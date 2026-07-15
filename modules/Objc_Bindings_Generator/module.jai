Objc_Generate_Bindings_Options :: struct {
    export_library_name: string;

    // In absolute path
    headers: [..] string;

    visitor: Objc_Visitor;
    userdata: *void;
}

Objc_Cursor :: struct {
    name: string;
}

Objc_Generate_Result :: enum {
    STOP;
    RECURSE;
}

Objc_Visitor :: #type (cursor: Objc_Cursor, parent: Objc_Cursor, client_data: *void) -> Objc_Generate_Result;

generate_bindings :: (options: Objc_Generate_Bindings_Options) -> bool {
    // To extract the comment from the header, we have to use
    // -fretain-comments-from-system-headers

    sdk_path := get_macos_sdk_path();
    framework_path := sprint("%/System/Library/Frameworks", sdk_path);

    args := (*u8).[
    "-x", "objective-c",
    "-fno-objc-arc",
    "-fparse-all-comments",
    "-fretain-comments-from-system-headers",
    "-isysroot", to_c_string(sdk_path),
    to_c_string(tprint("-F%", framework_path)),
    ];

    flags: CXTranslationUnit_Flags = .DetailedPreprocessingRecord | .IncludeBriefCommentsInCodeCompletion | .KeepGoing;

    for header: options.headers {
        index := clang_createIndex(0, 0);
        defer clang_disposeIndex(index);
        translation_unit := clang_parseTranslationUnit(index, to_c_string(header), args.data, xx args.count, null, 0, xx flags);
        root := clang_getTranslationUnitCursor(translation_unit);

        cd: Client_Data;
        cd.visitor = options.visitor;
        cd.userdata = options.userdata;
        clang_visitChildren(root, objc_default_visitor, *cd);
    }
    write_to_file(options.export_library_name);

    return true;
}

Client_Data :: struct {
    visitor: Objc_Visitor;
    userdata: *void;
}

objc_default_visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
    push_context {
        auto_release_temp();
    cd := cast(*Client_Data) client_data;

    cursor_name := to_string(clang_getCursorSpelling(cursor),, temp);
        cursor_type := clang_getCursorType(cursor);
        cursor_kind := clang_getCursorKind(cursor);
        parent_name := to_string(clang_getCursorSpelling(parent),, temp);

        objc_cursor: Objc_Cursor;
        objc_cursor.name = cursor_name;
        objc_parent: Objc_Cursor;
        objc_parent.name = parent_name;

        result := cd.visitor(objc_cursor, objc_parent, cd.userdata);
        if result == {
        case .STOP;
            return .Continue;
        case .RECURSE;
        // do nothing
        }

        if cursor_kind == {
        case .EnumDecl;
            handle_enum(cursor);
        case .MacroInstantiation;
            // Ignore
            ;
        case .MacroDefinition;
            ;
        case .ObjCClassRef;
            ;
        case .ObjCProtocolRef;
            ;
        case .TypedefDecl;
            handle_typedef(cursor);
        case .FunctionDecl;
            handle_function(cursor);
        case .VarDecl;
            handle_var(cursor);
        case .ObjCInterfaceDecl;
            handle_objc_interface(cursor);
        case .ObjCProtocolDecl;
            handle_objc_protocol(cursor);
        case .StructDecl;
            handle_struct(cursor);
        case;
            log("What is this % %", cursor_name, cursor_kind);
        }
    }

    return .Continue;
}

Objc_Enum_Member :: struct {
    name: string;
    value: string;
    comment: string;
}

Objc_Enum :: struct {
    name: string;
    type: string;
    comment: string;
    members: [..] Objc_Enum_Member;
    is_enum_flags: bool;
}

Objc_Struct_Member :: struct {
    name: string;
    type: string;
    comment: string;
}

Objc_Struct :: struct {
    name: string;
    comment: string;
    members: [..] Objc_Struct_Member;
}

Objc_Typedef :: struct {
    name: string;
    alias: string;
    comment: string;
}

Objc_Function_Parameter :: struct {
    name: string;
    type: string;
}

Objc_Function :: struct {
    name: string;
    return_type: string;
    parameters: [..] Objc_Function_Parameter;
    comment: string;
}

Objc_Var :: struct {
    name: string;
    type: string;
    value: string;
    comment: string;
}

Objc_Method :: struct {
    using func: Objc_Function;
    name_underline: string; // This is to prevent calling replace multiple time
}

Objc_Property :: struct {
    name: string;
    comment: string;
}

Objc_Interface :: struct {
    name: string;
    comment: string;
    class_methods: [..] Objc_Method;
    instance_methods: [..] Objc_Method;
    properties: [..] Objc_Property;
}

Objc_Protocol :: struct {
    name: string;
    comment: string;
    instance_methods: [..] Objc_Method;
    properties: [..] Objc_Property;
}

objc_enums: [..] Objc_Enum;
objc_structs: [..] Objc_Struct;
objc_typedefs: [..] Objc_Typedef;
objc_functions: [..] Objc_Function;
objc_vars: [..] Objc_Var;
objc_interfaces: [..] Objc_Interface;
objc_protocols: [..] Objc_Protocol;

selector_table: Table(string, struct{});

// This function return a newly allocated Jai string
to_string :: (spelling: CXString) -> string {
    str := to_string(clang_getCString(spelling));

    return copy_string(str);
}

to_string :: (cursor: CXCursor) -> string {
    spelling := clang_getCursorSpelling(cursor);
    defer clang_disposeString(spelling);

    return to_string(spelling);
}

to_string :: (type: CXType) -> string {
    spelling := clang_getTypeSpelling(type);
    defer clang_disposeString(spelling);

    return to_string(spelling);
}

to_jai_type :: (type: CXType, user_data: *void = null) -> string {
    sb: String_Builder;
    auto_release_temp();
    to_jai_type(*sb, type, user_data,, temp);
    return builder_to_string(*sb);
}

// This function appends its result to the String_Builder
to_jai_type :: (sb: *String_Builder, type: CXType, user_data: *void = null) {
    if type.kind == {
    case .Void;
        append(sb, "void");
    case .Typedef;
        unqualified_type := clang_getUnqualifiedType(type);
        type_string := to_string(unqualified_type);
        if ends_with(type_string, "_t") && !begins_with(type_string, "dispatch") {
            canonical_type := clang_getCanonicalType(type);
            to_jai_type(sb, canonical_type);
        } else {
            append(sb, type_string);
        }
    case .ObjCObjectPointer;
        #through;
    case .Pointer;
        pointee_type := clang_getPointeeType(type);
        if pointee_type.kind != .FunctionProto {
            append(sb, "*");
        }

        to_jai_type(sb, pointee_type, user_data);
    case .ObjCObject;
        base_type := clang_Type_getObjCObjectBaseType(type);
        base_name := to_string(base_type);

        if base_type.kind == .ObjCId {
            // Before an id<Foo> is parsed as ObjcObject, it is parsed as
            // a pointer, so we just need to append the first protocol.
            protocols := get_objc_protocols(type);
            assert(protocols.count == 1, "There should only be one protocol of id, %", to_string(type));
            append(sb, to_string(clang_getCursorSpelling(protocols[0])));
        } else {
            if base_name == {
            case "NSArray";
                arguments := get_objc_type_arguments(type);
                assert(arguments.count == 1, "NSArray should only have one argument, %", to_string(type));
                // TODO: Weird, any better way to write this?
                append(sb, "NSArray(");
                to_jai_type(sb, arguments[0]);
                append(sb, ")");
            case "NSDictionary";
                arguments := get_objc_type_arguments(type);
                assert(arguments.count == 2, "NSDocument should only have two arguments %", to_string(type));
                append(sb, "NSDictionary(");
                to_jai_type(sb, arguments[0]);
                append(sb, ", ");
                to_jai_type(sb, arguments[1]);
                append(sb, ")");
            case;
                assert(false, "unexpected base name of objc object, %", base_name);
            }
        }
    case .ObjCInterface;
        append(sb, to_string(type));
    case .Float;
        append(sb, "float32");
    case .Double;
        append(sb, "float64");
    case .Char_S;
        append(sb, "s8");
    case .SChar;
        append(sb, "s8");
    case .Int;
        append(sb, "s32");
    case .Short;
        append(sb, "s16");
    case .UInt;
        append(sb, "u32");
    case .UShort;
        append(sb, "u16");
    case .ULong;
        append(sb, "u64");
    case .ULongLong;
        append(sb, "u64");
    case .UChar;
        append(sb, "u8");
    case .ConstantArray;
        array_size := clang_getArraySize(type);
        print_to_builder(sb, "[%]", array_size);
        element_type := clang_getArrayElementType(type);
        to_jai_type(sb, element_type);
    case .BlockPointer;
        pointee := clang_getPointeeType(type);
        to_jai_type(sb, pointee, user_data);
    case .Record;
        // WTF?? Why are we encountering this?
        // struct something
        declaration_cursor := clang_getTypeDeclaration(type);
        type_string := to_string(declaration_cursor);
        append(sb, type_string);
    case .FunctionProto;
        append(sb, "#type (");
        if user_data {
            cursor_pointer := cast(*CXCursor) user_data;
            params := collect_block_parameters(cursor_pointer.*);
            for params {
                if it_index > 0 {
                    append(sb, ", ");
                }
                if it.name == "" {
                    print_to_builder(sb, "unknown_%: %", it_index, it.type);
                } else {
                    print_to_builder(sb, "%: %", it.name, it.type);
                }

            }
        } else {
            params := get_block_parameters(type);
            for params {
                if it_index > 0 {
                    append(sb, ", ");
                }
                print_to_builder(sb, "unknown_%: %", it_index, to_jai_type(it));
            }
        }
        append(sb, ") -> ");
        return_type := clang_getResultType(type);
        to_jai_type(sb, return_type);
        append(sb, " #c_call");
    case;
        assert(false, "Error when converting to Jai type, Unexpected kind: %, %", type.kind, to_string(type));
    }
}

collect_block_parameters :: (cursor: CXCursor) -> [] Objc_Function_Parameter {
    visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
        push_context {
            members := cast(*[..] Objc_Function_Parameter) client_data;
            kind := clang_getCursorKind(cursor);
            if kind == .ParmDecl {
                param_name := to_string(cursor);
                param_type := clang_getCursorType(cursor);
                member := Objc_Function_Parameter.{
                    name = param_name,
                    type = to_jai_type(param_type),
                };
                array_add(members, member);
            }
        }
        return .Continue;
    }
    members: [..] Objc_Function_Parameter;
    clang_visitChildren(cursor, visitor, *members);
    return members;
}

get_block_parameters :: (type: CXType) -> []CXType {
    assert(type.kind == .FunctionProto, "Expect FunctionProto, get %", type.kind);
    num := clang_getNumArgTypes(type);
    parameters: []CXType;
    if num <= 0 {
        return parameters;
    }

    parameters = NewArray(xx num, CXType, initialized = false);
    for 0..num-1 {
        parameters[it] = clang_getArgType(type, xx it);
    }

    return parameters;
}

get_objc_type_arguments :: (type: CXType) -> []CXType {
    assert(type.kind == .ObjCObject, "Expect ObjcObject, gets, % %", type, to_string(type));

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

get_raw_comment_string :: (cursor: CXCursor) -> string {
    comment := clang_Cursor_getRawCommentText(cursor);
    defer clang_disposeString(comment);

    return to_string(comment);
}

sanitize_parameter_name :: (name: string) -> string {
    bad_names :: string.[
    "context",
    "string",
    ];

    good_names :: string.[
    "ctx",
    "str",
    ];

    found, index := array_find(bad_names, name);
    if found {
        return good_names[index];
    }

    return name;
}

handle_enum :: (cursor: CXCursor) {
    visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
        push_context {
            kind := clang_getCursorKind(cursor);
            objc_enum := cast (*Objc_Enum) client_data;
            if kind == {
            case .UnexposedAttr;
                // Don't care
                ;
            case .FlagEnum;
                objc_enum.is_enum_flags = true;
            case .VisibilityAttr;
                // Don't care
                ;
            case .EnumConstantDecl;
                auto_release_temp();
                parent_name := to_string(parent,, temp);
                name_string := to_string(cursor,, temp);
                occurences: int;
                name_string, occurences = replace(name_string, parent_name, "",, temp);
                if occurences == 0 && ends_with(parent_name, "s") {
                    modified_parent_name := slice(parent_name, 0, parent_name.count - 1);
                    name_string, occurences = replace(name_string, modified_parent_name, "",, temp);
                    if occurences == 0 && ends_with(parent_name, "Options") {
                        modified_parent_name = replace(parent_name, "Options", "",, temp);
                        name_string = replace(name_string, modified_parent_name, "",, temp);
                    }
                }
                if is_digit(name_string[0]) {
                    name_string = tprint("e%", name_string);
                }

                is_exist := false;
                for objc_enum.members {
                    if it.name == name_string {
                        is_exist = true;
                        break;
                    }
                }
                if is_exist return .Continue;

                value_string: string;
                if objc_enum.type == "NSInteger" {
                    v := clang_getEnumConstantDeclValue(cursor);
                    value_string = tprint("%", v);
                } else {
                    v := clang_getEnumConstantDeclUnsignedValue(cursor);
                    value_string = tprint("%", v);
                }

                enum_member: Objc_Enum_Member;
                enum_member.name = copy_string(name_string);
                enum_member.value = copy_string(value_string);
                enum_member.comment = get_raw_comment_string(cursor);
                array_add(*objc_enum.members, enum_member);
            case;
                assert(false, "Unexpected enum member kind: %", kind);
            }
        }
        return .Continue;
    }
    name := to_string(cursor);
    objc_enum_ptr :*Objc_Enum = null;
    for * objc_enums {
        if it.name == name {
            objc_enum_ptr = it;
            break;
        }
    }

    if objc_enum_ptr == null {
        objc_enum := Objc_Enum.{
            name = name,
            comment = get_raw_comment_string(cursor),
            type = to_jai_type(clang_getEnumDeclIntegerType(cursor)),
        };
        array_add(*objc_enums, objc_enum);
        objc_enum_ptr = peek_pointer(objc_enums);
    }

    clang_visitChildren(cursor, visitor, objc_enum_ptr);
}

handle_struct :: (cursor: CXCursor) {
    visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
        push_context {
            member_type := clang_getCursorType(cursor);
            name := to_string(cursor);
            type_string := to_jai_type(member_type);
            // log("%: %", name, type_string);
            struct_member := Objc_Struct_Member.{
                name = name,
                type = type_string,
                comment = get_raw_comment_string(cursor),
            };

            objc_struct := cast(*Objc_Struct) client_data;
            array_add(*objc_struct.members, struct_member);
        }
        return .Continue;
    }

    objc_struct := Objc_Struct.{
        name = to_string(cursor),
        comment = get_raw_comment_string(cursor),
    };
    clang_visitChildren(cursor, visitor, *objc_struct);
    array_add(*objc_structs, objc_struct);
}

handle_typedef :: (cursor: CXCursor) {
    typedef_compare :: (a: Objc_Typedef, b: Objc_Typedef) -> bool {
        return a.name == b.name;
    }

    name := to_string(cursor);
    underlying_type := clang_getTypedefDeclUnderlyingType(cursor);
    if underlying_type.kind == {
    case .Enum;
        return;
    case .Record;
    // log("record: %", to_string(cursor));
    case .BlockPointer;
        typedef := Objc_Typedef.{
            name = name,
            alias = to_jai_type(underlying_type, *cursor),
            comment = get_raw_comment_string(cursor),
        };
        array_add_if_unique(*objc_typedefs, typedef, typedef_compare);
    case .ObjCObjectPointer;
        #through;
    case .Pointer;
        #through;
    case .Typedef;
        typedef := Objc_Typedef.{
            name = name,
            alias = to_jai_type(underlying_type, *cursor),
            comment = get_raw_comment_string(cursor),
        };
        array_add_if_unique(*objc_typedefs, typedef, typedef_compare);
    case;
        assert(false, "Unexpected kind in typedef: % %", underlying_type.kind, to_string(cursor));
    }
}

handle_function :: (cursor: CXCursor) {
    visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
        push_context {
            kind := clang_getCursorKind(cursor);
            objc_function := cast(*Objc_Function) client_data;
            if kind == .ParmDecl {
                param := Objc_Function_Parameter.{
                    name = to_string(cursor),
                    type = to_jai_type(clang_getCursorType(cursor)),
                };

                array_add(*objc_function.parameters, param);
            }
        }

        return .Continue;
    }
    if clang_Cursor_isFunctionInlined(cursor) return;

    func_type := clang_getCursorType(cursor);
    result_type := clang_getResultType(func_type);

    objc_function := Objc_Function.{
        name = to_string(cursor),
        return_type = to_jai_type(result_type),
        comment = get_raw_comment_string(cursor),
    };

    clang_visitChildren(cursor, visitor, *objc_function);

    array_add(*objc_functions, objc_function);
}

handle_var :: (cursor: CXCursor) {
    type := clang_getCursorType(cursor);

    // Remove const
    unqualified_type := clang_getUnqualifiedType(type);

    var := Objc_Var.{
        name = to_string(cursor),
        type = to_jai_type(unqualified_type),
        comment = get_raw_comment_string(cursor),
    };

    storage_class := clang_Cursor_getStorageClass(cursor);

    if storage_class == .Static {
        eval := clang_Cursor_Evaluate(cursor);
        eval_kind := clang_EvalResult_getKind(eval);

        if eval_kind == {
        case .Int;
            ivalue := clang_EvalResult_getAsUnsigned(eval);
            var.value = sprint("%", ivalue);
        case;
            assert(false, "Other static constant variable type is not supported, current type is %", eval_kind);
        }
    }

    array_add(*objc_vars, var);
}

method_visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
    push_context {
        params := cast(*[..] Objc_Function_Parameter) client_data;
        kind := clang_getCursorKind(cursor);
        type := clang_getCursorType(cursor);
        if kind == .ParmDecl {
            param := Objc_Function_Parameter.{
                name = to_string(cursor),
                type = to_jai_type(type),
            };
            array_add(params, param);
        }
    }

    return .Continue;
}

handle_objc_interface :: (cursor: CXCursor) {
    visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
        push_context {
            i := cast(*Objc_Interface) client_data;
            name := to_string(cursor);
            kind := clang_getCursorKind(cursor);
            methods: *[..]Objc_Method = *i.class_methods;
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
                // This is unclear, but cleaner.
                methods = *i.instance_methods;
                #through;
            case .ObjCClassMethodDecl;
                table_set(*selector_table, name, {});
                result_type := clang_getCursorResultType(cursor);
                method := Objc_Method.{
                    name = name,
                    name_underline = replace(name, ":", "_"),
                    return_type = to_jai_type(result_type),
                    comment = get_raw_comment_string(cursor),
                };
                clang_visitChildren(cursor, method_visitor, *method.parameters);

                array_add(methods, method);
            case .ObjCPropertyDecl;
                // The tricky part of objc handling is that the
                // property is not that important, since we can only
                // access it by its setter and getter, however, we
                // still want to preserve the comment of the
                // property. Since a objc property cannot be writable
                // only, we can safely assume the getter name is the
                // property name. A objc property cannot be neither
                // readable or writable. We store the thing here, and
                // leave the hard work when writing to file.
                getter_name := clang_Cursor_getObjCPropertyGetterName(cursor);
                defer clang_disposeString(getter_name);
                property := Objc_Property.{
                    name = to_string(getter_name),
                    comment = get_raw_comment_string(cursor),
                };
                array_add(*i.properties, property);
            case;
                assert(false, "    % %", kind, name);
            }
        }
        return .Continue;
    }

    i := Objc_Interface.{
        name = to_string(cursor),
        comment = get_raw_comment_string(cursor),
    };
    clang_visitChildren(cursor, visitor, *i);
    array_add(*objc_interfaces, i);
}

handle_objc_protocol :: (cursor: CXCursor) {
    visitor :: (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call {
        push_context {
            protocol := cast(*Objc_Protocol) client_data;
            kind := clang_getCursorKind(cursor);
            name := to_string(cursor);
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
                // Check out the same thing in interface handling.
                getter_name := clang_Cursor_getObjCPropertyGetterName(cursor);
                defer clang_disposeString(getter_name);
                property := Objc_Property.{
                    name = to_string(getter_name),
                    comment = get_raw_comment_string(cursor),
                };
                array_add(*protocol.properties, property);
            case .ObjCInstanceMethodDecl;
                table_set(*selector_table, name, {});
                result_type := clang_getCursorResultType(cursor);
                method := Objc_Method.{
                    name = name,
                    name_underline = replace(name, ":", "_"),
                    return_type = to_jai_type(result_type),
                    comment = get_raw_comment_string(cursor),
                };
                clang_visitChildren(cursor, method_visitor, *method.parameters);
                array_add(*protocol.instance_methods, method);
            case;
                assert(false, "unexpected kind in objc protocol % %", kind, name);
            }
        }
        return .Continue;
    }

    protocol := Objc_Protocol.{
        name = to_string(cursor),
        comment = get_raw_comment_string(cursor),
    };

    clang_visitChildren(cursor, visitor, *protocol);

    protocol_compare :: (a: Objc_Protocol, b: Objc_Protocol) -> bool {
        return a.name == b.name;
    }
    array_add_if_unique(*objc_protocols, protocol, protocol_compare);
}

write_to_file :: (export_library_name: string) {
    sb: String_Builder;
    for e: objc_enums {
        if e.comment != "" {
            append(*sb, e.comment);
            append(*sb, "\n");
        }
        append(*sb, e.name);
        append(*sb, " :: ");
        if e.is_enum_flags {
            append(*sb, "enum_flags ");
        } else {
            append(*sb, "enum ");
        }
        append(*sb, e.type);
        append(*sb, " {\n");
        for m: e.members {
            if m.comment != "" {
                append(*sb, "    ");
                append(*sb, m.comment);
                append(*sb, "\n");
            }
            print_to_builder(*sb, "    % :: %;\n", m.name, m.value);
        }
        append(*sb, "}\n\n");
    }

    write_entire_file("enum.jai", *sb);

    for s: objc_structs {
        if s.comment != "" {
            append(*sb, s.comment);
            append(*sb, "\n");
        }
        append(*sb, s.name);
        append(*sb, " :: struct {\n");
        for m: s.members {
            if m.comment != "" {
                append(*sb, "    ");
                append(*sb, m.comment);
                append(*sb, "\n");
            }
            print_to_builder(*sb, "    %: %;\n", m.name, m.type);
        }
        append(*sb, "}\n\n");
    }

    write_entire_file("struct.jai", *sb);

    for t: objc_typedefs {
        if t.comment != "" {
            append(*sb, t.comment);
            append(*sb, "\n");
        }
        print_to_builder(*sb, "% :: %;\n", t.name, t.alias);
    }

    write_entire_file("typedef.jai", *sb);

    for f: objc_functions {
        if f.comment != "" {
            append(*sb, f.comment);
            append(*sb, "\n");
        }
        print_to_builder(*sb, "% :: (", f.name);
        for p: f.parameters {
            if it_index > 0 {
                append(*sb, ", ");
            }
            print_to_builder(*sb, "%: %", sanitize_parameter_name(p.name), p.type);
        }
        print_to_builder(*sb, ") -> % #foreign %;\n", f.return_type, export_library_name);
    }

    write_entire_file("function.jai", *sb);

    for v: objc_vars {
        if v.comment != "" {
            append(*sb, v.comment);
            append(*sb, "\n");
        }
        if v.value == "" {
            print_to_builder(*sb, "%: % #elsewhere %;\n", v.name, v.type, export_library_name);
        } else {
            print_to_builder(*sb, "%: % : %;\n", v.name, v.type, v.value);
        }
    }

    write_entire_file("var.jai", *sb);

    for i: objc_interfaces {
        if i.comment != "" {
            append(*sb, i.comment);
            append(*sb, "\n");
        }

        print_to_builder(*sb, "% :: struct #type_info_no_size_complaint {\n", i.name);
        // For other Jai objc module, it adds a nsobject pointer as
        // the sole struct member, I don't know if that is necessary,
        // it does not affect any usage. So for consistency, I will
        // add an nsobject pointer here.
        append(*sb, "    nsobject: *NSObject;\n");
        for m: i.class_methods {
            if m.comment != "" {
                // TODO: The alignment of the comment is off, should be indented by 4 spaces.
                append(*sb, m.comment);
                append(*sb, "\n");
            }
            print_to_builder(*sb, "    % :: (", m.name_underline);
            for p: m.parameters {
                if it_index > 0 {
                    append(*sb, ", ");
                }
                print_to_builder(*sb, "%: %", sanitize_parameter_name(p.name), p.type);
            }
            return_type := ifx m.return_type == "instancetype" then tprint("*%", i.name) else m.return_type;
            print_to_builder(*sb, ") -> % {\n", return_type);
            append(*sb, "        func: #type (obj: *void, selector: *void");
            for p: m.parameters {
                print_to_builder(*sb, ", %: %", sanitize_parameter_name(p.name), p.type);
            }
            print_to_builder(*sb, ") -> % #c_call;\n", return_type);
            append(*sb, "        func = xx objc_msgSend;\n");
            print_to_builder(*sb, "        return func(objc_getClass(\"%\"), __sel.%", i.name, m.name_underline);
            for p: m.parameters {
                append(*sb, ", ");
                append(*sb, p.name);
            }
            append(*sb, ");\n    }\n\n");
        }

        for m: i.instance_methods {
            if m.comment != "" {
                // TODO: The alignment of the comment is off, should be indented by 4 spaces.
                append(*sb, m.comment);
                append(*sb, "\n");
            } else {
                // Check if there is a property of the same name
                found := false;
                comment: string;
                for property: i.properties {
                    if property.name == m.name {
                        found = true;
                        comment = property.comment;
                        break;
                    }
                }
                if comment != "" {
                    append(*sb, comment);
                    append(*sb, "\n");
                }
            }
            print_to_builder(*sb, "    % :: (self: *%", m.name_underline, i.name);
            for p: m.parameters {
                print_to_builder(*sb, ", %: %", sanitize_parameter_name(p.name), p.type);
            }
            return_type := ifx m.return_type == "instancetype" then tprint("*%", i.name) else m.return_type;
            print_to_builder(*sb, ") -> % {\n", return_type);
            append(*sb, "        func: #type (obj: *void, selector: *void");
            for p: m.parameters {
                print_to_builder(*sb, ", %: %", sanitize_parameter_name(p.name), p.type);
            }
            print_to_builder(*sb, ") -> % #c_call;\n", return_type);
            append(*sb, "        func = xx objc_msgSend;\n");
            print_to_builder(*sb, "        return func(self, __sel.%", m.name_underline);
            for p: m.parameters {
                append(*sb, ", ");
                append(*sb, sanitize_parameter_name(p.name));
            }
            append(*sb, ");\n    }\n\n");
        }
        append(*sb, "}\n\n");
    }

    write_entire_file("interface.jai", *sb);

    for protocol: objc_protocols {
        if protocol.comment != "" {
            append(*sb, protocol.comment);
            append(*sb, "\n");
        }
        print_to_builder(*sb, "% :: struct #type_info_no_size_complaint {\n", protocol.name);

        for m: protocol.instance_methods {
            if m.comment != "" {
                // TODO: The alignment of the comment is off, should be indented by 4 spaces.
                append(*sb, m.comment);
                append(*sb, "\n");
            } else {
                // Check if there is a property of the same name
                found := false;
                comment: string;
                for property: protocol.properties {
                    if property.name == m.name {
                        found = true;
                        comment = property.comment;
                        break;
                    }
                }
                if comment != "" {
                    append(*sb, comment);
                    append(*sb, "\n");
                }
            }
            print_to_builder(*sb, "    % :: (self: *%", m.name_underline, protocol.name);
            for p: m.parameters {
                print_to_builder(*sb, ", %: %", sanitize_parameter_name(p.name), p.type);
            }
            return_type := ifx m.return_type == "instancetype" then tprint("*%", protocol.name) else m.return_type;
            print_to_builder(*sb, ") -> % {\n", return_type);
            append(*sb, "        func: #type (obj: *void, selector: *void");
            for p: m.parameters {
                print_to_builder(*sb, ", %: %", sanitize_parameter_name(p.name), p.type);
            }
            print_to_builder(*sb, ") -> % #c_call;\n", return_type);
            append(*sb, "        func = xx objc_msgSend;\n");
            print_to_builder(*sb, "        return func(self, __sel.%", m.name_underline);
            for p: m.parameters {
                append(*sb, ", ");
                append(*sb, sanitize_parameter_name(p.name));
            }
            append(*sb, ");\n    }\n\n");
        }
        append(*sb, "}\n\n");

    }

    write_entire_file("protocol.jai", *sb);

    append(*sb, "_Generated_Selectors :: struct #type_info_no_size_complaint {\n");
    for selector_table {
        real_selector_name := replace(it_index, ":", "_");
        print_to_builder(*sb, "    %: *void = ---;\n", real_selector_name);
    }
    append(*sb, "}\n__sel: _Generated_Selectors;\n");
    write_entire_file("selectors.jai", *sb);
}

#import "clang";
#import "Basic";
#import "String";
#import "macOS/Toolchain";
#import "Hash_Table";
#import "File";
