Token_Type :: enum {
    ERROR;
    L_BRACKET;
    R_BRACKET;
    IDENTIFIER;
    EQUAL;
    SLASH;
    STRING;
    CONTENT;
    QUESTION;
    BANG;
    DASH;
    EOF;
}

Token :: struct {
    type: Token_Type;
    l0, c0: s32;
    l1, c1: s32 = -1;

    text: string;
}

Lexer :: struct {
    current_line_number: s32 = 1;
    current_character_index: s32 = 1;

    input: string;
    input_cursor: s64;

    is_inside_tag := false;
    reported_error := false;
}

report_parse_error :: (lexer: *Lexer, format: string, arguments: .. Any) {
    log(format, .. arguments);
    log("... at line %, character %.\n", lexer.current_line_number, lexer.current_character_index);
    lexer.reported_error = true;
} @PrintLike

report_parse_error :: (lexer: *Lexer, token: Token, format: string, arguments: .. Any) {
    log(format, .. arguments);
    log("... at line %, character %.\n", token.l0, token.c0);
    lexer.reported_error = true;
} @PrintLike

get_token :: (lexer: *Lexer) -> Token {
    token: Token;

    if lexer.is_inside_tag {
        skip_spaces(lexer);
        c := peek_next_character(lexer);
        if c < 0 return .{ type = .EOF };

        if c == {
        case #char "=";
            token = make_single_character_token(lexer, .EQUAL);
        case #char "/";
            token = make_single_character_token(lexer, .SLASH);
        case #char "\"";
            token = make_string_token(lexer);
        case #char ">";
            token = make_single_character_token(lexer, .R_BRACKET);
            lexer.is_inside_tag = false;
        case #char "-";
            token = make_single_character_token(lexer, .DASH);
        case #char "!";
            token = make_single_character_token(lexer, .BANG);
        case #char "?";
            token = make_single_character_token(lexer, .QUESTION);
        case;
            token = make_identifier_token(lexer);
        }
    } else {
        // read until next <
        c := peek_next_character(lexer);
        if c < 0 return .{ type = .EOF };

        if c == #char "<" {
            token = make_single_character_token(lexer, .L_BRACKET);
            lexer.is_inside_tag = true;
        } else {
            token = make_content_token(lexer);

            all_space := true;
            for token.text {
                if !is_space(it) {
                    all_space = false;
                    break;
                }
            }

            if all_space {
                skip_spaces(lexer);
                c = peek_next_character(lexer);
                if c < 0 return .{ type = .EOF };

                if c != #char "<" {
                    report_parse_error(lexer, "Expect <");
                    return .{type = .ERROR};
                }
                token = make_single_character_token(lexer, .L_BRACKET);
                lexer.is_inside_tag = true;
            }
        }
    }

    return token;
}

#scope_file

peek_next_character :: (using lexer: *Lexer) -> s16 {
    if input_cursor >= input.count {
        return -1;
    }

    return input[input_cursor];
}

eat_character :: (using lexer: *Lexer) {
    if input_cursor >= input.count {
        return;
    }

    if input[input_cursor] == #char "\n" {
        current_line_number += 1;
        current_character_index = 0;
    }

    input_cursor += 1;
    current_character_index += 1;
}

make_empty_token :: (using lexer: *Lexer) -> Token {
    t := Token.{
        l0 = current_line_number,
        c0 = current_character_index,
    };

    return t;
}

skip_spaces :: (lexer: *Lexer) {
    while 1 {
        c := peek_next_character(lexer);
        if c < 0 break;

        if is_space(xx c) {
            eat_character(lexer);
        } else {
            return;
        }
    }
}

set_end_of_token :: (using lexer: *Lexer, token: *Token){
    token.l1 = lexer.current_line_number;
    token.c1 = lexer.current_character_index;
}

make_string_token :: (lexer: *Lexer) -> Token {
    // Assume the first character is a double quote
    //
    // This function does not include the surrounded double quotes
    eat_character(lexer);
    last_char: s16 = 0;

    token := make_empty_token(lexer);
    token.type = .STRING;
    start_pos := lexer.input_cursor;
    while true {
        c := peek_next_character(lexer);

        if c == #char "\"" && last_char != #char "\\" {
            set_end_of_token(lexer, *token);

            token.text = slice(lexer.input, start_pos, lexer.input_cursor - start_pos);

            // eat the last quote
            eat_character(lexer);

            break;
        }

        eat_character(lexer);
        last_char = c;
    }

    return token;
}

make_identifier_token :: (lexer: *Lexer) -> Token {
    token := make_empty_token(lexer);
    start_pos := lexer.input_cursor;

    SPECIAL_CHARACTERS :: "=/>?-";

    while true {
        c := peek_next_character(lexer);
        if c < 0 break;
        if contains(SPECIAL_CHARACTERS, cast(u8) c) || is_space(xx c) {
            token.type = .IDENTIFIER;
            set_end_of_token(lexer, *token);
            token.text = slice(lexer.input, start_pos, lexer.input_cursor - start_pos);
            break;
        }
        eat_character(lexer);
    }

    return token;
}

make_single_character_token :: (lexer: *Lexer, token_type: Token_Type) -> Token {
    token := make_empty_token(lexer);
    token.type = token_type;
    eat_character(lexer);
    set_end_of_token(lexer, *token);

    return token;
}

make_content_token :: (lexer: *Lexer) -> Token {
    token := make_empty_token(lexer);
    start_pos := lexer.input_cursor;

    while true {
        c := peek_next_character(lexer);
        if c < 0 break;

        if c == #char "<" {
            token.type = .CONTENT;
            set_end_of_token(lexer, *token);
            token.text = slice(lexer.input, start_pos, lexer.input_cursor - start_pos);
            break;
        }
        eat_character(lexer);
    }

    return token;
}

#import "Basic";
#import "String";
