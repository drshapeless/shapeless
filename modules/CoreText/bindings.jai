/*!
    @enum       CTFontSymbolicTraits
    @abstract   Symbolic representation of stylistic font attributes.
    @discussion CTFontSymbolicTraits symbolically describes stylistic aspects of a font. The top 4 bits is used to describe appearance of the font while the lower 28 bits for typeface. The font appearance information represented by the upper 4 bits can be used for stylistic font matching.
*/
CTFontSymbolicTraits :: enum_flags u32 {
    // Additional detail available via kCTFontSlantTrait
    kCTFontTraitItalic :: 1;
    // Additional detail available via kCTFontWeightTrait
    kCTFontTraitBold :: 2;
    // Expanded and condensed traits are mutually exclusive
    kCTFontTraitExpanded :: 32;
    // Additional detail available via kCTFontWidthTrait
    kCTFontTraitCondensed :: 64;
    // Use fixed-pitch glyphs if available. May have multiple glyph advances (most CJK glyphs may contain two spaces)
    kCTFontTraitMonoSpace :: 1024;
    // Use vertical glyph variants and metrics
    kCTFontTraitVertical :: 2048;
    // Synthesize appropriate attributes for UI rendering such as control titles if necessary
    kCTFontTraitUIOptimized :: 4096;
    // Color glyphs ('sbix', 'COLR', or 'SVG ') are available. 
    kCTFontTraitColorGlyphs :: 8192;
    // The font is a CFR (Composite font reference), a cascade list is expected per font. 
    kCTFontTraitComposite :: 16384;
    kCTFontTraitClassMask :: 4026531840;
    // Mask for the font class
    kCTFontItalicTrait :: 1;
    // Mask for the font class
    kCTFontBoldTrait :: 2;
    // Mask for the font class
    kCTFontExpandedTrait :: 32;
    // Mask for the font class
    kCTFontCondensedTrait :: 64;
    // Mask for the font class
    kCTFontMonoSpaceTrait :: 1024;
    // Mask for the font class
    kCTFontVerticalTrait :: 2048;
    // Mask for the font class
    kCTFontUIOptimizedTrait :: 4096;
    // Mask for the font class
    kCTFontColorGlyphsTrait :: 8192;
    // Mask for the font class
    kCTFontCompositeTrait :: 16384;
    // Mask for the font class
    kCTFontClassMaskTrait :: 4026531840;
}

/*!
    @enum       CTFontStylisticClass
    @abstract   Stylistic class values.
    @discussion CTFontStylisticClass classifies certain stylistic qualities of the font. These values correspond closely to the font class values in the OpenType 'OS/2' table. The class values are bundled in the upper four bits of the CTFontSymbolicTraits and can be obtained via the kCTFontTraitClassMask.
*/
CTFontStylisticClass :: enum_flags u32 {
    kCTFontClassUnknown :: 0;
    kCTFontClassOldStyleSerifs :: 268435456;
    kCTFontClassTransitionalSerifs :: 536870912;
    kCTFontClassModernSerifs :: 805306368;
    kCTFontClassClarendonSerifs :: 1073741824;
    kCTFontClassSlabSerifs :: 1342177280;
    kCTFontClassFreeformSerifs :: 1879048192;
    kCTFontClassSansSerif :: 2147483648;
    kCTFontClassOrnamentals :: 2415919104;
    kCTFontClassScripts :: 2684354560;
    kCTFontClassSymbolic :: 3221225472;
    kCTFontUnknownClass :: 0;
    kCTFontOldStyleSerifsClass :: 268435456;
    kCTFontTransitionalSerifsClass :: 536870912;
    kCTFontModernSerifsClass :: 805306368;
    kCTFontClarendonSerifsClass :: 1073741824;
    kCTFontSlabSerifsClass :: 1342177280;
    kCTFontFreeformSerifsClass :: 1879048192;
    kCTFontSansSerifClass :: 2147483648;
    kCTFontOrnamentalsClass :: 2415919104;
    kCTFontScriptsClass :: 2684354560;
    kCTFontSymbolicClass :: 3221225472;
}

/*!
    @enum       CTFontOrientation
    @abstract   Specifies the intended rendering orientation of the font for obtaining glyph metrics.
*/
CTFontOrientation :: enum u32 {
    kDefault :: 0;
    kHorizontal :: 1;
    kVertical :: 2;
    kCTFontDefaultOrientation :: 0;
    kCTFontHorizontalOrientation :: 1;
    kCTFontVerticalOrientation :: 2;
}

/*!
    @constant   kCTFontFormatUnrecognized
                The font is not a recognized format
    @constant   kCTFontFormatOpenTypePostScript
                The font is an OpenType format containing PostScript data
    @constant   kCTFontFormatOpenTypeTrueType
                The font is an OpenType format containing TrueType data
    @constant   kCTFontFormatTrueType
                The font is a recognized TrueType format
    @constant   kCTFontFormatPostScript
                The font is a recognized PostScript format
    @constant   kCTFontFormatBitmap
                The font is a bitmap only format
*/
CTFontFormat :: enum u32 {
    kUnrecognized :: 0;
    kOpenTypePostScript :: 1;
    kOpenTypeTrueType :: 2;
    kTrueType :: 3;
    kPostScript :: 4;
    kBitmap :: 5;
}

/*!
    Progress state
 */
CTFontDescriptorMatchingState :: enum u32 {
    // called once at the beginning.
    kCTFontDescriptorMatchingDidBegin :: 0;
    // called once at the end.
    kCTFontDescriptorMatchingDidFinish :: 1;
    // called once before talking to the server.  Skipped if not necessary.
    kCTFontDescriptorMatchingWillBeginQuerying :: 2;
    // called when stalled. (e.g. while waiting for server response.)
    kCTFontDescriptorMatchingStalled :: 3;
    // Downloading part may be skipped if all the assets are already downloaded
    kCTFontDescriptorMatchingWillBeginDownloading :: 4;
    kCTFontDescriptorMatchingDownloading :: 5;
    kCTFontDescriptorMatchingDidFinishDownloading :: 6;
    // called when font descriptor is matched.
    kCTFontDescriptorMatchingDidMatch :: 7;
    // called when an error occurred.  (may be called multiple times.)
    kCTFontDescriptorMatchingDidFailWithError :: 8;
}

/*!
    @enum       CTFontOptions
    @abstract   Options for descriptor match and font creation.
    @constant   kCTFontOptionsPreventAutoActivation
                Prevents automatic font activation from taking place.
                This option is available only on macOS and will be deprecated on other platforms in the future.
    @constant   kCTFontOptionsPreventAutoDownload
                Prevents automatic font download from taking place.
    @constant   kCTFontOptionsPreferSystemFont
                Font matching will prefer to match Apple system fonts.
*/
CTFontOptions :: enum_flags CFOptionFlags {
    kDefault :: 0;
    kPreventAutoActivation :: 1;
    kPreventAutoDownload :: 2;
    kPreferSystemFont :: 4;
}

/*!
    @enum       UI Type constants
    @abstract   These constants represent the specific user interface purpose to specify for font creation.
    @discussion Use these constants with CTFontCreateUIFontForLanguage to indicate the intended user interface usage of the font reference to be created. The system may internally remap the value, so the value returned by CTFontGetUIFontType may return a different value than the one originally passed to CTFontCreateUIFontForLanguage. This remapping may vary by platform and OS version.
*/
CTFontUIFontType :: enum u32 {
    kCTFontUIFontNone :: 4294967295;
    kCTFontUIFontUser :: 0;
    kCTFontUIFontUserFixedPitch :: 1;
    kCTFontUIFontSystem :: 2;
    kCTFontUIFontEmphasizedSystem :: 3;
    kCTFontUIFontSmallSystem :: 4;
    kCTFontUIFontSmallEmphasizedSystem :: 5;
    kCTFontUIFontMiniSystem :: 6;
    kCTFontUIFontMiniEmphasizedSystem :: 7;
    kCTFontUIFontViews :: 8;
    kCTFontUIFontApplication :: 9;
    kCTFontUIFontLabel :: 10;
    kCTFontUIFontMenuTitle :: 11;
    kCTFontUIFontMenuItem :: 12;
    kCTFontUIFontMenuItemMark :: 13;
    kCTFontUIFontMenuItemCmdKey :: 14;
    kCTFontUIFontWindowTitle :: 15;
    kCTFontUIFontPushButton :: 16;
    kCTFontUIFontUtilityWindowTitle :: 17;
    kCTFontUIFontAlertHeader :: 18;
    kCTFontUIFontSystemDetail :: 19;
    kCTFontUIFontEmphasizedSystemDetail :: 20;
    kCTFontUIFontToolbar :: 21;
    kCTFontUIFontSmallToolbar :: 22;
    kCTFontUIFontMessage :: 23;
    kCTFontUIFontPalette :: 24;
    kCTFontUIFontToolTip :: 25;
    kCTFontUIFontControlContent :: 26;
    kCTFontNoFontType :: 4294967295;
    kCTFontUserFontType :: 0;
    kCTFontUserFixedPitchFontType :: 1;
    kCTFontSystemFontType :: 2;
    kCTFontEmphasizedSystemFontType :: 3;
    kCTFontSmallSystemFontType :: 4;
    kCTFontSmallEmphasizedSystemFontType :: 5;
    kCTFontMiniSystemFontType :: 6;
    kCTFontMiniEmphasizedSystemFontType :: 7;
    kCTFontViewsFontType :: 8;
    kCTFontApplicationFontType :: 9;
    kCTFontLabelFontType :: 10;
    kCTFontMenuTitleFontType :: 11;
    kCTFontMenuItemFontType :: 12;
    kCTFontMenuItemMarkFontType :: 13;
    kCTFontMenuItemCmdKeyFontType :: 14;
    kCTFontWindowTitleFontType :: 15;
    kCTFontPushButtonFontType :: 16;
    kCTFontUtilityWindowTitleFontType :: 17;
    kCTFontAlertHeaderFontType :: 18;
    kCTFontSystemDetailFontType :: 19;
    kCTFontEmphasizedSystemDetailFontType :: 20;
    kCTFontToolbarFontType :: 21;
    kCTFontSmallToolbarFontType :: 22;
    kCTFontMessageFontType :: 23;
    kCTFontPaletteFontType :: 24;
    kCTFontToolTipFontType :: 25;
    kCTFontControlContentFontType :: 26;
}

CTFontTableOptions :: enum_flags u32 {
    kNoOptions :: 0;
    kExcludeSynthetic :: 1;
}

/*!
    @enum       CTFontCollectionCopyOptions
    @abstract   Option bits for use with CTFontCollectionCopyFontAttribute(s).

    @constant   kCTFontCollectionCopyStandardSort
                Passing this option indicates that the return values should be sorted in standard UI order, suitable for display to the user. This is the same sorting behavior used by NSFontPanel and Font Book.

    @constant   kCTFontCollectionCopyUnique
                Passing this option indicates that duplicate values should be removed from the results.
 */
CTFontCollectionCopyOptions :: enum_flags u32 {
    kDefaultOptions :: 0;
    kUnique :: 1;
    kStandardSort :: 2;
}

/*!
    @enum
    @abstract   Font registration errors
    @discussion Errors that would prevent registration of fonts for a specified font file URL.
    @constant   kCTFontManagerErrorFileNotFound
                The file does not exist at the specified URL.
    @constant   kCTFontManagerErrorInsufficientPermissions
                Cannot access the file due to insufficient permissions.
    @constant   kCTFontManagerErrorUnrecognizedFormat
                The file is not a recognized or supported font file format.
    @constant   kCTFontManagerErrorInvalidFontData
                The file contains invalid font data that could cause system problems.
    @constant   kCTFontManagerErrorAlreadyRegistered
                The file has already been registered in the specified scope.
    @discussion Errors that would prevent un-registration of fonts for a specified font file URL.
    @constant   kCTFontManagerErrorNotRegistered
                The file is not registered in the specified scope.
    @constant   kCTFontManagerErrorInUse
                The font file is actively in use and cannot be unregistered.
    @constant   kCTFontManagerErrorSystemRequired
                The file is required by the system and cannot be unregistered.
    @constant   kCTFontManagerErrorRegistrationFailed
                The file could not be processed due to an unexpected FontProvider error.
    @constant   kCTFontManagerErrorMissingEntitlement
                The file could not be processed because the provider does not have a necessary entitlement.
    @constant   kCTFontManagerErrorInsufficientInfo
                The font descriptor does not have information to specify a font file.
    @constant   kCTFontManagerErrorCancelledByUser
                The operation was cancelled by the user.
    @constant   kCTFontManagerErrorDuplicatedName
                The file could not be registered because of a duplicated font name.
    @constant   kCTFontManagerErrorInvalidFilePath
                The file is not in an allowed location. It must be either in the application's bundle or an on-demand resource.
    @constant   kCTFontManagerErrorExceededResourceLimit
                The operation failed due to a system limitation.
    @constant   kCTFontManagerErrorUnsupportedScope
                The specified scope is not supported.

*/
CTFontManagerError :: enum CFIndex {
    kFileNotFound :: 101;
    kInsufficientPermissions :: 102;
    kUnrecognizedFormat :: 103;
    kInvalidFontData :: 104;
    kAlreadyRegistered :: 105;
    kExceededResourceLimit :: 106;
    kAssetNotFound :: 107;
    kNotRegistered :: 201;
    kInUse :: 202;
    kSystemRequired :: 203;
    kRegistrationFailed :: 301;
    kMissingEntitlement :: 302;
    kInsufficientInfo :: 303;
    kCancelledByUser :: 304;
    kDuplicatedName :: 305;
    kInvalidFilePath :: 306;
    kUnsupportedScope :: 307;
}

/*!
    @enum       CTFontManagerScope
    @abstract   Scope for font registration. A uses session refers to a login session in macOS, and the current booted session in iOS.
    @constant   kCTFontManagerScopeNone
                The font is not registered and does not participate in font descriptor matching. This isn't a valid scope to specify while registering fonts.
    @constant   kCTFontManagerScopeProcess
                The font is available to the current process for the duration of the process unless directly unregistered.
    @constant   kCTFontManagerScopePersistent
                The font is available to all processes for the current user session and will be available in subsequent sessions unless unregistered.
    @constant   kCTFontManagerScopeSession
                The font is available to the current user session, and will not be available in subsequent sessions.
                Session scope is only available in macOS.
*/
CTFontManagerScope :: enum u32 {
    kNone :: 0;
    kProcess :: 1;
    kPersistent :: 2;
    kSession :: 3;
    kUser :: 2;
}

/*!
    @enum
    @abstract   Auto-activation settings.
    @constant   kCTFontManagerAutoActivationDefault
                Default auto-activation setting. When specified, the application will use the global setting.
    @constant   kCTFontManagerAutoActivationDisabled
                Disables auto-activation.
    @constant   kCTFontManagerAutoActivationEnabled
                Enables auto-activation.
    @constant   kCTFontManagerAutoActivationPromptUser - deprecated and treated as kCTFontManagerAutoActivationDefault on 10.13.
                Requires user input for auto-activation. A dialog will be presented to the user to confirm auto
                activation of the font.
*/
CTFontManagerAutoActivationSetting :: enum u32 {
    kCTFontManagerAutoActivationDefault :: 0;
    kCTFontManagerAutoActivationDisabled :: 1;
    kCTFontManagerAutoActivationEnabled :: 2;
    kCTFontManagerAutoActivationPromptUser :: 3;
}

/*!
    @enum       CTFrameProgression
    @abstract   These constants specify frame progression types.

    @discussion The lines of text within a frame may be stacked for either
                horizontal or vertical text. Values are enumerated for each
                stacking type supported by CTFrame. Frames created with a
                progression type specifying vertical text will rotate lines
                90 degrees counterclockwise when drawing.

    @constant   kCTFrameProgressionTopToBottom
                Lines are stacked top to bottom for horizontal text.

    @constant   kCTFrameProgressionRightToLeft
                Lines are stacked right to left for vertical text.

    @constant   kCTFrameProgressionLeftToRight
                Lines are stacked left to right for vertical text.
*/
CTFrameProgression :: enum u32 {
    kTopToBottom :: 0;
    kRightToLeft :: 1;
    kLeftToRight :: 2;
}

/*!
    @enum       CTFramePathFillRule
    @abstract   These constants specify fill rule used by the frame.
 
    @discussion When a path intersects with itself, the client should specify which rule to use for deciding the 
                area of the path.
 
    @constant   kCTFramePathFillEvenOdd
                Text is filled in the area that would be painted if the path were given to CGContextEOFillPath.

    @constant   kCTFramePathFillWindingNumber
                Text is fill in the area that would be painted if the path were given to CGContextFillPath.
 
 
 */
CTFramePathFillRule :: enum u32 {
    kCTFramePathFillEvenOdd :: 0;
    kCTFramePathFillWindingNumber :: 1;
}

/*!
    @enum       CTLineBoundsOptions
    @abstract   Options for CTLineGetBoundsWithOptions.

    @discussion Passing 0 (no options) returns the typographic bounds,
                including typographic leading and shifts.

    @constant   kCTLineBoundsExcludeTypographicLeading
                Pass this option to exclude typographic leading.

    @constant   kCTLineBoundsExcludeTypographicShifts
                Pass this option to ignore cross-stream shifts due to
                positioning (such as kerning or baseline alignment).

    @constant   kCTLineBoundsUseHangingPunctuation
                Normally line bounds include all glyphs; pass this option to
                treat standard punctuation hanging off either end of the line
                as fully hanging.

    @constant   kCTLineBoundsUseGlyphPathBounds
                Pass this option to use glyph path bounds rather than the
                default typographic bounds.

    @constant   kCTLineBoundsUseOpticalBounds
                Pass this option to use optical bounds, as determined by
                CTFontGetOpticalBoundsForGlyphs. This option overrides
                kCTLineBoundsUseGlyphPathBounds.
                
    @constant   kCTLineBoundsIncludeLanguageExtents
                Pass this option to include additional space based on common
                glyph sequences for various languages. The result is intended
                to be used when drawing to avoid clipping that may be caused
                by the typographic bounds. This option does not have any effect
                when used with kCTLineBoundsUseGlyphPathBounds.
*/
CTLineBoundsOptions :: enum_flags CFOptionFlags {
    kExcludeTypographicLeading :: 1;
    kExcludeTypographicShifts :: 2;
    kUseHangingPunctuation :: 4;
    kUseGlyphPathBounds :: 8;
    kUseOpticalBounds :: 16;
    kIncludeLanguageExtents :: 32;
}

/*!
    @enum       CTLineTruncationType
    @abstract   Truncation types required by CTLineCreateTruncatedLine. These
                will tell truncation engine which type of truncation is being
                requested.

    @constant   kCTLineTruncationStart
                Truncate at the beginning of the line, leaving the end portion
                visible.

    @constant   kCTLineTruncationEnd
                Truncate at the end of the line, leaving the start portion
                visible.

    @constant   kCTLineTruncationMiddle
                Truncate in the middle of the line, leaving both the start
                and the end portions visible.
*/
CTLineTruncationType :: enum u32 {
    kCTLineTruncationStart :: 0;
    kCTLineTruncationEnd :: 1;
    kCTLineTruncationMiddle :: 2;
}

/*!
    @enum       CTCharacterCollection
    @abstract   These constants specify character collections.

    @constant   kCTCharacterCollectionIdentityMapping
                Indicates that the character identifier is equal to the CGGlyph
                glyph index.

    @constant   kCTCharacterCollectionAdobeCNS1
                Indicates the Adobe-CNS1 mapping.

    @constant   kCTCharacterCollectionAdobeGB1
                Indicates the Adobe-GB1 mapping.

    @constant   kCTCharacterCollectionAdobeJapan1
                Indicates the Adobe-Japan1 mapping.

    @constant   kCTCharacterCollectionAdobeJapan2
                Indicates the Adobe-Japan2 mapping.

    @constant   kCTCharacterCollectionAdobeKorea1
                Indicates the Adobe-Korea1 mapping.
*/
CTCharacterCollection :: enum u16 {
    kIdentityMapping :: 0;
    kAdobeCNS1 :: 1;
    kAdobeGB1 :: 2;
    kAdobeJapan1 :: 3;
    kAdobeJapan2 :: 4;
    kAdobeKorea1 :: 5;
    kCTIdentityMappingCharacterCollection :: 0;
    kCTAdobeCNS1CharacterCollection :: 1;
    kCTAdobeGB1CharacterCollection :: 2;
    kCTAdobeJapan1CharacterCollection :: 3;
    kCTAdobeJapan2CharacterCollection :: 4;
    kCTAdobeKorea1CharacterCollection :: 5;
}

/*!
    @enum       CTTextAlignment
    @abstract   These constants specify text alignment.

    @constant   kCTTextAlignmentLeft
                Text is visually left-aligned.

    @constant   kCTTextAlignmentRight
                Text is visually right-aligned.

    @constant   kCTTextAlignmentCenter
                Text is visually center-aligned.

    @constant   kCTTextAlignmentJustified
                Text is fully justified. The last line in a paragraph is
                naturally aligned.

    @constant   kCTTextAlignmentNatural
                Use the natural alignment of the text's script.
*/
CTTextAlignment :: enum u8 {
    kLeft :: 0;
    kRight :: 1;
    kCenter :: 2;
    kJustified :: 3;
    kNatural :: 4;
    kCTLeftTextAlignment :: 0;
    kCTRightTextAlignment :: 1;
    kCTCenterTextAlignment :: 2;
    kCTJustifiedTextAlignment :: 3;
    kCTNaturalTextAlignment :: 4;
}

/*!
    @enum       CTLineBreakMode
    @abstract   These constants specify what happens when a line is too long for
                its frame.

    @constant   kCTLineBreakByWordWrapping
                Wrapping occurs at word boundaries, unless the word itself doesn't
                fit on a single line.

    @constant   kCTLineBreakByCharWrapping
                Wrapping occurs before the first character that doesn't fit.

    @constant   kCTLineBreakByClipping
                Lines are simply not drawn past the edge of the frame.

    @constant   kCTLineBreakByTruncatingHead
                Each line is displayed so that the end fits in the frame and the
                missing text is indicated by some kind of ellipsis glyph.

    @constant   kCTLineBreakByTruncatingTail
                Each line is displayed so that the beginning fits in the
                container and the missing text is indicated by some kind of
                ellipsis glyph.

    @constant   kCTLineBreakByTruncatingMiddle
                Each line is displayed so that the beginning and end fit in the
                container and the missing text is indicated by some kind of
                ellipsis glyph in the middle.
*/
CTLineBreakMode :: enum u8 {
    kCTLineBreakByWordWrapping :: 0;
    kCTLineBreakByCharWrapping :: 1;
    kCTLineBreakByClipping :: 2;
    kCTLineBreakByTruncatingHead :: 3;
    kCTLineBreakByTruncatingTail :: 4;
    kCTLineBreakByTruncatingMiddle :: 5;
}

/*!
    @enum       CTWritingDirection
    @abstract   These constants specify the writing direction

    @constant   kCTWritingDirectionNatural
                The writing direction is algorithmically determined
                using the Unicode Bidirectional Algorithm rules P2 and P3.

    @constant   kCTWritingDirectionLeftToRight
                The writing direction is left to right.

    @constant   kCTWritingDirectionRightToLeft
                The writing direction is right to left.
*/
CTWritingDirection :: enum s8 {
    kNatural :: 255;
    kLeftToRight :: 0;
    kRightToLeft :: 1;
}

/*!
    @enum       CTParagraphStyleSpecifier
    @abstract   These constants are used to query and modify the CTParagraphStyle
                object.

    @discussion Each specifier has a type and a default value associated with it.
                The type must always be observed when setting or fetching the
                value from the CTParagraphStyle object. In addition, some
                specifiers affect the behavior of both the framesetter and
                the typesetter, and others only affect the behavior of the
                framesetter; this is also noted below.

    @constant   kCTParagraphStyleSpecifierAlignment
                The text alignment. Natural text alignment is realized as
                left or right alignment, depending on the line sweep direction
                of the first script contained in the paragraph.

                Type: CTTextAlignment
                Default: kCTTextAlignmentNatural
                Application: CTFramesetter


    @constant   kCTParagraphStyleSpecifierFirstLineHeadIndent
                The distance in points from the leading margin of a frame to
                the beginning of the paragraph's first line. This value is always
                nonnegative.

                Type: CGFloat
                Default: 0.0
                Application: CTFramesetter


    @constant   kCTParagraphStyleSpecifierHeadIndent
                The distance in points from the leading margin of a text
                container to the beginning of lines other than the first.
                This value is always nonnegative.

                Type: CGFloat
                Default: 0.0
                Application: CTFramesetter


    @constant   kCTParagraphStyleSpecifierTailIndent
                The distance in points from the margin of a frame to the end of
                lines. If positive, this value is the distance from the leading
                margin (for example, the left margin in left-to-right text).
                If 0 or negative, it's the distance from the trailing margin.

                Type: CGFloat
                Default: 0.0
                Application: CTFramesetter


    @constant   kCTParagraphStyleSpecifierTabStops
                The CTTextTab objects, sorted by location, that define the tab
                stops for the paragraph style.

                Type: CFArray of CTTextTabRef
                Default: 12 left-aligned tabs, spaced by 28.0 points
                Application: CTFramesetter, CTTypesetter


    @constant   kCTParagraphStyleSpecifierDefaultTabInterval
                The document-wide default tab interval. Tabs after the last
                specified by kCTParagraphStyleSpecifierTabStops are placed at
                integer multiples of this distance (if positive).

                Type: CGFloat
                Default: 0.0
                Application: CTFramesetter, CTTypesetter


    @constant   kCTParagraphStyleSpecifierLineBreakMode
                The mode that should be used to break lines when laying out
                the paragraph's text.

                Type: CTLineBreakMode
                Default: kCTLineBreakByWordWrapping
                Application: CTFramesetter


    @constant   kCTParagraphStyleSpecifierLineHeightMultiple
                The line height multiple. The natural line height of the
                receiver is multiplied by this factor (if positive) before
                being constrained by minimum and maximum line height.

                Type: CGFloat
                Default: 0.0
                Application: CTFramesetter


    @constant   kCTParagraphStyleSpecifierMaximumLineHeight
                The maximum height that any line in the frame will occupy,
                regardless of the font size or size of any attached graphic.
                Glyphs and graphics exceeding this height will overlap
                neighboring lines. A maximum height of 0 implies
                no line height limit. This value is always nonnegative.

                Type: CGFloat
                Default: 0.0
                Application: CTFramesetter


    @constant   kCTParagraphStyleSpecifierMinimumLineHeight
                The minimum height that any line in the frame will occupy,
                regardless of the font size or size of any attached graphic.
                This value is always nonnegative.

                Type: CGFloat
                Default: 0.0
                Application: CTFramesetter


    @constant   kCTParagraphStyleSpecifierLineSpacing
                Deprecated.
                Use kCTParagraphStyleSpecifierMaximumLineSpacing, kCTParagraphStyleSpecifierMinimumLineSpacing,
                and kCTParagraphStyleSpecifierLineSpacingAdjustment to control
                space between lines.


    @constant   kCTParagraphStyleSpecifierParagraphSpacing
                The space added at the end of the paragraph to separate it from
                the following paragraph. This value is always nonnegative and is
                determined by adding the previous paragraph's
                kCTParagraphStyleSpecifierParagraphSpacing setting and the
                current paragraph's kCTParagraphStyleSpecifierParagraphSpacingBefore
                setting.

                Type: CGFloat
                Default: 0.0
                Application: CTFramesetter


    @constant   kCTParagraphStyleSpecifierParagraphSpacingBefore
                The distance between the paragraph's top and the beginning of
                its text content.

                Type: CGFloat
                Default: 0.0
                Application: CTFramesetter


    @constant   kCTParagraphStyleSpecifierBaseWritingDirection
                The base writing direction of the lines.

                Type: CTWritingDirection
                Default: kCTWritingDirectionNatural
                Application: CTFramesetter, CTTypesetter


    @constant   kCTParagraphStyleSpecifierMaximumLineSpacing
                The maximum space in points between lines within the paragraph
                (commonly known as leading).

                Type: CGFloat
                Default: some large number.
                Application: CTFramesetter
 
 
    @constant   kCTParagraphStyleSpecifierMinimumLineSpacing
                The minimum space in points between lines within the paragraph
                (commonly known as leading).

                Type: CGFloat
                Default: 0.0
                Application: CTFramesetter
 
 
    @constant   kCTParagraphStyleSpecifierLineSpacingAdjustment
                The space in points added between lines within the paragraph
                (commonly known as leading). 

                Type: CGFloat
                Default: 0.0
                Application: CTFramesetter


    @constant   kCTParagraphStyleSpecifierLineBoundsOptions
                The options controlling the alignment of the line edges with
                the leading and trailing margins.

                Type: CTLineBoundsOptions
                Default: 0 (no options)
                Application: CTTypesetter
*/
CTParagraphStyleSpecifier :: enum u32 {
    kAlignment :: 0;
    kFirstLineHeadIndent :: 1;
    kHeadIndent :: 2;
    kTailIndent :: 3;
    kTabStops :: 4;
    kDefaultTabInterval :: 5;
    kLineBreakMode :: 6;
    kLineHeightMultiple :: 7;
    kMaximumLineHeight :: 8;
    kMinimumLineHeight :: 9;
    kLineSpacing :: 10;
    kParagraphSpacing :: 11;
    kParagraphSpacingBefore :: 12;
    kBaseWritingDirection :: 13;
    kMaximumLineSpacing :: 14;
    kMinimumLineSpacing :: 15;
    kLineSpacingAdjustment :: 16;
    kLineBoundsOptions :: 17;
    kCount :: 18;
}

/*!
    @enum       CTRubyAlignment
    @abstract   These constants specify how to align the ruby annotation and the base text relative to each other when they don't have the same length.

    @constant   kCTRubyAlignmentAuto
                CoreText will determine the alignment.

    @constant   kCTRubyAlignmentStart
                The ruby text is aligned with the start edge of the base text.

    @constant   kCTRubyAlignmentCenter
                The ruby text is centered within the width of the base text. If the ruby text is wider than the base text the base text is centered in the width of the ruby text.

    @constant   kCTRubyAlignmentEnd
                The ruby text is aligned with the end edge of the base text.

    @constant   kCTRubyAlignmentDistributeLetter
                If the width of the ruby text is less than the width of the base text, the ruby text is evenly distributed over the width of the base text, with the first letter of the ruby text aligning with the first letter of the base text and the last letter of the ruby text aligning with the last letter of the base text. If the width of the base text is less than the width of the ruby text, the base text is evenly distributed over the width of the ruby text.

    @constant   kCTRubyAlignmentDistributeSpace
                If the width of the ruby text is less than the width of the base text, the ruby text is evenly distributed over the width of the base text, with a certain amount of space, usually half the inter-character width of the ruby text, before the first and after the last character. If the width of the base text is less than the width of the ruby text, the base text is similarly aligned to the width of the ruby text.

    @constant   kCTRubyAlignmentLineEdge
                If the ruby text is not adjacent to a line edge it is aligned as with kCTRubyAlignmentAuto. If it is adjacent to a line edge the end of ruby text adjacent to the line edge is aligned to the line edge. This is only relevant if the width of the ruby text is greater than the width of the base text; otherwise alignment is as with kCTRubyAlignmentAuto.
*/
CTRubyAlignment :: enum u8 {
    kInvalid :: 255;
    kAuto :: 0;
    kStart :: 1;
    kCenter :: 2;
    kEnd :: 3;
    kDistributeLetter :: 4;
    kDistributeSpace :: 5;
    kLineEdge :: 6;
}

/*!
    @enum       CTRubyOverhang
    @abstract   These constants specify whether, and on which side, ruby text is allowed to overhang adjacent text if it is wider than the base text.

    @constant   kCTRubyOverhangAuto
                The ruby text can overhang adjacent text on both sides.

    @constant   kCTRubyOverhangStart
                The ruby text can overhang the text that proceeds it.

    @constant   kCTRubyOverhangEnd
                The ruby text can overhang the text that follows it.

    @constant   kCTRubyOverhangNone
                The ruby text cannot overhang the proceeding or following text.
*/
CTRubyOverhang :: enum u8 {
    kInvalid :: 255;
    kAuto :: 0;
    kStart :: 1;
    kEnd :: 2;
    kNone :: 3;
}

/*!
    @enum       CTRubyPosition
    @abstract   These constants specify the position of the ruby text with respect to the base text.

    @constant   kCTRubyPositionBefore
                The ruby text is positioned before the base text; i.e. above horizontal text and to the right of vertical text.

    @constant   kCTRubyPositionAfter
                The ruby text is positioned after the base text; i.e. below horizontal text and to the left of vertical text.

    @constant   kCTRubyPositionInterCharacter
                The ruby text is positioned to the right of the base text whether it is horizontal or vertical. This is the way that Bopomofo annotations are attached to Chinese text in Taiwan.

    @constant   kCTRubyPositionInline
                The ruby text follows the base text with no special styling.
*/
CTRubyPosition :: enum u8 {
    kBefore :: 0;
    kAfter :: 1;
    kInterCharacter :: 2;
    kInline :: 3;
    kCount :: 4;
}

/*!
    @enum       CTRunStatus
    @abstract   A bitfield passed back by CTRunGetStatus that is used to
                indicate the disposition of the run.

    @constant   kCTRunStatusNoStatus
                The run has no special attributes.

    @constant   kCTRunStatusRightToLeft
                When set, the run is right to left.

    @constant   kCTRunStatusNonMonotonic
                When set, the run has been reordered in some way such that
                the string indices associated with the glyphs are no longer
                strictly increasing (for left to right runs) or decreasing
                (for right to left runs).

    @constant   kCTRunStatusHasNonIdentityMatrix
                When set, the run requires a specific text matrix to be set
                in the current CG context for proper drawing.
*/
CTRunStatus :: enum_flags u32 {
    kNoStatus :: 0;
    kRightToLeft :: 1;
    kNonMonotonic :: 2;
    kHasNonIdentityMatrix :: 4;
}

/*!
    @enum       CTUnderlineStyle
    @abstract   Underline style specifiers.

    @discussion These underline type specifiers can be applied to the value set
                with the kCTUnderlineStyleAttributeName attribute to tell
                CoreText that you want a different underline style.
*/
CTUnderlineStyle :: enum_flags s32 {
    kNone :: 0;
    kSingle :: 1;
    kThick :: 2;
    kDouble :: 9;
}

/*!
    @enum       CTUnderlineStyleModifiers
    @abstract   Underline style modifiers.

    @discussion Set these bits with the CTUnderlineStyle that you set with the
                kCTUnderlineStyleAttributeName attribute to modify how the
                underline will be drawn.
*/
CTUnderlineStyleModifiers :: enum_flags s32 {
    kCTUnderlinePatternSolid :: 0;
    kCTUnderlinePatternDot :: 256;
    kCTUnderlinePatternDash :: 512;
    kCTUnderlinePatternDashDot :: 768;
    kCTUnderlinePatternDashDotDot :: 1024;
}

/*!
    @struct     CTParagraphStyleSetting
    @abstract   This structure is used to alter the paragraph style.

    @field      spec
                The specifier of the setting.

    @field      valueSize
                The size of the value pointed to by the "value" field. This
                must match the size of the value required by the
                CTParagraphStyleSpecifier set in the "spec" field.

    @field      value
                A reference to the value of the setting specified by the
                "spec" field. The value must be in the proper range for the
                spec value. The value must also be at least valueSize.
*/
CTParagraphStyleSetting :: struct {
    spec: CTParagraphStyleSpecifier;
    valueSize: u64;
    value: *void;
}

/*!
    @typedef    CTRunDelegateCallbacks
    @abstract   Structure containing the callbacks of a CTRunDelegate.
    
    @discussion These callbacks are provided by the owner of a run delegate and
                are used to modify glyph metrics during layout. The values
                returned by a delegate are applied to each glyph in the run(s)
                corresponding to the attribute containing that delegate.
                
    @field      version
                The version number of the callbacks being passed in as a
                parameter to CTRunDelegateCreate. This field should always 
                be set to kCTRunDelegateCurrentVersion.
                
    @field      dealloc
                The callback used when a CTRunDelegate's retain count reaches
                0 and the CTRunDelegate is deallocated. This callback may be
                NULL.
                
    @field      getAscent
                The callback used to indicate the ascent of the
                CTRunDelegate. This callback may be NULL, which is equivalent
                to a getAscent callback that always returns 0.
                
    @field      getDescent
                The callback used to indicate the descent of the
                CTRunDelegate. This callback may be NULL, which is equivalent
                to a getDescent callback that always returns 0.
                
    @field      getWidth
                The callback used to indicate the width of the
                CTRunDelegate. This callback may be NULL, which is equivalent
                to a getWidth callback that always returns 0.
*/
CTRunDelegateCallbacks :: struct {
    version: CFIndex;
    dealloc: CTRunDelegateDeallocateCallback;
    getAscent: CTRunDelegateGetAscentCallback;
    getDescent: CTRunDelegateGetDescentCallback;
    getWidth: CTRunDelegateGetWidthCallback;
}

CTFontDescriptorRef :: *__CTFontDescriptor;
CTFontPriority :: u32;
/* Progress callback type */
CTFontDescriptorProgressHandler :: #type () -> s32 #c_call;
CTFontRef :: *__CTFont;
CTFontTableTag :: FourCharCode;
CTFontCollectionRef :: *__CTFontCollection;
CTMutableFontCollectionRef :: *__CTFontCollection;
/*!
    @typedef    CTFontCollectionSortDescriptorsCallback
    @abstract   Collection sorting callback.
    @discussion This callback can be specified to obtain the matching font descriptors of a collection in sorted order. Return the appropriate comparison result of first descriptor to second descriptor.
*/
CTFontCollectionSortDescriptorsCallback :: #type (first: CTFontDescriptorRef, second: CTFontDescriptorRef, refCon: *void) -> CFComparisonResult #c_call;
/* --------------------------------------------------------------------------- */
/* Frame Types */
/* --------------------------------------------------------------------------- */
CTFrameRef :: *__CTFrame;
/* --------------------------------------------------------------------------- */
/* Line Types */
/* --------------------------------------------------------------------------- */
CTLineRef :: *__CTLine;
/* --------------------------------------------------------------------------- */
/* Typesetter Types */
/* --------------------------------------------------------------------------- */
CTTypesetterRef :: *__CTTypesetter;
/* --------------------------------------------------------------------------- */
/* Framesetter Types */
/* --------------------------------------------------------------------------- */
CTFramesetterRef :: *__CTFramesetter;
CTGlyphInfoRef :: *__CTGlyphInfo;
/* --------------------------------------------------------------------------- */
/* Paragraph Style Types */
/* --------------------------------------------------------------------------- */
CTParagraphStyleRef :: *__CTParagraphStyle;
/* --------------------------------------------------------------------------- */
/* RubyAnnotation Types                                                        */
/* --------------------------------------------------------------------------- */
CTRubyAnnotationRef :: *__CTRubyAnnotation;
/* --------------------------------------------------------------------------- */
/* Glyph Run Types */
/* --------------------------------------------------------------------------- */
CTRunRef :: *__CTRun;
/* --------------------------------------------------------------------------- */
/* Run Delegate Types */
/* --------------------------------------------------------------------------- */
CTRunDelegateRef :: *__CTRunDelegate;
/*!
    @typedef    CTRunDelegateDeallocateCallback
    @abstract   The callback invoked when a CTRunDelegate is deallocated.
    
    @param      refCon
                The value supplied to CTRunDelegateCreate.
*/
CTRunDelegateDeallocateCallback :: #type (refCon: *void) -> void #c_call;
/*!
    @typedef    CTRunDelegateGetAscentCallback
    @abstract   The callback used to determine typographic ascent.
    
    @param      refCon
                The value supplied to CTRunDelegateCreate.
                
    @result     A CGFloat value indicating the typographic ascent of glyphs to
                which a run delegate pertains.
*/
CTRunDelegateGetAscentCallback :: #type (refCon: *void) -> CGFloat #c_call;
/*!
    @typedef    CTRunDelegateGetDescentCallback
    @abstract   The callback used to determine typographic descent.
    
    @param      refCon
                The value supplied to CTRunDelegateCreate.
                
    @result     A CGFloat value indicating the typographic descent of glyphs to
                which a run delegate pertains.
*/
CTRunDelegateGetDescentCallback :: #type (refCon: *void) -> CGFloat #c_call;
/*!
    @typedef    CTRunDelegateGetWidthCallback
    @abstract   The callback used to determine width.
    
    @param      refCon
                The value supplied to CTRunDelegateCreate.
                
    @result     A CGFloat value indicating the width of glyphs to which a run
                delegate pertains. A value of 0.0 indicates that the glyphs
                should not be drawn.
*/
CTRunDelegateGetWidthCallback :: #type (refCon: *void) -> CGFloat #c_call;
/* A CTTextTab represents a tab in an CTParagraphStyle object, storing an
    alignment type and location.

    CoreText supports four alignment types: left, center, right, and decimal.
    These alignment types are absolute, not based on the line sweep direction
    of text. For example, tabbed text is always positioned to the left of a
    right-aligned tab, whether the line sweep direction is left to right or right
    to left. A tab's location, on the other hand, is relative to the back margin.
    A tab set at 1.5", for example, is at 1.5" from the right in right to left
    text.
*/
CTTextTabRef :: *__CTTextTab;
/*!
    @function   CTFontDescriptorGetTypeID
    @abstract   Returns the type identifier for Core Text font descriptor
                references.
    @result     The identifier for the opaque type CTFontDescriptorRef.
*/
CTFontDescriptorGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTFontDescriptorCreateWithNameAndSize
    @abstract   Creates a new font descriptor with the provided PostScript name and size.

    @param      name
                The PostScript name to be used for the font descriptor as a CFStringRef. Any font name beginning with a "." is reserved for the system and should not be used here.

    @param      size
                The point size. If 0.0, the kCTFontSizeAttribute will be omitted from the font descriptor.

    @result     This function creates a new font descriptor reference with the given PostScript name and point size.

    @discussion If you are trying to create a system UI font descriptor (with name beginning with a "."), you should create a font with CTFontCreateUIFontForLanguage() or appropriate AppKit/UIKit APIs instead, then use CTFontCopyFontDescriptor() to get its font descriptor.
*/
CTFontDescriptorCreateWithNameAndSize :: (name: CFStringRef, size: CGFloat) -> CTFontDescriptorRef #foreign CoreText;
/*!
    @function   CTFontDescriptorCreateWithAttributes
    @abstract   Creates a new font descriptor reference from a dictionary of attributes.

    @param      attributes
                A CFDictionaryRef of arbitrary attributes.

    @result     This function creates a new font descriptor with the attributes specified. This dictionary can contain arbitrary attributes that will be preserved, however unrecognized attributes will be ignored on font creation and and may not be preserved over the round trip (descriptor -> font -> descriptor).
*/
CTFontDescriptorCreateWithAttributes :: (attributes: CFDictionaryRef) -> CTFontDescriptorRef #foreign CoreText;
/*!
    @function   CTFontDescriptorCreateCopyWithAttributes
    @abstract   Creates a copy of the original font descriptor with new attributes.

    @param      original
                The original font descriptor reference.

    @param      attributes
                A CFDictionaryRef of arbitrary attributes.

    @result     This function creates a new copy of the original font descriptor with attributes augmented by those specified. If there are conflicts between attributes, the new attributes will replace existing ones, except for kCTFontVariationAttribute and kCTFontFeatureSettingsAttribute which will be merged.
                Starting with macOS 10.12 and iOS 10.0, setting the value of kCTFontFeatureSettingsAttribute to kCFNull will clear the feature settings of the original font descriptor. Setting the value of any individual feature settings pair in the kCTFontFeatureSettingsAttribute value array to kCFNull will clear that feature setting alone. For example, an element like @{ (id)kCTFontFeatureTypeIdentifierKey: @(kLigaturesType), (id)kCTFontFeatureSelectorIdentifierKey: (id)kCFNull } means clear the kLigatureType feature set in the original font descriptor. An element like @[ @"liga", (id)kCFNull ] will have the same effect.

    @seealso    kCTFontFeatureSettingsAttribute
*/
CTFontDescriptorCreateCopyWithAttributes :: (original: CTFontDescriptorRef, attributes: CFDictionaryRef) -> CTFontDescriptorRef #foreign CoreText;
/*!
    @function   CTFontDescriptorCreateCopyWithFamily
    @abstract   Returns a new font descriptor in the specified family based on the traits of the original descriptor.

    @param      original
                The original font descriptor reference.

    @param      family
                The name of the desired family.

    @result     Returns a new font reference with the original traits in the given family, or NULL if none found in the system.
*/
CTFontDescriptorCreateCopyWithFamily :: (original: CTFontDescriptorRef, family: CFStringRef) -> CTFontDescriptorRef #foreign CoreText;
/*!
    @function   CTFontDescriptorCreateCopyWithSymbolicTraits
    @abstract   Returns a new font descriptor based on the original descriptor having the specified symbolic traits.

    @param      original
                The original font descriptor reference.

    @param      symTraitValue
                The value of the symbolic traits. This bitfield is used to indicate the desired value for the traits specified by the symTraitMask parameter. Used in conjunction, they can allow for trait removal as well as addition.

    @param      symTraitMask
                The mask bits of the symbolic traits. This bitfield is used to indicate the traits that should be changed.

    @result     Returns a new font descriptor reference in the same family with the given symbolic traits, or NULL if none found in the system.
*/
CTFontDescriptorCreateCopyWithSymbolicTraits :: (original: CTFontDescriptorRef, symTraitValue: CTFontSymbolicTraits, symTraitMask: CTFontSymbolicTraits) -> CTFontDescriptorRef #foreign CoreText;
/*!
    @function   CTFontDescriptorCreateCopyWithVariation
    @abstract   Creates a copy of the original font descriptor with a new variation instance.

    @param      original
                The original font descriptor reference.

    @param      variationIdentifier
                The variation axis identifier. This is the four character code of the variation axis as a CFNumberRef.

    @param      variationValue
                The value corresponding with the variation instance.

    @result     This function returns a copy of the original font descriptor with a new variation instance. This is a convenience method for easily creating new variation font instances.
*/
CTFontDescriptorCreateCopyWithVariation :: (original: CTFontDescriptorRef, variationIdentifier: CFNumberRef, variationValue: CGFloat) -> CTFontDescriptorRef #foreign CoreText;
/*!
    @function   CTFontDescriptorCreateCopyWithFeature
    @abstract   Copies a font descriptor with new feature setting.

    @discussion This is a convenience method to more easily toggle the state of individual features.

    @param      original
                The original font descriptor reference.

    @param      featureTypeIdentifier
                The feature type identifier.

    @param      featureSelectorIdentifier
                The feature selector identifier.

    @result     A copy of the original font descriptor modified with the given feature settings.

    @seealso    CTFontDescriptorCreateCopyWithAttributes
    @seealso    kCTFontFeatureSettingsAttribute
*/
CTFontDescriptorCreateCopyWithFeature :: (original: CTFontDescriptorRef, featureTypeIdentifier: CFNumberRef, featureSelectorIdentifier: CFNumberRef) -> CTFontDescriptorRef #foreign CoreText;
/*!
    @function   CTFontDescriptorCreateMatchingFontDescriptors
    @abstract   Returns an array of font normalized font descriptors matching the provided descriptor.

    @param      descriptor
                The font descriptor reference.

    @param      mandatoryAttributes
                A set of attribute keys which are required to be identically matched in any returned font descriptors. Optional.

    @result     This function returns a retained array of normalized font descriptors matching the attributes present in descriptor. If descriptor itself is normalized then the array will contain only one item, the original descriptor.
*/
CTFontDescriptorCreateMatchingFontDescriptors :: (descriptor: CTFontDescriptorRef, mandatoryAttributes: CFSetRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontDescriptorCreateMatchingFontDescriptor
    @abstract   Returns an the single preferred matching font descriptor based on the original descriptor and system precedence.

    @param      descriptor
                The font descriptor reference.

    @param      mandatoryAttributes
                A set of attribute keys which are required to be identically matched in any returned font descriptors. Optional.

    @result     This function returns a retained normalized font descriptor matching the attributes present in descriptor. The original descriptor may be returned in normalized form.
*/
CTFontDescriptorCreateMatchingFontDescriptor :: (descriptor: CTFontDescriptorRef, mandatoryAttributes: CFSetRef) -> CTFontDescriptorRef #foreign CoreText;
/*
    @function   CTFontDescriptorMatchFontDescriptorsWithProgressHandler
                This function returns immediately, but can potentially take long time to process.  The progress is notified via progressBlock.
     
    @param      descriptors
                An array of descriptors to process.
     
    @param      mandatoryAttributes
     
    @param      progressBlock
                Callback block to indicate the progress.
                Return true to continue, and return false to cancel the process.
                This block is called on a private serial queue on OS X 10.15, iOS 13, and later.
     
    @result     false if it couldn't start the work.
*/
CTFontDescriptorMatchFontDescriptorsWithProgressHandler :: () -> s32 #foreign CoreText;
/*!
    @function   CTFontDescriptorCopyAttributes
    @abstract   Returns the attributes dictionary of the font descriptor.

    @param      descriptor
                The font descriptor reference.

    @result     A retained reference to the font descriptor attributes dictionary. This dictionary will contain the minimum number of attributes to fully specify this particular font descriptor.
*/
CTFontDescriptorCopyAttributes :: (descriptor: CTFontDescriptorRef) -> CFDictionaryRef #foreign CoreText;
/*!
    @function   CTFontDescriptorCopyAttribute
    @abstract   Returns the value associated with an arbitrary attribute.

    @param      descriptor
                The font descriptor.

    @param      attribute
                The requested attribute.

    @result     A retained reference to the requested attribute, or NULL if the requested attribute is not present. Refer to the attribute definitions for documentation as to how each attribute is packaged as a CFType.
*/
CTFontDescriptorCopyAttribute :: (descriptor: CTFontDescriptorRef, attribute: CFStringRef) -> CFTypeRef #foreign CoreText;
/*!
    function    CTFontDescriptorCopyLocalizedAttribute
    @abstract   Returns a localized value for the requested attribute if available.

    @discussion This function returns a localized attribute based on the global language list. If localization is not possible for the attribute the behavior matches CTFontDescriptorCopyAttribute(). Generally, localization of attributes is only applicable to name attributes of a normalized font descriptor.

    @param      descriptor
                The font descriptor reference.

    @param      attribute
                The requested font attribute.

    @param      language
                If non-NULL, this will be receive a retained reference to the matched language. The language identifier will conform to UTS #35.
                If CoreText can supply its own localized string where the font cannot, this value will be NULL.

    @result     A retained reference to the requested attribute, or NULL if the requested attribute is not present. Refer to the attribute definitions for documentation as to how each attribute is packaged as a CFType.
*/
CTFontDescriptorCopyLocalizedAttribute :: (descriptor: CTFontDescriptorRef, attribute: CFStringRef, language: *CFStringRef) -> CFTypeRef #foreign CoreText;
/*!
    @function   CTFontGetTypeID
    @abstract   Returns the type identifier for Core Text font references.
    @result     The identifier for the opaque type CTFontRef.
*/
CTFontGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTFontCreateWithName
    @abstract   Returns a new font reference for the given name.

    @discussion This function uses font descriptor matching so only registered fonts can be returned; see CTFontManager.h for more information. If you are trying to create a system UI font (with name beginning with a "."), you should use CTFontCreateUIFontForLanguage() or appropriate AppKit/UIKit APIs instead.

    @param      name
                The font name for which you wish to create a new font reference. A valid PostScript name is preferred, although other font name types will be matched in a fallback manner. Any font name beginning with a "." is reserved for the system and should not be used here.

    @param      size
                The point size for the font reference. If 0.0 is specified, the default font size of 12.0 will be used.

    @param      matrix
                The transformation matrix for the font. If unspecified, the identity matrix will be used. Optional.

    @result     This function will return a CTFontRef that best matches the name provided with size and matrix attributes. The name parameter is the only required parameters, and default values will be used for unspecified parameters. A best match will be found if all parameters cannot be matched identically.
*/
CTFontCreateWithName :: (name: CFStringRef, size: CGFloat, matrix: *CGAffineTransform) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontCreateWithFontDescriptor
    @abstract   Returns a new font reference that best matches the font descriptor.

    @param      descriptor
                A font descriptor containing attributes that specify the requested font.

    @param      size
                The point size for the font reference. If 0.0 is specified and the font descriptor does not specify the size, the default font size of 12.0 will be used.

    @param      matrix
                The transformation matrix for the font. If unspecified, the identity matrix will be used. Optional.

    @result     This function will return a CTFontRef that best matches the attributes provided with the font descriptor. The size and matrix parameters will override any specified in the font descriptor, unless they are unspecified. A best match font will always be returned, and default values will be used for any unspecified.
*/
CTFontCreateWithFontDescriptor :: (descriptor: CTFontDescriptorRef, size: CGFloat, matrix: *CGAffineTransform) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontCreateWithNameAndOptions
    @abstract   Returns a new font reference for the given name.

    @discussion This function uses font descriptor matching so only registered fonts can be returned; see CTFontManager.h for more information. If you are trying to create a system UI font (with name beginning with a "."), you should use CTFontCreateUIFontForLanguage() or appropriate AppKit/UIKit APIs instead.

    @param      name
                The font name for which you wish to create a new font reference. A valid PostScript name is preferred, although other font name types will be matched in a fallback manner. Any font name beginning with a "." is reserved for the system and should not be used here.

    @param      size
                The point size for the font reference. If 0.0 is specified, the default font size of 12.0 will be used.

    @param      matrix
                The transformation matrix for the font. If unspecified, the identity matrix will be used. Optional.
                
    @param      options
                Options flags.

    @result     This function will return a CTFontRef that best matches the name provided with size and matrix attributes. The name parameter is the only required parameters, and default values will be used for unspecified parameters. A best match will be found if all parameters cannot be matched identically.
*/
CTFontCreateWithNameAndOptions :: (name: CFStringRef, size: CGFloat, matrix: *CGAffineTransform, options: CTFontOptions) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontCreateWithFontDescriptorAndOptions
    @abstract   Returns a new font reference that best matches the font descriptor.

    @param      descriptor
                A font descriptor containing attributes that specify the requested font.

    @param      size
                The point size for the font reference. If 0.0 is specified, the default font size of 12.0 will be used.

    @param      matrix
                The transformation matrix for the font. If unspecified, the identity matrix will be used. Optional.

    @param      options
                Options flags.

    @result     This function will return a CTFontRef that best matches the attributes provided with the font descriptor. The size and matrix parameters will override any specified in the font descriptor, unless they are unspecified. A best match font will always be returned, and default values will be used for any unspecified.
*/
CTFontCreateWithFontDescriptorAndOptions :: (descriptor: CTFontDescriptorRef, size: CGFloat, matrix: *CGAffineTransform, options: CTFontOptions) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontCreateUIFontForLanguage
    @abstract   Returns the special UI font for the given language and UI type.

    @param      uiType
                A uiType constant specifying the intended UI use for the requested font reference.

    @param      size
                The point size for the font reference. If 0.0 is specified, the default size for the requested uiType is used.

    @param      language
                Language identifier to select a font for a particular localization. If unspecified, the current system language is used. The format of the language identifier should conform to UTS #35.

    @result     This function returns the correct font for various UI uses. The only required parameter is the uiType selector, unspecified optional parameters will use default values.
*/
CTFontCreateUIFontForLanguage :: (uiType: CTFontUIFontType, size: CGFloat, language: CFStringRef) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontGetUIFontType
    @discussion Get the CTFontUIFontType of UI font. Note that this value may differ from the uiType parameter originally passed to CTFontCreateUIFontForLanguage, as the system may use a different uiType value internally.
 */
CTFontGetUIFontType :: (font: CTFontRef) -> CTFontUIFontType #foreign CoreText;
/*!
    @function   CTFontCreateCopyWithAttributes
    @abstract   Returns a new font with additional attributes based on the original font.

    @discussion This function provides a mechanism to quickly change attributes on a given font reference in response to user actions. For instance, the size can be changed in response to a user manipulating a size slider.

    @param      font
                Original font reference to base new font on.

    @param      size
                The point size for the font reference. If 0.0 is specified, the original font's size will be preserved.

    @param      matrix
                The transformation matrix for the font. If unspecified, the original font matrix will be preserved. Optional.

    @param      attributes
                A font descriptor containing additional attributes that the new font should contain.

    @result     Returns a new font reference converted from the original with the specified attributes.
*/
CTFontCreateCopyWithAttributes :: (font: CTFontRef, size: CGFloat, matrix: *CGAffineTransform, attributes: CTFontDescriptorRef) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontCreateCopyWithSymbolicTraits
    @abstract   Returns a new font based on the original font with the specified symbolic traits.

    @param      font
                Original font reference on which to base the new font.

    @param      size
                The point size for the font reference. If 0.0 is specified, the original font's size will be preserved.

    @param      matrix
                The transformation matrix for the font. If unspecified, the original font matrix will be preserved. Optional.

    @param      symTraitValue
                The value of the symbolic traits. This bitfield is used to indicate the desired value for the traits specified by the symTraitMask parameter. Used in conjunction, they can allow for trait removal as well as addition.

    @param      symTraitMask
                The mask bits of the symbolic traits. This bitfield is used to indicate the traits that should be changed.

    @result     Returns a new font reference in the same family with the given symbolic traits, or NULL if none found in the system.
*/
CTFontCreateCopyWithSymbolicTraits :: (font: CTFontRef, size: CGFloat, matrix: *CGAffineTransform, symTraitValue: CTFontSymbolicTraits, symTraitMask: CTFontSymbolicTraits) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontCreateCopyWithFamily
    @abstract   Returns a new font in the specified family based on the traits of the original font.

    @param      font
                Original font reference to base new font on.

    @param      size
                The point size for the font reference. If 0.0 is specified, the original font's size will be preserved.

    @param      matrix
                The transformation matrix for the font. If unspecified, the original font matrix will be preserved. Optional.

    @param      family
                The name of the desired family.

    @result     Returns a new font reference with the original traits in the given family. NULL if non found in the system.
*/
CTFontCreateCopyWithFamily :: (font: CTFontRef, size: CGFloat, matrix: *CGAffineTransform, family: CFStringRef) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontCreateForString
    @abstract   Returns a new font reference that can best map the given string range based on the current font.

    @discussion This function is to be used when the current font does not cover the given range of the string. The current font itself will not be returned, but preference is given to fonts in its cascade list.

    @param      currentFont
                The current font that contains a valid cascade list.

    @param      string
                A unicode string containing characters that cannot be encoded by the current font.

    @param      range
                A CFRange specifying the range of the string that needs to be mapped.

    @result     This function returns the best substitute font that can encode the specified string range.

    @seealso    CTFontCopyCharacterSet
    @seealso    CTFontGetGlyphsForCharacters
    @seealso    kCTFontCascadeListAttribute
*/
CTFontCreateForString :: (currentFont: CTFontRef, str: CFStringRef, range: CFRange) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontCreateForStringWithLanguage
    @abstract   Returns a new font reference that can best map the given string range based on the current font and language specified.

    @discussion The current font itself can be returned if it covers the string provided.

    @param      currentFont
                The current font that contains a valid cascade list.

    @param      string
                A unicode string containing characters that cannot be encoded by the current font.

    @param      range
                A CFRange specifying the range of the string that needs to be mapped.

    @param      language
                Language identifier to select a font for a particular localization. If unspecified, the current system language is used. The format of the language identifier should conform to UTS #35.

    @result     This function returns the best substitute font that can encode the specified string range.

    @seealso    CTFontCopyCharacterSet
    @seealso    CTFontGetGlyphsForCharacters
    @seealso    kCTFontCascadeListAttribute
*/
CTFontCreateForStringWithLanguage :: (currentFont: CTFontRef, str: CFStringRef, range: CFRange, language: CFStringRef) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontCopyFontDescriptor
    @abstract   Returns the normalized font descriptors for the given font reference.

    @param      font
                The font reference.

    @result     This function returns a normalized font descriptor for a font. The font descriptor contains enough information to recreate this font at a later time.
*/
CTFontCopyFontDescriptor :: (font: CTFontRef) -> CTFontDescriptorRef #foreign CoreText;
/*!
    @function   CTFontCopyAttribute
    @abstract   Returns the value associated with an arbitrary attribute.

    @param      font
                The font reference.

    @param      attribute
                The requested attribute.

    @result     This function returns a retained reference to an arbitrary attribute. If the requested attribute is not present, NULL is returned. Refer to the attribute definitions for documentation as to how each attribute is packaged as a CFType.
*/
CTFontCopyAttribute :: (font: CTFontRef, attribute: CFStringRef) -> CFTypeRef #foreign CoreText;
/*!
    @function   CTFontGetSize
    @abstract   Returns the point size of the font reference.

    @param      font
                The font reference.

    @result     This function returns the point size of the given font reference. This is the point size provided when the font was created.
*/
CTFontGetSize :: (font: CTFontRef) -> CGFloat #foreign CoreText;
/*!
    @function   CTFontGetMatrix
    @abstract   Returns the transformation matrix of the font.

    @param      font
                The font reference.

    @result     This function returns the transformation matrix for this given font reference. This is the matrix that was provided when the font was created.
*/
CTFontGetMatrix :: (font: CTFontRef) -> CGAffineTransform #foreign CoreText;
/*!
    @function   CTFontGetSymbolicTraits
    @abstract   Returns the symbolic font traits.

    @param      font
                The font reference.

    @result     This function returns the symbolic traits of the font. This is equivalent to the kCTFontSymbolicTrait of traits dictionary. See CTFontTraits.h for a definition of the font traits.
*/
CTFontGetSymbolicTraits :: (font: CTFontRef) -> CTFontSymbolicTraits #foreign CoreText;
/*!
    @function   CTFontCopyTraits
    @abstract   Returns the font traits dictionary.

    @param      font
                The font reference.

    @result     This function returns a retained reference to the font traits dictionary. Individual traits can be accessed with the trait key constants. See CTFontTraits.h for a definition of the font traits.
*/
CTFontCopyTraits :: (font: CTFontRef) -> CFDictionaryRef #foreign CoreText;
/*!
    @function   CTFontCopyDefaultCascadeListForLanguages
    @abstract   Return an ordered list of CTFontDescriptorRef's for font fallback derived from the system default fallback according to the given language preferences, making a reasonable attempt to match the given font's style, weight, and width.

    @param      font
                The font reference.

    @param      languagePrefList
                An array of language identifiers as CFString values, in decreasing order of preference.

    @result     The ordered list of fallback fonts - ordered array of CTFontDescriptors.
*/
CTFontCopyDefaultCascadeListForLanguages :: (font: CTFontRef, languagePrefList: CFArrayRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontCopyPostScriptName
    @abstract   Returns the PostScript name.

    @param      font
                The font reference.

    @result     This function returns a retained reference to the PostScript name of the font.
*/
CTFontCopyPostScriptName :: (font: CTFontRef) -> CFStringRef #foreign CoreText;
/*!
    @function   CTFontCopyFamilyName
    @abstract   Returns the family name.

    @param      font
                The font reference.

    @result     This function returns a retained reference to the family name of the font.
*/
CTFontCopyFamilyName :: (font: CTFontRef) -> CFStringRef #foreign CoreText;
/*!
    @function   CTFontCopyFullName
    @abstract   Returns the display name.

    @param      font
                The font reference.

    @result     This function returns a retained reference to the full name of the font.
*/
CTFontCopyFullName :: (font: CTFontRef) -> CFStringRef #foreign CoreText;
/*!
    @function   CTFontCopyDisplayName
    @abstract   Returns the display name.

    @param      font
                The font reference.

    @result     This function returns a retained reference to the localized display name of the font.
*/
CTFontCopyDisplayName :: (font: CTFontRef) -> CFStringRef #foreign CoreText;
/*!
    @function   CTFontCopyName
    @abstract   Returns a reference to the requested name.

    @param      font
                The font reference.

    @param      nameKey
                The name specifier. See name specifier constants.

    @result     This function creates the requested name for the font, or NULL if the font does not have an entry for the requested name. The Unicode version of the name will be preferred, otherwise the first available will be used.
*/
CTFontCopyName :: (font: CTFontRef, nameKey: CFStringRef) -> CFStringRef #foreign CoreText;
/*!
    @function   CTFontCopyLocalizedName
    @abstract   Returns a reference to a localized font name.

    @discussion Localized names are necessary for presentation to a human but are rarely appropriate for programmatic use. CoreText provides localizations for common names but will not attempt any sort of automated translation.

    @param      font
                The font reference.

    @param      nameKey
                A name specifier listed in "Font Constants", for example kCTFontStyleNameKey. Name keys present in dictionaries (such as those for axes or features) are handled not by this function but by the functions returning those dictionaries.

    @param      actualLanguage
                Pointer to a CFStringRef to receive the language identifier of the returned name string. The format of the language identifier will conform to UTS #35.
                If CoreText can supply its own localized string where the font cannot, this value will be NULL.

    @result     This function returns a specific localized name from the font reference. The name is localized based on the user's global language precedence. If the font does not have an entry for the requested name, NULL will be returned. The matched language will be returned in the caller's buffer.

    @seealso    CTFontCopyVariationAxes
    @seealso    CTFontCopyFeatures
*/
CTFontCopyLocalizedName :: (font: CTFontRef, nameKey: CFStringRef, actualLanguage: *CFStringRef) -> CFStringRef #foreign CoreText;
/*!
    @function   CTFontCopyCharacterSet
    @abstract   Returns the Unicode character set of the font.

    @param      font
                The font reference.

    @result     This function returns a retained reference to the font's character set. This character set covers the nominal referenced by the font's Unicode cmap table (or equivalent).
*/
CTFontCopyCharacterSet :: (font: CTFontRef) -> CFCharacterSetRef #foreign CoreText;
/*!
    @function   CTFontGetStringEncoding
    @abstract   Returns the best string encoding for legacy format support.

    @param      font
                The font reference.

    @result     This function returns the best string encoding for the font.
*/
CTFontGetStringEncoding :: (font: CTFontRef) -> CFStringEncoding #foreign CoreText;
/*!
    @function   CTFontCopySupportedLanguages
    @abstract   Returns an array of languages supported by the font.

    @param      font
                The font reference.

    @result     This function returns a retained reference to an array of languages supported by the font. The array contains language identifier strings as CFStringRefs. The format of the language identifier will conform to UTS #35.
*/
CTFontCopySupportedLanguages :: (font: CTFontRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontGetGlyphsForCharacters
    @abstract   Performs basic character-to-glyph mapping.

    @discussion This function only provides the nominal mapping as specified by the font's Unicode cmap (or equivalent); such mapping does not constitute proper Unicode layout: it is the caller's responsibility to handle the Unicode properties of the characters.

    @param      font
                The font reference.

    @param      characters
                An array of characters (UTF-16 code units). Non-BMP characters must be encoded as surrogate pairs.

    @param      glyphs
                A pointer to a buffer to receive the glyphs. Glyphs for non-BMP characters are sparse: the first glyph corresponds to the full character and the second glyph will be 0.

    @param      count
                The capacity of both the characters and glyphs arrays.

    @result     The return value indicates whether all provided characters were successfully mapped. A return value of true indicates that the font mapped all characters. A return value of false indicates that some or all of the characters were not mapped; glyphs for unmapped characters will be 0 (with the exception of those corresponding non-BMP characters as described above).

    @seealso    CTFontCopyCharacterSet
*/
CTFontGetGlyphsForCharacters :: () -> s32 #foreign CoreText;
/*!
    @function   CTFontGetAscent
    @abstract   Returns the scaled font ascent metric.

    @param      font
                The font reference.

    @result     This function returns the font ascent metric scaled based on the point size and matrix of the font reference.
*/
CTFontGetAscent :: (font: CTFontRef) -> CGFloat #foreign CoreText;
/*!
    @function   CTFontGetDescent
    @abstract   Returns the scaled font descent metric.

    @param      font
                The font reference.

    @result     This function returns the font descent metric scaled based on the point size and matrix of the font reference.
*/
CTFontGetDescent :: (font: CTFontRef) -> CGFloat #foreign CoreText;
/*!
    @function   CTFontGetLeading
    @abstract   Returns the scaled font leading metric.

    @param      font
                The font reference.

    @result     This function returns the font leading metric scaled based on the point size and matrix of the font reference.
*/
CTFontGetLeading :: (font: CTFontRef) -> CGFloat #foreign CoreText;
/*!
    @function   CTFontGetUnitsPerEm
    @abstract   Returns the units per em metric.

    @param      font
                The font reference.

    @result     This function returns the units per em of the font.
*/
CTFontGetUnitsPerEm :: (font: CTFontRef) -> u32 #foreign CoreText;
/*!
    @function   CTFontGetGlyphCount
    @abstract   Returns the number of glyphs.

    @param      font
                The font reference.

    @result     This function returns the number of glyphs in the font.
*/
CTFontGetGlyphCount :: (font: CTFontRef) -> CFIndex #foreign CoreText;
/*!
    @function   CTFontGetBoundingBox
    @abstract   Returns the scaled bounding box.

    @param      font
                The font reference.

    @result     This will return the design bounding box of the font, which is the rectangle defined by xMin, yMin, xMax, and yMax values for the font.
*/
CTFontGetBoundingBox :: (font: CTFontRef) -> CGRect #foreign CoreText;
/*!
    @function   CTFontGetUnderlinePosition
    @abstract   Returns the scaled underline position.

    @param      font
                The font reference.

    @result     This function returns the font underline position metric scaled based on the point size and matrix of the font reference.
*/
CTFontGetUnderlinePosition :: (font: CTFontRef) -> CGFloat #foreign CoreText;
/*!
    @function   CTFontGetUnderlineThickness
    @abstract   Returns the scaled underline thickness metric.

    @param      font
                The font reference.

    @result     This function returns the font underline thickness metric scaled based on the point size and matrix of the font reference.
*/
CTFontGetUnderlineThickness :: (font: CTFontRef) -> CGFloat #foreign CoreText;
/*!
    @function   CTFontGetSlantAngle
    @abstract   Returns the slant angle of the font.

    @param      font
                The font reference.

    @result     This function returns the transformed slant angle of the font. This is equivalent to the italic or caret angle with any skew from the transformation matrix applied.
*/
CTFontGetSlantAngle :: (font: CTFontRef) -> CGFloat #foreign CoreText;
/*!
    @function   CTFontGetCapHeight
    @abstract   Returns the cap height metric.

    @param      font
                The font reference.

    @result     This function returns the font cap height metric scaled based on the point size and matrix of the font reference.
*/
CTFontGetCapHeight :: (font: CTFontRef) -> CGFloat #foreign CoreText;
/*!
    @function   CTFontGetXHeight
    @abstract   Returns the X height metric.

    @param      font
                The font reference.

    @result     This function returns the font X height metric scaled based on the point size and matrix of the font reference.
*/
CTFontGetXHeight :: (font: CTFontRef) -> CGFloat #foreign CoreText;
/*!
    @function   CTFontGetGlyphWithName
    @abstract   Returns the CGGlyph for the specified glyph name.

    @param      font
                The font reference.

    @param      glyphName
                The glyph name as a CFString.

    @result     The glyph with the specified name or 0 if the name is not recognized; this glyph can be used with other Core Text glyph data accessors or with Quartz.
*/
CTFontGetGlyphWithName :: (font: CTFontRef, glyphName: CFStringRef) -> CGGlyph #foreign CoreText;
/*!
    @function   CTFontCopyNameForGlyph
    @abstract   Returns the name for the specified glyph.

    @param      font
                The font reference.

    @param      glyph
                The glyph.

    @result     The glyph name as a CFString or NULL if the glyph is invalid.

    @seealso    CTFontGetGlyphWithName
*/
CTFontCopyNameForGlyph :: (font: CTFontRef, glyph: CGGlyph) -> CFStringRef #foreign CoreText;
/*!
    @function   CTFontGetBoundingRectsForGlyphs
    @abstract   Calculates the bounding rects for an array of glyphs and returns the overall bounding rect for the run.

    @param      font
                The font reference.

    @param      orientation
                The intended drawing orientation of the glyphs. Used to determined which glyph metrics to return.

    @param      glyphs
                An array of count number of glyphs.

    @param      boundingRects
                An array of count number of CGRects to receive the computed glyph rects. Can be NULL, in which case only the overall bounding rect is calculated.

    @param      count
                The capacity of the glyphs and boundingRects buffers.

    @result     This function returns the overall bounding rectangle for an array or run of glyphs. The bounding rects of the individual glyphs are returned through the boundingRects parameter. These are the design metrics from the font transformed in font space.
*/
CTFontGetBoundingRectsForGlyphs :: (font: CTFontRef, orientation: CTFontOrientation, glyphs: *CGGlyph, boundingRects: *CGRect, count: CFIndex) -> CGRect #foreign CoreText;
/*!
    @function   CTFontGetOpticalBoundsForGlyphs
    @abstract   Calculates the optical bounding rects for an array of glyphs and returns the overall optical bounding rect for the run.

    @discussion Fonts may specify the optical edges of glyphs that can be used to make the edges of lines of text line up in a more visually pleasing way. This function returns bounding rects corresponding to this information if present in a font, otherwise it returns typographic bounding rects (composed of the font's ascent and descent and a glyph's advance width).

    @param      font
                The font reference.

    @param      glyphs
                An array of count number of glyphs.

    @param      boundingRects
                An array of count number of CGRects to receive the computed glyph rects. Can be NULL, in which case only the overall bounding rect is calculated.

    @param      count
                The capacity of the glyphs and boundingRects buffers.

    @param      options
                Reserved, set to zero.

    @result     This function returns the overall bounding rectangle for an array or run of glyphs. The bounding rects of the individual glyphs are returned through the boundingRects parameter. These are the design metrics from the font transformed in font space.
*/
CTFontGetOpticalBoundsForGlyphs :: (font: CTFontRef, glyphs: *CGGlyph, boundingRects: *CGRect, count: CFIndex, options: CFOptionFlags) -> CGRect #foreign CoreText;
/*!
    @function   CTFontGetAdvancesForGlyphs
    @abstract   Calculates the advances for an array of glyphs and returns the summed advance.

    @param      font
                The font reference.

    @param      orientation
                The intended drawing orientation of the glyphs. Used to determined which glyph metrics to return.

    @param      glyphs
                An array of count number of glyphs.

    @param      advances
                An array of count number of CGSize to receive the computed glyph advances. Can be NULL, in which case only the overall advance is calculated.

    @param      count
                The capacity of the glyphs and advances buffers.

    @result     This function returns the summed glyph advance of an array of glyphs. Individual glyph advances are passed back via the advances parameter. These are the ideal metrics for each glyph scaled and transformed in font space.
*/
CTFontGetAdvancesForGlyphs :: (font: CTFontRef, orientation: CTFontOrientation, glyphs: *CGGlyph, advances: *CGSize, count: CFIndex) -> float64 #foreign CoreText;
/*!
    @function   CTFontGetVerticalTranslationsForGlyphs
    @abstract   Calculates the offset from the default (horizontal) origin to the vertical origin for an array of glyphs.

    @param      font
                The font reference.

    @param      glyphs
                An array of count number of glyphs.

    @param      translations
                An array of count number of CGSize to receive the computed origin offsets.

    @param      count
                The capacity of the glyphs and translations buffers.
*/
CTFontGetVerticalTranslationsForGlyphs :: (font: CTFontRef, glyphs: *CGGlyph, translations: *CGSize, count: CFIndex) -> void #foreign CoreText;
/*!
    @function   CTFontCreatePathForGlyph
    @abstract   Creates a path for the specified glyph.

    @discussion Creates a path from the outlines of the glyph for the specified font. The path will reflect the font point size, matrix, and transform parameter, in that order. The transform parameter will most commonly be used to provide a translation to the desired glyph origin.

    @param      font
                The font reference.

    @param      glyph
                The glyph.

    @param      matrix
                An affine transform applied to the path. Can be NULL, in which case CGAffineTransformIdentity will be used.

    @result     A retained CGPath reference containing the glyph outlines or NULL if there is no such glyph or it has no outline.
*/
CTFontCreatePathForGlyph :: (font: CTFontRef, glyph: CGGlyph, matrix: *CGAffineTransform) -> CGPathRef #foreign CoreText;
/*!
    @function   CTFontCopyVariationAxes
    @abstract   Returns an array of variation axis dictionaries.
    @discussion Each variation axis dictionary contains the five kCTFontVariationAxis* keys above, and kCTFontVariationAxisNameKey values will be localized when supported by the font; for programmatic uses kCTFontVariationAxesAttribute may be used instead.

    @param      font
                The font reference.

    @result     An array of variation axis dictionaries or null if the font does not support variations.

    @seealso    kCTFontVariationAxesAttribute
*/
CTFontCopyVariationAxes :: (font: CTFontRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontCopyVariation
    @abstract   Returns a variation dictionary.
    @discussion This function describes the current configuration of a variation font: a dictionary of number values with variation identifier number keys. As of macOS 10.12 and iOS 10.0, only non-default values (as determined by the variation axis) are returned.

    @param      font
                The font reference.

    @result     This function returns a variation dictionary or null if the font does not support variations.
    
    @seealso    kCTFontVariationAxisIdentifierKey
    @seealso    kCTFontVariationAxisDefaultValueKey
*/
CTFontCopyVariation :: (font: CTFontRef) -> CFDictionaryRef #foreign CoreText;
/*!
    @function   CTFontCopyFeatures
    @abstract   Returns an array of font features

    @discussion The returned value describes the features available for the provided font. Each array value is a feature dictionary describing a feature type, with related selector dictionaries in an array under the kCTFontFeatureTypeSelectorsKey.
                While CoreText supports AAT and OpenType font features, they are preferentially represented as AAT features owing to their more formal structure: individual feature types can be either exclusive or non-exclusive, which indicates whether one or more of its selectors can be simultaneously enabled. Where possible features are elaborated with their OpenType feature tag and value, which can occur within both type or selector dictionaries depending on the feature's mapping to an AAT type and selector pair.
                Names are localized according to the preferred langauges of the caller and therefore are not appropriate for programmatically identifying features.

    @param      font
                The font reference.

    @result     This function returns an array of font feature dictionaries for the font reference.
*/
CTFontCopyFeatures :: (font: CTFontRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontCopyFeatureSettings
    @abstract   Returns an array of font feature setting tuples

    @discussion A setting tuple is a dictionary of a kCTFontFeatureTypeIdentifierKey key-value pair and a kCTFontFeatureSelectorIdentifierKey key-value pair. Each tuple corresponds to an enabled non-default setting. It is the caller's responsibility to handle exclusive and non-exclusive settings as necessary.

    @param      font
                The font reference.

    @result     This function returns a normalized array of font feature setting dictionaries. The array will only contain the non-default settings that should be applied to the font, or NULL if the default settings should be used.
*/
CTFontCopyFeatureSettings :: (font: CTFontRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontCopyGraphicsFont
    @abstract   Returns a CGFontRef and attributes.

    @param      font
                The font reference.

    @param      attributes
                A pointer to a CTFontDescriptorRef to receive a font descriptor containing additional attributes. Can be NULL. Must be released by caller.

    @result     This function returns a CGFontRef for the given font reference. Additional attributes from the font will be passed back as a font descriptor via the attributes parameter. The result must be released by the caller.
*/
CTFontCopyGraphicsFont :: (font: CTFontRef, attributes: *CTFontDescriptorRef) -> CGFontRef #foreign CoreText;
/*!
    @function   CTFontCreateWithGraphicsFont
    @abstract   Creates a new font reference from a CGFontRef.

    @param      graphicsFont
                A valid CGFontRef.

    @param      size
                The point size for the font reference. If 0.0 is specified, the default font size of 12.0 will be used.

    @param      matrix
                The transformation matrix for the font. If unspecified, the identity matrix will be used. Optional.

    @param      attributes
                A CTFontDescriptorRef containing additional attributes that should be matched. Optional.

    @result     This function returns a new font reference for an existing CGFontRef with the specified size, matrix, and additional attributes.
*/
CTFontCreateWithGraphicsFont :: (graphicsFont: CGFontRef, size: CGFloat, matrix: *CGAffineTransform, attributes: CTFontDescriptorRef) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontGetPlatformFont
    @abstract   Returns the ATSFontRef and attributes.

    @param      font
                The font reference.

    @param      attributes
                A pointer to a CTFontDescriptorRef to receive a font descriptor containing additional attributes. Can be NULL. Must be released by caller.

    @result     This function returns a an ATSFontRef for the given font reference. Additional attributes from the font will be passed back as a font descriptor via the attributes parameter.
*/
CTFontGetPlatformFont :: (font: CTFontRef, attributes: *CTFontDescriptorRef) -> ATSFontRef #foreign CoreText;
/*!
    @function   CTFontCreateWithPlatformFont
    @abstract   Creates a new font reference from an ATSFontRef.

    @param      platformFont
                A valid ATSFontRef.

    @param      size
                The point size for the font reference. If 0.0 is specified, the default font size of 12.0 will be used.

    @param      matrix
                The transformation matrix for the font. If unspecified, the identity matrix will be used. Optional.

    @param      attributes
                A CTFontDescriptorRef containing additional attributes that should be matched. Optional.

    @result     This function returns a new font reference for an ATSFontRef with the specified size, matrix, and additional attributes.
*/
CTFontCreateWithPlatformFont :: (platformFont: ATSFontRef, size: CGFloat, matrix: *CGAffineTransform, attributes: CTFontDescriptorRef) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontCreateWithQuickdrawInstance
    @abstract   Returns a font reference for the given Quickdraw instance.

    @discussion This function is provided for compatibility support between Core Text and clients needing to support Quickdraw font references.

    @param      name
                The Quickdraw font name. If NULL or zero length, an identifier must be specified instead.

    @param      identifier
                The Quickdraw font identifier. If 0, a name must be specified instead.

    @param      style
                The Quickdraw font style.

    @param      size
                The point size for the font reference. If 0.0 is specified, the default size of 12.0 is used.

    @result     This function returns the best font instance matching the Quickdraw instance information.
*/
CTFontCreateWithQuickdrawInstance :: (name: ConstStr255Param, identifier: s16, style: u8, size: CGFloat) -> CTFontRef #foreign CoreText;
/*!
    @function   CTFontCopyAvailableTables
    @abstract   Returns an array of font table tags.

    @param      font
                The font reference.

    @param      options
                The options used when copying font tables.

    @result     This function returns an array of CTFontTableTag values for the given font and the supplied options. The returned set will contain unboxed values, which may be extracted like so:
                <code>CTFontTableTag tag = (CTFontTableTag)(uintptr_t)CFArrayGetValueAtIndex(tags, index);</code>
*/
CTFontCopyAvailableTables :: (font: CTFontRef, options: CTFontTableOptions) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontHasTable
    @abstract   Determine whether a table is present in a font.
    @discussion This is a convenience function to avoid requesting an array of table tags or any table data. It behaves according as if using `kCTFontTableOptionNoOptions`.

    @param      font
                The font reference.

    @param      tag
                The font table identifier as a CTFontTableTag.

    @result     Returns true if the call was successful and the requested table is present.
*/
CTFontHasTable :: () -> s32 #foreign CoreText;
/*!
    @function   CTFontCopyTable
    @abstract   Returns a reference to the font table data.

    @param      font
                The font reference.

    @param      table
                The font table identifier as a CTFontTableTag.

    @param      options
                The options used when copying font table.

    @result     This function returns a retained reference to the font table data as CFDataRef or NULL if the table is not present.
*/
CTFontCopyTable :: (font: CTFontRef, table: CTFontTableTag, options: CTFontTableOptions) -> CFDataRef #foreign CoreText;
/*!
    @function   CTFontDrawGlyphs
    @abstract   Renders the given glyphs from the CTFont at the given positions in the CGContext.
    @discussion This function will modify the CGContext's font, text size, and text matrix if specified in the CTFont. These attributes will not be restored.
        The given glyphs should be the result of proper Unicode text layout operations (such as CTLine). Results from CTFontGetGlyphsForCharacters (or similar APIs) do not perform any Unicode text layout.

    @param      font
                The font to render glyphs from. If the font has a size or matrix attribute, the CGContext will be set with these values.

    @param      glyphs
                The glyphs to be rendered. See above discussion of how the glyphs should be derived.

    @param      positions
                The positions (origins) for each glyph. The positions are in user space. The number of positions passed in must be equivalent to the number of glyphs.

    @param      count
                The number of glyphs to be rendered from the glyphs array.

    @param      context
                CGContext used to render the glyphs.
*/
CTFontDrawGlyphs :: (font: CTFontRef, glyphs: *CGGlyph, positions: *CGPoint, count: u64, ctx: CGContextRef) -> void #foreign CoreText;
/*!
    @function   CTFontGetLigatureCaretPositions
    @abstract   Returns caret positions within a glyph.
    @discussion This function is used to obtain caret positions for a specific glyph.
                The return value is the max number of positions possible, and the function
                will populate the caller's positions buffer with available positions if possible.
                This function may not be able to produce positions if the font does not
                have the appropriate data, in which case it will return 0.
 
    @param      font
                The font reference.
    
    @param      glyph
                The glyph.
 
    @param      positions
                A buffer of at least maxPositions to receive the ligature caret positions for
                the glyph.
 
    @param      maxPositions
                The maximum number of positions to return.
 
    @result     Returns the number of caret positions for the specified glyph.
*/
CTFontGetLigatureCaretPositions :: (font: CTFontRef, glyph: CGGlyph, positions: *CGFloat, maxPositions: CFIndex) -> CFIndex #foreign CoreText;
CTFontGetTypographicBoundsForAdaptiveImageProvider :: (font: CTFontRef, provider: *CTAdaptiveImageProviding) -> CGRect #foreign CoreText;
CTFontDrawImageFromAdaptiveImageProviderAtPoint :: (font: CTFontRef, provider: *CTAdaptiveImageProviding, point: CGPoint, ctx: CGContextRef) -> void #foreign CoreText;
/*!
    @function   CTFontCollectionGetTypeID
    @abstract   Returns the type identifier for Core Text font collection references.
    @result     The identifier for the opaque types CTFontCollectionRef or CTMutableFontCollectionRef.
*/
CTFontCollectionGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTFontCollectionCreateFromAvailableFonts
    @abstract   Returns a new font collection matching all available fonts.

    @param      options
                The options dictionary. See constant option keys.

    @result     This function creates a new collection containing all fonts available to the current application.
*/
CTFontCollectionCreateFromAvailableFonts :: (options: CFDictionaryRef) -> CTFontCollectionRef #foreign CoreText;
/*!
    @function   CTFontCollectionCreateWithFontDescriptors
    @abstract   Returns a new collection based on the array of font descriptors.

    @param      queryDescriptors
                An array of font descriptors to use for matching. May be NULL, in which case the matching descriptors will be NULL.

    @param      options
                The options dictionary. See constant option keys.

    @result     This function creates a new collection based on the provided font descriptors. The contents of this collection is defined by matching the provided descriptors against all available font descriptors.
*/
CTFontCollectionCreateWithFontDescriptors :: (queryDescriptors: CFArrayRef, options: CFDictionaryRef) -> CTFontCollectionRef #foreign CoreText;
/*!
    @function   CTFontCollectionCreateCopyWithFontDescriptors
    @abstract   Returns a copy of the original collection augmented with the new font descriptors.

    @param      original
                The original font collection reference.

    @param      queryDescriptors
                An array of font descriptors to augment those of the original collection.

    @param      options
                The options dictionary. See constant option keys.

    @result     This function creates a copy of the original font collection augmented by the new font descriptors and options. The new font descriptors are merged with the existing descriptors to create a single set.
*/
CTFontCollectionCreateCopyWithFontDescriptors :: (original: CTFontCollectionRef, queryDescriptors: CFArrayRef, options: CFDictionaryRef) -> CTFontCollectionRef #foreign CoreText;
/*!
    @function   CTFontCollectionCreateMutableCopy
    @abstract   Returns a mutable copy of the original collection.

    @param      original
                The original font collection reference.

    @result     This function creates a mutable copy of the original font collection.
*/
CTFontCollectionCreateMutableCopy :: (original: CTFontCollectionRef) -> CTMutableFontCollectionRef #foreign CoreText;
/*!
    @function   CTFontCollectionCopyQueryDescriptors
    @abstract   Returns the array of descriptors to match.

    @param      collection
                The font collection reference.

    @result     This function returns a retained reference to the array of descriptors to be used to query (match) the system font database. The return value is undefined if CTFontCollectionCreateFromAvailableFonts was used to create the collection.
*/
CTFontCollectionCopyQueryDescriptors :: (collection: CTFontCollectionRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontCollectionSetQueryDescriptors
    @abstract   Replaces the array of descriptors to match.

    @param      collection
                The font collection reference.

    @param      descriptors
                An array of CTFontDescriptorRef. May be NULL to represent an empty collection, in which case the matching descriptors will also be NULL.
*/
CTFontCollectionSetQueryDescriptors :: (collection: CTMutableFontCollectionRef, descriptors: CFArrayRef) -> void #foreign CoreText;
/*!
    @function   CTFontCollectionCopyExclusionDescriptors
    @abstract   Returns the array of descriptors to exclude from the match.

    @param      collection
                The font collection reference.

    @result     This function returns a retained reference to the array of descriptors to be used to query (match) the system font database.
*/
CTFontCollectionCopyExclusionDescriptors :: (collection: CTFontCollectionRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontCollectionSetExclusionDescriptors
    @abstract   Replaces the array of descriptors to exclude from the match.

    @param      collection
                The font collection reference.

    @param      descriptors
                An array of CTFontDescriptorRef. May be NULL.
*/
CTFontCollectionSetExclusionDescriptors :: (collection: CTMutableFontCollectionRef, descriptors: CFArrayRef) -> void #foreign CoreText;
/*!
    @function   CTFontCollectionCreateMatchingFontDescriptors
    @abstract   Returns an array of font descriptors matching the collection.

    @param      collection
                The font collection reference.

    @result     An array of CTFontDescriptors matching the collection definition or NULL if there are none.
*/
CTFontCollectionCreateMatchingFontDescriptors :: (collection: CTFontCollectionRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback
    @abstract   Returns the array of matching font descriptors sorted with the callback function.

    @param      collection
                The collection reference.

    @param      sortCallback
                The sorting callback function that defines the sort order.

    @param      refCon
                Pointer to client data define context for the callback.

    @result     An array of CTFontDescriptors matching the criteria of the collection, sorted by the results of the sorting callback function, or NULL if there are none.
*/
CTFontCollectionCreateMatchingFontDescriptorsSortedWithCallback :: (collection: CTFontCollectionRef, sortCallback: CTFontCollectionSortDescriptorsCallback, refCon: *void) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontCollectionCreateMatchingFontDescriptorsWithOptions
    @abstract   Returns an array of font descriptors matching the collection.

    @param      collection
                The font collection reference.

    @param      options
                The options dictionary. See constant option keys. May be NULL, in which case this call returns the same results as CTFontCollectionCreateMatchingFontDescriptors, using the options passed in when the collection was created.

    @result     An array of CTFontDescriptors matching the collection definition or NULL if there are none.
*/
CTFontCollectionCreateMatchingFontDescriptorsWithOptions :: (collection: CTFontCollectionRef, options: CFDictionaryRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontCollectionCreateMatchingFontDescriptorsForFamily
    @abstract   Returns an array of font descriptors matching the specified family, one descriptor for each style in the collection.

    @param      collection
                The font collection reference.

    @param      familyName
                The font family name

    @result     An array of CTFontDescriptors matching the specified family in the collection or NULL if there are none.
*/
CTFontCollectionCreateMatchingFontDescriptorsForFamily :: (collection: CTFontCollectionRef, familyName: CFStringRef, options: CFDictionaryRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontCollectionCopyFontAttribute
    @abstract   Returns an array of font descriptor attribute values.

    @param      collection
                The font collection reference.

    @param      attributeName
                The attribute to retrieve for each descriptor in the collection.

    @param      options
                Options to alter the return value.

    @result     An array containing one value for each descriptor. With kCTFontCollectionCopyDefaultOptions, the values will be in the same order as the results from CTFontCollectionCreateMatchingFontDescriptors and NULL values will be transformed to kCFNull. When the kCTFontCollectionCopyUnique is set, duplicate values will be removed. When kCTFontCollectionCopyStandardSort is set, the values will be sorted in standard UI order.
 */
CTFontCollectionCopyFontAttribute :: (collection: CTFontCollectionRef, attributeName: CFStringRef, options: CTFontCollectionCopyOptions) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontCollectionCopyFontAttributes
    @abstract   Returns an array of dictionaries containing font descriptor attribute values.
 
    @param      collection
                The font collection reference.

    @param      attributeNames
                The attributes to retrieve for each descriptor in the collection.

    @param      options
                Options to alter the return value.

    @result     An array containing one CFDictionary value for each descriptor mapping the requested attribute names. With kCTFontCollectionCopyDefaultOptions, the values will be in the same order as the results from CTFontCollectionCreateMatchingFontDescriptors. When the kCTFontCollectionCopyUnique is set, duplicate values will be removed. When kCTFontCollectionCopyStandardSort is set, the values will be sorted in standard UI order.
 */
CTFontCollectionCopyFontAttributes :: (collection: CTFontCollectionRef, attributeNames: CFSetRef, options: CTFontCollectionCopyOptions) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontManagerCopyAvailablePostScriptNames
    @abstract   Returns an array of unique PostScript font names.
 
    @result     An array of CFStrings.
*/
CTFontManagerCopyAvailablePostScriptNames :: () -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontManagerCopyAvailableFontFamilyNames
    @abstract   Returns an array of visible font family names sorted for UI display.

    @result     An array of CFStrings.
*/
CTFontManagerCopyAvailableFontFamilyNames :: () -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontManagerCopyAvailableFontURLs
    @abstract   Returns an array of font URLs.

    @result     An array of CFURLs.
*/
CTFontManagerCopyAvailableFontURLs :: () -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontManagerCompareFontFamilyNames
    @abstract   A CFComparatorFunction to compare font family names and sort them according to Apple guidelines.
    @discussion This function compares font family names and sorts them in the preferred order for display in user interfaces.
    @param      family1
                The first localized font family name, as CFStringRef.
    @param      family2
                The second localized font family name, as CFStringRef.
    @param      context
                Unused. Can be NULL.
    @result     A CFComparisonResult value indicating the sort order for the two family names. kCFComparisonResultGreaterThan if family1 is greater than family2, kCFComparisonResultLessThan if family1 is less than family2, and kCFComparisonResultEqualTo if they are equal.
*/
CTFontManagerCompareFontFamilyNames :: (family1: *void, family2: *void, ctx: *void) -> CFComparisonResult #foreign CoreText;
/*!
    @function   CTFontManagerCreateFontDescriptorsFromURL
    @abstract   Returns an array of font descriptors representing each of the fonts in the specified URL.
                Note: these font descriptors are not available through font descriptor matching.

    @param      fileURL
                A file system URL referencing a valid font file.

    @result     An array of CTFontDescriptors or NULL if there are no valid fonts.
*/
CTFontManagerCreateFontDescriptorsFromURL :: (fileURL: CFURLRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontManagerCreateFontDescriptorFromData
    @abstract   Returns a font descriptor representing the font in the supplied data.
                Note: the font descriptor is not available through font descriptor matching.

    @discussion If the data contains a font collection (TTC or OTC), only the first font in the collection will be returned.

    @param      data
                A CFData containing font data.

    @result     A font descriptor created from the data or NULL if it is not a valid font.
*/
CTFontManagerCreateFontDescriptorFromData :: (data: CFDataRef) -> CTFontDescriptorRef #foreign CoreText;
/*!
    @function   CTFontManagerCreateFontDescriptorsFromData
    @abstract   Returns an array of font descriptors for the fonts in the supplied data.
                Note: the font descriptors are not available through font descriptor matching.

    @param      data
                A CFData containing font data.

    @result     An array of font descriptors. This can be an empty array in the event of invalid or unsupported font data.
*/
CTFontManagerCreateFontDescriptorsFromData :: (data: CFDataRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFontManagerRegisterFontsForURL
    @abstract   Registers fonts from the specified font URL with the font manager. Registered fonts participate in font descriptor matching.

    @param      fontURL
                A file URL for the font or collection (TTC or OTC) to be registered. Once fonts have been registered from a file, it shouldn't be moved or renamed.

    @param      scope
                Scope constant defining the availability and lifetime of the registration. See scope constants for more details.

    @param      error
                Pointer to receive CFError in the case of failed registration.

    @result     Returns true if registration of the fonts was successful.
*/
CTFontManagerRegisterFontsForURL :: () -> s32 #foreign CoreText;
/*!
    @function   CTFontManagerUnregisterFontsForURL
    @abstract   Unregisters fonts from the specified font URL with the font manager. Unregistered fonts do not participate in font descriptor matching.
                iOS note: only fonts registered with CTFontManagerRegisterFontsForURL or CTFontManagerRegisterFontsForURLs can be unregistered with this API.

    @param      fontURL
                Font URL.

    @param      scope
                Scope constant defining the availability and lifetime of the registration. Should match the scope the fonts are registered in. See scope constants for more details.

    @param      error
                Pointer to receive CFError in the case of failed unregistration.

    @result     Returns true if unregistration of the fonts was successful.

*/
CTFontManagerUnregisterFontsForURL :: () -> s32 #foreign CoreText;
/*!
    @function   CTFontManagerRegisterGraphicsFont
    @abstract   Registers the specified graphics font with the font manager. Registered fonts participate in font descriptor matching.

    @discussion Attempts to register a font that is either already registered or contains the same PostScript name of an already registered font will fail.
                This functionality is intended for fonts that may be embedded in documents or present/constructed in memory. A graphics font is obtained
                by calling CGFontCreateWithDataProvider. Fonts that are backed by files should be registered using CTFontManagerRegisterFontsForURL.
 
    @param      font
                Graphics font to be registered.
 
    @param      error
                Pointer to receive CFError in the case of failed registration.
 
    @result     Returns true if registration of the fonts was successful.
*/
CTFontManagerRegisterGraphicsFont :: () -> s32 #foreign CoreText;
/*!
    @function   CTFontManagerUnregisterGraphicsFont
    @abstract   Unregisters the specified graphics font with the font manager. Unregistered fonts do not participate in font descriptor matching.
 
    @param      font
                Graphics font to be unregistered.
 
    @param      error
                Pointer to receive CFError in the case of failed unregistration.
 
    @result     Returns true if unregistration of the font was successful.
*/
CTFontManagerUnregisterGraphicsFont :: () -> s32 #foreign CoreText;
/*!
    @function   CTFontManagerRegisterFontsForURLs
    @abstract   Registers fonts from the specified font URLs with the font manager. Registered fonts are discoverable through font descriptor matching.

    @param      fontURLs
                An array of file URLs for the fonts or collections (TTC or OTC) to be registered. Once fonts have been registered from a file, it shouldn't be moved or renamed.

    @param      scope
                Scope constant defining the availability and lifetime of the registration. See scope constants for more details.

    @param      errors
                Pointer to CFArrayRef to receive array of CFError references. Each error will contain a CFArray of font URLs corresponding to kCTFontManagerErrorFontURLsKey. These URLs represent the font files that caused the error, and were not successfully registered. Must be released by caller. Can be NULL.

    @result     Returns true if registration of all font URLs was successful. Otherwise false.
*/
CTFontManagerRegisterFontsForURLs :: () -> s32 #foreign CoreText;
/*!
    @function   CTFontManagerUnregisterFontsForURLs
    @abstract   Unregisters fonts from the specified font URLs with the font manager. Unregistered fonts do not participate in font descriptor matching.
                iOS note: only fonts registered with CTFontManagerRegisterFontsForURL or CTFontManagerRegisterFontsForURLs can be unregistered with this API.

    @param      fontURLs
                Array of font URLs.

    @param      scope
                Scope constant defining the availability and lifetime of the registration. Should match the scope the fonts are registered in. See scope constants for more details.

    @param      errors
                Pointer to CFArrayRef to receive array of CFError references. Each error will contain a CFArray of font URLs corresponding to kCTFontManagerErrorFontURLsKey. These URLs represent the font files that caused the error, and were not successfully unregistered. Must be released by caller. Can be NULL.

    @result     Returns true if unregistration of all font URLs was successful. Otherwise false.
*/
CTFontManagerUnregisterFontsForURLs :: () -> s32 #foreign CoreText;
/*!
	@function   CTFontManagerRegisterFontURLs
	@abstract   Registers fonts from the specified font URLs with the font manager. Registered fonts are discoverable through font descriptor matching in the calling process

	@discussion In iOS, fonts registered with the persistent scope are not automatically available to other processes. Other process may call CTFontManagerRequestFonts to get access to these fonts.
 
	@param      fontURLs
				A file URL for the fonts or collections (TTC or OTC) to be registered. Once fonts have been registered from a file, it shouldn't be moved or renamed.
	
	@param      scope
				Scope constant defining the availability and lifetime of the registration. See scope constants for more details.
	
	@param      enabled
				Boolean value indicating whether the font derived from the URL should be enabled for font descriptor matching and/or discoverable via CTFontManagerRequestFonts.

	@param      registrationHandler
				Block called as errors are discovered or upon completion. The errors parameter contains an array of CFError references. An empty array indicates no errors. Each error reference will contain a CFArray of font URLs corresponding to kCTFontManagerErrorFontURLsKey. These URLs represent the font files that caused the error, and were not successfully registered. Note, the handler may be called multiple times during the registration process. The done parameter will be set to true when the registration process has completed. The handler should return false if the operation is to be stopped. This may be desirable after receiving an error.
 */
CTFontManagerRegisterFontURLs :: (fontURLs: CFArrayRef, scope: CTFontManagerScope, enabled: bool, registrationHandler: #type (unknown_0: CFArrayRef, unknown_1: bool) -> s32 #c_call) -> void #foreign CoreText;
/*!
	@function   CTFontManagerUnregisterFontURLs
	@abstract   Unregisters fonts from the specified font URLs with the font manager. Unregistered fonts do not participate in font descriptor matching.
	iOS note: only fonts registered with CTFontManagerRegisterFontsForURL or CTFontManagerRegisterFontsForURLs can be unregistered with this API.
	 
	@param      fontURLs
				Array of font URLs.
	
	@param      scope
				Scope constant defining the availability and lifetime of the registration. Should match the scope the fonts are registered in. See scope constants for more details.
	
	@param      registrationHandler
				Block called as errors are discovered or upon completion. The errors parameter will be an empty array if all files are unregistered. Otherwise, it will contain an array of CFError references. Each error reference will contain a CFArray of font URLs corresponding to kCTFontManagerErrorFontURLsKey. These URLs represent the font files that caused the error, and were not successfully unregistered. Note, the handler may be called multiple times during the unregistration process. The done parameter will be set to true when the unregistration process has completed. The handler should return false if the operation is to be stopped. This may be desirable after receiving an error.
 */
CTFontManagerUnregisterFontURLs :: (fontURLs: CFArrayRef, scope: CTFontManagerScope, registrationHandler: #type (unknown_0: CFArrayRef, unknown_1: bool) -> s32 #c_call) -> void #foreign CoreText;
/*!
	@function   CTFontManagerRegisterFontDescriptors
	@abstract   Registers font descriptors with the font manager. Registered fonts are discoverable through font descriptor matching in the calling process.
	
	@discussion Fonts descriptors registered in disabled state are not immediately available for descriptor matching but the font manager will know the descriptors could be made available if necessary. These decriptors can be enabled by making this called again with the enabled parameter set to true. This operation may fail if there is another font registered and enabled with the same Postscript name. In iOS, fonts registered with the persistent scope are not automatically available to other processes. Other process may call CTFontManagerRequestFonts to get access to these fonts.
	
	@param      fontDescriptors
				Array of font descriptors to register. Font descriptor keys used for registration are: kCTFontURLAttribute, kCTFontNameAttribute, kCTFontFamilyNameAttribute, or kCTFontRegistrationUserInfoAttribute.
	
	@param      scope
				Scope constant defining the availability and lifetime of the registration. See scope constants for more details.
	
	@param      enabled
				Boolean value indicating whether the font descriptors should be enabled for font descriptor matching and/or discoverable via CTFontManagerRequestFonts.
	
	@param      registrationHandler
				Block called as errors are discovered or upon completion. The errors parameter contains an array of CFError references. An empty array indicates no errors. Each error reference will contain a CFArray of font descriptors corresponding to kCTFontManagerErrorFontDescriptorsKey. These represent the font descriptors that caused the error, and were not successfully registered. Note, the handler may be called multiple times during the registration process. The done parameter will be set to true when the registration process has completed. The handler should return false if the operation is to be stopped. This may be desirable after receiving an error.
 */
CTFontManagerRegisterFontDescriptors :: (fontDescriptors: CFArrayRef, scope: CTFontManagerScope, enabled: bool, registrationHandler: #type (unknown_0: CFArrayRef, unknown_1: bool) -> s32 #c_call) -> void #foreign CoreText;
/*!
	@function   CTFontManagerUnregisterFontDescriptors
	@abstract   Unregisters font descriptors with the font manager. Unregistered fonts do not participate in font descriptor matching.
	
	@param      fontDescriptors
				Array of font descriptors to unregister.
	
	@param      scope
				Scope constant defining the availability and lifetime of the registration. See scope constants for more details.
	
	@param      registrationHandler
				Block called as errors are discovered or upon completion. The errors parameter will be an empty array if all font descriptors are unregistered. Otherwise, it will contain an array of CFError references. Each error reference will contain a CFArray of font descriptors corresponding to kCTFontManagerErrorFontDescriptorsKey. These represent the font descriptors that caused the error, and were not successfully unregistered. Note, the handler may be called multiple times during the unregistration process. The done parameter will be set to true when the unregistration process has completed. The handler should return false if the operation is to be stopped. This may be desirable after receiving an error.
 */
CTFontManagerUnregisterFontDescriptors :: (fontDescriptors: CFArrayRef, scope: CTFontManagerScope, registrationHandler: #type (unknown_0: CFArrayRef, unknown_1: bool) -> s32 #c_call) -> void #foreign CoreText;
/*!
	@function   CTFontManagerRegisterFontsWithAssetNames
	@abstract   Registers named font assets in the specified bundle with the font manager. Registered fonts are discoverable through font descriptor matching in the calling process.

	@discussion Font assets are extracted from the asset catalog and registered. This call must be made after the completion handler of either NSBundleResourceRequest beginAccessingResourcesWithCompletionHandler: or conditionallyBeginAccessingResourcesWithCompletionHandler: is called successfully.
	Name the assets using Postscript names for individual faces, or family names for variable/collection fonts. The same names can be used to unregister the fonts with CTFontManagerUnregisterFontDescriptors. In iOS, fonts registered with the persistent scope are not automatically available to other processes. Other process may call CTFontManagerRequestFonts to get access to these fonts.
 
	@param      fontAssetNames
				Array of font name assets in asset catalog.
	
	@param      bundle
				Bundle containing asset catalog. A null value resolves to the main bundle.

	@param      scope
				Scope constant defining the availability and lifetime of the registration. kCTFontManagerScopePersistent is the only supported scope for iOS.
	
	@param      enabled
				Boolean value indicating whether the font assets should be enabled for font descriptor matching and/or discoverable via CTFontManagerRequestFonts.

	@param      registrationHandler
				Block called as errors are discovered, or upon completion. The errors parameter contains an array of CFError references. An empty array indicates no errors. Each error reference will contain a CFArray of font asset names corresponding to kCTFontManagerErrorFontAssetNameKey. These represent the font asset names that were not successfully registered. Note, the handler may be called multiple times during the registration process. The done parameter will be set to true when the registration process has completed. The handler should return false if the operation is to be stopped. This may be desirable after receiving an error.
 */
CTFontManagerRegisterFontsWithAssetNames :: (fontAssetNames: CFArrayRef, bundle: CFBundleRef, scope: CTFontManagerScope, enabled: bool, registrationHandler: #type (unknown_0: CFArrayRef, unknown_1: bool) -> s32 #c_call) -> void #foreign CoreText;
/*!
    @function   CTFontManagerEnableFontDescriptors
    @abstract   Enables or disables the matching font descriptors for font descriptor matching.

    @param      descriptors
                Array of font descriptors.

    @param      enable
                Boolean value indicating whether the fonts matching descriptors should be enabled for font descriptor matching.
*/
CTFontManagerEnableFontDescriptors :: (descriptors: CFArrayRef, enable: bool) -> void #foreign CoreText;
/*!
    @function   CTFontManagerGetScopeForURL
    @abstract   Returns the registration scope of the specified URL.

    @param      fontURL
                Font URL.

    @result     Returns the registration scope of the specified URL, will return kCTFontManagerScopeNone if not currently registered.
*/
CTFontManagerGetScopeForURL :: (fontURL: CFURLRef) -> CTFontManagerScope #foreign CoreText;
/*!
	@function   CTFontManagerCopyRegisteredFontDescriptors
	@abstract   Returns the font descriptors that were registered with the font manager.
	
	@discussion In the case the persistent scope is specified, only macOS can return fonts registered by any process. Other platforms can only return font descriptors registered by the application's process.
	
	@param      scope
				Scope constant defining the availability and lifetime of the registration. See scope constants for more details.
	
	@param      enabled
				Boolean value indicating if the caller is interested in registered font descriptors that are enabled or disabled.
	
	@result     Array of of font descriptors registered by the application. Array may be empty if nothing is registered.
 */
CTFontManagerCopyRegisteredFontDescriptors :: (scope: CTFontManagerScope, enabled: bool) -> CFArrayRef #foreign CoreText;
/*!
	@function   CTFontManagerRequestFonts
	@abstract   Resolves font descriptors specified on input. On iOS only, if the font descriptors cannot be found, the user is presented with a dialog indicating fonts that could not be resolved. The user may optionally be provided with a way to resolve the missing fonts if the font manager has a way to enable them.
	
	@discussion On iOS, fonts registered by font provider applications in the persistent scope are not automatically available to other applications. Client applications must call this function to make the requested fonts available for font descriptor matching.
	
	@param      fontDescriptors
				Array of font descriptors to make available to the process.  Keys used to describe the fonts may be a combination of: kCTFontNameAttribute, kCTFontFamilyNameAttribute, or kCTFontRegistrationUserInfoAttribute.
	
	@param      completionHandler
				Block called after request operation completes. Block takes a single parameter containing an array of those descriptors that could not be resolved/found. The array can be empty if all descriptors were resolved.
 */
CTFontManagerRequestFonts :: (fontDescriptors: CFArrayRef, completionHandler: #type (unknown_0: CFArrayRef) -> void #c_call) -> void #foreign CoreText;
/*!
    @function   CTFontManagerIsSupportedFont
    @abstract   Determines whether a file is in a supported font format.

    @discussion This function does not validate any font data, so clients using it must still be prepared to handle failed registration or font descriptor creation.

    @param      fontURL
                A file URL.

    @result     This function returns true if the file is in a supported font format.
*/
CTFontManagerIsSupportedFont :: () -> s32 #foreign CoreText;
/*!
    @function   CTFontManagerCreateFontRequestRunLoopSource
    @abstract   Creates a CFRunLoopSourceRef that will be used to convey font requests from CTFontManager.
    @param      sourceOrder
                The order of the created run loop source.
    @param      createMatchesCallback
                A block to handle the font request.
    @result     A CFRunLoopSourceRef that should be added to the run loop. To stop receiving requests, invalidate this run loop source. Will return NULL on error, in the case of a duplicate requestPortName or invalid context structure.
*/
CTFontManagerCreateFontRequestRunLoopSource :: (sourceOrder: CFIndex, createMatchesCallback: #type (unknown_0: CFDictionaryRef, unknown_1: s32) -> CFArrayRef #c_call) -> CFRunLoopSourceRef #foreign CoreText;
/*!
    @function   CTFontManagerSetAutoActivationSetting
    @abstract   Sets the auto-activation for the specified bundle identifier.
    @param      bundleIdentifier
                The bundle identifier. Used to specify a particular application bundle. If NULL,
                the current application bundle will be used. If kCTFontManagerBundleIdentifier is specified,
                will set the global auto-activation settings.
    @param      setting
                The new setting.
    @discussion Function will apply the setting to the appropriate preferences location.
*/
CTFontManagerSetAutoActivationSetting :: (bundleIdentifier: CFStringRef, setting: CTFontManagerAutoActivationSetting) -> void #foreign CoreText;
/*!
    @function   CTFontManagerGetAutoActivationSetting
    @abstract   Accessor for the auto-activation setting.
    @param      bundleIdentifier
                The bundle identifier. Used to specify a particular application bundle. If NULL,
                the current application bundle will be used. If kCTFontManagerBundleIdentifier is specified,
                will set the global auto-activation settings.
    @result     Will return the auto-activation setting for specified bundle identifier.
*/
CTFontManagerGetAutoActivationSetting :: (bundleIdentifier: CFStringRef) -> CTFontManagerAutoActivationSetting #foreign CoreText;
/*!
    @function   CTFrameGetTypeID
    @abstract   Returns the CFType of the frame object
*/
CTFrameGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTFrameGetStringRange
    @abstract   Returns the range of characters that were originally requested
                to fill the frame.

    @param      frame
                The frame that you want to get the character range from.

    @result     This function will return a CFRange containing the backing
                store range of characters that were originally requested
                to fill the frame. If the function call is not successful,
                then an empty range will be returned.
*/
CTFrameGetStringRange :: (frame: CTFrameRef) -> CFRange #foreign CoreText;
/*!
    @function   CTFrameGetVisibleStringRange
    @abstract   Returns the range of characters that actually fit in the
                frame.

    @discussion This can be used to chain frames, as it returns the range of
                characters that can be seen in the frame. The next frame would
                start where this frame ends.

    @param      frame
                The frame that you want to get the visible character range
                from.

    @result     This function will return a CFRange containing the backing
                store range of characters that fit into the frame. If the
                function call is not successful, or if no characters fit
                in the frame, then an empty range will be returned.
*/
CTFrameGetVisibleStringRange :: (frame: CTFrameRef) -> CFRange #foreign CoreText;
/*!
    @function   CTFrameGetPath
    @abstract   Returns the path used to create the frame.

    @param      frame
                The frame that you want to obtain the path from.
*/
CTFrameGetPath :: (frame: CTFrameRef) -> CGPathRef #foreign CoreText;
/*!
    @function   CTFrameGetFrameAttributes
    @abstract   Returns the frame attributes used to create the frame.

    @discussion It is possible to create a frame with an attributes dictionary
                in order to control various aspects of the framing process.
                These attributes are different from the ones that are used to
                create an attributed string.

    @param      frame
                The frame that you want to obtain the frame attributes from.

    @result     This function will return a CFDictionary containing the
                frame attributes that were used to create the frame. If the
                frame was created without any frame attributes, this function
                will return NULL.
*/
CTFrameGetFrameAttributes :: (frame: CTFrameRef) -> CFDictionaryRef #foreign CoreText;
/*!
    @function   CTFrameGetLines
    @abstract   Returns an array of lines that make up the frame.

    @discussion This function will return an array of CTLine objects that are
                stored in the frame. These line objects can be accessed and
                manipulated in any way that normal line objects can be. It is
                possible that an empty frame exists. That is, a frame in which
                no lines exist. In this case, the returned array will have 0
                entries.

    @param      frame
                The frame that you want to obtain the line array from.

    @result     This function will return a CFArray object containing the
                CTLine objects that make up the frame.
*/
CTFrameGetLines :: (frame: CTFrameRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTFrameGetLineOrigins
    @abstract   Copies a range of line origins for a frame.

    @discussion This function will copy a range of CGPoint structures. Each
                CGPoint is the origin of the corresponding line in the array of
                lines returned by CTFrameGetLines, relative to the origin of the
                frame's path. The maximum number of line origins returned by
                this function is the count of the array of lines.

    @param      frame
                The frame that you want to obtain the line origin array from.

    @param      range
                The range of line origins you wish to copy. If the length of the
                range is set to 0, then the copy operation will continue from
                the range's start index to the last line origin.

    @param      origins
                The buffer to which the origins will be copied. The buffer must
                have at least as many elements as specified by range's length.
                When using the origins to calculate measurements for a frame's
                contents, remember that line origins do not always correspond to
                line metrics; paragraph style settings can affect line origins,
                for one. The overall typographic bounds of a frame may generally
                be calculated as the difference between the top of the frame and
                the descent of the last line. This will obviously exclude any
                spacing following the last line, but such spacing has no effect
                on framesetting in the first place.
*/
CTFrameGetLineOrigins :: (frame: CTFrameRef, range: CFRange, origins: *CGPoint) -> void #foreign CoreText;
/*!
    @function   CTFrameDraw
    @abstract   Draws an entire frame to a context.

    @discussion This function will draw an entire frame to the context. Note
                that this call may leave the context in any state and does not
                flush it after the draw operation.

    @param      frame
                The frame that you want to draw.

    @param      context
                The context to draw the frame to.

    @discussion If both the frame and the context are valid, the frame will be
                drawn in the context.
*/
CTFrameDraw :: (frame: CTFrameRef, ctx: CGContextRef) -> void #foreign CoreText;
/*!
    @function   CTLineGetTypeID
    @abstract   Returns the CFType of the line object
*/
CTLineGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTLineCreateWithAttributedString
    @abstract   Creates a single immutable line object directly from an
                attributed string.

    @discussion This will allow clients who need very simple line generation to
                create a line without needing to create a typesetter object. The
                typesetting will be done under the hood. Without a typesetter
                object, the line cannot be properly broken. However, for simple
                things like text labels and other things, this is not an issue.

    @param      attrString
                The attributed string which the line will be created for.

    @result     This function will return a reference to a CTLine object.
*/
CTLineCreateWithAttributedString :: (attrString: CFAttributedStringRef) -> CTLineRef #foreign CoreText;
/*!
    @function   CTLineCreateTruncatedLine
    @abstract   Creates a truncated line from an existing line.

    @param      line
                The line that you want to create a truncated line for.

    @param      width
                The width at which truncation will begin. The line will be
                truncated if its width is greater than the width passed in this.

    @param      truncationType
                The type of truncation to perform if needed.

    @param      truncationToken
                This token will be added to the point where truncation took place
                to indicate that the line was truncated. Usually, the truncation
                token is the ellipsis character (U+2026). If this parameter is
                set to NULL, then no truncation token is used, and the line is
                simply cut off. The line specified in truncationToken should have
                a width less than the width specified by the width parameter. If
                the width of the line specified in truncationToken is greater,
                this function will return NULL if truncation is needed.

    @result     This function will return a reference to a truncated CTLine
                object if the call was successful. Otherwise, it will return
                NULL.
*/
CTLineCreateTruncatedLine :: (line: CTLineRef, width: float64, truncationType: CTLineTruncationType, truncationToken: CTLineRef) -> CTLineRef #foreign CoreText;
/*!
    @function   CTLineCreateJustifiedLine
    @abstract   Creates a justified line from an existing line.

    @param      line
                The line that you want to create a justified line for.

    @param      justificationFactor
                Allows for full or partial justification. When set to 1.0 or
                greater indicates, full justification will be performed. If less
                than 1.0, varying degrees of partial justification will be
                performed. If set to 0 or less, then no justification will be
                performed.

    @param      justificationWidth
                The width to which the resultant line will be justified. If
                justificationWidth is less than the actual width of the line,
                then negative justification will be performed ("text squishing").

    @result     This function will return a reference to a justified CTLine
                object if the call was successful. Otherwise, it will return
                NULL.
*/
CTLineCreateJustifiedLine :: (line: CTLineRef, justificationFactor: CGFloat, justificationWidth: float64) -> CTLineRef #foreign CoreText;
/*!
    @function   CTLineGetGlyphCount
    @abstract   Returns the total glyph count for the line object.

    @discussion The total glyph count is equal to the sum of all of the glyphs in
                the glyph runs forming the line.

    @param      line
                The line that you want to obtain the glyph count for.

    @result     The total glyph count for the line passed in.
*/
CTLineGetGlyphCount :: (line: CTLineRef) -> CFIndex #foreign CoreText;
/*!
    @function   CTLineGetGlyphRuns
    @abstract   Returns the array of glyph runs that make up the line object.

    @param      line
                The line that you want to obtain the glyph run array for.

    @result     A CFArrayRef containing the CTRun objects that make up the line.
*/
CTLineGetGlyphRuns :: (line: CTLineRef) -> CFArrayRef #foreign CoreText;
/*!
    @function   CTLineGetStringRange
    @abstract   Gets the range of characters that originally spawned the glyphs
                in the line.

    @param      line
                The line that you want to obtain the string range from.

    @result     A CFRange that contains the range over the backing store string
                that spawned the glyphs. If the function fails for any reason, an
                empty range will be returned.
*/
CTLineGetStringRange :: (line: CTLineRef) -> CFRange #foreign CoreText;
/*!
    @function   CTLineGetPenOffsetForFlush
    @abstract   Gets the pen offset required to draw flush text.

    @param      line
                The line that you want to obtain a flush position from.

    @param      flushFactor
                Specifies what kind of flushness you want. A flushFactor of 0 or
                less indicates left flush. A flushFactor of 1.0 or more indicates
                right flush. Flush factors between 0 and 1.0 indicate varying
                degrees of center flush, with a value of 0.5 being totally center
                flush.

    @param      flushWidth
                Specifies the width that the flushness operation should apply to.

    @result     A value which can be used to offset the current pen position for
                the flush operation.
*/
CTLineGetPenOffsetForFlush :: (line: CTLineRef, flushFactor: CGFloat, flushWidth: float64) -> float64 #foreign CoreText;
/*!
    @function   CTLineDraw
    @abstract   Draws a line.

    @discussion This is a convenience call, since the line could be drawn
                run-by-run by getting the glyph runs and accessing the glyphs out
                of them. This call may leave the graphics context in any state and
                does not flush the context after drawing. This call also expects
                a text matrix with `y` values increasing from bottom to top; a
                flipped text matrix may result in misplaced diacritics.

    @param      line
                The line that you want to draw.

    @param      context
                The context to which the line will be drawn.
*/
CTLineDraw :: (line: CTLineRef, ctx: CGContextRef) -> void #foreign CoreText;
/*!
    @function   CTLineGetTypographicBounds
    @abstract   Calculates the typographic bounds for a line.

    @discussion A line's typographic width is the distance to the rightmost
                glyph advance width edge. Note that this distance includes
                trailing whitespace glyphs.

    @param      line
                The line that you want to calculate the typographic bounds for.

    @param      ascent
                Upon return, this parameter will contain the ascent of the line.
                This may be set to NULL if not needed.

    @param      descent
                Upon return, this parameter will contain the descent of the line.
                This may be set to NULL if not needed.

    @param      leading
                Upon return, this parameter will contain the leading of the line.
                This may be set to NULL if not needed.

    @result     The typographic width of the line. If line is invalid, this
                function will always return zero.

    @seealso    CTLineGetTrailingWhitespaceWidth
*/
CTLineGetTypographicBounds :: (line: CTLineRef, ascent: *CGFloat, descent: *CGFloat, leading: *CGFloat) -> float64 #foreign CoreText;
/*!
    @function   CTLineGetBoundsWithOptions
    @abstract   Calculates the bounds for a line.

    @param      line
                The line that you want to calculate the bounds for.

    @param      options
                Desired options or 0 if none.

    @result     The bounds of the line as specified by the type and options,
                such that the coordinate origin is coincident with the line
                origin and the rect origin is at the bottom left. If the line
                is invalid this function will return CGRectNull.
*/
CTLineGetBoundsWithOptions :: (line: CTLineRef, options: CTLineBoundsOptions) -> CGRect #foreign CoreText;
/*!
    @function   CTLineGetTrailingWhitespaceWidth
    @abstract   Calculates the trailing whitespace width for a line.

    @param      line
                The line that you want to calculate the trailing whitespace width
                for. Creating a line for a width can result in a line that is
                actually longer than the desired width due to trailing
                whitespace. Normally this is not an issue due to whitespace being
                invisible, but this function may be used to determine what amount
                of a line's width is due to trailing whitespace.

    @result     The width of the line's trailing whitespace. If line is invalid,
                this function will always return zero.
*/
CTLineGetTrailingWhitespaceWidth :: (line: CTLineRef) -> float64 #foreign CoreText;
/*!
    @function   CTLineGetImageBounds
    @abstract   Calculates the image bounds for a line.

    @discussion The image bounds for a line is the union of all non-empty glyph
                bounding rects, each positioned as it would be if drawn using
                CTLineDraw using the current context. Note that the result is
                ideal and does not account for raster coverage due to rendering.
                This function is purely a convenience for using glyphs as an
                image and should not be used for typographic purposes.

    @param      line
                The line that you want to calculate the image bounds for.

    @param      context
                The context which the image bounds will be calculated for or NULL,
                in which case the bounds are relative to CGPointZero.

    @result     A rectangle that tightly encloses the paths of the line's glyphs,
                which will be translated by the supplied context's text position.
                If the line is invalid, CGRectNull will be returned.

    @seealso    CTLineGetTypographicBounds
    @seealso    CTLineGetBoundsWithOptions
    @seealso    CTLineGetPenOffsetForFlush
*/
CTLineGetImageBounds :: (line: CTLineRef, ctx: CGContextRef) -> CGRect #foreign CoreText;
/*!
    @function   CTLineGetStringIndexForPosition
    @abstract   Performs hit testing.

    @discussion This function can be used to determine the string index for a
                mouse click or other event. This string index corresponds to the
                character before which the next character should be inserted.
                This determination is made by analyzing the string from which a
                typesetter was created and the corresponding glyphs as embodied
                by a particular line.

    @param      line
                The line being examined.

    @param      position
                The location of the mouse click relative to the line's origin.

    @result     The string index for the position. Relative to the line's string
                range, this value will be no less than the first string index and
                no greater than one plus the last string index. In the event of
                failure, this function will return kCFNotFound.
*/
CTLineGetStringIndexForPosition :: (line: CTLineRef, position: CGPoint) -> CFIndex #foreign CoreText;
/*!
    @function   CTLineGetOffsetForStringIndex
    @abstract   Determines the graphical offset(s) for a string index.

    @discussion This function returns the graphical offset(s) corresponding to
                a string index, suitable for movement between adjacent lines or
                for drawing a custom caret. For the former, the primary offset
                may be adjusted for any relative indentation of the two lines;
                a CGPoint constructed with the adjusted offset for its x value
                and 0.0 for its y value is suitable for passing to
                CTLineGetStringIndexForPosition. In either case, the primary
                offset corresponds to the portion of the caret that represents
                the visual insertion location for a character whose direction
                matches the line's writing direction.

    @param      line
                The line from which the offset is requested.

    @param      charIndex
                The string index corresponding to the desired position.

    @param      secondaryOffset
                An output parameter that will be set to the secondary offset
                along the baseline for charIndex. When a single caret is
                sufficient for a string index, this value will be the same as
                the primary offset, which is the return value of this function.
                This parameter may be NULL.

    @result     The primary offset along the baseline for charIndex, or 0.0 in
                the event of failure.
*/
CTLineGetOffsetForStringIndex :: (line: CTLineRef, charIndex: CFIndex, secondaryOffset: *CGFloat) -> CGFloat #foreign CoreText;
/*!
    @function   CTLineEnumerateCaretOffsets
    @abstract   Enumerates caret offsets for characters in a line.

    @discussion The provided block is invoked once for each logical caret edge in the line, in left-to-right visual order.

    @param      block
                The offset parameter is relative to the line origin. The leadingEdge parameter of this block refers to logical order.
*/
CTLineEnumerateCaretOffsets :: (line: CTLineRef, block: #type (unknown_0: float64, unknown_1: CFIndex, unknown_2: bool, unknown_3: *bool) -> void #c_call) -> void #foreign CoreText;
/*!
    @function   CTTypesetterGetTypeID
    @abstract   Returns the CFType of the typesetter object
*/
CTTypesetterGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTTypesetterCreateWithAttributedString
    @abstract   Creates an immutable typesetter object using an attributed
                string.

    @discussion The resultant typesetter can be used to create lines, perform
                line breaking, and do other contextual analysis based on the
                characters in the string.

    @param      string
                The CFAttributedStringRef that you want to typeset. This
                parameter must be filled in with a valid CFAttributedString.

    @result     This function will return a reference to a CTTypesetter.
*/
CTTypesetterCreateWithAttributedString :: (str: CFAttributedStringRef) -> CTTypesetterRef #foreign CoreText;
/*!
    @function   CTTypesetterCreateWithAttributedStringAndOptions
    @abstract   Creates an immutable typesetter object using an attributed
                string and a dictionary of options.

    @discussion The resultant typesetter can be used to create lines, perform
                line breaking, and do other contextual analysis based on the
                characters in the string.

    @param      string
                The CFAttributedStringRef that you want to typeset. This
                parameter must be filled in with a valid CFAttributedString.

    @param      options
                A CFDictionary of typesetter options, or NULL if there are none.

    @result     This function will return either a reference to a CTTypesetter
                or NULL if layout cannot be performed due to an attributed
                string that would require unreasonable effort.

    @seealso    kCTTypesetterOptionAllowUnboundedLayout
*/
CTTypesetterCreateWithAttributedStringAndOptions :: (str: CFAttributedStringRef, options: CFDictionaryRef) -> CTTypesetterRef #foreign CoreText;
/*!
    @function   CTTypesetterCreateLineWithOffset
    @abstract   Creates an immutable line from the typesetter.

    @discussion The resultant line will consist of glyphs in the correct visual
                order, ready to draw.

    @param      typesetter
                The typesetter which the line will come from.

    @param      stringRange
                The string range which the line will be based on. If the length
                portion of range is set to 0, then the typesetter will continue
                to add glyphs to the line until it runs out of characters in the
                string. The location and length of the range must be within the
                bounds of the string, otherwise the call will fail.

    @param      offset
                The line position offset.

    @result     This function will return a reference to a CTLine.
*/
CTTypesetterCreateLineWithOffset :: (typesetter: CTTypesetterRef, stringRange: CFRange, offset: float64) -> CTLineRef #foreign CoreText;
/*!
    @function   CTTypesetterCreateLine
    @abstract   Equivalent to CTTypesetterCreateLineWithOffset with offset = 0.0.
*/
CTTypesetterCreateLine :: (typesetter: CTTypesetterRef, stringRange: CFRange) -> CTLineRef #foreign CoreText;
/*!
    @function   CTTypesetterSuggestLineBreakWithOffset
    @abstract   Suggests a contextual line break point based on the width
                provided.

    @discussion The line break can be triggered either by a hard break character
                in the stream or by filling the specified width with characters.

    @param      typesetter
                The typesetter which the line will come from.

    @param      startIndex
                The starting point for the line break calculations. The break
                calculations will include the character starting at startIndex.

    @param      width
                The requested line break width.

    @param      offset
                The line position offset.

    @result     The value returned is a count of the characters from startIndex
                that would cause the line break. This value returned can be used
                to construct a character range for CTTypesetterCreateLine.
*/
CTTypesetterSuggestLineBreakWithOffset :: (typesetter: CTTypesetterRef, startIndex: CFIndex, width: float64, offset: float64) -> CFIndex #foreign CoreText;
/*!
    @function   CTTypesetterSuggestLineBreak
    @abstract   Equivalent to CTTypesetterSuggestLineBreakWithOffset with offset = 0.0.
*/
CTTypesetterSuggestLineBreak :: (typesetter: CTTypesetterRef, startIndex: CFIndex, width: float64) -> CFIndex #foreign CoreText;
/*!
    @function   CTTypesetterSuggestClusterBreakWithOffset
    @abstract   Suggests a cluster line break point based on the width provided.

    @discussion Suggests a typographic cluster line break point based on the width
                provided. This cluster break is similar to a character break,
                except that it will not break apart linguistic clusters. No other
                contextual analysis will be done. This can be used by the caller
                to implement a different line breaking scheme, such as
                hyphenation. Note that a typographic cluster break can also be
                triggered by a hard break character in the stream.

    @param      typesetter
                The typesetter which the line will come from.

    @param      startIndex
                The starting point for the typographic cluster break
                calculations. The break calculations will include the character
                starting at startIndex.

    @param      width
                The requested typographic cluster break width.

    @param      offset
                The line position offset.

    @result     The value returned is a count of the characters from startIndex
                that would cause the cluster break. This value returned can be
                used to construct a character range for CTTypesetterCreateLine.
*/
CTTypesetterSuggestClusterBreakWithOffset :: (typesetter: CTTypesetterRef, startIndex: CFIndex, width: float64, offset: float64) -> CFIndex #foreign CoreText;
/*!
    @function   CTTypesetterSuggestClusterBreak
    @abstract   Equivalent to CTTypesetterSuggestClusterBreakWithOffset with offset = 0.0.
*/
CTTypesetterSuggestClusterBreak :: (typesetter: CTTypesetterRef, startIndex: CFIndex, width: float64) -> CFIndex #foreign CoreText;
/*!
    @function   CTFramesetterGetTypeID
    @abstract   Returns the CFType of the framesetter object
*/
CTFramesetterGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTFramesetterCreateWithTypesetter
    @abstract   Creates a framesetter directly from a typesetter.

    @discussion Each framesetter uses a typesetter internally to perform
                line breaking and other contextual analysis based on the
                characters in a string. This function allows use of a
                typesetter that was constructed using specific options.

    @param      typesetter
                The typesetter to be used by the newly-created framesetter.

    @result     This function will return a reference to a CTFramesetter object.

    @seealso    CTTypesetterCreateWithAttributedStringAndOptions
*/
CTFramesetterCreateWithTypesetter :: (typesetter: CTTypesetterRef) -> CTFramesetterRef #foreign CoreText;
/*!
    @function   CTFramesetterCreateWithAttributedString
    @abstract   Creates an immutable framesetter object from an attributed
                string.

    @discussion The resultant framesetter object can be used to create and
                fill text frames with the CTFramesetterCreateFrame call.

    @param      attrString
                The attributed string to construct the framesetter with.

    @result     This function will return a reference to a CTFramesetter object.
*/
CTFramesetterCreateWithAttributedString :: (attrString: CFAttributedStringRef) -> CTFramesetterRef #foreign CoreText;
/*!
    @function   CTFramesetterCreateFrame
    @abstract   Creates an immutable frame from a framesetter.

    @discussion This call will create a frame full of glyphs in the shape of
                the path provided by the "path" parameter. The framesetter
                will continue to fill the frame until it either runs out of
                text or it finds that text no longer fits.

    @param      framesetter
                The framesetter that will be used to create the frame.

    @param      stringRange
                The string range which the new frame will be based on. The
                string range is a range over the string that was used to
                create the framesetter. If the length portion of the range
                is set to 0, then the framesetter will continue to add lines
                until it runs out of text or space.

    @param      path
                A CGPath object that specifies the shape which the frame will
                take on.

    @param      frameAttributes
                Additional attributes that control the frame filling process
                can be specified here, or NULL if there are no such attributes.
                See CTFrame.h for available attributes.

    @result     This function will return a reference to a new CTFrame object.
*/
CTFramesetterCreateFrame :: (framesetter: CTFramesetterRef, stringRange: CFRange, path: CGPathRef, frameAttributes: CFDictionaryRef) -> CTFrameRef #foreign CoreText;
/*!
    @function   CTFramesetterGetTypesetter
    @abstract   Returns the typesetter object being used by the framesetter.

    @discussion Each framesetter uses a typesetter internally to perform
                line breaking and other contextual analysis based on the
                characters in a string; this function returns the typesetter
                being used by a particular framesetter if the caller would
                like to perform other operations on that typesetter.

    @param      framesetter
                The framesetter from which a typesetter is being requested.

    @result     This function will return a reference to a CTTypesetter
                object, which should not be released by the caller.
*/
CTFramesetterGetTypesetter :: (framesetter: CTFramesetterRef) -> CTTypesetterRef #foreign CoreText;
/*!
    @function   CTFramesetterSuggestFrameSizeWithConstraints
    @abstract   Determines the frame size needed for a string range.

    @discussion This function may be used to determine how much space is needed
                to display a string, optionally by constraining the space along
                either dimension.

    @param      framesetter
                The framesetter that will be used for measuring the frame size.

    @param      stringRange
                The string range to which the frame size will apply. The
                string range is a range over the string that was used to
                create the framesetter. If the length portion of the range
                is set to 0, then the framesetter will continue to add lines
                until it runs out of text or space.

    @param      frameAttributes
                Additional attributes that control the frame filling process
                can be specified here, or NULL if there are no such attributes.

    @param      constraints
                The width and height to which the frame size will be constrained,
                A value of CGFLOAT_MAX for either dimension indicates that it
                should be treated as unconstrained.

    @param      fitRange
                The range of the string that actually fit in the constrained size.

    @result     The actual dimensions for the given string range and constraints.
*/
CTFramesetterSuggestFrameSizeWithConstraints :: (framesetter: CTFramesetterRef, stringRange: CFRange, frameAttributes: CFDictionaryRef, constraints: CGSize, fitRange: *CFRange) -> CGSize #foreign CoreText;
/*!
    @function   CTGlyphInfoGetTypeID
    @abstract   Returns the CFType of the glyph info object
*/
CTGlyphInfoGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTGlyphInfoCreateWithGlyphName
    @abstract   Creates an immutable glyph info object.

    @discussion This function creates an immutable glyph info object for a glyph
                name such as "copyright" and a specified font.

    @param      glyphName
                The name of the glyph.

    @param      font
                The font to be associated with the returned CTGlyphInfo object.

    @param      baseString
                The part of the string the returned object is intended
                to override.

    @result     This function will return a reference to a CTGlyphInfo object.
*/
CTGlyphInfoCreateWithGlyphName :: (glyphName: CFStringRef, font: CTFontRef, baseString: CFStringRef) -> CTGlyphInfoRef #foreign CoreText;
/*!
    @function   CTGlyphInfoCreateWithGlyph
    @abstract   Creates an immutable glyph info object.

    @discussion This function creates an immutable glyph info object for a glyph
                index and a specified font.

    @param      glyph
                The glyph identifier.

    @param      font
                The font to be associated with the returned CTGlyphInfo object.

    @param      baseString
                The part of the string the returned object is intended
                to override.

    @result     This function will return a reference to a CTGlyphInfo object.
*/
CTGlyphInfoCreateWithGlyph :: (glyph: CGGlyph, font: CTFontRef, baseString: CFStringRef) -> CTGlyphInfoRef #foreign CoreText;
/*!
    @function   CTGlyphInfoCreateWithCharacterIdentifier
    @abstract   Creates an immutable glyph info object.

    @discussion This function creates an immutable glyph info object for a
                character identifier and a character collection.

    @param      cid
                A character identifier.

    @param      collection
                A character collection identifier.

    @param      baseString
                The part of the string the returned object is intended
                to override.

    @result     This function will return a reference to a CTGlyphInfo object.
*/
CTGlyphInfoCreateWithCharacterIdentifier :: (cid: CGFontIndex, collection: CTCharacterCollection, baseString: CFStringRef) -> CTGlyphInfoRef #foreign CoreText;
/*!
    @function   CTGlyphInfoGetGlyphName
    @abstract   Gets the glyph name for a glyph info, if applicable.

    @discussion This function will return the glyph name.

    @param      glyphInfo
                The glyph info for which you would like the glyph name.

    @result     If the glyph info object was created with a glyph name, it will
                be returned. Otherwise, this function will return NULL.
*/
CTGlyphInfoGetGlyphName :: (glyphInfo: CTGlyphInfoRef) -> CFStringRef #foreign CoreText;
/*!
    @function   CTGlyphInfoGetGlyph
    @abstract   Gets the glyph for a glyph info, if applicable.

    @discussion This function will return the glyph.

    @param      glyphInfo
                The glyph info from which you would like the glyph.

    @result     If the glyph info object was created with a font, it will be
                returned. Otherwise, this function will return 0.
*/
CTGlyphInfoGetGlyph :: (glyphInfo: CTGlyphInfoRef) -> CGGlyph #foreign CoreText;
/*!
    @function   CTGlyphInfoGetCharacterIdentifier
    @abstract   Gets the character identifier for a glyph info.

    @discussion This function will return the character identifier.

    @param      glyphInfo
                The glyph info for which you would like the character identifier.

    @result     If the glyph info object was created with a character identifier,
                it will be returned. Otherwise, this function will return 0.
*/
CTGlyphInfoGetCharacterIdentifier :: (glyphInfo: CTGlyphInfoRef) -> CGFontIndex #foreign CoreText;
/*!
    @function   CTGlyphInfoGetCharacterCollection
    @abstract   Gets the character collection for a glyph info.

    @discussion This function will return the character collection. If the glyph
                info object was created with a glyph name or a glyph index, its
                character collection will be
                kCTIdentityMappingCharacterCollection.

    @param      glyphInfo
                The glyph info for which you would like the character collection.

    @result     This function will return the character collection of the given
                glyph info.
*/
CTGlyphInfoGetCharacterCollection :: (glyphInfo: CTGlyphInfoRef) -> CTCharacterCollection #foreign CoreText;
/*!
    @function   CTParagraphStyleGetTypeID
    @abstract   Returns the CFType of the paragraph style object
*/
CTParagraphStyleGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTParagraphStyleCreate
    @abstract   Creates an immutable paragraph style.

    @discussion Using this function is the easiest and most efficient way to
                create a paragraph style. Paragraph styles should be kept
                immutable for totally lock-free operation.

                If an invalid paragraph style setting specifier is passed into
                the "settings" parameter, nothing bad will happen but just don't
                expect to be able to query for this value. This is to allow
                backwards compatibility with style setting specifiers that may
                be introduced in future versions.

    @param      settings
                The settings that you wish to pre-load the paragraph style
                with. If you wish to specify the default set of settings,
                then this parameter may be set to NULL.

    @param      settingCount
                The number of settings that you have specified in the
                "settings" parameter. This must be greater than or equal
                to zero.

    @result     If the paragraph style creation was successful, this function
                will return a valid reference to an immutable CTParagraphStyle
                object. Otherwise, this function will return NULL.
*/
CTParagraphStyleCreate :: (settings: *CTParagraphStyleSetting, settingCount: u64) -> CTParagraphStyleRef #foreign CoreText;
/*!
    @function   CTParagraphStyleCreateCopy
    @abstract   Creates an immutable copy of a paragraph style.

    @param      paragraphStyle
                The style that you wish to copy.

    @result     If the "paragraphStyle" reference is valid, then this
                function will return valid reference to an immutable
                CTParagraphStyle object that is a copy of the one passed into
                "paragraphStyle".
*/
CTParagraphStyleCreateCopy :: (paragraphStyle: CTParagraphStyleRef) -> CTParagraphStyleRef #foreign CoreText;
/*!
    @function   CTParagraphStyleGetValueForSpecifier
    @abstract   Obtains the current value for a single setting specifier.

    @discussion This function will return the current value of the specifier
                whether or not the user had actually set it. If the user has
                not set it, this function will return the default value.

                If an invalid paragraph style setting specifier is passed into
                the "spec" parameter, nothing bad will happen and the buffer
                value will simply be zeroed out. This is to allow backwards
                compatibility with style setting specifier that may be introduced
                in future versions.

    @param      paragraphStyle
                The paragraph style that you wish to get the value from.

    @param      spec
                The setting specifier that you want to get the value for.

    @param      valueBufferSize
                The size of the buffer pointed to by the "valueBuffer" parameter.
                This value must be at least as large as the size the required by
                the CTParagraphSpecifier value set in the "spec" parameter.

    @param      valueBuffer
                The buffer where the requested setting value will be written
                upon successful completion. The buffer's size needs to be at least
                as large as the value passed into "valueBufferSize".

    @result     This function will return "true" if the valueBuffer had been
                successfully filled. Otherwise, this function will return false,
                indicating that one or more of the parameters is not valid.
*/
CTParagraphStyleGetValueForSpecifier :: () -> s32 #foreign CoreText;
/*!
    @function	CTRubyAnnotationGetTypeID
    @abstract	Returns the CFType of the ruby annotation object
*/
CTRubyAnnotationGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTRubyAnnotationCreate
    @abstract   Creates an immutable ruby annotation object.

    @discussion Using this function is the easiest and most efficient way to
                create a ruby annotation object.

    @param      alignment
                Specifies how the ruby text and the base text should be aligned relative to each other.

    @param      overhang
                Specifies how the ruby text can overhang adjacent characters.

    @param		sizeFactor
                Specifies the size of the annotation text as a percent of the size of the base text.

    @param      text
                An array of CFStringRef, indexed by CTRubyPosition. Supply NULL for any unused positions.

    @result     This function will return a reference to a CTRubyAnnotation object.
*/
CTRubyAnnotationCreate :: (alignment: CTRubyAlignment, overhang: CTRubyOverhang, sizeFactor: CGFloat, text: *CFStringRef) -> CTRubyAnnotationRef #foreign CoreText;
/*!
    @function   CTRubyAnnotationCreateWithAttributes
    @abstract   Creates an immutable ruby annotation object.

    @discussion Using this function to create a ruby annotation object with more precise
                control of the annotation text.

    @param      alignment
                Specifies how the ruby text and the base text should be aligned relative to each other.

    @param      overhang
                Specifies how the ruby text can overhang adjacent characters.

    @param      position
                The position of the annotation text.

    @param      string
                A string without any formatting, its format will be derived from the attrs specified below.

    @param      attributes
                A attribute dictionary to combine with the string specified above. If you don't specify
                kCTFontAttributeName, the font used by the Ruby annotation will be deduced from the base
                text, with a size factor specified by a CFNumberRef value keyed by
                kCTRubyAnnotationSizeFactorAttributeName.

    @result     This function will return a reference to a CTRubyAnnotation object.
*/
CTRubyAnnotationCreateWithAttributes :: (alignment: CTRubyAlignment, overhang: CTRubyOverhang, position: CTRubyPosition, str: CFStringRef, attributes: CFDictionaryRef) -> CTRubyAnnotationRef #foreign CoreText;
/*!
    @function   CTRubyAnnotationCreateCopy
    @abstract   Creates an immutable copy of a ruby annotation object.

    @param      rubyAnnotation
                The ruby annotation that you wish to copy.

    @result     If the "rubyAnnotation" reference is valid, then this
                function will return valid reference to an immutable
                CTRubyAnnotation object that is a copy of the one passed into
                "rubyAnnotation".
*/
CTRubyAnnotationCreateCopy :: (rubyAnnotation: CTRubyAnnotationRef) -> CTRubyAnnotationRef #foreign CoreText;
/*!
    @function   CTRubyAnnotationGetAlignment
    @abstract   Get the alignment value of a ruby annotation object.

    @param      rubyAnnotation
                The ruby annotation object.

    @result     If the "rubyAnnotation" reference is valid, then this
                function will return its alignment. Otherwise it will return kCTRubyAlignmentInvalid.
*/
CTRubyAnnotationGetAlignment :: (rubyAnnotation: CTRubyAnnotationRef) -> CTRubyAlignment #foreign CoreText;
/*!
    @function   CTRubyAnnotationGetOverhang
    @abstract   Get the overhang value of a ruby annotation object.

    @param      rubyAnnotation
                The ruby annotation object.

    @result     If the "rubyAnnotation" reference is valid, then this
                function will return its overhang value. Otherwise it will return kCTRubyOverhangInvalid.
*/
CTRubyAnnotationGetOverhang :: (rubyAnnotation: CTRubyAnnotationRef) -> CTRubyOverhang #foreign CoreText;
/*!
    @function   CTRubyAnnotationGetSizeFactor
    @abstract   Get the size factor of a ruby annotation object.

    @param      rubyAnnotation
                The ruby annotation object.

    @result     If the "rubyAnnotation" reference is valid, then this
                function will return its sizeFactor. Otherwise it will return 0.
*/
CTRubyAnnotationGetSizeFactor :: (rubyAnnotation: CTRubyAnnotationRef) -> CGFloat #foreign CoreText;
/*!
    @function   CTRubyAnnotationGetTextForPosition
    @abstract   Get the ruby text for a particular position in a ruby annotation.

    @param      rubyAnnotation
                The ruby annotation object.

    @param      position
                The position for which you want to get the ruby text.

    @result     If the "rubyAnnotation" reference and the position are valid, then this
                function will return a CFStringRef for the text. Otherwise it will return NULL.
*/
CTRubyAnnotationGetTextForPosition :: (rubyAnnotation: CTRubyAnnotationRef, position: CTRubyPosition) -> CFStringRef #foreign CoreText;
/*!
    @function   CTRunGetTypeID
    @abstract   Returns the CFType of the run object
*/
CTRunGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTRunGetGlyphCount
    @abstract   Gets the glyph count for the run.

    @param      run
                The run whose glyph count you wish to access.

    @result     The number of glyphs that the run contains. It is totally
                possible that this function could return a value of zero,
                indicating that there are no glyphs in this run.
*/
CTRunGetGlyphCount :: (run: CTRunRef) -> CFIndex #foreign CoreText;
/*!
    @function   CTRunGetAttributes
    @abstract   Returns the attribute dictionary that was used to create the
                glyph run.

    @discussion This dictionary returned is either the same exact one that was
                set as an attribute dictionary on the original attributed string
                or a dictionary that has been manufactured by the layout engine.
                Attribute dictionaries can be manufactured in the case of font
                substitution or if they are missing critical attributes.

    @param      run
                The run whose attributes you wish to access.

    @result     The attribute dictionary.
*/
CTRunGetAttributes :: (run: CTRunRef) -> CFDictionaryRef #foreign CoreText;
/*!
    @function   CTRunGetStatus
    @abstract   Returns the run's status.

    @discussion In addition to attributes, runs also have status that can be
                used to expedite certain operations. Knowing the direction and
                ordering of a run's glyphs can aid in string index analysis,
                whereas knowing whether the positions reference the identity
                text matrix can avoid expensive comparisons. Note that this
                status is provided as a convenience, since this information is
                not strictly necessary but can certainly be helpful.

    @param      run
                The run whose status you wish to access.

    @result     The run's status.
*/
CTRunGetStatus :: (run: CTRunRef) -> CTRunStatus #foreign CoreText;
/*!
    @function   CTRunGetGlyphsPtr
    @abstract   Returns a direct pointer for the glyph array stored in the run.

    @discussion The glyph array will have a length equal to the value returned by
                CTRunGetGlyphCount. The caller should be prepared for this
                function to return NULL even if there are glyphs in the stream.
                Should this function return NULL, the caller will need to
                allocate their own buffer and call CTRunGetGlyphs to fetch the
                glyphs.

    @param      run
                The run whose glyphs you wish to access.

    @result     A valid pointer to an array of CGGlyph structures or NULL.
*/
CTRunGetGlyphsPtr :: (run: CTRunRef) -> *CGGlyph #foreign CoreText;
/*!
    @function   CTRunGetGlyphs
    @abstract   Copies a range of glyphs into user-provided buffer.

    @param      run
                The run whose glyphs you wish to copy.

    @param      range
                The range of glyphs to be copied, with the entire range having a
                location of 0 and a length of CTRunGetGlyphCount. If the length
                of the range is set to 0, then the operation will continue from
                the range's start index to the end of the run.

    @param      buffer
                The buffer where the glyphs will be copied to. The buffer must be
                allocated to at least the value specified by the range's length.
*/
CTRunGetGlyphs :: (run: CTRunRef, range: CFRange, buffer: *CGGlyph) -> void #foreign CoreText;
/*!
    @function   CTRunGetPositionsPtr
    @abstract   Returns a direct pointer for the glyph position array stored in
                the run.

    @discussion The glyph positions in a run are relative to the origin of the
                line containing the run. The position array will have a length
                equal to the value returned by CTRunGetGlyphCount. The caller
                should be prepared for this function to return NULL even if there
                are glyphs in the stream. Should this function return NULL, the
                caller will need to allocate their own buffer and call
                CTRunGetPositions to fetch the positions.

    @param      run
                The run whose positions you wish to access.

    @result     A valid pointer to an array of CGPoint structures or NULL.
*/
CTRunGetPositionsPtr :: (run: CTRunRef) -> *CGPoint #foreign CoreText;
/*!
    @function   CTRunGetPositions
    @abstract   Copies a range of glyph positions into a user-provided buffer.

    @discussion The glyph positions in a run are relative to the origin of the
                line containing the run.

    @param      run
                The run whose positions you wish to copy.

    @param      range
                The range of glyph positions to be copied, with the entire range
                having a location of 0 and a length of CTRunGetGlyphCount. If the
                length of the range is set to 0, then the operation will continue
                from the range's start index to the end of the run.

    @param      buffer
                The buffer where the glyph positions will be copied to. The buffer
                must be allocated to at least the value specified by the range's
                length.
*/
CTRunGetPositions :: (run: CTRunRef, range: CFRange, buffer: *CGPoint) -> void #foreign CoreText;
/*!
    @function   CTRunGetAdvancesPtr
    @abstract   Returns a direct pointer for the glyph advance array stored in
                the run.

    @discussion The advance array will have a length equal to the value returned
                by CTRunGetGlyphCount. The caller should be prepared for this
                function to return NULL even if there are glyphs in the stream.
                Should this function return NULL, the caller will need to
                allocate their own buffer and call CTRunGetAdvances to fetch the
                advances. Note that advances alone are not sufficient for correctly
                positioning glyphs in a line, as a run may have a non-identity
                matrix or the initial glyph in a line may have a non-zero origin;
                callers should consider using positions instead.

    @param      run
                The run whose advances you wish to access.

    @result     A valid pointer to an array of CGSize structures or NULL.
*/
CTRunGetAdvancesPtr :: (run: CTRunRef) -> *CGSize #foreign CoreText;
/*!
    @function   CTRunGetAdvances
    @abstract   Copies a range of glyph advances into a user-provided buffer.

    @param      run
                The run whose advances you wish to copy.

    @param      range
                The range of glyph advances to be copied, with the entire range
                having a location of 0 and a length of CTRunGetGlyphCount. If the
                length of the range is set to 0, then the operation will continue
                from the range's start index to the end of the run.

    @param      buffer
                The buffer where the glyph advances will be copied to. The buffer
                must be allocated to at least the value specified by the range's
                length.
*/
CTRunGetAdvances :: (run: CTRunRef, range: CFRange, buffer: *CGSize) -> void #foreign CoreText;
/*!
    @function   CTRunGetStringIndicesPtr
    @abstract   Returns a direct pointer for the string indices stored in the run.

    @discussion The indices are the character indices that originally spawned the
                glyphs that make up the run. They can be used to map the glyphs in
                the run back to the characters in the backing store. The string
                indices array will have a length equal to the value returned by
                CTRunGetGlyphCount. The caller should be prepared for this
                function to return NULL even if there are glyphs in the stream.
                Should this function return NULL, the caller will need to allocate
                their own buffer and call CTRunGetStringIndices to fetch the
                indices.

    @param      run
                The run whose string indices you wish to access.

    @result     A valid pointer to an array of CFIndex structures or NULL.
*/
CTRunGetStringIndicesPtr :: (run: CTRunRef) -> *CFIndex #foreign CoreText;
/*!
    @function   CTRunGetStringIndices
    @abstract   Copies a range of string indices into a user-provided buffer.

    @discussion The indices are the character indices that originally spawned the
                glyphs that make up the run. They can be used to map the glyphs
                in the run back to the characters in the backing store.

    @param      run
                The run whose string indices you wish to copy.

    @param      range
                The range of string indices to be copied, with the entire range
                having a location of 0 and a length of CTRunGetGlyphCount. If the
                length of the range is set to 0, then the operation will continue
                from the range's start index to the end of the run.

    @param      buffer
                The buffer where the string indices will be copied to. The buffer
                must be allocated to at least the value specified by the range's
                length.
*/
CTRunGetStringIndices :: (run: CTRunRef, range: CFRange, buffer: *CFIndex) -> void #foreign CoreText;
/*!
    @function   CTRunGetStringRange
    @abstract   Gets the range of characters that originally spawned the glyphs
                in the run.

    @param      run
                The run whose string range you wish to access.

    @result     Returns the range of characters that originally spawned the
                glyphs. If run is invalid, this will return an empty range.
*/
CTRunGetStringRange :: (run: CTRunRef) -> CFRange #foreign CoreText;
/*!
    @function   CTRunGetTypographicBounds
    @abstract   Gets the typographic bounds of the run.

    @param      run
                The run that you want to calculate the typographic bounds for.

    @param      range
                The range of glyphs to be measured, with the entire range having
                a location of 0 and a length of CTRunGetGlyphCount. If the length
                of the range is set to 0, then the operation will continue from
                the range's start index to the end of the run.

    @param      ascent
                Upon return, this parameter will contain the ascent of the run.
                This may be set to NULL if not needed.

    @param      descent
                Upon return, this parameter will contain the descent of the run.
                This may be set to NULL if not needed.

    @param      leading
                Upon return, this parameter will contain the leading of the run.
                This may be set to NULL if not needed.

    @result     The typographic width of the run. If run or range is
                invalid, then this function will always return zero.
*/
CTRunGetTypographicBounds :: (run: CTRunRef, range: CFRange, ascent: *CGFloat, descent: *CGFloat, leading: *CGFloat) -> float64 #foreign CoreText;
/*!
    @function   CTRunGetImageBounds
    @abstract   Calculates the image bounds for a glyph range.

    @discussion The image bounds for a run is the union of all non-empty glyph
                bounding rects, each positioned as it would be if drawn using
                CTRunDraw using the current context (for clients linked against
                macOS High Sierra or iOS 11 and later) or the text position of
                the supplied context (for all others). Note that the result is
                ideal and does not account for raster coverage due to rendering.
                This function is purely a convenience for using glyphs as an
                image and should not be used for typographic purposes.

    @param      run
                The run that you want to calculate the image bounds for.

    @param      context
                The context which the image bounds will be calculated for or NULL,
                in which case the bounds are relative to CGPointZero.

    @param      range
                The range of glyphs to be measured, with the entire range having
                a location of 0 and a length of CTRunGetGlyphCount. If the length
                of the range is set to 0, then the operation will continue from
                the range's start index to the end of the run.

    @result     A rect that tightly encloses the paths of the run's glyphs. The
                rect origin will match the drawn position of the requested range;
                that is, it will be translated by the supplied context's text
                position and the positions of the individual glyphs. If the run
                or range is invalid, CGRectNull will be returned.

    @seealso    CTRunGetTypographicBounds
*/
CTRunGetImageBounds :: (run: CTRunRef, ctx: CGContextRef, range: CFRange) -> CGRect #foreign CoreText;
/*!
    @function   CTRunGetTextMatrix
    @abstract   Returns the text matrix needed to draw this run.

    @discussion To properly draw the glyphs in a run, the fields 'tx' and 'ty' of
                the CGAffineTransform returned by this function should be set to
                the current text position.

    @param      run
                The run object from which to get the text matrix.

    @result     A CGAffineTransform.
*/
CTRunGetTextMatrix :: (run: CTRunRef) -> CGAffineTransform #foreign CoreText;
/*!
    @function   CTRunGetBaseAdvancesAndOrigins
    @abstract   Copies a range of base advances and/or origins into user-provided
                buffers.

    @discussion A run's base advances and origins determine the positions of its
                glyphs but require additional processing before being used for
                drawing. Similar to the advances returned by CTRunGetAdvances,
                base advances are the displacement from the origin of a glyph
                to the origin of the next glyph, except base advances do not
                include any positioning the font layout tables may have done
                relative to another glyph (such as a mark relative to its base).
                The actual position of the current glyph is determined by the
                displacement of its origin from the starting position, and the
                position of the next glyph by the displacement of the current
                glyph's base advance from the starting position.

    @param      runRef
                The run whose base advances and/or origins you wish to copy.

    @param      range
                The range of values to be copied. If the length of the
                range is set to 0, then the copy operation will continue from the
                range's start index to the end of the run.

    @param      advancesBuffer
                The buffer where the base advances will be copied to, or NULL.
                If not NULL, the buffer must allow for at least as many elements
                as specified by the range's length.

    @param      originsBuffer
                The buffer where the origins will be copied to, or NULL. If not
                NULL, the buffer must allow for at least as many elements as
                specified by the range's length.
*/
CTRunGetBaseAdvancesAndOrigins :: (runRef: CTRunRef, range: CFRange, advancesBuffer: *CGSize, originsBuffer: *CGPoint) -> void #foreign CoreText;
/*!
    @function   CTRunDraw
    @abstract   Draws a complete run or part of one.

    @discussion This is a convenience call, since the run could also be drawn by
                accessing its glyphs, positions, and text matrix. Unlike when
                drawing the entire line containing the run with CTLineDraw, the
                run's underline (if any) will not be drawn, since the underline's
                appearance may depend on other runs in the line. This call may
                leave the graphics context in any state and does not flush the
                context after drawing. This call also expects a text matrix with
                `y` values increasing from bottom to top; a flipped text matrix
                may result in misplaced diacritics.

    @param      run
                The run that you want to draw.

    @param      context
                The context to draw the run to.

    @param      range
                The range of glyphs to be drawn, with the entire range having a
                location of 0 and a length of CTRunGetGlyphCount. If the length
                of the range is set to 0, then the operation will continue from
                the range's start index to the end of the run.
*/
CTRunDraw :: (run: CTRunRef, ctx: CGContextRef, range: CFRange) -> void #foreign CoreText;
/*!
    @function   CTRunDelegateGetTypeID
    @abstract   Returns the CFType of CTRunDelegate objects.
*/
CTRunDelegateGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTRunDelegateCreate
    @abstract   Creates an immutable instance of a run delegate.

    @discussion This function creates an immutable instance of a run delegate
                that can be used for reserving space in a line or for eliding the
                glyphs for a range of text altogether. 
                
    @param      callbacks
                The callbacks for this run delegate.
                
    @result     If run delegate creation was successful, this function will
                return a valid reference to an immutable CTRunDelegate
                object. Otherwise, this function will return NULL.
*/
CTRunDelegateCreate :: (callbacks: *CTRunDelegateCallbacks, refCon: *void) -> CTRunDelegateRef #foreign CoreText;
/*!
    @function   CTRunDelegateGetRefCon
    @abstract   Returns a run delegate's refCon value.

    @discussion This function returns the refCon value that a run delegate was
                created with.
                
    @param      runDelegate
                The run delegate to be queried.
                
    @result     The refCon value of the supplied run delegate.
*/
CTRunDelegateGetRefCon :: (runDelegate: CTRunDelegateRef) -> *void #foreign CoreText;
/*!
    @function   CTTypesetterGetTypeID
    @abstract   Returns the CFType of the text tab object
*/
CTTextTabGetTypeID :: () -> CFTypeID #foreign CoreText;
/*!
    @function   CTTextTabCreate
    @abstract   Creates and initializes a new text tab.

    @param      alignment
                The tab's alignment. This is used to determine the position of
                text inside the tab column. This parameter must be set to a valid
                CTTextAlignment value or this function will return NULL.

    @param      location
                The tab's ruler location, relative to the back margin.

    @param      options
                Options to pass in when the tab is created. Currently, the only
                option available is kCTTabColumnTerminatorsAttributeName. This
                parameter is optional and can be set to NULL if not needed.

    @result     The new CTTextTab.
*/
CTTextTabCreate :: (alignment: CTTextAlignment, location: float64, options: CFDictionaryRef) -> CTTextTabRef #foreign CoreText;
/*!
    @function   CTTextTabGetAlignment
    @abstract   Returns the text alignment of the tab.

    @param      tab
                The tab whose text alignment you wish to access.

    @result     The tab's text alignment value.
*/
CTTextTabGetAlignment :: (tab: CTTextTabRef) -> CTTextAlignment #foreign CoreText;
/*!
    @function   CTTextTabGetLocation
    @abstract   Returns the tab's ruler location.

    @param      tab
                The tab whose location you wish to access.

    @result     The tab's ruler location relative to the back margin.
*/
CTTextTabGetLocation :: (tab: CTTextTabRef) -> float64 #foreign CoreText;
/*!
    @function   CTTextTabGetOptions
    @abstract   Returns the dictionary of attributes associated with the tab. 

    @param      tab
                The tab whose attributes you wish to access.

    @result     The dictionary of attributes associated with the tab or NULL if
                no dictionary is present.
*/
CTTextTabGetOptions :: (tab: CTTextTabRef) -> CFDictionaryRef #foreign CoreText;
/*!
    @function   CTGetCoreTextVersion
    @abstract   Returns the version of the CoreText framework.

    @discussion This function returns a number indicating the version of the
                CoreText framework. Note that framework version is not always
                an accurate indicator of feature availability. The recommended
                way to use this function is first to check that the function
                pointer is non-NULL, followed by calling it and comparing its
                result to a defined constant (or constants). For example, to
                determine whether the CoreText API is available:
                    if (&CTGetCoreTextVersion != NULL && CTGetCoreTextVersion() >= kCTVersionNumber10_5) {
                        // CoreText API is available
                    }

    @result     The version number. This value is for comparison with the
                constants beginning with kCTVersionNumber and will not exceed
                kCTVersionNumber11_0.
*/
CTGetCoreTextVersion :: () -> u32 #foreign CoreText;
CTAdaptiveImageProviding :: struct #type_info_no_size_complaint {
/* The callee is to return an image for use at a particular point size and scale factor, as well as its offset and size (in points), which define the placement of the returned image relative to a rect with the proposed size.
 */
    imageForProposedSize_scaleFactor_imageOffset_imageSize_ :: (self: *CTAdaptiveImageProviding, proposedSize: CGSize, scaleFactor: CGFloat, outImageOffset: *CGPoint, outImageSize: *CGSize) -> CGImageRef {
        func: #type (obj: *void, selector: *void, proposedSize: CGSize, scaleFactor: CGFloat, outImageOffset: *CGPoint, outImageSize: *CGSize) -> CGImageRef #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.imageForProposedSize_scaleFactor_imageOffset_imageSize_, proposedSize, scaleFactor, outImageOffset, outImageSize);
    }

}

__CTFontDescriptor :: struct {};
__CTFont :: struct {};
__CTFontCollection :: struct {};
__CTFrame :: struct {};
__CTLine :: struct {};
__CTTypesetter :: struct {};
__CTFramesetter :: struct {};
__CTGlyphInfo :: struct {};
__CTParagraphStyle :: struct {};
__CTRubyAnnotation :: struct {};
__CTRun :: struct {};
__CTRunDelegate :: struct {};
__CTTextTab :: struct {};


_Generated_Selectors :: struct #type_info_no_size_complaint {
    imageForProposedSize_scaleFactor_imageOffset_imageSize_: *void = ---;
}
__sel: _Generated_Selectors;
