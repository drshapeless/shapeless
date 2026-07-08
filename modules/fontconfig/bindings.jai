//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



FC_MAJOR :: 2;
FC_MINOR :: 17;
FC_REVISION :: 1;

FC_VERSION :: (FC_MAJOR * 10000) + (FC_MINOR * 100) + (FC_REVISION);

FC_CACHE_VERSION_NUMBER :: 9;

FcFalse :: 0;
FcTrue :: 1;
FcDontCare :: 2;

FC_FAMILY :: "family";
FC_STYLE :: "style";
FC_SLANT :: "slant";
FC_WEIGHT :: "weight";
FC_SIZE :: "size";
FC_ASPECT :: "aspect";
FC_PIXEL_SIZE :: "pixelsize";
FC_SPACING :: "spacing";
FC_FOUNDRY :: "foundry";
FC_ANTIALIAS :: "antialias";
FC_HINTING :: "hinting";
FC_HINT_STYLE :: "hintstyle";
FC_VERTICAL_LAYOUT :: "verticallayout";
FC_AUTOHINT :: "autohint";

FC_GLOBAL_ADVANCE :: "globaladvance";
FC_WIDTH :: "width";
FC_FILE :: "file";
FC_INDEX :: "index";
FC_FT_FACE :: "ftface";
FC_RASTERIZER :: "rasterizer";
FC_OUTLINE :: "outline";
FC_SCALABLE :: "scalable";
FC_COLOR :: "color";
FC_VARIABLE :: "variable";
FC_SCALE :: "scale";
FC_SYMBOL :: "symbol";
FC_DPI :: "dpi";
FC_RGBA :: "rgba";
FC_MINSPACE :: "minspace";
FC_SOURCE :: "source";
FC_CHARSET :: "charset";
FC_LANG :: "lang";
FC_FONTVERSION :: "fontversion";
FC_FULLNAME :: "fullname";
FC_FAMILYLANG :: "familylang";
FC_STYLELANG :: "stylelang";
FC_FULLNAMELANG :: "fullnamelang";
FC_CAPABILITY :: "capability";
FC_FONTFORMAT :: "fontformat";
FC_EMBOLDEN :: "embolden";
FC_EMBEDDED_BITMAP :: "embeddedbitmap";
FC_DECORATIVE :: "decorative";
FC_LCD_FILTER :: "lcdfilter";
FC_FONT_FEATURES :: "fontfeatures";
FC_FONT_VARIATIONS :: "fontvariations";
FC_NAMELANG :: "namelang";
FC_PRGNAME :: "prgname";
FC_HASH :: "hash";
FC_POSTSCRIPT_NAME :: "postscriptname";
FC_FONT_HAS_HINT :: "fonthashint";
FC_ORDER :: "order";
FC_DESKTOP_NAME :: "desktop";
FC_NAMED_INSTANCE :: "namedinstance";
FC_FONT_WRAPPER :: "fontwrapper";

FC_CHARWIDTH :: "charwidth";
FC_CHAR_WIDTH :: FC_CHARWIDTH;
FC_CHAR_HEIGHT :: "charheight";
FC_MATRIX :: "matrix";

FC_WEIGHT_THIN :: 0;
FC_WEIGHT_EXTRALIGHT :: 40;
FC_WEIGHT_ULTRALIGHT :: FC_WEIGHT_EXTRALIGHT;
FC_WEIGHT_LIGHT :: 50;
FC_WEIGHT_DEMILIGHT :: 55;
FC_WEIGHT_SEMILIGHT :: FC_WEIGHT_DEMILIGHT;
FC_WEIGHT_BOOK :: 75;
FC_WEIGHT_REGULAR :: 80;
FC_WEIGHT_NORMAL :: FC_WEIGHT_REGULAR;
FC_WEIGHT_MEDIUM :: 100;
FC_WEIGHT_DEMIBOLD :: 180;
FC_WEIGHT_SEMIBOLD :: FC_WEIGHT_DEMIBOLD;
FC_WEIGHT_BOLD :: 200;
FC_WEIGHT_EXTRABOLD :: 205;
FC_WEIGHT_ULTRABOLD :: FC_WEIGHT_EXTRABOLD;
FC_WEIGHT_BLACK :: 210;
FC_WEIGHT_HEAVY :: FC_WEIGHT_BLACK;
FC_WEIGHT_EXTRABLACK :: 215;
FC_WEIGHT_ULTRABLACK :: FC_WEIGHT_EXTRABLACK;

FC_SLANT_ROMAN :: 0;
FC_SLANT_ITALIC :: 100;
FC_SLANT_OBLIQUE :: 110;

FC_WIDTH_ULTRACONDENSED :: 50;
FC_WIDTH_EXTRACONDENSED :: 63;
FC_WIDTH_CONDENSED :: 75;
FC_WIDTH_SEMICONDENSED :: 87;
FC_WIDTH_NORMAL :: 100;
FC_WIDTH_SEMIEXPANDED :: 113;
FC_WIDTH_EXPANDED :: 125;
FC_WIDTH_EXTRAEXPANDED :: 150;
FC_WIDTH_ULTRAEXPANDED :: 200;

FC_PROPORTIONAL :: 0;
FC_DUAL :: 90;
FC_MONO :: 100;
FC_CHARCELL :: 110;

FC_RGBA_UNKNOWN :: 0;
FC_RGBA_RGB :: 1;
FC_RGBA_BGR :: 2;
FC_RGBA_VRGB :: 3;
FC_RGBA_VBGR :: 4;
FC_RGBA_NONE :: 5;

FC_HINT_NONE :: 0;
FC_HINT_SLIGHT :: 1;
FC_HINT_MEDIUM :: 2;
FC_HINT_FULL :: 3;

FC_LCD_NONE :: 0;
FC_LCD_DEFAULT :: 1;
FC_LCD_LIGHT :: 2;
FC_LCD_LEGACY :: 3;

FC_CHARSET_MAP_SIZE :: 256 / 32;
FC_CHARSET_DONE :: cast,trunc(FcChar32) - 1;

FC_UTF8_MAX_LEN :: 6;

FcChar8 :: u8;
FcChar16 :: u16;
FcChar32 :: u32;
FcBool :: s32;

_FcType :: enum s32 {
    Unknown :: -1;
    Void    :: 0;
    Integer :: 1;
    Double  :: 2;
    String  :: 3;
    Bool    :: 4;
    Matrix  :: 5;
    CharSet :: 6;
    FTFace  :: 7;
    LangSet :: 8;
    Range   :: 9;

    FcTypeUnknown :: Unknown;
    FcTypeVoid    :: Void;
    FcTypeInteger :: Integer;
    FcTypeDouble  :: Double;
    FcTypeString  :: String;
    FcTypeBool    :: Bool;
    FcTypeMatrix  :: Matrix;
    FcTypeCharSet :: CharSet;
    FcTypeFTFace  :: FTFace;
    FcTypeLangSet :: LangSet;
    FcTypeRange   :: Range;
}

FcType :: _FcType;

_FcMatrix :: struct {
    _xx: float64;
    xy:  float64;
    yx:  float64;
    yy:  float64;
}

FcMatrix :: _FcMatrix;

_FcCharSet :: struct {}
/*
* A data structure to represent the available glyphs in a font.
* This is represented as a sparse boolean btree.
*/
FcCharSet :: _FcCharSet;

_FcObjectType :: struct {
    object: *u8;
    type:   FcType;
}

FcObjectType :: _FcObjectType;

_FcConstant :: struct {
    name:   *FcChar8;
    object: *u8;
    value:  s32;
}

FcConstant :: _FcConstant;

_FcResult :: enum u32 {
    Match        :: 0;
    NoMatch      :: 1;
    TypeMismatch :: 2;
    NoId         :: 3;
    OutOfMemory  :: 4;

    FcResultMatch        :: Match;
    FcResultNoMatch      :: NoMatch;
    FcResultTypeMismatch :: TypeMismatch;
    FcResultNoId         :: NoId;
    FcResultOutOfMemory  :: OutOfMemory;
}

FcResult :: _FcResult;

_FcValueBinding :: enum u32 {
    Weak   :: 0;
    Strong :: 1;
    Same   :: 2;

    End    :: 2147483647;

    FcValueBindingWeak   :: Weak;
    FcValueBindingStrong :: Strong;
    FcValueBindingSame   :: Same;

    FcValueBindingEnd    :: End;
}

FcValueBinding :: _FcValueBinding;

_FcPattern :: struct {}
FcPattern :: _FcPattern;

_FcPatternIter :: struct {
    dummy1: *void;
    dummy2: *void;
}

FcPatternIter :: _FcPatternIter;

_FcLangSet :: struct {}
FcLangSet :: _FcLangSet;

_FcRange :: struct {}
FcRange :: _FcRange;

_FcValue :: struct {
    type: FcType;
    u:    struct {
        s: *FcChar8;

        #overlay (s) i: s32;
        #overlay (s) b: FcBool;
        #overlay (s) d: float64;
        #overlay (s) m: *FcMatrix;
        #overlay (s) c: *FcCharSet;
        #overlay (s) f: *void;
        #overlay (s) l: *FcLangSet;
        #overlay (s) r: *FcRange;
    };
}

FcValue :: _FcValue;

_FcFontSet :: struct {
    nfont: s32;
    sfont: s32;
    fonts: **FcPattern;
}

FcFontSet :: _FcFontSet;

_FcObjectSet :: struct {
    nobject: s32;
    sobject: s32;
    objects: **u8;
}

FcObjectSet :: _FcObjectSet;

_FcMatchKind :: enum u32 {
    Pattern   :: 0;
    Font      :: 1;
    Scan      :: 2;
    KindEnd   :: 3;
    KindBegin :: 0;

    FcMatchPattern   :: Pattern;
    FcMatchFont      :: Font;
    FcMatchScan      :: Scan;
    FcMatchKindEnd   :: KindEnd;
    FcMatchKindBegin :: KindBegin;
}

FcMatchKind :: _FcMatchKind;

_FcLangResult :: enum u32 {
    Equal              :: 0;
    DifferentCountry   :: 1;
    DifferentTerritory :: 1;
    DifferentLang      :: 2;

    FcLangEqual              :: Equal;
    FcLangDifferentCountry   :: DifferentCountry;
    FcLangDifferentTerritory :: DifferentTerritory;
    FcLangDifferentLang      :: DifferentLang;
}

FcLangResult :: _FcLangResult;

_FcSetName :: enum u32 {
    System      :: 0;
    Application :: 1;

    FcSetSystem      :: System;
    FcSetApplication :: Application;
}

FcSetName :: _FcSetName;

_FcConfigFileInfoIter :: struct {
    dummy1: *void;
    dummy2: *void;
    dummy3: *void;
}

FcConfigFileInfoIter :: _FcConfigFileInfoIter;

_FcAtomic :: struct {}
FcAtomic :: _FcAtomic;

FcEndian :: enum u32 {
    Big    :: 0;
    Little :: 1;

    FcEndianBig    :: Big;
    FcEndianLittle :: Little;
}

_FcConfig :: struct {}
FcConfig :: _FcConfig;

_FcGlobalCache :: struct {}
FcFileCache :: _FcGlobalCache;

_FcBlanks :: struct {}
FcBlanks :: _FcBlanks;

_FcStrList :: struct {}
FcStrList :: _FcStrList;

_FcStrSet :: struct {}
FcStrSet :: _FcStrSet;

_FcCache :: struct {}
FcCache :: _FcCache;

FcDestroyFunc :: #type (data: *void) -> void #c_call;
FcFilterFontSetFunc :: #type (font: *FcPattern, user_data: *void) -> FcBool #c_call;

/* fcblanks.c */
FcBlanksCreate :: () -> *FcBlanks #foreign libfontconfig;

FcBlanksDestroy :: (b: *FcBlanks) -> void #foreign libfontconfig;

FcBlanksAdd :: (b: *FcBlanks, ucs4: FcChar32) -> FcBool #foreign libfontconfig;

FcBlanksIsMember :: (b: *FcBlanks, ucs4: FcChar32) -> FcBool #foreign libfontconfig;

/* fccache.c */
FcCacheDir :: (c: *FcCache) -> *FcChar8 #foreign libfontconfig;

FcCacheCopySet :: (c: *FcCache) -> *FcFontSet #foreign libfontconfig;

FcCacheSubdir :: (c: *FcCache, i: s32) -> *FcChar8 #foreign libfontconfig;

FcCacheNumSubdir :: (c: *FcCache) -> s32 #foreign libfontconfig;

FcCacheNumFont :: (c: *FcCache) -> s32 #foreign libfontconfig;

FcDirCacheUnlink :: (dir: *FcChar8, config: *FcConfig) -> FcBool #foreign libfontconfig;

FcDirCacheValid :: (cache_file: *FcChar8) -> FcBool #foreign libfontconfig;

FcDirCacheClean :: (cache_dir: *FcChar8, verbose: FcBool) -> FcBool #foreign libfontconfig;

FcCacheCreateTagFile :: (config: *FcConfig) -> void #foreign libfontconfig;

FcDirCacheCreateUUID :: (dir: *FcChar8, force: FcBool, config: *FcConfig) -> FcBool #foreign libfontconfig;

FcDirCacheDeleteUUID :: (dir: *FcChar8, config: *FcConfig) -> FcBool #foreign libfontconfig;

/* fccfg.c */
FcConfigHome :: () -> *FcChar8 #foreign libfontconfig;

FcConfigEnableHome :: (enable: FcBool) -> FcBool #foreign libfontconfig;

FcConfigGetFilename :: (config: *FcConfig, url: *FcChar8) -> *FcChar8 #foreign libfontconfig;

FcConfigFilename :: (url: *FcChar8) -> *FcChar8 #foreign libfontconfig;

FcConfigCreate :: () -> *FcConfig #foreign libfontconfig;

FcConfigReference :: (config: *FcConfig) -> *FcConfig #foreign libfontconfig;

FcConfigDestroy :: (config: *FcConfig) -> void #foreign libfontconfig;

FcConfigSetCurrent :: (config: *FcConfig) -> FcBool #foreign libfontconfig;

FcConfigGetCurrent :: () -> *FcConfig #foreign libfontconfig;

FcConfigUptoDate :: (config: *FcConfig) -> FcBool #foreign libfontconfig;

FcConfigBuildFonts :: (config: *FcConfig) -> FcBool #foreign libfontconfig;

FcConfigGetFontDirs :: (config: *FcConfig) -> *FcStrList #foreign libfontconfig;

FcConfigGetConfigDirs :: (config: *FcConfig) -> *FcStrList #foreign libfontconfig;

FcConfigGetConfigFiles :: (config: *FcConfig) -> *FcStrList #foreign libfontconfig;

FcConfigGetCache :: (config: *FcConfig) -> *FcChar8 #foreign libfontconfig;

FcConfigGetBlanks :: (config: *FcConfig) -> *FcBlanks #foreign libfontconfig;

FcConfigGetCacheDirs :: (config: *FcConfig) -> *FcStrList #foreign libfontconfig;

FcConfigGetRescanInterval :: (config: *FcConfig) -> s32 #foreign libfontconfig;

FcConfigSetRescanInterval :: (config: *FcConfig, rescanInterval: s32) -> FcBool #foreign libfontconfig;

FcConfigGetFonts :: (config: *FcConfig, set: FcSetName) -> *FcFontSet #foreign libfontconfig;

FcConfigAcceptFont :: (config: *FcConfig, font: *FcPattern) -> FcBool #foreign libfontconfig;

FcConfigAcceptFilter :: (config: *FcConfig, font: *FcPattern) -> FcBool #foreign libfontconfig;

FcConfigAppFontAddFile :: (config: *FcConfig, file: *FcChar8) -> FcBool #foreign libfontconfig;

FcConfigAppFontAddDir :: (config: *FcConfig, dir: *FcChar8) -> FcBool #foreign libfontconfig;

FcConfigAppFontClear :: (config: *FcConfig) -> void #foreign libfontconfig;

FcConfigPreferAppFont :: (config: *FcConfig, flag: FcBool) -> void #foreign libfontconfig;

FcConfigSubstituteWithPat :: (config: *FcConfig, p: *FcPattern, p_pat: *FcPattern, kind: FcMatchKind) -> FcBool #foreign libfontconfig;

FcConfigSubstitute :: (config: *FcConfig, p: *FcPattern, kind: FcMatchKind) -> FcBool #foreign libfontconfig;

FcConfigGetSysRoot :: (config: *FcConfig) -> *FcChar8 #foreign libfontconfig;

FcConfigSetSysRoot :: (config: *FcConfig, sysroot: *FcChar8) -> void #foreign libfontconfig;

FcConfigSetFontSetFilter :: (config: *FcConfig, filter_func: FcFilterFontSetFunc, destroy_data_func: FcDestroyFunc, user_data: *void) -> *FcConfig #foreign libfontconfig;

FcConfigFileInfoIterInit :: (config: *FcConfig, iter: *FcConfigFileInfoIter) -> void #foreign libfontconfig;

FcConfigFileInfoIterNext :: (config: *FcConfig, iter: *FcConfigFileInfoIter) -> FcBool #foreign libfontconfig;

FcConfigFileInfoIterGet :: (config: *FcConfig, iter: *FcConfigFileInfoIter, name: **FcChar8, description: **FcChar8, enabled: *FcBool) -> FcBool #foreign libfontconfig;

/* fccharset.c */
FcCharSetCreate :: () -> *FcCharSet #foreign libfontconfig;

/* deprecated alias for FcCharSetCreate */
FcCharSetNew :: () -> *FcCharSet #foreign libfontconfig;

FcCharSetDestroy :: (fcs: *FcCharSet) -> void #foreign libfontconfig;

FcCharSetAddChar :: (fcs: *FcCharSet, ucs4: FcChar32) -> FcBool #foreign libfontconfig;

FcCharSetDelChar :: (fcs: *FcCharSet, ucs4: FcChar32) -> FcBool #foreign libfontconfig;

FcCharSetCopy :: (src: *FcCharSet) -> *FcCharSet #foreign libfontconfig;

FcCharSetEqual :: (a: *FcCharSet, b: *FcCharSet) -> FcBool #foreign libfontconfig;

FcCharSetIntersect :: (a: *FcCharSet, b: *FcCharSet) -> *FcCharSet #foreign libfontconfig;

FcCharSetUnion :: (a: *FcCharSet, b: *FcCharSet) -> *FcCharSet #foreign libfontconfig;

FcCharSetSubtract :: (a: *FcCharSet, b: *FcCharSet) -> *FcCharSet #foreign libfontconfig;

FcCharSetMerge :: (a: *FcCharSet, b: *FcCharSet, changed: *FcBool) -> FcBool #foreign libfontconfig;

FcCharSetHasChar :: (fcs: *FcCharSet, ucs4: FcChar32) -> FcBool #foreign libfontconfig;

FcCharSetCount :: (a: *FcCharSet) -> FcChar32 #foreign libfontconfig;

FcCharSetIntersectCount :: (a: *FcCharSet, b: *FcCharSet) -> FcChar32 #foreign libfontconfig;

FcCharSetSubtractCount :: (a: *FcCharSet, b: *FcCharSet) -> FcChar32 #foreign libfontconfig;

FcCharSetIsSubset :: (a: *FcCharSet, b: *FcCharSet) -> FcBool #foreign libfontconfig;

FcCharSetFirstPage :: (a: *FcCharSet, map: *[8] FcChar32, next: *FcChar32) -> FcChar32 #foreign libfontconfig;

FcCharSetNextPage :: (a: *FcCharSet, map: *[8] FcChar32, next: *FcChar32) -> FcChar32 #foreign libfontconfig;

/*
* old coverage API, rather hard to use correctly
*/
FcCharSetCoverage :: (a: *FcCharSet, page: FcChar32, result: *FcChar32) -> FcChar32 #foreign libfontconfig;

/* fcdbg.c */
FcValuePrint :: (v: FcValue) -> void #foreign libfontconfig;

FcPatternPrint :: (p: *FcPattern) -> void #foreign libfontconfig;

FcFontSetPrint :: (s: *FcFontSet) -> void #foreign libfontconfig;

/* fcdefault.c */
FcConfigGetDefaultLangs :: (config: *FcConfig) -> *FcStrSet #foreign libfontconfig;

FcGetDefaultLangs :: () -> *FcStrSet #foreign libfontconfig;

FcConfigSetDefaultSubstitute :: (config: *FcConfig, pattern: *FcPattern) -> void #foreign libfontconfig;

FcDefaultSubstitute :: (pattern: *FcPattern) -> void #foreign libfontconfig;

/* fcdir.c */
FcFileIsDir :: (file: *FcChar8) -> FcBool #foreign libfontconfig;

FcFileScan :: (set: *FcFontSet, dirs: *FcStrSet, cache: *FcFileCache, blanks: *FcBlanks, file: *FcChar8, force: FcBool) -> FcBool #foreign libfontconfig;

FcDirScan :: (set: *FcFontSet, dirs: *FcStrSet, cache: *FcFileCache, blanks: *FcBlanks, dir: *FcChar8, force: FcBool) -> FcBool #foreign libfontconfig;

FcDirSave :: (set: *FcFontSet, dirs: *FcStrSet, dir: *FcChar8) -> FcBool #foreign libfontconfig;

FcDirCacheLoad :: (dir: *FcChar8, config: *FcConfig, cache_file: **FcChar8) -> *FcCache #foreign libfontconfig;

FcDirCacheRescan :: (dir: *FcChar8, config: *FcConfig) -> *FcCache #foreign libfontconfig;

FcDirCacheRead :: (dir: *FcChar8, force: FcBool, config: *FcConfig) -> *FcCache #foreign libfontconfig;

FcDirCacheLoadFile :: (cache_file: *FcChar8, file_stat: *stat) -> *FcCache #foreign libfontconfig;

FcDirCacheUnload :: (cache: *FcCache) -> void #foreign libfontconfig;

/* fcfreetype.c */
FcFreeTypeQuery :: (file: *FcChar8, id: u32, blanks: *FcBlanks, count: *s32) -> *FcPattern #foreign libfontconfig;

FcFreeTypeQueryAll :: (file: *FcChar8, id: u32, blanks: *FcBlanks, count: *s32, set: *FcFontSet) -> u32 #foreign libfontconfig;

/* fcfs.c */
FcFontSetCreate :: () -> *FcFontSet #foreign libfontconfig;

FcFontSetDestroy :: (s: *FcFontSet) -> void #foreign libfontconfig;

FcFontSetAdd :: (s: *FcFontSet, font: *FcPattern) -> FcBool #foreign libfontconfig;

/* fcinit.c */
FcInitLoadConfig :: () -> *FcConfig #foreign libfontconfig;

FcInitLoadConfigAndFonts :: () -> *FcConfig #foreign libfontconfig;

FcInit :: () -> FcBool #foreign libfontconfig;

FcFini :: () -> void #foreign libfontconfig;

FcGetVersion :: () -> s32 #foreign libfontconfig;

FcInitReinitialize :: () -> FcBool #foreign libfontconfig;

FcInitBringUptoDate :: () -> FcBool #foreign libfontconfig;

/* fclang.c */
FcGetLangs :: () -> *FcStrSet #foreign libfontconfig;

FcLangNormalize :: (lang: *FcChar8) -> *FcChar8 #foreign libfontconfig;

FcLangGetCharSet :: (lang: *FcChar8) -> *FcCharSet #foreign libfontconfig;

FcLangSetCreate :: () -> *FcLangSet #foreign libfontconfig;

FcLangSetDestroy :: (ls: *FcLangSet) -> void #foreign libfontconfig;

FcLangSetCopy :: (ls: *FcLangSet) -> *FcLangSet #foreign libfontconfig;

FcLangSetAdd :: (ls: *FcLangSet, lang: *FcChar8) -> FcBool #foreign libfontconfig;

FcLangSetDel :: (ls: *FcLangSet, lang: *FcChar8) -> FcBool #foreign libfontconfig;

FcLangSetHasLang :: (ls: *FcLangSet, lang: *FcChar8) -> FcLangResult #foreign libfontconfig;

FcLangSetCompare :: (lsa: *FcLangSet, lsb: *FcLangSet) -> FcLangResult #foreign libfontconfig;

FcLangSetContains :: (lsa: *FcLangSet, lsb: *FcLangSet) -> FcBool #foreign libfontconfig;

FcLangSetEqual :: (lsa: *FcLangSet, lsb: *FcLangSet) -> FcBool #foreign libfontconfig;

FcLangSetHash :: (ls: *FcLangSet) -> FcChar32 #foreign libfontconfig;

FcLangSetGetLangs :: (ls: *FcLangSet) -> *FcStrSet #foreign libfontconfig;

FcLangSetUnion :: (a: *FcLangSet, b: *FcLangSet) -> *FcLangSet #foreign libfontconfig;

FcLangSetSubtract :: (a: *FcLangSet, b: *FcLangSet) -> *FcLangSet #foreign libfontconfig;

/* fclist.c */
FcObjectSetCreate :: () -> *FcObjectSet #foreign libfontconfig;

FcObjectSetAdd :: (os: *FcObjectSet, object: *u8) -> FcBool #foreign libfontconfig;

FcObjectSetDestroy :: (os: *FcObjectSet) -> void #foreign libfontconfig;

FcObjectSetBuild_CFormat :: (first: *u8, __args: ..Any) -> *FcObjectSet #foreign libfontconfig "FcObjectSetBuild";
FcObjectSetBuild :: (first: string, __args: ..Any) -> *FcObjectSet {
    push_allocator(temp);
    formatted_text_builder: String_Builder;
    print_to_builder(*formatted_text_builder, first, ..__args);
    append(*formatted_text_builder, "\0");
    formatted_text := builder_to_string(*formatted_text_builder);
    return FcObjectSetBuild_CFormat("%s", formatted_text.data);
} @PrintLike

FcFontSetList :: (config: *FcConfig, sets: **FcFontSet, nsets: s32, p: *FcPattern, os: *FcObjectSet) -> *FcFontSet #foreign libfontconfig;

FcFontList :: (config: *FcConfig, p: *FcPattern, os: *FcObjectSet) -> *FcFontSet #foreign libfontconfig;

/* fcatomic.c */
FcAtomicCreate :: (file: *FcChar8) -> *FcAtomic #foreign libfontconfig;

FcAtomicLock :: (atomic: *FcAtomic) -> FcBool #foreign libfontconfig;

FcAtomicNewFile :: (atomic: *FcAtomic) -> *FcChar8 #foreign libfontconfig;

FcAtomicOrigFile :: (atomic: *FcAtomic) -> *FcChar8 #foreign libfontconfig;

FcAtomicReplaceOrig :: (atomic: *FcAtomic) -> FcBool #foreign libfontconfig;

FcAtomicDeleteNew :: (atomic: *FcAtomic) -> void #foreign libfontconfig;

FcAtomicUnlock :: (atomic: *FcAtomic) -> void #foreign libfontconfig;

FcAtomicDestroy :: (atomic: *FcAtomic) -> void #foreign libfontconfig;

/* fcmatch.c */
FcFontSetMatch :: (config: *FcConfig, sets: **FcFontSet, nsets: s32, p: *FcPattern, result: *FcResult) -> *FcPattern #foreign libfontconfig;

FcFontMatch :: (config: *FcConfig, p: *FcPattern, result: *FcResult) -> *FcPattern #foreign libfontconfig;

FcFontRenderPrepare :: (config: *FcConfig, pat: *FcPattern, font: *FcPattern) -> *FcPattern #foreign libfontconfig;

FcFontSetSort :: (config: *FcConfig, sets: **FcFontSet, nsets: s32, p: *FcPattern, trim: FcBool, csp: **FcCharSet, result: *FcResult) -> *FcFontSet #foreign libfontconfig;

FcFontSort :: (config: *FcConfig, p: *FcPattern, trim: FcBool, csp: **FcCharSet, result: *FcResult) -> *FcFontSet #foreign libfontconfig;

FcFontSetSortDestroy :: (fs: *FcFontSet) -> void #foreign libfontconfig;

/* fcmatrix.c */
FcMatrixCopy :: (mat: *FcMatrix) -> *FcMatrix #foreign libfontconfig;

FcMatrixEqual :: (mat1: *FcMatrix, mat2: *FcMatrix) -> FcBool #foreign libfontconfig;

FcMatrixMultiply :: (result: *FcMatrix, a: *FcMatrix, b: *FcMatrix) -> void #foreign libfontconfig;

FcMatrixRotate :: (m: *FcMatrix, c: float64, s: float64) -> void #foreign libfontconfig;

FcMatrixScale :: (m: *FcMatrix, sx: float64, sy: float64) -> void #foreign libfontconfig;

FcMatrixShear :: (m: *FcMatrix, sh: float64, sv: float64) -> void #foreign libfontconfig;

/* Deprecated.  Does nothing.  Returns FcFalse. */
FcNameRegisterObjectTypes :: (types: *FcObjectType, ntype: s32) -> FcBool #foreign libfontconfig;

/* Deprecated.  Does nothing.  Returns FcFalse. */
FcNameUnregisterObjectTypes :: (types: *FcObjectType, ntype: s32) -> FcBool #foreign libfontconfig;

FcNameGetObjectType :: (object: *u8) -> *FcObjectType #foreign libfontconfig;

/* Deprecated.  Does nothing.  Returns FcFalse. */
FcNameRegisterConstants :: (consts: *FcConstant, nconsts: s32) -> FcBool #foreign libfontconfig;

/* Deprecated.  Does nothing.  Returns FcFalse. */
FcNameUnregisterConstants :: (consts: *FcConstant, nconsts: s32) -> FcBool #foreign libfontconfig;

FcNameGetConstant :: (_string: *FcChar8) -> *FcConstant #foreign libfontconfig;

FcNameGetConstantFor :: (_string: *FcChar8, object: *u8) -> *FcConstant #foreign libfontconfig;

FcNameConstant :: (_string: *FcChar8, result: *s32) -> FcBool #foreign libfontconfig;

FcNameParse :: (name: *FcChar8) -> *FcPattern #foreign libfontconfig;

FcNameUnparse :: (pat: *FcPattern) -> *FcChar8 #foreign libfontconfig;

/* fcpat.c */
FcPatternCreate :: () -> *FcPattern #foreign libfontconfig;

FcPatternDuplicate :: (p: *FcPattern) -> *FcPattern #foreign libfontconfig;

FcPatternReference :: (p: *FcPattern) -> void #foreign libfontconfig;

FcPatternFilter :: (p: *FcPattern, os: *FcObjectSet) -> *FcPattern #foreign libfontconfig;

FcValueDestroy :: (v: FcValue) -> void #foreign libfontconfig;

FcValueEqual :: (va: FcValue, vb: FcValue) -> FcBool #foreign libfontconfig;

FcValueSave :: (v: FcValue) -> FcValue #foreign libfontconfig;

FcPatternDestroy :: (p: *FcPattern) -> void #foreign libfontconfig;

FcPatternObjectCount :: (pat: *FcPattern) -> s32 #foreign libfontconfig;

FcPatternEqual :: (pa: *FcPattern, pb: *FcPattern) -> FcBool #foreign libfontconfig;

FcPatternEqualSubset :: (pa: *FcPattern, pb: *FcPattern, os: *FcObjectSet) -> FcBool #foreign libfontconfig;

FcPatternHash :: (p: *FcPattern) -> FcChar32 #foreign libfontconfig;

FcPatternAdd :: (p: *FcPattern, object: *u8, value: FcValue, append: FcBool) -> FcBool #foreign libfontconfig;

FcPatternAddWeak :: (p: *FcPattern, object: *u8, value: FcValue, append: FcBool) -> FcBool #foreign libfontconfig;

FcPatternGet :: (p: *FcPattern, object: *u8, id: s32, v: *FcValue) -> FcResult #foreign libfontconfig;

FcPatternGetWithBinding :: (p: *FcPattern, object: *u8, id: s32, v: *FcValue, b: *FcValueBinding) -> FcResult #foreign libfontconfig;

FcPatternDel :: (p: *FcPattern, object: *u8) -> FcBool #foreign libfontconfig;

FcPatternRemove :: (p: *FcPattern, object: *u8, id: s32) -> FcBool #foreign libfontconfig;

FcPatternAddInteger :: (p: *FcPattern, object: *u8, i: s32) -> FcBool #foreign libfontconfig;

FcPatternAddDouble :: (p: *FcPattern, object: *u8, d: float64) -> FcBool #foreign libfontconfig;

FcPatternAddString :: (p: *FcPattern, object: *u8, s: *FcChar8) -> FcBool #foreign libfontconfig;

FcPatternAddMatrix :: (p: *FcPattern, object: *u8, s: *FcMatrix) -> FcBool #foreign libfontconfig;

FcPatternAddCharSet :: (p: *FcPattern, object: *u8, c: *FcCharSet) -> FcBool #foreign libfontconfig;

FcPatternAddBool :: (p: *FcPattern, object: *u8, b: FcBool) -> FcBool #foreign libfontconfig;

FcPatternAddLangSet :: (p: *FcPattern, object: *u8, ls: *FcLangSet) -> FcBool #foreign libfontconfig;

FcPatternAddRange :: (p: *FcPattern, object: *u8, r: *FcRange) -> FcBool #foreign libfontconfig;

FcPatternGetInteger :: (p: *FcPattern, object: *u8, n: s32, i: *s32) -> FcResult #foreign libfontconfig;

FcPatternGetDouble :: (p: *FcPattern, object: *u8, n: s32, d: *float64) -> FcResult #foreign libfontconfig;

FcPatternGetString :: (p: *FcPattern, object: *u8, n: s32, s: **FcChar8) -> FcResult #foreign libfontconfig;

FcPatternGetMatrix :: (p: *FcPattern, object: *u8, n: s32, s: **FcMatrix) -> FcResult #foreign libfontconfig;

FcPatternGetCharSet :: (p: *FcPattern, object: *u8, n: s32, c: **FcCharSet) -> FcResult #foreign libfontconfig;

FcPatternGetBool :: (p: *FcPattern, object: *u8, n: s32, b: *FcBool) -> FcResult #foreign libfontconfig;

FcPatternGetLangSet :: (p: *FcPattern, object: *u8, n: s32, ls: **FcLangSet) -> FcResult #foreign libfontconfig;

FcPatternGetRange :: (p: *FcPattern, object: *u8, id: s32, r: **FcRange) -> FcResult #foreign libfontconfig;

FcPatternBuild :: (p: *FcPattern, __args: ..Any) -> *FcPattern #foreign libfontconfig;

FcPatternFormat :: (pat: *FcPattern, format: *FcChar8) -> *FcChar8 #foreign libfontconfig;

/* fcrange.c */
FcRangeCreateDouble :: (begin: float64, end: float64) -> *FcRange #foreign libfontconfig;

FcRangeCreateInteger :: (begin: FcChar32, end: FcChar32) -> *FcRange #foreign libfontconfig;

FcRangeDestroy :: (range: *FcRange) -> void #foreign libfontconfig;

FcRangeCopy :: (r: *FcRange) -> *FcRange #foreign libfontconfig;

FcRangeGetDouble :: (range: *FcRange, begin: *float64, end: *float64) -> FcBool #foreign libfontconfig;

FcPatternIterStart :: (pat: *FcPattern, iter: *FcPatternIter) -> void #foreign libfontconfig;

FcPatternIterNext :: (pat: *FcPattern, iter: *FcPatternIter) -> FcBool #foreign libfontconfig;

FcPatternIterEqual :: (p1: *FcPattern, i1: *FcPatternIter, p2: *FcPattern, i2: *FcPatternIter) -> FcBool #foreign libfontconfig;

FcPatternFindIter :: (pat: *FcPattern, iter: *FcPatternIter, object: *u8) -> FcBool #foreign libfontconfig;

FcPatternIterIsValid :: (pat: *FcPattern, iter: *FcPatternIter) -> FcBool #foreign libfontconfig;

FcPatternIterGetObject :: (pat: *FcPattern, iter: *FcPatternIter) -> *u8 #foreign libfontconfig;

FcPatternIterValueCount :: (pat: *FcPattern, iter: *FcPatternIter) -> s32 #foreign libfontconfig;

FcPatternIterGetValue :: (pat: *FcPattern, iter: *FcPatternIter, id: s32, v: *FcValue, b: *FcValueBinding) -> FcResult #foreign libfontconfig;

/* fcweight.c */
FcWeightFromOpenType :: (ot_weight: s32) -> s32 #foreign libfontconfig;

FcWeightFromOpenTypeDouble :: (ot_weight: float64) -> float64 #foreign libfontconfig;

FcWeightToOpenType :: (fc_weight: s32) -> s32 #foreign libfontconfig;

FcWeightToOpenTypeDouble :: (fc_weight: float64) -> float64 #foreign libfontconfig;

/* fcstr.c */
FcStrCopy :: (s: *FcChar8) -> *FcChar8 #foreign libfontconfig;

FcStrCopyFilename :: (s: *FcChar8) -> *FcChar8 #foreign libfontconfig;

FcStrPlus :: (s1: *FcChar8, s2: *FcChar8) -> *FcChar8 #foreign libfontconfig;

FcStrFree :: (s: *FcChar8) -> void #foreign libfontconfig;

FcStrDowncase :: (s: *FcChar8) -> *FcChar8 #foreign libfontconfig;

FcStrCmpIgnoreCase :: (s1: *FcChar8, s2: *FcChar8) -> s32 #foreign libfontconfig;

FcStrCmp :: (s1: *FcChar8, s2: *FcChar8) -> s32 #foreign libfontconfig;

FcStrStrIgnoreCase :: (s1: *FcChar8, s2: *FcChar8) -> *FcChar8 #foreign libfontconfig;

FcStrStr :: (s1: *FcChar8, s2: *FcChar8) -> *FcChar8 #foreign libfontconfig;

FcUtf8ToUcs4 :: (src_orig: *FcChar8, dst: *FcChar32, len: s32) -> s32 #foreign libfontconfig;

FcUtf8Len :: (_string: *FcChar8, len: s32, nchar: *s32, wchar: *s32) -> FcBool #foreign libfontconfig;

FcUcs4ToUtf8 :: (ucs4: FcChar32, dest: *[6] FcChar8) -> s32 #foreign libfontconfig;

FcUtf16ToUcs4 :: (src_orig: *FcChar8, endian: FcEndian, dst: *FcChar32, len: s32) -> s32 #foreign libfontconfig;

FcUtf16Len :: (_string: *FcChar8, endian: FcEndian, len: s32, nchar: *s32, wchar: *s32) -> FcBool #foreign libfontconfig;

FcStrBuildFilename :: (path: *FcChar8, __args: ..Any) -> *FcChar8 #foreign libfontconfig;

FcStrDirname :: (file: *FcChar8) -> *FcChar8 #foreign libfontconfig;

FcStrBasename :: (file: *FcChar8) -> *FcChar8 #foreign libfontconfig;

FcStrSetCreate :: () -> *FcStrSet #foreign libfontconfig;

FcStrSetMember :: (set: *FcStrSet, s: *FcChar8) -> FcBool #foreign libfontconfig;

FcStrSetEqual :: (sa: *FcStrSet, sb: *FcStrSet) -> FcBool #foreign libfontconfig;

FcStrSetAdd :: (set: *FcStrSet, s: *FcChar8) -> FcBool #foreign libfontconfig;

FcStrSetAddFilename :: (set: *FcStrSet, s: *FcChar8) -> FcBool #foreign libfontconfig;

FcStrSetDel :: (set: *FcStrSet, s: *FcChar8) -> FcBool #foreign libfontconfig;

FcStrSetDestroy :: (set: *FcStrSet) -> void #foreign libfontconfig;

FcStrListCreate :: (set: *FcStrSet) -> *FcStrList #foreign libfontconfig;

FcStrListFirst :: (list: *FcStrList) -> void #foreign libfontconfig;

FcStrListNext :: (list: *FcStrList) -> *FcChar8 #foreign libfontconfig;

FcStrListDone :: (list: *FcStrList) -> void #foreign libfontconfig;

/* fcxml.c */
FcConfigParseAndLoad :: (config: *FcConfig, file: *FcChar8, complain: FcBool) -> FcBool #foreign libfontconfig;

FcConfigParseAndLoadFromMemory :: (config: *FcConfig, buffer: *FcChar8, complain: FcBool) -> FcBool #foreign libfontconfig;

#scope_file

#import "Basic"; // For print_to_builder

libfontconfig :: #library,system "libfontconfig";
