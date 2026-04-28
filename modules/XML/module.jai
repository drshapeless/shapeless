// This library structure is inspired by Anton Mikhailov's Large Array of Thing

XML :: struct {
    Node :: struct {
        IDX :: #type s64;

        Node_Type :: enum {
            NIL;
            ELEMENT;
            CONTENT;
        }

        type: Node_Type;

        union {
            text: string;
            key:  string;
        }

        value: string;


        parent_idx: IDX;
        first_child_idx: IDX;
        first_attribute_idx: IDX;

        // Ring structure, the last item points to the first. This should
        // eliminate the need of last_child_idx, but it has to transverse
        // all the children in order to add a new sibling, and that may be
        // slow?
        //
        // Need testing
        next_sibling_idx: IDX;
    }

    // We have no idea how many nodes are there, so this cannot be preallocated.
    nodes: [..] Node;

    // We have a string buffer that stores all the string in the whole xml
    //
    // We don't care about how big the string buffer is, all we know
    // is that it must be enough to hold all the string allocation in
    // XML
    string_buffer: *u8;
    string_buffer_cursor: *u8;
}

// The root node is located at idx 1
parse_xml :: (s: string) -> XML {
    lexer: Lexer;
    lexer.input = s;

    xml: XML;
    init_xml(*xml, s.count);

    current_idx: XML.Node.IDX;

    while !lexer.reported_error {
        token := get_token(*lexer);
        if token.type == {
        case .EOF;
            break;
        case .ERROR;
            report_parse_error(*lexer, token, "Token error");
        case .L_BRACKET;
            parse_tag(*xml, *lexer, *current_idx);
        case .CONTENT;
            new_node := XML.Node.{
                type = .CONTENT,
                text = make_string(*xml, token.text)
            };

            add_child(*xml, current_idx, new_node);
        }
    }

    return xml;
}

get_node :: (xml: *XML, idx: XML.Node.IDX) -> *XML.Node {
    assert(idx < xml.nodes.count);
    return *xml.nodes[idx];
}

find_element :: (xml: *XML, root: XML.Node.IDX, name: string) -> XML.Node.IDX, *XML.Node {
    walk_children(xml, root, #code {
        if it.type == .ELEMENT && it.text == name {
            return it_index, it;
        }
    });

    return 0, null;
}

find_attribute :: (xml: *XML, root: XML.Node.IDX, key: string) -> found:bool, string {
    walk_attributes(xml, root, #code {
        if it_index == key {
            return true, it;
        }
    });

    return false, "";
}

walk_children :: (xml: *XML, parent_idx: XML.Node.IDX, body: Code) #expand {
    parent_node := get_node(xml, parent_idx);

    if parent_node.first_child_idx == 0 return;

    idx := parent_node.first_child_idx;
    is_done := false;
    while !is_done {
        child_node := get_node(xml, idx);
        // next_sibling_idx will never equal to 0
        assert(child_node.next_sibling_idx != 0, "next_sibling_idx should never equal to 0");

        `it := child_node;
        `it_index := idx;

        if child_node.next_sibling_idx == parent_node.first_child_idx {
            is_done = true;
        }

        idx = child_node.next_sibling_idx;

        #insert body;
    }
}

walk_attributes :: (xml: *XML, parent_idx: XML.Node.IDX, body: Code) #expand {
    parent_node := get_node(xml, parent_idx);

    if parent_node.first_attribute_idx == 0 return;

    idx := parent_node.first_attribute_idx;

    is_done := false;
    while !is_done {
        attr := get_node(xml, idx);

        `it_index := attr.key;
        `it := attr.value;

        if attr.next_sibling_idx == parent_node.first_attribute_idx {
            is_done = true;
        }

        idx = attr.next_sibling_idx;

        #insert body;
    }
}

free :: (xml: XML) {
    array_free(xml.nodes);
    free(xml.string_buffer);
}

#scope_file
// The string size should be the file size of the input string of the lexer
init_xml :: (xml: *XML, string_size: s64) {
    xml.string_buffer = alloc(string_size);
    xml.string_buffer_cursor = xml.string_buffer;

    // here we append an empty node as the nil thing
    empty_node: XML.Node;
    array_add(*xml.nodes, empty_node);
}

make_node :: (xml: *XML, node: XML.Node) -> XML.Node.IDX, *XML.Node {
    array_add(*xml.nodes, node);

    idx := xml.nodes.count - 1;
    return idx, get_node(xml, idx);
}

get_last_child :: (xml: *XML, idx: XML.Node.IDX) -> XML.Node.IDX, *XML.Node {
    root_node := get_node(xml, idx);

    if root_node.first_child_idx == 0 {
        return 0, null;
    }

    current_idx := root_node.first_child_idx;
    while true {
        current_node := get_node(xml, current_idx);

        // Don't check 0 for now
        if current_node.next_sibling_idx == root_node.first_child_idx {
            return current_idx, current_node;
        }

        current_idx = current_node.next_sibling_idx;
    }

    return 0, null;
}

// return child idx
add_child :: (xml: *XML, parent_idx: XML.Node.IDX, child: XML.Node) -> XML.Node.IDX {
    current_child_idx := make_node(xml, child);
    parent_node := get_node(xml, parent_idx);

    current_child := get_node(xml, current_child_idx);
    current_child.parent_idx = parent_idx;

    last_child_idx, last_child := get_last_child(xml, parent_idx);
    if last_child_idx {
        last_child.next_sibling_idx = current_child_idx;
    } else {
        parent_node.first_child_idx = current_child_idx;
    }
    current_child.next_sibling_idx = parent_node.first_child_idx;

    return current_child_idx;
}

make_string :: (xml: *XML, s: string) -> string {
    new_string: string;

    new_string.data = xml.string_buffer_cursor;
    new_string.count = s.count;

    memcpy(new_string.data, s.data, s.count);

    xml.string_buffer_cursor += s.count;

    return new_string;
}

parse_tag :: (xml: *XML, lexer: *Lexer, current_idx: *XML.Node.IDX) {
    // The first L_BRACKET is read
    first_token := get_token(lexer);

    Attribute :: struct {
        key: string;
        value: string;
    }

    add_attributes :: (xml: *XML, attrs: [] Attribute) -> XML.Node.IDX {
        // Returns the first IDX

        if attrs.count == 0 {
            return 0;
        }

        first := xml.nodes.count;
        for attrs {
            attr: XML.Node;

            attr.key = make_string(xml, it.key);
            attr.value = make_string(xml, it.value);

            if it_index < attrs.count - 1 {
                attr.next_sibling_idx = xml.nodes.count + 1;
            } else {
                // The last one point to the first one
                attr.next_sibling_idx = first;
            }

            array_add(*xml.nodes, attr);
        }

        return first;
    }

    if first_token.type == {
    case .IDENTIFIER;
        new_node: XML.Node;
        new_node.type = .ELEMENT;
        new_node.text = make_string(xml, first_token.text);

        attrs: [..] Attribute;
        attrs.allocator = temp;

        is_self_closed := false;
        while true {
            attr: Attribute;
            token := get_token(lexer);
            if token.type == {
            case .IDENTIFIER;
                ;
            case .SLASH;
                // Read one more token to check if that is a R_BRACKET
                token = get_token(lexer);
                if token.type != .R_BRACKET {
                    report_parse_error(lexer, token, "Expect R_BRACKET at the end of a tag, got %", token.type);
                }
                is_self_closed = true;
                break;
            case .R_BRACKET;
                break;
            case;
                report_parse_error(lexer, token, "Expect IDENTIFIER in attribute, got %", token.type);
                log("First token is %", first_token);
                return;
            }
            attr.key = token.text;

            token = get_token(lexer);
            if token.type != .EQUAL {
                report_parse_error(lexer, token, "Expect EQUAL in attribute, got %", token.type);
                return;
            }

            token = get_token(lexer);
            if token.type != .STRING {
                report_parse_error(lexer, token, "Expect STRING in attribute, got %", token.type);
                return;
            }
            attr.value = token.text;

            array_add(*attrs, attr);
        }
        new_node.first_attribute_idx = add_attributes(xml, attrs);
        if current_idx.* == 0 {
            if is_self_closed {
                report_parse_error(lexer, first_token, "Root element cannot be self closed");
                return;
            }

            idx := make_node(xml, new_node);
            current_idx.* = idx;
        } else {
            new_node_idx := add_child(xml, current_idx.*, new_node);

            if !is_self_closed {
                current_idx.* = new_node_idx;
            }
        }

    case .SLASH;
        // Next token should be IDENTIFIER
        token := get_token(lexer);
        if token.type != .IDENTIFIER {
            report_parse_error(lexer, token, "Expect IDENTIFIER in closing tag, got %", token.type);
            return;
        }
        tag_name := token.text;

        token = get_token(lexer);
        if token.type != .R_BRACKET {
            report_parse_error(lexer, token, "Expect R_BRACKET in closing tag, got %", token.type);
            return;
        }

        current_node := get_node(xml, current_idx.*);
        if current_node.type != .ELEMENT {
            report_parse_error(lexer, token, "The current node is not even an element, something is very wrong");
            return;
        } else if current_node.text != tag_name {
            report_parse_error(lexer, token, "The closing tag does not match opening tag, open: %, close: %", current_node.text, tag_name);
            return;
        }

        current_idx.* = current_node.parent_idx;
    case .BANG;
        // This is equal to ignoring comment entirely.
        while true {
            token := get_token(lexer);
            if token.type == .R_BRACKET {
                break;
            }
        }
        return;
    case .QUESTION;
        // Same as comment, we should not do this, but whatever,
        // declaration does not matter in my use case.
        while true {
            token := get_token(lexer);
            if token.type == .R_BRACKET {
                break;
            }
        }
        return;
    case;
        report_parse_error(lexer, first_token, "Unexpected token % after L_BRACKET", first_token.type);
        return;
    }
}

#import "Basic";
#import,file "lexer.jai";
#import "String";
