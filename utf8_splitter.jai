SSS :: "Hello 你好 🤑🫩🤲🏾----Abb";

Bound :: struct {
    script: UScriptCode;
    codepoints: [] u32;
}

get_script :: (prev: UScriptCode, current: UScriptCode) -> UScriptCode {
    if current == .COMMON || current == .INHERITED {
        return prev;
    }

    return current;
}

split_to_chunks :: (s: string) -> [] Bound {
    prev_script := UScriptCode.INVALID_CODE;

    i := 0;

    codepoints: [..] u32;
    bounds: [..] Bound;
    for :utf8_iter s {
        err: UErrorCode;
        code := uscript_getScript(xx it, *err);
        assert(err == 0);

        if prev_script == .INVALID_CODE {
            prev_script = code;
        } else {
            current_script := get_script(prev_script, code);
            if current_script != prev_script {
                bound := Bound.{
                    script = prev_script,
                    codepoints = array_copy(codepoints,, temp)
                };

                array_add(*bounds, bound);
                array_reset_keeping_memory(*codepoints);

                prev_script = current_script;
            }
        }
        array_add(*codepoints, it);
    }

    // The last one
    bound := Bound.{
        script = prev_script,
        codepoints = array_copy(codepoints,, temp)
    };

    array_add(*bounds, bound);

    return bounds;
}

main :: () {
    bounds := split_to_chunks(SSS);
    log("%", bounds);
}

#import "Basic";

#import "HarfBuzz";
#import "ICU";
#import "Unicode";
