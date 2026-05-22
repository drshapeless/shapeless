AT_COMPILE :: false;
#if AT_COMPILE {
    #run {
        set_build_options_dc(.{do_output=false});
        generate_binding();
    }
} else {
    main :: () {
        generate_binding();
    }
}

generate_binding :: () {
    sdk_path := get_macos_sdk_path();
    framework_path := sprint("%/System/Library/Frameworks", sdk_path);
    metal_headers := sprint("%/Metal.framework/Headers", framework_path);
    quartzcore_headers := sprint("%/QuartzCore.framework/Headers", framework_path);

    metal_path := sprint("%/Metal.h", metal_headers);
    ca_metal_layer_path := sprint("%/CAMetalLayer.h", quartzcore_headers);

    index := clang_createIndex(0, 0);

    args := (*u8).[
    "-x", "objective-c",
    "-fno-objc-arc",
    "-fblocks",
    "-fobjc-runtime=macosx-26.0",
    "-mmacos-version-min=26.0",
    "-isysroot", to_c_string(sdk_path),
    to_c_string(tprint("-F%", framework_path)),
    ];


    tu := clang_parseTranslationUnit(index, to_c_string(metal_path), args.data, xx args.count, null, 0, xx (CXTranslationUnit_Flags.DetailedPreprocessingRecord | CXTranslationUnit_Flags.Incomplete | CXTranslationUnit_Flags.KeepGoing));

    if !tu {
        log("Cannot parse tu");
        return;
    }

    root := clang_getTranslationUnitCursor(tu);

    clang_visitChildren(root, metal_visitor, null);

    tu1 := clang_parseTranslationUnit(index, to_c_string(ca_metal_layer_path), args.data, xx args.count, null, 0, xx (CXTranslationUnit_Flags.DetailedPreprocessingRecord | CXTranslationUnit_Flags.Incomplete | CXTranslationUnit_Flags.KeepGoing));
    if !tu1 {
        log("Cannot parse tu1");
        return;
    }

    root1 := clang_getTranslationUnitCursor(tu1);

    clang_visitChildren(root1, metal_visitor, null);

    enum_sb: String_Builder;
    for metal_enum_table {
        print_to_builder(*enum_sb, "% :: % % {\n", it.name, ifx it.is_enum_flag then "enum_flags" else "enum", it.type);
        for it.members {
            print_to_builder(*enum_sb, "    % :: %;\n", it.key, it.value);
        }
        print_to_builder(*enum_sb, "}\n\n");
    }
    write_entire_file("metal_enum.jai", *enum_sb);

    struct_sb: String_Builder;
    for metal_structs {
        print_to_builder(*struct_sb, "% :: struct {\n", it.name);
        for it.members {
            print_to_builder(*struct_sb, "    %: %;\n", it.name, it.type);
        }
        print_to_builder(*struct_sb, "}\n\n");
    }
    write_entire_file("metal_struct.jai", *struct_sb);

    write_entire_file("metal_typedef.jai", *typedef_sb);

    write_entire_file("metal_func.jai", *func_sb);

    write_entire_file("metal_var.jai", *var_sb);

    selector_sb: String_Builder;
    append(*selector_sb, "_Generated_Selectors :: struct {\n");
    for selector_table {
        real_selector_name := replace(it_index, ":", "_");
        print_to_builder(*selector_sb, "    %: *void = ---;\n", real_selector_name);
    }
    append(*selector_sb, "}\n__sel: _Generated_Selectors;\n");
    write_entire_file("metal_selectors.jai", *selector_sb);

    protocol_sb: String_Builder;
    for protocol: metal_protocols {
        print_to_builder(*protocol_sb, "% :: struct {\n", protocol.name);
        for method: protocol.instance_methods {
            write_instance_method(*protocol_sb, method, protocol.name);
        }
        append(*protocol_sb, "}\n\n");
    }

    write_entire_file("metal_protocol.jai", *protocol_sb);

    interface_sb: String_Builder;
    for inter: metal_interfaces {
        print_to_builder(*interface_sb, "% :: struct {\n", inter.name);
        for method: inter.class_methods {
            write_class_method(*interface_sb, method, inter.name);
        }

        for method: inter.instance_methods {
            write_instance_method(*interface_sb, method, inter.name);
        }

        append(*interface_sb, "}\n\n");
    }
    write_entire_file("metal_interface.jai", *interface_sb);
}

Metal_Enum_Member :: struct {
    key: string;
    value: string;
}

Metal_Enum :: struct {
    name: string;
    type: string;
    is_enum_flag: bool;
    members: [..] Metal_Enum_Member;
}

metal_enum_table : Table(string, Metal_Enum);

Metal_Struct_Member :: struct {
    name: string;
    type: string;
}

Metal_Struct :: struct {
    name: string;
    members: [..] Metal_Struct_Member;
}

metal_structs: [..] Metal_Struct;

metal_visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call  {
    push_context {
        get_parent_and_child(cursor, parent);
        // If there is not parent, the parent kind would be TranslationUnit
    if begins_with(name, "MTL") || begins_with(name, "CAMetal") {
        if kind ==  {
        case .EnumDecl;
            // Find or create a new entry in table
            metal_enum := find_or_add(*metal_enum_table, name);
            metal_enum.name = copy_string(name);
            enum_type := clang_getEnumDeclIntegerType(cursor);
            type_name := get_type_string(enum_type);
            if type_name == {
            // Since the build-in Objective-C from Jai defines these
            // two, I don't think it is a good idea to define again.
            case "NSInteger";
                ;
                metal_enum.type = "NSInteger";
            case "NSUInteger";
                ;
                metal_enum.type = "NSUInteger";
            case "uint8_t";
                metal_enum.type = "u8";
            case "uint32_t";
                metal_enum.type = "u32";
            case;
                assert(false, "unexpected typedef in enum %", type_name);
            }
            clang_visitChildren(cursor, enum_visitor, metal_enum);

        case .StructDecl;
            metal_struct := Metal_Struct.{
                name = copy_string(name),
            };
            clang_visitChildren(cursor, struct_visitor, *metal_struct);
            array_add(*metal_structs, metal_struct);
        case .TypedefDecl;
            handle_typedef(cursor);
        case .FunctionDecl;
            handle_func(cursor);
        case .ObjCProtocolDecl;
            handle_objc_protocol(cursor);
        case .ObjCInterfaceDecl;
            handle_objc_interface(cursor);
        case .MacroDefinition;
            ;
        case .MacroInstantiation;
            ;
        case .ObjCProtocolRef;
            // We don't care about ref right now?
            ;
        case .ObjCClassRef;
            ;
        case .VarDecl;
            handle_var(cursor);
        case;
            assert(false, "%", kind);
        }
    }
}

    return .Continue;
}

enum_visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
    push_context {
        metal_enum := cast(*Metal_Enum)client_data;

        get_parent_and_child(cursor, parent);

        if kind == {
        case .UnexposedAttr;
            ;
        case .VisibilityAttr;
            ;
        case .FlagEnum;
            metal_enum.is_enum_flag = true;
        case .EnumConstantDecl;
            s := replace(name, parent_name, "");
            member: Metal_Enum_Member;
            member.key = copy_string(s);

            if metal_enum.type == "s64" {
                v := clang_getEnumConstantDeclValue(cursor);
                if metal_enum.is_enum_flag {
                    member.value = sprint("0x%", FormatInt.{value = v, base = 8});
                } else {
                    member.value = sprint("%", v);
                }
            } else {
                v := clang_getEnumConstantDeclUnsignedValue(cursor);
                if metal_enum.is_enum_flag {
                    member.value = sprint("0x%", FormatInt.{value = v, base = 8});
                } else {
                    member.value = sprint("%", v);
                }
            }
            if is_digit( member.key[0]) {
                member.key = sprint("e%", member.key);
            }
            array_add(*metal_enum.members, member);
        case;
            assert(false, "unexpected enum member kind %", kind);
        }

    }

    return .Continue;
}

get_parent_and_child :: (cursor: CXCursor, parent: CXCursor) #expand {
    `parent_kind := clang_getCursorKind(parent);
    `parent_name := get_cursor_string(parent);

    `kind := clang_getCursorKind(cursor);
    `name := get_cursor_string(cursor);
}

braindead_visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
    push_context {
        get_parent_and_child(cursor, parent);

        log("% % %", parent_name, kind, name);
    }

    return .Continue;
}

struct_visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
    push_context {
        get_parent_and_child(cursor, parent);

        metal_struct := cast(*Metal_Struct)client_data;
        member_type := clang_getCursorType(cursor);
        member_type_string := get_type_string(member_type);

        metal_struct_member := Metal_Struct_Member.{
            name = copy_string(name),
            type = metal_type_to_jai_type(member_type_string),
        };

        array_add(*metal_struct.members, metal_struct_member);
    }

    return .Continue;
}

typedef_sb: String_Builder;

handle_typedef :: (cursor: CXCursor) {
    name := get_cursor_string(cursor);
    alias_type := clang_getTypedefDeclUnderlyingType(cursor);
    alias_type_string := get_type_string(alias_type);
    if !begins_with(alias_type_string, "enum") && !begins_with(alias_type_string, "struct") {

        // All block in metal are void block void (^)
        //     -drshapeless, 16 May 2026

        // Find if the thing is a block (lambda)
        i := find_index_from_left(alias_type_string, "(^)");
        if i >= 0 {
            print_to_builder(*typedef_sb, "% :: #type (", name);
            argument_string := slice(alias_type_string, i + 4, alias_type_string.count - i - 5);
            parameters := split(argument_string, ", ");
            for parameters {
                if it_index != 0 append(*typedef_sb, ", ");
                print_to_builder(*typedef_sb, "unknown%: ", it_index);

                if begins_with(it, "id") {
                    append(*typedef_sb, "id");
                } else if find_index_from_left(it, #char "*") >= 0 {
                    _, s := split_from_left(alias_type_string, #char " ");
                    print_to_builder(*typedef_sb, "*%", s);
                } else {
                    s := it;

                    // For case like, MTLDeviceNotificationName _Nonnull
                    j := find_index_from_left(s, "_Nonnull");
                    if j >= 0 {
                        s = slice(s, 0, j-1);
                    }
                    if s == "uint64_t" s = "u64";
                    print_to_builder(*typedef_sb, "%", s);
                }
            }
            append(*typedef_sb, ") -> void #c_call;\n");

        } else {
            if alias_type_string == "uint64_t" {
                alias_type_string = "u64";
            } else if find_index_from_left(alias_type_string, "*") >= 0 {
                // It is a pointer
                _, alias_type_string = split_from_left(alias_type_string, #char " ");
                print_to_builder(*typedef_sb, "% :: *%;\n", name, alias_type_string);
            } else {
                print_to_builder(*typedef_sb, "% :: %;\n", name, alias_type_string);
            }

        }

    }
}

METAL_TYPE :: string.[
"float",
"double",
"uint64_t",
"uint32_t",
"uint16_t",
"int32_t",
];

JAI_TYPE :: string.[
"float32",
"float64",
"u64",
"u32",
"u16",
"s32",
];

metal_type_to_jai_type :: (metal_type: string) -> string {
    // Check if it is an array

    open_bracket_index := -1;
    close_bracket_index := -1;

    for metal_type {
        if it == {
        case #char "[";
            open_bracket_index = it_index;
        case #char "]";
            close_bracket_index = it_index;
        }
    }

    real_type := metal_type;

    if open_bracket_index != -1 {
        real_type = slice(metal_type, 0, open_bracket_index);
    }

    found, i := array_find(METAL_TYPE, real_type);
    if found {
        real_type = JAI_TYPE[i];
    }

    if open_bracket_index != -1 {
        return sprint("%%", slice(metal_type, open_bracket_index, close_bracket_index - open_bracket_index + 1), real_type);
    } else {
        return real_type;
    }
}

// This will allocated a string
get_cursor_string :: (cursor: CXCursor) -> string {
    spelling := clang_getCursorSpelling(cursor);
    defer clang_disposeString(spelling);
    str := to_string(clang_getCString(spelling));

    return copy_string(str);
}

get_type_string :: (type: CXType) -> string {
    spelling := clang_getTypeSpelling(type);
    defer clang_disposeString(spelling);
    str := to_string(clang_getCString(spelling));

    return copy_string(str);
}

func_sb: String_Builder;

// This function is not perfect, because of laziness. But should work
// on Metal 4, with macOS 26.4
//     -drshapeless, 18 May 2026
handle_func :: (cursor: CXCursor) {
    func_visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
        push_context {
            count := cast(*s64) client_data;
            get_parent_and_child(cursor, parent);
            if kind == .ParmDecl {
                if count.* > 0 {
                    append(*func_sb, ", ");
                }
                count.* += 1;
                // context will collide with Jai internal type
                if name == "context" {
                    name = "ctx";
                }

                print_to_builder(*func_sb, "%: ", name);

                param_type := clang_getCursorType(cursor);
                jai_type := to_jai_type(param_type);
                append(*func_sb, jai_type);
            }
        }
        return .Continue;
    }

    if clang_Cursor_isFunctionInlined(cursor) {
        // All the inline functions are written by hand, in my
        // opinion, they are useless in Jai.
    } else {
        // Every function has visibility of default, omit it.
        print_to_builder(*func_sb, "% :: (", get_cursor_string(cursor));

        func_type := clang_getCursorType(cursor);
        result_type := clang_getResultType(func_type);

        return_string := to_jai_type(result_type);
        count := 0;
        clang_visitChildren(cursor, func_visitor, *count);
        print_to_builder(*func_sb, ") -> % #foreign Metal;\n", return_string);
    }

}

var_sb: String_Builder;

handle_var :: (cursor: CXCursor) {
    name := get_cursor_string(cursor);
    type := clang_getCursorType(cursor);
    type_string := get_type_string(type);

    storage_class := clang_Cursor_getStorageClass(cursor);
    if storage_class == .Extern {
        type_string = replace(type_string, "const ", "");

        print_to_builder(*var_sb, "%: % #elsewhere Metal;\n", name, type_string);
    } else {
        init := clang_Cursor_getVarDeclInitializer(cursor);
        init_kind := clang_getCursorKind(init);

        assert(type_string == "const NSUInteger", "The variable type is no longer just NSUInteger, deal with it");
        value := clang_getEnumConstantDeclUnsignedValue(cursor);

        print_to_builder(*var_sb, "%: NSUInteger: %;\n", name, value);
    }
}

selector_table: Table(string, struct{});

method_visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
    push_context {
        params := cast(*[..]Metal_Method_Param) client_data;
        name := get_cursor_string(cursor);
        type := clang_getCursorType(cursor);
        kind := clang_getCursorKind(cursor);
        if kind == .ParmDecl {
            param: Metal_Method_Param;
            param.name = name;
            param.type = to_jai_type(type);

            array_add(params, param);
        }

    }
    return .Continue;
}

Metal_Method_Param :: struct {
    name: string;
    type: string;
}

Metal_Method :: struct {
    name: string;
    name_underline: string;
    return_type: string;
    params: [..] Metal_Method_Param;
}

Metal_Protocol :: struct {
    name: string;
    // There is only instance method in protocol, no class method
    instance_methods: [..] Metal_Method;
}

Metal_Interface :: struct {
    name: string;
    class_methods: [..] Metal_Method;
    instance_methods: [..] Metal_Method;
}

metal_protocols: [..] Metal_Protocol;
metal_interfaces: [..] Metal_Interface;

handle_objc_protocol :: (cursor: CXCursor) {
    visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
        push_context {
            instance_methods := cast(*[..] Metal_Method)client_data;
            get_parent_and_child(cursor, parent);

            if kind == {
            case .UnexposedAttr;
                ;
            case .ObjCProtocolRef;
                // Don't care
                ;
            case .VisibilityAttr;
                // Don't care
                ;
            case .ObjCPropertyDecl;
                ;
                // log("    property: %", name);
            case .ObjCInstanceMethodDecl;
                table_set(*selector_table, name, {});
                // log("    instance method: %", name);
                type := clang_getCursorResultType(cursor);

                method: Metal_Method;
                method.name = name;
                method.name_underline = replace(name, ":", "_");
                method.return_type = to_jai_type(type);

                clang_visitChildren(cursor, method_visitor, *method.params);
                array_add(instance_methods, method);
            case;
                assert(false, "    % %", kind, name);
            }


        }
        return .Continue;
    }

    name := get_cursor_string(cursor);

    protocol: Metal_Protocol;
    protocol.name = name;

    clang_visitChildren(cursor, visitor, *protocol.instance_methods);
    array_add(*metal_protocols, protocol);
}

handle_objc_interface :: (cursor: CXCursor) {
    visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
        push_context {
            i := cast(*Metal_Interface)client_data;
            class_methods := *i.class_methods;
            instance_methods := *i.instance_methods;
            get_parent_and_child(cursor, parent);

            if kind == {
            case .UnexposedAttr;
                ;
            case .ObjCProtocolRef;
                // Don't care
                ;
            case .VisibilityAttr;
                // Don't care
                ;
            case .ObjCSuperClassRef;
                ;
            case .ObjCClassRef;
                ;
            case .ObjCIvarDecl;
                ;
            case .StructDecl;
                // For interface MTLSharedEventHandle, it has this
                // struct MTLSharedEventHandlePrivate *_priv;
                // We don't have access to such a thing, just ignore
                // it for now.
                // log("!!!!WTF % %", kind, name);

            case .ObjCInstanceMethodDecl;
                table_set(*selector_table, name, {});

                type := clang_getCursorResultType(cursor);

                method: Metal_Method;
                method.name = name;
                method.name_underline = replace(name, ":", "_");
                method.return_type = to_jai_type(type);

                clang_visitChildren(cursor, method_visitor, *method.params);
                array_add(instance_methods, method);

            case .ObjCClassMethodDecl;
                table_set(*selector_table, name, {});
                type := clang_getCursorResultType(cursor);

                method: Metal_Method;
                method.name = name;
                method.name_underline = replace(name, ":", "_");
                method.return_type = to_jai_type(type);

                clang_visitChildren(cursor, method_visitor, *method.params);
                array_add(class_methods, method);
            case .ObjCPropertyDecl;
                ;
            case;
                assert(false, "    % %", kind, name);
            }


        }
        return .Continue;
    }

    name := get_cursor_string(cursor);

    i: Metal_Interface;
    i.name = name;

    clang_visitChildren(cursor, visitor, *i);

    array_add(*metal_interfaces, i);
}

to_jai_type :: (type: CXType) -> string {
    jai_type: string;
    if type.kind == {
    case .Void;
        jai_type = "void";
    case .Typedef;
        jai_type = get_type_string(type);

        if ends_with(jai_type, "_t") && jai_type != "dispatch_data_t" && jai_type != "dispatch_queue_t" {
            ctype := clang_getCanonicalType(type);
            jai_type = to_jai_type(ctype);
        }
    case .ObjCObjectPointer;
        #through;
    case .Pointer;
        pointee := clang_getPointeeType(type);
        jai_type = sprint("*%", to_jai_type(pointee));
    case .ObjCObject;
        base_type := clang_Type_getObjCObjectBaseType(type);
        base_name := get_type_string(base_type);
        // If the base_type is id<Something>, we will just think the
        // jai_type as id and call it a day. That is how the
        // Objective-C module does.
        if base_type.kind == .ObjCId {
            pros := get_objc_protocols(type);
            assert(pros.count == 1, "there are more than one protocol to id %", get_type_string(type));
            // Before it is identified as ObjCObject, and
            // id<Something> is first parse as pointer. This is
            // expected behaviour.
            jai_type = get_cursor_string(pros[0]);
        } else {
            if base_name == {
            case "NSArray";
                args := get_objc_type_arguments(type);
                assert(args.count == 1, "NSArray should only have one argument %", args);
                // log("NSArray(%)", to_jai_type(args[0]));
                jai_type = sprint("NSArray(%)", to_jai_type(args[0]));
            case "NSDictionary";
                args := get_objc_type_arguments(type);
                assert(args.count == 2, "NSArray should only have two arguments");
                jai_type = sprint("NSDictionary(%, %)", to_jai_type(args[0]), to_jai_type(args[1]));
            case;
                assert(false, "WTF is this %", base_name);
            }
        }
    case .ObjCInterface;
        // log("interface %", get_type_string(type));
        jai_type = get_type_string(type);
    case .Float;
        jai_type = "float32";
    case .Double;
        jai_type = "float64";
    case .BlockPointer;
        // TODO: Fix this, now it does not contains a real lambda function description
        jai_type = "*void";
    case .Char_S;
        jai_type = "s8";
    case .Int;
        jai_type = "s32";
    case .UInt;
        jai_type = "u32";
    case .ULong;
        jai_type = "u64";
    case .ULongLong;
        jai_type = "u64";
    case .UChar;
        jai_type = "u8";
    case;
        assert(false, "unexpected kind when generating jai type from objc type, % %", type.kind, get_type_string(type));
    }

    return jai_type;
}

get_objc_type_arguments :: (type: CXType) -> []CXType {
    assert(type.kind == .ObjCObject, "Expect ObjCObject, gets, % %", type, get_type_string(type));

    argument_count := clang_Type_getNumObjCTypeArgs(type);
    args: []CXType;
    if argument_count > 0 {
        args = NewArray(argument_count, CXType);
        for i: 0..argument_count - 1 {
            args[i] = clang_Type_getObjCTypeArg(type, i);
        }
    }

    return args;
}

get_objc_protocols :: (type: CXType) -> []CXCursor {
    protocol_count := clang_Type_getNumObjCProtocolRefs(type);
    pros: []CXCursor;
    if protocol_count > 0 {
        pros = NewArray(protocol_count, CXCursor);
        for i: 0..protocol_count - 1 {
            pros[i] = clang_Type_getObjCProtocolDecl(type, i);
        }
    }
    return pros;
}

write_instance_method :: (sb: *String_Builder, method: Metal_Method, object_name: string) {
    print_to_builder(sb, "    % :: (", method.name_underline);
    print_to_builder(sb, "self: *%", object_name);
    for param: method.params {
        append(sb, ", ");
        print_to_builder(sb, "%: %", param.name, param.type);
    }
    return_type := method.return_type;
    if return_type == "instancetype" {
        return_type = sprint("*%", object_name);
    }
    print_to_builder(sb, ") -> % {\n", return_type);
    append(sb, "        func :: #type (obj: *void, selector: *void");
    for param: method.params {
        append(sb, ", ");
        print_to_builder(sb, "%: %", param.name, param.type);
    }
    print_to_builder(sb, ") -> % #c_call;\n", method.return_type);
    append(sb, "        func = xx objc_msgSend;\n");

    print_to_builder(sb, "        return func(self, __sel.%", method.name_underline);
    for param: method.params {
        append(sb, ", ");
        append(sb, param.name);
    }
    append(sb, ");\n");

    append(sb, "    }\n\n");
}

write_class_method :: (sb: *String_Builder, method: Metal_Method, class_name: string) {
    print_to_builder(sb, "    % :: (", method.name_underline);
    for param: method.params {
        if it_index > 0 {
            append(sb, ", ");
        }
        print_to_builder(sb, "%: %", param.name, param.type);
    }
    return_type := method.return_type;
    if return_type == "instancetype" {
        return_type = sprint("*%", class_name);
    }
    print_to_builder(sb, ") -> % {\n", return_type);
    append(sb, "        func: #type (obj: *void, selector: *void");
    for param: method.params {
        append(sb, ", ");
        print_to_builder(sb, "%: %", param.name, param.type);
    }
    print_to_builder(sb, ") -> % #c_call;\n", method.return_type);
    append(sb, "        func = xx objc_msgSend;\n");
    print_to_builder(sb, "        return func(objc_getClass(\"%\", __sel.%", class_name, method.name_underline);
    for param: method.params {
        append(sb, ", ");
        append(sb, param.name);
    }
    append(sb, ");\n");

    append(sb, "    }\n\n");
}

#import "Basic";
#import "Compiler";
#import "clang";
#import "macOS/Toolchain";
#import "String";
#import "POSIX";
#import "Hash_Table";
#import "File";
