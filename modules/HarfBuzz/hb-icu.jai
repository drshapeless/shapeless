// This file is handcrafted.

hb_icu_script_to_script :: (script: UScriptCode) -> hb_script_t #foreign libharfbuzz_icu;
hb_icu_script_from_script :: (script: hb_script_t) -> UScriptCode #foreign libharfbuzz_icu;
hb_icu_get_unicode_funcs :: () -> *hb_unicode_funcs_t #foreign libharfbuzz_icu;

#scope_file
#import "ICU";

libharfbuzz_icu :: #library,system "libharfbuzz-icu";
