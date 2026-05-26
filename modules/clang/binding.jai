//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



CINDEX_VERSION_MAJOR :: 0;
CINDEX_VERSION_MINOR :: 64;

/**
* Error codes returned by libclang routines.
*
* Zero (\c CXError_Success) is the only error code indicating success.  Other
* error codes, including not yet assigned non-zero values, indicate errors.
*/
CXErrorCode :: enum u32 {
    Success          :: 0;
    Failure          :: 1;
    Crashed          :: 2;
    InvalidArguments :: 3;
    ASTReadError     :: 4;
}

/**
* A character string.
*
* The \c CXString type is used to return strings from the interface when
* the ownership of that string might differ from one call to the next.
* Use \c clang_getCString() to retrieve the string data and, once finished
* with the string data, call \c clang_disposeString() to free the string.
*/
CXString :: struct {
    data:          *void;
    private_flags: u32;
}

CXStringSet :: struct {
    Strings: *CXString;
    Count:   u32;
}

/**
* Retrieve the character data associated with the given string.
*
* The returned data is a reference and not owned by the user. This data
* is only valid while the `CXString` is valid. This function is similar
* to `std::string::c_str()`.
*/
clang_getCString :: (_string: CXString) -> *u8 #foreign libclang;

/**
* Free the given string.
*/
clang_disposeString :: (_string: CXString) -> void #foreign libclang;

/**
* Free the given string set.
*/
clang_disposeStringSet :: (set: *CXStringSet) -> void #foreign libclang;

/**
* Return the timestamp for use with Clang's
* \c -fbuild-session-timestamp= option.
*/
clang_getBuildSessionTimestamp :: () -> u64 #foreign libclang;

CXVirtualFileOverlayImpl :: struct {}
/**
* Object encapsulating information about overlaying virtual
* file/directories over the real file system.
*/
CXVirtualFileOverlay :: *CXVirtualFileOverlayImpl;

/**
* Create a \c CXVirtualFileOverlay object.
* Must be disposed with \c clang_VirtualFileOverlay_dispose().
*
* \param options is reserved, always pass 0.
*/
clang_VirtualFileOverlay_create :: (options: u32) -> CXVirtualFileOverlay #foreign libclang;

/**
* Map an absolute virtual file path to an absolute real one.
* The virtual path must be canonicalized (not contain "."/"..").
* \returns 0 for success, non-zero to indicate an error.
*/
clang_VirtualFileOverlay_addFileMapping :: (unknown0: CXVirtualFileOverlay, virtualPath: *u8, realPath: *u8) -> CXErrorCode #foreign libclang;

/**
* Set the case sensitivity for the \c CXVirtualFileOverlay object.
* The \c CXVirtualFileOverlay object is case-sensitive by default, this
* option can be used to override the default.
* \returns 0 for success, non-zero to indicate an error.
*/
clang_VirtualFileOverlay_setCaseSensitivity :: (unknown0: CXVirtualFileOverlay, caseSensitive: s32) -> CXErrorCode #foreign libclang;

/**
* Write out the \c CXVirtualFileOverlay object to a char buffer.
*
* \param options is reserved, always pass 0.
* \param out_buffer_ptr pointer to receive the buffer pointer, which should be
* disposed using \c clang_free().
* \param out_buffer_size pointer to receive the buffer size.
* \returns 0 for success, non-zero to indicate an error.
*/
clang_VirtualFileOverlay_writeToBuffer :: (unknown0: CXVirtualFileOverlay, options: u32, out_buffer_ptr: **u8, out_buffer_size: *u32) -> CXErrorCode #foreign libclang;

/**
* free memory allocated by libclang, such as the buffer returned by
* \c CXVirtualFileOverlay() or \c clang_ModuleMapDescriptor_writeToBuffer().
*
* \param buffer memory pointer to free.
*/
clang_free :: (buffer: *void) -> void #foreign libclang;

/**
* Dispose a \c CXVirtualFileOverlay object.
*/
clang_VirtualFileOverlay_dispose :: (unknown0: CXVirtualFileOverlay) -> void #foreign libclang;

CXModuleMapDescriptorImpl :: struct {}
/**
* Object encapsulating information about a module.modulemap file.
*/
CXModuleMapDescriptor :: *CXModuleMapDescriptorImpl;

/**
* Create a \c CXModuleMapDescriptor object.
* Must be disposed with \c clang_ModuleMapDescriptor_dispose().
*
* \param options is reserved, always pass 0.
*/
clang_ModuleMapDescriptor_create :: (options: u32) -> CXModuleMapDescriptor #foreign libclang;

/**
* Sets the framework module name that the module.modulemap describes.
* \returns 0 for success, non-zero to indicate an error.
*/
clang_ModuleMapDescriptor_setFrameworkModuleName :: (unknown0: CXModuleMapDescriptor, name: *u8) -> CXErrorCode #foreign libclang;

/**
* Sets the umbrella header name that the module.modulemap describes.
* \returns 0 for success, non-zero to indicate an error.
*/
clang_ModuleMapDescriptor_setUmbrellaHeader :: (unknown0: CXModuleMapDescriptor, name: *u8) -> CXErrorCode #foreign libclang;

/**
* Write out the \c CXModuleMapDescriptor object to a char buffer.
*
* \param options is reserved, always pass 0.
* \param out_buffer_ptr pointer to receive the buffer pointer, which should be
* disposed using \c clang_free().
* \param out_buffer_size pointer to receive the buffer size.
* \returns 0 for success, non-zero to indicate an error.
*/
clang_ModuleMapDescriptor_writeToBuffer :: (unknown0: CXModuleMapDescriptor, options: u32, out_buffer_ptr: **u8, out_buffer_size: *u32) -> CXErrorCode #foreign libclang;

/**
* Dispose a \c CXModuleMapDescriptor object.
*/
clang_ModuleMapDescriptor_dispose :: (unknown0: CXModuleMapDescriptor) -> void #foreign libclang;

/**
* A particular source file that is part of a translation unit.
*/
CXFile :: *void;

/**
* Retrieve the complete file and path name of the given file.
*/
clang_getFileName :: (SFile: CXFile) -> CXString #foreign libclang;

/**
* Retrieve the last modification time of the given file.
*/
clang_getFileTime :: (SFile: CXFile) -> time_t #foreign libclang;

/**
* Uniquely identifies a CXFile, that refers to the same underlying file,
* across an indexing session.
*/
CXFileUniqueID :: struct {
    data: [3] u64;
}

/**
* Retrieve the unique ID for the given \c file.
*
* \param file the file to get the ID for.
* \param outID stores the returned CXFileUniqueID.
* \returns If there was a failure getting the unique ID, returns non-zero,
* otherwise returns 0.
*/
clang_getFileUniqueID :: (file: CXFile, outID: *CXFileUniqueID) -> s32 #foreign libclang;

/**
* Returns non-zero if the \c file1 and \c file2 point to the same file,
* or they are both NULL.
*/
clang_File_isEqual :: (file1: CXFile, file2: CXFile) -> s32 #foreign libclang;

/**
* Returns the real path name of \c file.
*
* An empty string may be returned. Use \c clang_getFileName() in that case.
*/
clang_File_tryGetRealPathName :: (file: CXFile) -> CXString #foreign libclang;

/**
* Identifies a specific source location within a translation
* unit.
*
* Use clang_getExpansionLocation() or clang_getSpellingLocation()
* to map a source location to a particular file, line, and column.
*/
CXSourceLocation :: struct {
    ptr_data: [2] *void;
    int_data: u32;
}

/**
* Identifies a half-open character range in the source code.
*
* Use clang_getRangeStart() and clang_getRangeEnd() to retrieve the
* starting and end locations from a source range, respectively.
*/
CXSourceRange :: struct {
    ptr_data:       [2] *void;
    begin_int_data: u32;
    end_int_data:   u32;
}

/**
* Retrieve a NULL (invalid) source location.
*/
clang_getNullLocation :: () -> CXSourceLocation #foreign libclang;

/**
* Determine whether two source locations, which must refer into
* the same translation unit, refer to exactly the same point in the source
* code.
*
* \returns non-zero if the source locations refer to the same location, zero
* if they refer to different locations.
*/
clang_equalLocations :: (loc1: CXSourceLocation, loc2: CXSourceLocation) -> u32 #foreign libclang;

/**
* Determine for two source locations if the first comes
* strictly before the second one in the source code.
*
* \returns non-zero if the first source location comes
* strictly before the second one, zero otherwise.
*/
clang_isBeforeInTranslationUnit :: (loc1: CXSourceLocation, loc2: CXSourceLocation) -> u32 #foreign libclang;

/**
* Returns non-zero if the given source location is in a system header.
*/
clang_Location_isInSystemHeader :: (location: CXSourceLocation) -> s32 #foreign libclang;

/**
* Returns non-zero if the given source location is in the main file of
* the corresponding translation unit.
*/
clang_Location_isFromMainFile :: (location: CXSourceLocation) -> s32 #foreign libclang;

/**
* Retrieve a NULL (invalid) source range.
*/
clang_getNullRange :: () -> CXSourceRange #foreign libclang;

/**
* Retrieve a source range given the beginning and ending source
* locations.
*/
clang_getRange :: (begin: CXSourceLocation, end: CXSourceLocation) -> CXSourceRange #foreign libclang;

/**
* Determine whether two ranges are equivalent.
*
* \returns non-zero if the ranges are the same, zero if they differ.
*/
clang_equalRanges :: (range1: CXSourceRange, range2: CXSourceRange) -> u32 #foreign libclang;

/**
* Returns non-zero if \p range is null.
*/
clang_Range_isNull :: (range: CXSourceRange) -> s32 #foreign libclang;

/**
* Retrieve the file, line, column, and offset represented by
* the given source location.
*
* If the location refers into a macro expansion, retrieves the
* location of the macro expansion.
*
* \param location the location within a source file that will be decomposed
* into its parts.
*
* \param file [out] if non-NULL, will be set to the file to which the given
* source location points.
*
* \param line [out] if non-NULL, will be set to the line to which the given
* source location points.
*
* \param column [out] if non-NULL, will be set to the column to which the given
* source location points.
*
* \param offset [out] if non-NULL, will be set to the offset into the
* buffer to which the given source location points.
*/
clang_getExpansionLocation :: (location: CXSourceLocation, file: *CXFile, line: *u32, column: *u32, offset: *u32) -> void #foreign libclang;

/**
* Retrieve the file, line and column represented by the given source
* location, as specified in a # line directive.
*
* Example: given the following source code in a file somefile.c
*
* \code
* #123 "dummy.c" 1
*
* static int func(void)
* {
*     return 0;
* }
* \endcode
*
* the location information returned by this function would be
*
* File: dummy.c Line: 124 Column: 12
*
* whereas clang_getExpansionLocation would have returned
*
* File: somefile.c Line: 3 Column: 12
*
* \param location the location within a source file that will be decomposed
* into its parts.
*
* \param filename [out] if non-NULL, will be set to the filename of the
* source location. Note that filenames returned will be for "virtual" files,
* which don't necessarily exist on the machine running clang - e.g. when
* parsing preprocessed output obtained from a different environment. If
* a non-NULL value is passed in, remember to dispose of the returned value
* using \c clang_disposeString() once you've finished with it. For an invalid
* source location, an empty string is returned.
*
* \param line [out] if non-NULL, will be set to the line number of the
* source location. For an invalid source location, zero is returned.
*
* \param column [out] if non-NULL, will be set to the column number of the
* source location. For an invalid source location, zero is returned.
*/
clang_getPresumedLocation :: (location: CXSourceLocation, filename: *CXString, line: *u32, column: *u32) -> void #foreign libclang;

/**
* Legacy API to retrieve the file, line, column, and offset represented
* by the given source location.
*
* This interface has been replaced by the newer interface
* #clang_getExpansionLocation(). See that interface's documentation for
* details.
*/
clang_getInstantiationLocation :: (location: CXSourceLocation, file: *CXFile, line: *u32, column: *u32, offset: *u32) -> void #foreign libclang;

/**
* Retrieve the file, line, column, and offset represented by
* the given source location.
*
* If the location refers into a macro instantiation, return where the
* location was originally spelled in the source file.
*
* \param location the location within a source file that will be decomposed
* into its parts.
*
* \param file [out] if non-NULL, will be set to the file to which the given
* source location points.
*
* \param line [out] if non-NULL, will be set to the line to which the given
* source location points.
*
* \param column [out] if non-NULL, will be set to the column to which the given
* source location points.
*
* \param offset [out] if non-NULL, will be set to the offset into the
* buffer to which the given source location points.
*/
clang_getSpellingLocation :: (location: CXSourceLocation, file: *CXFile, line: *u32, column: *u32, offset: *u32) -> void #foreign libclang;

/**
* Retrieve the file, line, column, and offset represented by
* the given source location.
*
* If the location refers into a macro expansion, return where the macro was
* expanded or where the macro argument was written, if the location points at
* a macro argument.
*
* \param location the location within a source file that will be decomposed
* into its parts.
*
* \param file [out] if non-NULL, will be set to the file to which the given
* source location points.
*
* \param line [out] if non-NULL, will be set to the line to which the given
* source location points.
*
* \param column [out] if non-NULL, will be set to the column to which the given
* source location points.
*
* \param offset [out] if non-NULL, will be set to the offset into the
* buffer to which the given source location points.
*/
clang_getFileLocation :: (location: CXSourceLocation, file: *CXFile, line: *u32, column: *u32, offset: *u32) -> void #foreign libclang;

/**
* Retrieve a source location representing the first character within a
* source range.
*/
clang_getRangeStart :: (range: CXSourceRange) -> CXSourceLocation #foreign libclang;

/**
* Retrieve a source location representing the last character within a
* source range.
*/
clang_getRangeEnd :: (range: CXSourceRange) -> CXSourceLocation #foreign libclang;

/**
* Identifies an array of ranges.
*/
CXSourceRangeList :: struct {
    /** The number of ranges in the \c ranges array. */
    count:  u32;
    /**
    * An array of \c CXSourceRanges.
    */
    ranges: *CXSourceRange;
}

/**
* Destroy the given \c CXSourceRangeList.
*/
clang_disposeSourceRangeList :: (ranges: *CXSourceRangeList) -> void #foreign libclang;

/**
* Describes the severity of a particular diagnostic.
*/
CXDiagnosticSeverity :: enum u32 {
    Ignored :: 0;
    Note    :: 1;
    Warning :: 2;
    Error   :: 3;
    Fatal   :: 4;
}

/**
* A single diagnostic, containing the diagnostic's severity,
* location, text, source ranges, and fix-it hints.
*/
CXDiagnostic :: *void;

/**
* A group of CXDiagnostics.
*/
CXDiagnosticSet :: *void;

/**
* Determine the number of diagnostics in a CXDiagnosticSet.
*/
clang_getNumDiagnosticsInSet :: (Diags: CXDiagnosticSet) -> u32 #foreign libclang;

/**
* Retrieve a diagnostic associated with the given CXDiagnosticSet.
*
* \param Diags the CXDiagnosticSet to query.
* \param Index the zero-based diagnostic number to retrieve.
*
* \returns the requested diagnostic. This diagnostic must be freed
* via a call to \c clang_disposeDiagnostic().
*/
clang_getDiagnosticInSet :: (Diags: CXDiagnosticSet, Index: u32) -> CXDiagnostic #foreign libclang;

/**
* Describes the kind of error that occurred (if any) in a call to
* \c clang_loadDiagnostics.
*/
CXLoadDiag_Error :: enum u32 {
    None        :: 0;
    Unknown     :: 1;
    CannotLoad  :: 2;
    InvalidFile :: 3;
}

/**
* Deserialize a set of diagnostics from a Clang diagnostics bitcode
* file.
*
* \param file The name of the file to deserialize.
* \param error A pointer to a enum value recording if there was a problem
*        deserializing the diagnostics.
* \param errorString A pointer to a CXString for recording the error string
*        if the file was not successfully loaded.
*
* \returns A loaded CXDiagnosticSet if successful, and NULL otherwise.  These
* diagnostics should be released using clang_disposeDiagnosticSet().
*/
clang_loadDiagnostics :: (file: *u8, error: *CXLoadDiag_Error, errorString: *CXString) -> CXDiagnosticSet #foreign libclang;

/**
* Release a CXDiagnosticSet and all of its contained diagnostics.
*/
clang_disposeDiagnosticSet :: (Diags: CXDiagnosticSet) -> void #foreign libclang;

/**
* Retrieve the child diagnostics of a CXDiagnostic.
*
* This CXDiagnosticSet does not need to be released by
* clang_disposeDiagnosticSet.
*/
clang_getChildDiagnostics :: (D: CXDiagnostic) -> CXDiagnosticSet #foreign libclang;

/**
* Destroy a diagnostic.
*/
clang_disposeDiagnostic :: (Diagnostic: CXDiagnostic) -> void #foreign libclang;

/**
* Options to control the display of diagnostics.
*
* The values in this enum are meant to be combined to customize the
* behavior of \c clang_formatDiagnostic().
*/
CXDiagnosticDisplayOptions :: enum u32 {
    DisplaySourceLocation :: 1;
    DisplayColumn         :: 2;
    DisplaySourceRanges   :: 4;
    DisplayOption         :: 8;
    DisplayCategoryId     :: 16;
    DisplayCategoryName   :: 32;
}

/**
* Format the given diagnostic in a manner that is suitable for display.
*
* This routine will format the given diagnostic to a string, rendering
* the diagnostic according to the various options given. The
* \c clang_defaultDiagnosticDisplayOptions() function returns the set of
* options that most closely mimics the behavior of the clang compiler.
*
* \param Diagnostic The diagnostic to print.
*
* \param Options A set of options that control the diagnostic display,
* created by combining \c CXDiagnosticDisplayOptions values.
*
* \returns A new string containing for formatted diagnostic.
*/
clang_formatDiagnostic :: (Diagnostic: CXDiagnostic, Options: u32) -> CXString #foreign libclang;

/**
* Retrieve the set of display options most similar to the
* default behavior of the clang compiler.
*
* \returns A set of display options suitable for use with \c
* clang_formatDiagnostic().
*/
clang_defaultDiagnosticDisplayOptions :: () -> u32 #foreign libclang;

/**
* Determine the severity of the given diagnostic.
*/
clang_getDiagnosticSeverity :: (unknown0: CXDiagnostic) -> CXDiagnosticSeverity #foreign libclang;

/**
* Retrieve the source location of the given diagnostic.
*
* This location is where Clang would print the caret ('^') when
* displaying the diagnostic on the command line.
*/
clang_getDiagnosticLocation :: (unknown0: CXDiagnostic) -> CXSourceLocation #foreign libclang;

/**
* Retrieve the text of the given diagnostic.
*/
clang_getDiagnosticSpelling :: (unknown0: CXDiagnostic) -> CXString #foreign libclang;

/**
* Retrieve the name of the command-line option that enabled this
* diagnostic.
*
* \param Diag The diagnostic to be queried.
*
* \param Disable If non-NULL, will be set to the option that disables this
* diagnostic (if any).
*
* \returns A string that contains the command-line option used to enable this
* warning, such as "-Wconversion" or "-pedantic".
*/
clang_getDiagnosticOption :: (Diag: CXDiagnostic, Disable: *CXString) -> CXString #foreign libclang;

/**
* Retrieve the category number for this diagnostic.
*
* Diagnostics can be categorized into groups along with other, related
* diagnostics (e.g., diagnostics under the same warning flag). This routine
* retrieves the category number for the given diagnostic.
*
* \returns The number of the category that contains this diagnostic, or zero
* if this diagnostic is uncategorized.
*/
clang_getDiagnosticCategory :: (unknown0: CXDiagnostic) -> u32 #foreign libclang;

/**
* Retrieve the name of a particular diagnostic category.  This
*  is now deprecated.  Use clang_getDiagnosticCategoryText()
*  instead.
*
* \param Category A diagnostic category number, as returned by
* \c clang_getDiagnosticCategory().
*
* \returns The name of the given diagnostic category.
*/
clang_getDiagnosticCategoryName :: (Category: u32) -> CXString #foreign libclang;

/**
* Retrieve the diagnostic category text for a given diagnostic.
*
* \returns The text of the given diagnostic category.
*/
clang_getDiagnosticCategoryText :: (unknown0: CXDiagnostic) -> CXString #foreign libclang;

/**
* Determine the number of source ranges associated with the given
* diagnostic.
*/
clang_getDiagnosticNumRanges :: (unknown0: CXDiagnostic) -> u32 #foreign libclang;

/**
* Retrieve a source range associated with the diagnostic.
*
* A diagnostic's source ranges highlight important elements in the source
* code. On the command line, Clang displays source ranges by
* underlining them with '~' characters.
*
* \param Diagnostic the diagnostic whose range is being extracted.
*
* \param Range the zero-based index specifying which range to
*
* \returns the requested source range.
*/
clang_getDiagnosticRange :: (Diagnostic: CXDiagnostic, Range: u32) -> CXSourceRange #foreign libclang;

/**
* Determine the number of fix-it hints associated with the
* given diagnostic.
*/
clang_getDiagnosticNumFixIts :: (Diagnostic: CXDiagnostic) -> u32 #foreign libclang;

/**
* Retrieve the replacement information for a given fix-it.
*
* Fix-its are described in terms of a source range whose contents
* should be replaced by a string. This approach generalizes over
* three kinds of operations: removal of source code (the range covers
* the code to be removed and the replacement string is empty),
* replacement of source code (the range covers the code to be
* replaced and the replacement string provides the new code), and
* insertion (both the start and end of the range point at the
* insertion location, and the replacement string provides the text to
* insert).
*
* \param Diagnostic The diagnostic whose fix-its are being queried.
*
* \param FixIt The zero-based index of the fix-it.
*
* \param ReplacementRange The source range whose contents will be
* replaced with the returned replacement string. Note that source
* ranges are half-open ranges [a, b), so the source code should be
* replaced from a and up to (but not including) b.
*
* \returns A string containing text that should be replace the source
* code indicated by the \c ReplacementRange.
*/
clang_getDiagnosticFixIt :: (Diagnostic: CXDiagnostic, FixIt: u32, ReplacementRange: *CXSourceRange) -> CXString #foreign libclang;

/**
* An "index" that consists of a set of translation units that would
* typically be linked together into an executable or library.
*/
CXIndex :: *void;

CXTargetInfoImpl :: struct {}
/**
* An opaque type representing target information for a given translation
* unit.
*/
CXTargetInfo :: *CXTargetInfoImpl;

CXTranslationUnitImpl :: struct {}
/**
* A single translation unit, which resides in an index.
*/
CXTranslationUnit :: *CXTranslationUnitImpl;

/**
* Opaque pointer representing client data that will be passed through
* to various callbacks and visitors.
*/
CXClientData :: *void;

/**
* Provides the contents of a file that has not yet been saved to disk.
*
* Each CXUnsavedFile instance provides the name of a file on the
* system along with the current contents of that file that have not
* yet been saved to disk.
*/
CXUnsavedFile :: struct {
    /**
    * The file whose contents have not yet been saved.
    *
    * This file must already exist in the file system.
    */
    Filename: *u8;
    /**
    * A buffer containing the unsaved contents of this file.
    */
    Contents: *u8;
    /**
    * The length of the unsaved contents of this buffer.
    */
    Length:   u64;
}

/**
* Describes the availability of a particular entity, which indicates
* whether the use of this entity will result in a warning or error due to
* it being deprecated or unavailable.
*/
CXAvailabilityKind :: enum u32 {
    Available     :: 0;
    Deprecated    :: 1;
    NotAvailable  :: 2;
    NotAccessible :: 3;
}

/**
* Describes a version number of the form major.minor.subminor.
*/
CXVersion :: struct {
    /**
    * The major version number, e.g., the '10' in '10.7.3'. A negative
    * value indicates that there is no version number at all.
    */
    Major:    s32;
    /**
    * The minor version number, e.g., the '7' in '10.7.3'. This value
    * will be negative if no minor version number was provided, e.g., for
    * version '10'.
    */
    Minor:    s32;
    /**
    * The subminor version number, e.g., the '3' in '10.7.3'. This value
    * will be negative if no minor or subminor version number was provided,
    * e.g., in version '10' or '10.7'.
    */
    Subminor: s32;
}

/**
* Describes the exception specification of a cursor.
*
* A negative value indicates that the cursor is not a function declaration.
*/
CXCursor_ExceptionSpecificationKind :: enum u32 {
    None             :: 0;
    DynamicNone      :: 1;
    Dynamic          :: 2;
    MSAny            :: 3;
    BasicNoexcept    :: 4;
    ComputedNoexcept :: 5;
    Unevaluated      :: 6;
    Uninstantiated   :: 7;
    Unparsed         :: 8;
    NoThrow          :: 9;
}

/**
* Provides a shared context for creating translation units.
*
* It provides two options:
*
* - excludeDeclarationsFromPCH: When non-zero, allows enumeration of "local"
* declarations (when loading any new translation units). A "local" declaration
* is one that belongs in the translation unit itself and not in a precompiled
* header that was used by the translation unit. If zero, all declarations
* will be enumerated.
*
* Here is an example:
*
* \code
*   // excludeDeclsFromPCH = 1, displayDiagnostics=1
*   Idx = clang_createIndex(1, 1);
*
*   // IndexTest.pch was produced with the following command:
*   // "clang -x c IndexTest.h -emit-ast -o IndexTest.pch"
*   TU = clang_createTranslationUnit(Idx, "IndexTest.pch");
*
*   // This will load all the symbols from 'IndexTest.pch'
*   clang_visitChildren(clang_getTranslationUnitCursor(TU),
*                       TranslationUnitVisitor, 0);
*   clang_disposeTranslationUnit(TU);
*
*   // This will load all the symbols from 'IndexTest.c', excluding symbols
*   // from 'IndexTest.pch'.
*   char *args[] = { "-Xclang", "-include-pch=IndexTest.pch" };
*   TU = clang_createTranslationUnitFromSourceFile(Idx, "IndexTest.c", 2, args,
*                                                  0, 0);
*   clang_visitChildren(clang_getTranslationUnitCursor(TU),
*                       TranslationUnitVisitor, 0);
*   clang_disposeTranslationUnit(TU);
* \endcode
*
* This process of creating the 'pch', loading it separately, and using it (via
* -include-pch) allows 'excludeDeclsFromPCH' to remove redundant callbacks
* (which gives the indexer the same performance benefit as the compiler).
*/
clang_createIndex :: (excludeDeclarationsFromPCH: s32, displayDiagnostics: s32) -> CXIndex #foreign libclang;

/**
* Destroy the given index.
*
* The index must not be destroyed until all of the translation units created
* within that index have been destroyed.
*/
clang_disposeIndex :: (index: CXIndex) -> void #foreign libclang;

CXChoice :: enum u32 {
    Default  :: 0;
    Enabled  :: 1;
    Disabled :: 2;
}

CXGlobalOptFlags :: enum u32 {
    None                                :: 0;
    ThreadBackgroundPriorityForIndexing :: 1;
    ThreadBackgroundPriorityForEditing  :: 2;
    ThreadBackgroundPriorityForAll      :: 3;
}

/**
* Index initialization options.
*
* 0 is the default value of each member of this struct except for Size.
* Initialize the struct in one of the following three ways to avoid adapting
* code each time a new member is added to it:
* \code
* CXIndexOptions Opts;
* memset(&Opts, 0, sizeof(Opts));
* Opts.Size = sizeof(CXIndexOptions);
* \endcode
* or explicitly initialize the first data member and zero-initialize the rest:
* \code
* CXIndexOptions Opts = { sizeof(CXIndexOptions) };
* \endcode
* or to prevent the -Wmissing-field-initializers warning for the above version:
* \code
* CXIndexOptions Opts{};
* Opts.Size = sizeof(CXIndexOptions);
* \endcode
*/
CXIndexOptions :: struct {
    /**
    * The size of struct CXIndexOptions used for option versioning.
    *
    * Always initialize this member to sizeof(CXIndexOptions), or assign
    * sizeof(CXIndexOptions) to it right after creating a CXIndexOptions object.
    */
    Size:                                u32;
    /**
    * A CXChoice enumerator that specifies the indexing priority policy.
    * \sa CXGlobalOpt_ThreadBackgroundPriorityForIndexing
    */
    ThreadBackgroundPriorityForIndexing: u8;
    /**
    * A CXChoice enumerator that specifies the editing priority policy.
    * \sa CXGlobalOpt_ThreadBackgroundPriorityForEditing
    */
    ThreadBackgroundPriorityForEditing:  u8;
    __bitfield:                          u16;
    /* 
        /**
        * \see clang_createIndex()
        */
        ExcludeDeclarationsFromPCH: u32; /* 1 bits */
        /**
        * \see clang_createIndex()
        */
        DisplayDiagnostics: u32; /* 1 bits */
        /**
        * Store PCH in memory. If zero, PCH are stored in temporary files.
        */
        StorePreamblesInMemory: u32; /* 1 bits */
        anon_decl: u32; /* 13 bits */ /*Reserved*/;
    */
    /**
    * The path to a directory, in which to store temporary PCH files. If null or
    * empty, the default system temporary directory is used. These PCH files are
    * deleted on clean exit but stay on disk if the program crashes or is killed.
    *
    * This option is ignored if \a StorePreamblesInMemory is non-zero.
    *
    * Libclang does not create the directory at the specified path in the file
    * system. Therefore it must exist, or storing PCH files will fail.
    */
    PreambleStoragePath:                 *u8;
    /**
    * Specifies a path which will contain log files for certain libclang
    * invocations. A null value implies that libclang invocations are not logged.
    */
    InvocationEmissionPath:              *u8;
}

set_ExcludeDeclarationsFromPCH :: (fields: *CXIndexOptions, value: bool) {
    if value fields.__bitfield |= 1 << 0;
    else     fields.__bitfield &= ~cast(u16)(1 << 0);
}
get_ExcludeDeclarationsFromPCH :: (fields: CXIndexOptions) -> bool {
    return (fields.__bitfield & (1 << 0)) != 0;
}

set_DisplayDiagnostics :: (fields: *CXIndexOptions, value: bool) {
    if value fields.__bitfield |= 1 << 1;
    else     fields.__bitfield &= ~cast(u16)(1 << 1);
}
get_DisplayDiagnostics :: (fields: CXIndexOptions) -> bool {
    return (fields.__bitfield & (1 << 1)) != 0;
}

set_StorePreamblesInMemory :: (fields: *CXIndexOptions, value: bool) {
    if value fields.__bitfield |= 1 << 2;
    else     fields.__bitfield &= ~cast(u16)(1 << 2);
}
get_StorePreamblesInMemory :: (fields: CXIndexOptions) -> bool {
    return (fields.__bitfield & (1 << 2)) != 0;
}


/**
* Provides a shared context for creating translation units.
*
* Call this function instead of clang_createIndex() if you need to configure
* the additional options in CXIndexOptions.
*
* \returns The created index or null in case of error, such as an unsupported
* value of options->Size.
*
* For example:
* \code
* CXIndex createIndex(const char *ApplicationTemporaryPath) {
*   const int ExcludeDeclarationsFromPCH = 1;
*   const int DisplayDiagnostics = 1;
*   CXIndex Idx;
* #if CINDEX_VERSION_MINOR >= 64
*   CXIndexOptions Opts;
*   memset(&Opts, 0, sizeof(Opts));
*   Opts.Size = sizeof(CXIndexOptions);
*   Opts.ThreadBackgroundPriorityForIndexing = 1;
*   Opts.ExcludeDeclarationsFromPCH = ExcludeDeclarationsFromPCH;
*   Opts.DisplayDiagnostics = DisplayDiagnostics;
*   Opts.PreambleStoragePath = ApplicationTemporaryPath;
*   Idx = clang_createIndexWithOptions(&Opts);
*   if (Idx)
*     return Idx;
*   fprintf(stderr,
*           "clang_createIndexWithOptions() failed. "
*           "CINDEX_VERSION_MINOR = %d, sizeof(CXIndexOptions) = %u\n",
*           CINDEX_VERSION_MINOR, Opts.Size);
* #else
*   (void)ApplicationTemporaryPath;
* #endif
*   Idx = clang_createIndex(ExcludeDeclarationsFromPCH, DisplayDiagnostics);
*   clang_CXIndex_setGlobalOptions(
*       Idx, clang_CXIndex_getGlobalOptions(Idx) |
*                CXGlobalOpt_ThreadBackgroundPriorityForIndexing);
*   return Idx;
* }
* \endcode
*
* \sa clang_createIndex()
*/
clang_createIndexWithOptions :: (options: *CXIndexOptions) -> CXIndex #foreign libclang;

/**
* Sets general options associated with a CXIndex.
*
* This function is DEPRECATED. Set
* CXIndexOptions::ThreadBackgroundPriorityForIndexing and/or
* CXIndexOptions::ThreadBackgroundPriorityForEditing and call
* clang_createIndexWithOptions() instead.
*
* For example:
* \code
* CXIndex idx = ...;
* clang_CXIndex_setGlobalOptions(idx,
*     clang_CXIndex_getGlobalOptions(idx) |
*     CXGlobalOpt_ThreadBackgroundPriorityForIndexing);
* \endcode
*
* \param options A bitmask of options, a bitwise OR of CXGlobalOpt_XXX flags.
*/
clang_CXIndex_setGlobalOptions :: (unknown0: CXIndex, options: u32) -> void #foreign libclang;

/**
* Gets the general options associated with a CXIndex.
*
* This function allows to obtain the final option values used by libclang after
* specifying the option policies via CXChoice enumerators.
*
* \returns A bitmask of options, a bitwise OR of CXGlobalOpt_XXX flags that
* are associated with the given CXIndex object.
*/
clang_CXIndex_getGlobalOptions :: (unknown0: CXIndex) -> u32 #foreign libclang;

/**
* Sets the invocation emission path option in a CXIndex.
*
* This function is DEPRECATED. Set CXIndexOptions::InvocationEmissionPath and
* call clang_createIndexWithOptions() instead.
*
* The invocation emission path specifies a path which will contain log
* files for certain libclang invocations. A null value (default) implies that
* libclang invocations are not logged..
*/
clang_CXIndex_setInvocationEmissionPathOption :: (unknown0: CXIndex, Path: *u8) -> void #foreign libclang;

/**
* Determine whether the given header is guarded against
* multiple inclusions, either with the conventional
* \#ifndef/\#define/\#endif macro guards or with \#pragma once.
*/
clang_isFileMultipleIncludeGuarded :: (tu: CXTranslationUnit, file: CXFile) -> u32 #foreign libclang;

/**
* Retrieve a file handle within the given translation unit.
*
* \param tu the translation unit
*
* \param file_name the name of the file.
*
* \returns the file handle for the named file in the translation unit \p tu,
* or a NULL file handle if the file was not a part of this translation unit.
*/
clang_getFile :: (tu: CXTranslationUnit, file_name: *u8) -> CXFile #foreign libclang;

/**
* Retrieve the buffer associated with the given file.
*
* \param tu the translation unit
*
* \param file the file for which to retrieve the buffer.
*
* \param size [out] if non-NULL, will be set to the size of the buffer.
*
* \returns a pointer to the buffer in memory that holds the contents of
* \p file, or a NULL pointer when the file is not loaded.
*/
clang_getFileContents :: (tu: CXTranslationUnit, file: CXFile, size: *u64) -> *u8 #foreign libclang;

/**
* Retrieves the source location associated with a given file/line/column
* in a particular translation unit.
*/
clang_getLocation :: (tu: CXTranslationUnit, file: CXFile, line: u32, column: u32) -> CXSourceLocation #foreign libclang;

/**
* Retrieves the source location associated with a given character offset
* in a particular translation unit.
*/
clang_getLocationForOffset :: (tu: CXTranslationUnit, file: CXFile, offset: u32) -> CXSourceLocation #foreign libclang;

/**
* Retrieve all ranges that were skipped by the preprocessor.
*
* The preprocessor will skip lines when they are surrounded by an
* if/ifdef/ifndef directive whose condition does not evaluate to true.
*/
clang_getSkippedRanges :: (tu: CXTranslationUnit, file: CXFile) -> *CXSourceRangeList #foreign libclang;

/**
* Retrieve all ranges from all files that were skipped by the
* preprocessor.
*
* The preprocessor will skip lines when they are surrounded by an
* if/ifdef/ifndef directive whose condition does not evaluate to true.
*/
clang_getAllSkippedRanges :: (tu: CXTranslationUnit) -> *CXSourceRangeList #foreign libclang;

/**
* Determine the number of diagnostics produced for the given
* translation unit.
*/
clang_getNumDiagnostics :: (Unit: CXTranslationUnit) -> u32 #foreign libclang;

/**
* Retrieve a diagnostic associated with the given translation unit.
*
* \param Unit the translation unit to query.
* \param Index the zero-based diagnostic number to retrieve.
*
* \returns the requested diagnostic. This diagnostic must be freed
* via a call to \c clang_disposeDiagnostic().
*/
clang_getDiagnostic :: (Unit: CXTranslationUnit, Index: u32) -> CXDiagnostic #foreign libclang;

/**
* Retrieve the complete set of diagnostics associated with a
*        translation unit.
*
* \param Unit the translation unit to query.
*/
clang_getDiagnosticSetFromTU :: (Unit: CXTranslationUnit) -> CXDiagnosticSet #foreign libclang;

/**
* Get the original translation unit source file name.
*/
clang_getTranslationUnitSpelling :: (CTUnit: CXTranslationUnit) -> CXString #foreign libclang;

/**
* Return the CXTranslationUnit for a given source file and the provided
* command line arguments one would pass to the compiler.
*
* Note: The 'source_filename' argument is optional.  If the caller provides a
* NULL pointer, the name of the source file is expected to reside in the
* specified command line arguments.
*
* Note: When encountered in 'clang_command_line_args', the following options
* are ignored:
*
*   '-c'
*   '-emit-ast'
*   '-fsyntax-only'
*   '-o \<output file>'  (both '-o' and '\<output file>' are ignored)
*
* \param CIdx The index object with which the translation unit will be
* associated.
*
* \param source_filename The name of the source file to load, or NULL if the
* source file is included in \p clang_command_line_args.
*
* \param num_clang_command_line_args The number of command-line arguments in
* \p clang_command_line_args.
*
* \param clang_command_line_args The command-line arguments that would be
* passed to the \c clang executable if it were being invoked out-of-process.
* These command-line options will be parsed and will affect how the translation
* unit is parsed. Note that the following options are ignored: '-c',
* '-emit-ast', '-fsyntax-only' (which is the default), and '-o \<output file>'.
*
* \param num_unsaved_files the number of unsaved file entries in \p
* unsaved_files.
*
* \param unsaved_files the files that have not yet been saved to disk
* but may be required for code completion, including the contents of
* those files.  The contents and name of these files (as specified by
* CXUnsavedFile) are copied when necessary, so the client only needs to
* guarantee their validity until the call to this function returns.
*/
clang_createTranslationUnitFromSourceFile :: (CIdx: CXIndex, source_filename: *u8, num_clang_command_line_args: s32, clang_command_line_args: **u8, num_unsaved_files: u32, unsaved_files: *CXUnsavedFile) -> CXTranslationUnit #foreign libclang;

/**
* Same as \c clang_createTranslationUnit2, but returns
* the \c CXTranslationUnit instead of an error code.  In case of an error this
* routine returns a \c NULL \c CXTranslationUnit, without further detailed
* error codes.
*/
clang_createTranslationUnit :: (CIdx: CXIndex, ast_filename: *u8) -> CXTranslationUnit #foreign libclang;

/**
* Create a translation unit from an AST file (\c -emit-ast).
*
* \param[out] out_TU A non-NULL pointer to store the created
* \c CXTranslationUnit.
*
* \returns Zero on success, otherwise returns an error code.
*/
clang_createTranslationUnit2 :: (CIdx: CXIndex, ast_filename: *u8, out_TU: *CXTranslationUnit) -> CXErrorCode #foreign libclang;

/**
* Flags that control the creation of translation units.
*
* The enumerators in this enumeration type are meant to be bitwise
* ORed together to specify which options should be used when
* constructing the translation unit.
*/
CXTranslationUnit_Flags :: enum_flags u32 {
    None                                 :: 0x0;
    DetailedPreprocessingRecord          :: 0x1;
    Incomplete                           :: 0x2;
    PrecompiledPreamble                  :: 0x4;
    CacheCompletionResults               :: 0x8;
    ForSerialization                     :: 0x10;
    CXXChainedPCH                        :: 0x20;
    SkipFunctionBodies                   :: 0x40;
    IncludeBriefCommentsInCodeCompletion :: 0x80;
    CreatePreambleOnFirstParse           :: 0x100;
    KeepGoing                            :: 0x200;
    SingleFileParse                      :: 0x400;
    LimitSkipFunctionBodiesToPreamble    :: 0x800;
    IncludeAttributedTypes               :: 0x1000;
    VisitImplicitAttributes              :: 0x2000;
    IgnoreNonErrorsFromIncludedFiles     :: 0x4000;
    RetainExcludedConditionalBlocks      :: 0x8000;
}

/**
* Returns the set of flags that is suitable for parsing a translation
* unit that is being edited.
*
* The set of flags returned provide options for \c clang_parseTranslationUnit()
* to indicate that the translation unit is likely to be reparsed many times,
* either explicitly (via \c clang_reparseTranslationUnit()) or implicitly
* (e.g., by code completion (\c clang_codeCompletionAt())). The returned flag
* set contains an unspecified set of optimizations (e.g., the precompiled
* preamble) geared toward improving the performance of these routines. The
* set of optimizations enabled may change from one version to the next.
*/
clang_defaultEditingTranslationUnitOptions :: () -> u32 #foreign libclang;

/**
* Same as \c clang_parseTranslationUnit2, but returns
* the \c CXTranslationUnit instead of an error code.  In case of an error this
* routine returns a \c NULL \c CXTranslationUnit, without further detailed
* error codes.
*/
clang_parseTranslationUnit :: (CIdx: CXIndex, source_filename: *u8, command_line_args: **u8, num_command_line_args: s32, unsaved_files: *CXUnsavedFile, num_unsaved_files: u32, options: u32) -> CXTranslationUnit #foreign libclang;

/**
* Parse the given source file and the translation unit corresponding
* to that file.
*
* This routine is the main entry point for the Clang C API, providing the
* ability to parse a source file into a translation unit that can then be
* queried by other functions in the API. This routine accepts a set of
* command-line arguments so that the compilation can be configured in the same
* way that the compiler is configured on the command line.
*
* \param CIdx The index object with which the translation unit will be
* associated.
*
* \param source_filename The name of the source file to load, or NULL if the
* source file is included in \c command_line_args.
*
* \param command_line_args The command-line arguments that would be
* passed to the \c clang executable if it were being invoked out-of-process.
* These command-line options will be parsed and will affect how the translation
* unit is parsed. Note that the following options are ignored: '-c',
* '-emit-ast', '-fsyntax-only' (which is the default), and '-o \<output file>'.
*
* \param num_command_line_args The number of command-line arguments in
* \c command_line_args.
*
* \param unsaved_files the files that have not yet been saved to disk
* but may be required for parsing, including the contents of
* those files.  The contents and name of these files (as specified by
* CXUnsavedFile) are copied when necessary, so the client only needs to
* guarantee their validity until the call to this function returns.
*
* \param num_unsaved_files the number of unsaved file entries in \p
* unsaved_files.
*
* \param options A bitmask of options that affects how the translation unit
* is managed but not its compilation. This should be a bitwise OR of the
* CXTranslationUnit_XXX flags.
*
* \param[out] out_TU A non-NULL pointer to store the created
* \c CXTranslationUnit, describing the parsed code and containing any
* diagnostics produced by the compiler.
*
* \returns Zero on success, otherwise returns an error code.
*/
clang_parseTranslationUnit2 :: (CIdx: CXIndex, source_filename: *u8, command_line_args: **u8, num_command_line_args: s32, unsaved_files: *CXUnsavedFile, num_unsaved_files: u32, options: u32, out_TU: *CXTranslationUnit) -> CXErrorCode #foreign libclang;

/**
* Same as clang_parseTranslationUnit2 but requires a full command line
* for \c command_line_args including argv[0]. This is useful if the standard
* library paths are relative to the binary.
*/
clang_parseTranslationUnit2FullArgv :: (CIdx: CXIndex, source_filename: *u8, command_line_args: **u8, num_command_line_args: s32, unsaved_files: *CXUnsavedFile, num_unsaved_files: u32, options: u32, out_TU: *CXTranslationUnit) -> CXErrorCode #foreign libclang;

/**
* Flags that control how translation units are saved.
*
* The enumerators in this enumeration type are meant to be bitwise
* ORed together to specify which options should be used when
* saving the translation unit.
*/
CXSaveTranslationUnit_Flags :: enum_flags u32 {
    CXSaveTranslationUnit_None :: 0x0;
}

/**
* Returns the set of flags that is suitable for saving a translation
* unit.
*
* The set of flags returned provide options for
* \c clang_saveTranslationUnit() by default. The returned flag
* set contains an unspecified set of options that save translation units with
* the most commonly-requested data.
*/
clang_defaultSaveOptions :: (TU: CXTranslationUnit) -> u32 #foreign libclang;

/**
* Describes the kind of error that occurred (if any) in a call to
* \c clang_saveTranslationUnit().
*/
CXSaveError :: enum u32 {
    None              :: 0;
    Unknown           :: 1;
    TranslationErrors :: 2;
    InvalidTU         :: 3;
}

/**
* Saves a translation unit into a serialized representation of
* that translation unit on disk.
*
* Any translation unit that was parsed without error can be saved
* into a file. The translation unit can then be deserialized into a
* new \c CXTranslationUnit with \c clang_createTranslationUnit() or,
* if it is an incomplete translation unit that corresponds to a
* header, used as a precompiled header when parsing other translation
* units.
*
* \param TU The translation unit to save.
*
* \param FileName The file to which the translation unit will be saved.
*
* \param options A bitmask of options that affects how the translation unit
* is saved. This should be a bitwise OR of the
* CXSaveTranslationUnit_XXX flags.
*
* \returns A value that will match one of the enumerators of the CXSaveError
* enumeration. Zero (CXSaveError_None) indicates that the translation unit was
* saved successfully, while a non-zero value indicates that a problem occurred.
*/
clang_saveTranslationUnit :: (TU: CXTranslationUnit, FileName: *u8, options: u32) -> s32 #foreign libclang;

/**
* Suspend a translation unit in order to free memory associated with it.
*
* A suspended translation unit uses significantly less memory but on the other
* side does not support any other calls than \c clang_reparseTranslationUnit
* to resume it or \c clang_disposeTranslationUnit to dispose it completely.
*/
clang_suspendTranslationUnit :: (unknown0: CXTranslationUnit) -> u32 #foreign libclang;

/**
* Destroy the specified CXTranslationUnit object.
*/
clang_disposeTranslationUnit :: (unknown0: CXTranslationUnit) -> void #foreign libclang;

/**
* Flags that control the reparsing of translation units.
*
* The enumerators in this enumeration type are meant to be bitwise
* ORed together to specify which options should be used when
* reparsing the translation unit.
*/
CXReparse_Flags :: enum_flags u32 {
    CXReparse_None :: 0x0;
}

/**
* Returns the set of flags that is suitable for reparsing a translation
* unit.
*
* The set of flags returned provide options for
* \c clang_reparseTranslationUnit() by default. The returned flag
* set contains an unspecified set of optimizations geared toward common uses
* of reparsing. The set of optimizations enabled may change from one version
* to the next.
*/
clang_defaultReparseOptions :: (TU: CXTranslationUnit) -> u32 #foreign libclang;

/**
* Reparse the source files that produced this translation unit.
*
* This routine can be used to re-parse the source files that originally
* created the given translation unit, for example because those source files
* have changed (either on disk or as passed via \p unsaved_files). The
* source code will be reparsed with the same command-line options as it
* was originally parsed.
*
* Reparsing a translation unit invalidates all cursors and source locations
* that refer into that translation unit. This makes reparsing a translation
* unit semantically equivalent to destroying the translation unit and then
* creating a new translation unit with the same command-line arguments.
* However, it may be more efficient to reparse a translation
* unit using this routine.
*
* \param TU The translation unit whose contents will be re-parsed. The
* translation unit must originally have been built with
* \c clang_createTranslationUnitFromSourceFile().
*
* \param num_unsaved_files The number of unsaved file entries in \p
* unsaved_files.
*
* \param unsaved_files The files that have not yet been saved to disk
* but may be required for parsing, including the contents of
* those files.  The contents and name of these files (as specified by
* CXUnsavedFile) are copied when necessary, so the client only needs to
* guarantee their validity until the call to this function returns.
*
* \param options A bitset of options composed of the flags in CXReparse_Flags.
* The function \c clang_defaultReparseOptions() produces a default set of
* options recommended for most uses, based on the translation unit.
*
* \returns 0 if the sources could be reparsed.  A non-zero error code will be
* returned if reparsing was impossible, such that the translation unit is
* invalid. In such cases, the only valid call for \c TU is
* \c clang_disposeTranslationUnit(TU).  The error codes returned by this
* routine are described by the \c CXErrorCode enum.
*/
clang_reparseTranslationUnit :: (TU: CXTranslationUnit, num_unsaved_files: u32, unsaved_files: *CXUnsavedFile, options: u32) -> s32 #foreign libclang;

/**
* Categorizes how memory is being used by a translation unit.
*/
CXTUResourceUsageKind :: enum u32 {
    AST                                :: 1;
    Identifiers                        :: 2;
    Selectors                          :: 3;
    GlobalCompletionResults            :: 4;
    SourceManagerContentCache          :: 5;
    AST_SideTables                     :: 6;
    SourceManager_Membuffer_Malloc     :: 7;
    SourceManager_Membuffer_MMap       :: 8;
    ExternalASTSource_Membuffer_Malloc :: 9;
    ExternalASTSource_Membuffer_MMap   :: 10;
    Preprocessor                       :: 11;
    PreprocessingRecord                :: 12;
    SourceManager_DataStructures       :: 13;
    Preprocessor_HeaderSearch          :: 14;
    MEMORY_IN_BYTES_BEGIN              :: 1;
    MEMORY_IN_BYTES_END                :: 14;
    First                              :: 1;
    Last                               :: 14;
}

/**
* Returns the human-readable null-terminated C string that represents
*  the name of the memory category.  This string should never be freed.
*/
clang_getTUResourceUsageName :: (kind: CXTUResourceUsageKind) -> *u8 #foreign libclang;

CXTUResourceUsageEntry :: struct {
    /* The memory usage category. */
    kind:   CXTUResourceUsageKind;
    /* Amount of resources used.
    The units will depend on the resource kind. */
    amount: u64;
}

/**
* The memory usage of a CXTranslationUnit, broken into categories.
*/
CXTUResourceUsage :: struct {
    /* Private data member, used for queries. */
    data:       *void;
    /* The number of entries in the 'entries' array. */
    numEntries: u32;
    /* An array of key-value pairs, representing the breakdown of memory
    usage. */
    entries:    *CXTUResourceUsageEntry;
}

/**
* Return the memory usage of a translation unit.  This object
*  should be released with clang_disposeCXTUResourceUsage().
*/
clang_getCXTUResourceUsage :: (TU: CXTranslationUnit) -> CXTUResourceUsage #foreign libclang;

clang_disposeCXTUResourceUsage :: (usage: CXTUResourceUsage) -> void #foreign libclang;

/**
* Get target information for this translation unit.
*
* The CXTargetInfo object cannot outlive the CXTranslationUnit object.
*/
clang_getTranslationUnitTargetInfo :: (CTUnit: CXTranslationUnit) -> CXTargetInfo #foreign libclang;

/**
* Destroy the CXTargetInfo object.
*/
clang_TargetInfo_dispose :: (Info: CXTargetInfo) -> void #foreign libclang;

/**
* Get the normalized target triple as a string.
*
* Returns the empty string in case of any error.
*/
clang_TargetInfo_getTriple :: (Info: CXTargetInfo) -> CXString #foreign libclang;

/**
* Get the pointer width of the target in bits.
*
* Returns -1 in case of error.
*/
clang_TargetInfo_getPointerWidth :: (Info: CXTargetInfo) -> s32 #foreign libclang;

/**
* Describes the kind of entity that a cursor refers to.
*/
CXCursorKind :: enum u32 {
    UnexposedDecl                                    :: 1;
    StructDecl                                       :: 2;
    UnionDecl                                        :: 3;
    ClassDecl                                        :: 4;
    EnumDecl                                         :: 5;
    FieldDecl                                        :: 6;
    EnumConstantDecl                                 :: 7;
    FunctionDecl                                     :: 8;
    VarDecl                                          :: 9;
    ParmDecl                                         :: 10;
    ObjCInterfaceDecl                                :: 11;
    ObjCCategoryDecl                                 :: 12;
    ObjCProtocolDecl                                 :: 13;
    ObjCPropertyDecl                                 :: 14;
    ObjCIvarDecl                                     :: 15;
    ObjCInstanceMethodDecl                           :: 16;
    ObjCClassMethodDecl                              :: 17;
    ObjCImplementationDecl                           :: 18;
    ObjCCategoryImplDecl                             :: 19;
    TypedefDecl                                      :: 20;
    CXXMethod                                        :: 21;
    Namespace                                        :: 22;
    LinkageSpec                                      :: 23;
    Constructor                                      :: 24;
    Destructor                                       :: 25;
    ConversionFunction                               :: 26;
    TemplateTypeParameter                            :: 27;
    NonTypeTemplateParameter                         :: 28;
    TemplateTemplateParameter                        :: 29;
    FunctionTemplate                                 :: 30;
    ClassTemplate                                    :: 31;
    ClassTemplatePartialSpecialization               :: 32;
    NamespaceAlias                                   :: 33;
    UsingDirective                                   :: 34;
    UsingDeclaration                                 :: 35;
    TypeAliasDecl                                    :: 36;
    ObjCSynthesizeDecl                               :: 37;
    ObjCDynamicDecl                                  :: 38;
    CXXAccessSpecifier                               :: 39;
    OverloadCandidate                                :: 700;
    ConceptDecl                                      :: 604;
    FriendDecl                                       :: 603;
    ObjCSuperClassRef                                :: 40;
    ObjCProtocolRef                                  :: 41;
    ObjCClassRef                                     :: 42;
    TypeRef                                          :: 43;
    CXXBaseSpecifier                                 :: 44;
    TemplateRef                                      :: 45;
    NamespaceRef                                     :: 46;
    MemberRef                                        :: 47;
    LabelRef                                         :: 48;
    OverloadedDeclRef                                :: 49;
    VariableRef                                      :: 50;
    StaticAssert                                     :: 602;
    TypeAliasTemplateDecl                            :: 601;
    InvalidFile                                      :: 70;
    NoDeclFound                                      :: 71;
    NotImplemented                                   :: 72;
    InvalidCode                                      :: 73;
    ModuleImportDecl                                 :: 600;
    InclusionDirective                               :: 503;
    UnexposedExpr                                    :: 100;
    DeclRefExpr                                      :: 101;
    MemberRefExpr                                    :: 102;
    CallExpr                                         :: 103;
    ObjCMessageExpr                                  :: 104;
    BlockExpr                                        :: 105;
    IntegerLiteral                                   :: 106;
    FloatingLiteral                                  :: 107;
    ImaginaryLiteral                                 :: 108;
    StringLiteral                                    :: 109;
    CharacterLiteral                                 :: 110;
    ParenExpr                                        :: 111;
    UnaryOperator                                    :: 112;
    ArraySubscriptExpr                               :: 113;
    BinaryOperator                                   :: 114;
    CompoundAssignOperator                           :: 115;
    ConditionalOperator                              :: 116;
    CStyleCastExpr                                   :: 117;
    CompoundLiteralExpr                              :: 118;
    InitListExpr                                     :: 119;
    AddrLabelExpr                                    :: 120;
    StmtExpr                                         :: 121;
    GenericSelectionExpr                             :: 122;
    GNUNullExpr                                      :: 123;
    CXXStaticCastExpr                                :: 124;
    CXXDynamicCastExpr                               :: 125;
    CXXReinterpretCastExpr                           :: 126;
    CXXConstCastExpr                                 :: 127;
    CXXFunctionalCastExpr                            :: 128;
    CXXTypeidExpr                                    :: 129;
    CXXBoolLiteralExpr                               :: 130;
    CXXNullPtrLiteralExpr                            :: 131;
    CXXThisExpr                                      :: 132;
    CXXThrowExpr                                     :: 133;
    CXXNewExpr                                       :: 134;
    CXXDeleteExpr                                    :: 135;
    UnaryExpr                                        :: 136;
    ObjCStringLiteral                                :: 137;
    ObjCEncodeExpr                                   :: 138;
    ObjCSelectorExpr                                 :: 139;
    ObjCProtocolExpr                                 :: 140;
    ObjCBridgedCastExpr                              :: 141;
    PackExpansionExpr                                :: 142;
    SizeOfPackExpr                                   :: 143;
    LambdaExpr                                       :: 144;
    ObjCBoolLiteralExpr                              :: 145;
    ObjCSelfExpr                                     :: 146;
    ArraySectionExpr                                 :: 147;
    ObjCAvailabilityCheckExpr                        :: 148;
    FixedPointLiteral                                :: 149;
    OMPArrayShapingExpr                              :: 150;
    OMPIteratorExpr                                  :: 151;
    CXXAddrspaceCastExpr                             :: 152;
    ConceptSpecializationExpr                        :: 153;
    RequiresExpr                                     :: 154;
    CXXParenListInitExpr                             :: 155;
    PackIndexingExpr                                 :: 156;
    MacroInstantiation                               :: 502;
    MacroExpansion                                   :: 502;
    UnexposedStmt                                    :: 200;
    LabelStmt                                        :: 201;
    CompoundStmt                                     :: 202;
    CaseStmt                                         :: 203;
    DefaultStmt                                      :: 204;
    IfStmt                                           :: 205;
    SwitchStmt                                       :: 206;
    WhileStmt                                        :: 207;
    DoStmt                                           :: 208;
    ForStmt                                          :: 209;
    GotoStmt                                         :: 210;
    IndirectGotoStmt                                 :: 211;
    ContinueStmt                                     :: 212;
    BreakStmt                                        :: 213;
    ReturnStmt                                       :: 214;
    GCCAsmStmt                                       :: 215;
    AsmStmt                                          :: 215;
    ObjCAtTryStmt                                    :: 216;
    ObjCAtCatchStmt                                  :: 217;
    ObjCAtFinallyStmt                                :: 218;
    ObjCAtThrowStmt                                  :: 219;
    ObjCAtSynchronizedStmt                           :: 220;
    ObjCAutoreleasePoolStmt                          :: 221;
    ObjCForCollectionStmt                            :: 222;
    CXXCatchStmt                                     :: 223;
    CXXTryStmt                                       :: 224;
    CXXForRangeStmt                                  :: 225;
    SEHTryStmt                                       :: 226;
    SEHExceptStmt                                    :: 227;
    SEHFinallyStmt                                   :: 228;
    MSAsmStmt                                        :: 229;
    NullStmt                                         :: 230;
    DeclStmt                                         :: 231;
    OMPParallelDirective                             :: 232;
    OMPSimdDirective                                 :: 233;
    OMPForDirective                                  :: 234;
    OMPSectionsDirective                             :: 235;
    OMPSectionDirective                              :: 236;
    OMPSingleDirective                               :: 237;
    OMPParallelForDirective                          :: 238;
    OMPParallelSectionsDirective                     :: 239;
    OMPTaskDirective                                 :: 240;
    OMPMasterDirective                               :: 241;
    OMPCriticalDirective                             :: 242;
    OMPTaskyieldDirective                            :: 243;
    OMPBarrierDirective                              :: 244;
    OMPTaskwaitDirective                             :: 245;
    OMPFlushDirective                                :: 246;
    SEHLeaveStmt                                     :: 247;
    OMPOrderedDirective                              :: 248;
    OMPAtomicDirective                               :: 249;
    OMPForSimdDirective                              :: 250;
    OMPParallelForSimdDirective                      :: 251;
    OMPTargetDirective                               :: 252;
    OMPTeamsDirective                                :: 253;
    OMPTaskgroupDirective                            :: 254;
    OMPCancellationPointDirective                    :: 255;
    OMPCancelDirective                               :: 256;
    OMPTargetDataDirective                           :: 257;
    OMPTaskLoopDirective                             :: 258;
    OMPTaskLoopSimdDirective                         :: 259;
    OMPDistributeDirective                           :: 260;
    OMPTargetEnterDataDirective                      :: 261;
    OMPTargetExitDataDirective                       :: 262;
    OMPTargetParallelDirective                       :: 263;
    OMPTargetParallelForDirective                    :: 264;
    OMPTargetUpdateDirective                         :: 265;
    OMPDistributeParallelForDirective                :: 266;
    OMPDistributeParallelForSimdDirective            :: 267;
    OMPDistributeSimdDirective                       :: 268;
    OMPTargetParallelForSimdDirective                :: 269;
    OMPTargetSimdDirective                           :: 270;
    OMPTeamsDistributeDirective                      :: 271;
    OMPTeamsDistributeSimdDirective                  :: 272;
    OMPTeamsDistributeParallelForSimdDirective       :: 273;
    OMPTeamsDistributeParallelForDirective           :: 274;
    OMPTargetTeamsDirective                          :: 275;
    OMPTargetTeamsDistributeDirective                :: 276;
    OMPTargetTeamsDistributeParallelForDirective     :: 277;
    OMPTargetTeamsDistributeParallelForSimdDirective :: 278;
    OMPTargetTeamsDistributeSimdDirective            :: 279;
    BuiltinBitCastExpr                               :: 280;
    OMPMasterTaskLoopDirective                       :: 281;
    OMPParallelMasterTaskLoopDirective               :: 282;
    OMPMasterTaskLoopSimdDirective                   :: 283;
    OMPParallelMasterTaskLoopSimdDirective           :: 284;
    OMPParallelMasterDirective                       :: 285;
    OMPDepobjDirective                               :: 286;
    OMPScanDirective                                 :: 287;
    OMPTileDirective                                 :: 288;
    OMPCanonicalLoop                                 :: 289;
    OMPInteropDirective                              :: 290;
    OMPDispatchDirective                             :: 291;
    OMPMaskedDirective                               :: 292;
    OMPUnrollDirective                               :: 293;
    OMPMetaDirective                                 :: 294;
    OMPGenericLoopDirective                          :: 295;
    OMPTeamsGenericLoopDirective                     :: 296;
    OMPTargetTeamsGenericLoopDirective               :: 297;
    OMPParallelGenericLoopDirective                  :: 298;
    OMPTargetParallelGenericLoopDirective            :: 299;
    OMPParallelMaskedDirective                       :: 300;
    OMPMaskedTaskLoopDirective                       :: 301;
    OMPMaskedTaskLoopSimdDirective                   :: 302;
    OMPParallelMaskedTaskLoopDirective               :: 303;
    OMPParallelMaskedTaskLoopSimdDirective           :: 304;
    OMPErrorDirective                                :: 305;
    OMPScopeDirective                                :: 306;
    OMPReverseDirective                              :: 307;
    OMPInterchangeDirective                          :: 308;
    OMPAssumeDirective                               :: 309;
    OMPStripeDirective                               :: 310;
    OMPFuseDirective                                 :: 311;
    OpenACCComputeConstruct                          :: 320;
    OpenACCLoopConstruct                             :: 321;
    OpenACCCombinedConstruct                         :: 322;
    OpenACCDataConstruct                             :: 323;
    OpenACCEnterDataConstruct                        :: 324;
    OpenACCExitDataConstruct                         :: 325;
    OpenACCHostDataConstruct                         :: 326;
    OpenACCWaitConstruct                             :: 327;
    OpenACCInitConstruct                             :: 328;
    OpenACCShutdownConstruct                         :: 329;
    OpenACCSetConstruct                              :: 330;
    OpenACCUpdateConstruct                           :: 331;
    OpenACCAtomicConstruct                           :: 332;
    OpenACCCacheConstruct                            :: 333;
    MacroDefinition                                  :: 501;
    TranslationUnit                                  :: 350;
    PreprocessingDirective                           :: 500;
    UnexposedAttr                                    :: 400;
    IBActionAttr                                     :: 401;
    IBOutletAttr                                     :: 402;
    IBOutletCollectionAttr                           :: 403;
    CXXFinalAttr                                     :: 404;
    CXXOverrideAttr                                  :: 405;
    AnnotateAttr                                     :: 406;
    AsmLabelAttr                                     :: 407;
    PackedAttr                                       :: 408;
    PureAttr                                         :: 409;
    ConstAttr                                        :: 410;
    NoDuplicateAttr                                  :: 411;
    CUDAConstantAttr                                 :: 412;
    CUDADeviceAttr                                   :: 413;
    CUDAGlobalAttr                                   :: 414;
    CUDAHostAttr                                     :: 415;
    CUDASharedAttr                                   :: 416;
    VisibilityAttr                                   :: 417;
    DLLExport                                        :: 418;
    DLLImport                                        :: 419;
    NSReturnsRetained                                :: 420;
    NSReturnsNotRetained                             :: 421;
    NSReturnsAutoreleased                            :: 422;
    NSConsumesSelf                                   :: 423;
    NSConsumed                                       :: 424;
    ObjCException                                    :: 425;
    ObjCNSObject                                     :: 426;
    ObjCIndependentClass                             :: 427;
    ObjCPreciseLifetime                              :: 428;
    ObjCReturnsInnerPointer                          :: 429;
    ObjCRequiresSuper                                :: 430;
    ObjCRootClass                                    :: 431;
    ObjCSubclassingRestricted                        :: 432;
    ObjCExplicitProtocolImpl                         :: 433;
    ObjCDesignatedInitializer                        :: 434;
    ObjCRuntimeVisible                               :: 435;
    ObjCBoxable                                      :: 436;
    FlagEnum                                         :: 437;
    ConvergentAttr                                   :: 438;
    WarnUnusedAttr                                   :: 439;
    WarnUnusedResultAttr                             :: 440;
    AlignedAttr                                      :: 441;
    FirstDecl                                        :: 1;
    LastDecl                                         :: 39;
    LastExtraDecl                                    :: 604;
    FirstExtraDecl                                   :: 600;
    FirstRef                                         :: 40;
    LastRef                                          :: 50;
    FirstInvalid                                     :: 70;
    LastInvalid                                      :: 73;
    FirstExpr                                        :: 100;
    LastPreprocessing                                :: 503;
    FirstPreprocessing                               :: 500;
    LastExpr                                         :: 156;
    FirstStmt                                        :: 200;
    LastStmt                                         :: 333;
    FirstAttr                                        :: 400;
    LastAttr                                         :: 441;
}

/**
* A cursor representing some element in the abstract syntax tree for
* a translation unit.
*
* The cursor abstraction unifies the different kinds of entities in a
* program--declaration, statements, expressions, references to declarations,
* etc.--under a single "cursor" abstraction with a common set of operations.
* Common operation for a cursor include: getting the physical location in
* a source file where the cursor points, getting the name associated with a
* cursor, and retrieving cursors for any child nodes of a particular cursor.
*
* Cursors can be produced in two specific ways.
* clang_getTranslationUnitCursor() produces a cursor for a translation unit,
* from which one can use clang_visitChildren() to explore the rest of the
* translation unit. clang_getCursor() maps from a physical source location
* to the entity that resides at that location, allowing one to map from the
* source code into the AST.
*/
CXCursor :: struct {
    kind:  CXCursorKind;
    xdata: s32;
    data:  [3] *void;
}

/**
* Retrieve the NULL cursor, which represents no entity.
*/
clang_getNullCursor :: () -> CXCursor #foreign libclang;

/**
* Retrieve the cursor that represents the given translation unit.
*
* The translation unit cursor can be used to start traversing the
* various declarations within the given translation unit.
*/
clang_getTranslationUnitCursor :: (unknown0: CXTranslationUnit) -> CXCursor #foreign libclang;

/**
* Determine whether two cursors are equivalent.
*/
clang_equalCursors :: (unknown0: CXCursor, unknown1: CXCursor) -> u32 #foreign libclang;

/**
* Returns non-zero if \p cursor is null.
*/
clang_Cursor_isNull :: (cursor: CXCursor) -> s32 #foreign libclang;

/**
* Compute a hash value for the given cursor.
*/
clang_hashCursor :: (unknown0: CXCursor) -> u32 #foreign libclang;

/**
* Retrieve the kind of the given cursor.
*/
clang_getCursorKind :: (unknown0: CXCursor) -> CXCursorKind #foreign libclang;

/**
* Determine whether the given cursor kind represents a declaration.
*/
clang_isDeclaration :: (unknown0: CXCursorKind) -> u32 #foreign libclang;

/**
* Determine whether the given declaration is invalid.
*
* A declaration is invalid if it could not be parsed successfully.
*
* \returns non-zero if the cursor represents a declaration and it is
* invalid, otherwise NULL.
*/
clang_isInvalidDeclaration :: (unknown0: CXCursor) -> u32 #foreign libclang;

/**
* Determine whether the given cursor kind represents a simple
* reference.
*
* Note that other kinds of cursors (such as expressions) can also refer to
* other cursors. Use clang_getCursorReferenced() to determine whether a
* particular cursor refers to another entity.
*/
clang_isReference :: (unknown0: CXCursorKind) -> u32 #foreign libclang;

/**
* Determine whether the given cursor kind represents an expression.
*/
clang_isExpression :: (unknown0: CXCursorKind) -> u32 #foreign libclang;

/**
* Determine whether the given cursor kind represents a statement.
*/
clang_isStatement :: (unknown0: CXCursorKind) -> u32 #foreign libclang;

/**
* Determine whether the given cursor kind represents an attribute.
*/
clang_isAttribute :: (unknown0: CXCursorKind) -> u32 #foreign libclang;

/**
* Determine whether the given cursor has any attributes.
*/
clang_Cursor_hasAttrs :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine whether the given cursor kind represents an invalid
* cursor.
*/
clang_isInvalid :: (unknown0: CXCursorKind) -> u32 #foreign libclang;

/**
* Determine whether the given cursor kind represents a translation
* unit.
*/
clang_isTranslationUnit :: (unknown0: CXCursorKind) -> u32 #foreign libclang;

/***
* Determine whether the given cursor represents a preprocessing
* element, such as a preprocessor directive or macro instantiation.
*/
clang_isPreprocessing :: (unknown0: CXCursorKind) -> u32 #foreign libclang;

/***
* Determine whether the given cursor represents a currently
*  unexposed piece of the AST (e.g., CXCursor_UnexposedStmt).
*/
clang_isUnexposed :: (unknown0: CXCursorKind) -> u32 #foreign libclang;

/**
* Describe the linkage of the entity referred to by a cursor.
*/
CXLinkageKind :: enum u32 {
    Invalid        :: 0;
    NoLinkage      :: 1;
    Internal       :: 2;
    UniqueExternal :: 3;
    External       :: 4;
}

/**
* Determine the linkage of the entity referred to by a given cursor.
*/
clang_getCursorLinkage :: (cursor: CXCursor) -> CXLinkageKind #foreign libclang;

CXVisibilityKind :: enum u32 {
    Invalid   :: 0;
    Hidden    :: 1;
    Protected :: 2;
    Default   :: 3;
}

/**
* Describe the visibility of the entity referred to by a cursor.
*
* This returns the default visibility if not explicitly specified by
* a visibility attribute. The default visibility may be changed by
* commandline arguments.
*
* \param cursor The cursor to query.
*
* \returns The visibility of the cursor.
*/
clang_getCursorVisibility :: (cursor: CXCursor) -> CXVisibilityKind #foreign libclang;

/**
* Determine the availability of the entity that this cursor refers to,
* taking the current target platform into account.
*
* \param cursor The cursor to query.
*
* \returns The availability of the cursor.
*/
clang_getCursorAvailability :: (cursor: CXCursor) -> CXAvailabilityKind #foreign libclang;

/**
* Describes the availability of a given entity on a particular platform, e.g.,
* a particular class might only be available on Mac OS 10.7 or newer.
*/
CXPlatformAvailability :: struct {
    /**
    * A string that describes the platform for which this structure
    * provides availability information.
    *
    * Possible values are "ios" or "macos".
    */
    Platform:    CXString;
    /**
    * The version number in which this entity was introduced.
    */
    Introduced:  CXVersion;
    /**
    * The version number in which this entity was deprecated (but is
    * still available).
    */
    Deprecated:  CXVersion;
    /**
    * The version number in which this entity was obsoleted, and therefore
    * is no longer available.
    */
    Obsoleted:   CXVersion;
    /**
    * Whether the entity is unconditionally unavailable on this platform.
    */
    Unavailable: s32;
    /**
    * An optional message to provide to a user of this API, e.g., to
    * suggest replacement APIs.
    */
    Message:     CXString;
}

/**
* Determine the availability of the entity that this cursor refers to
* on any platforms for which availability information is known.
*
* \param cursor The cursor to query.
*
* \param always_deprecated If non-NULL, will be set to indicate whether the
* entity is deprecated on all platforms.
*
* \param deprecated_message If non-NULL, will be set to the message text
* provided along with the unconditional deprecation of this entity. The client
* is responsible for deallocating this string.
*
* \param always_unavailable If non-NULL, will be set to indicate whether the
* entity is unavailable on all platforms.
*
* \param unavailable_message If non-NULL, will be set to the message text
* provided along with the unconditional unavailability of this entity. The
* client is responsible for deallocating this string.
*
* \param availability If non-NULL, an array of CXPlatformAvailability instances
* that will be populated with platform availability information, up to either
* the number of platforms for which availability information is available (as
* returned by this function) or \c availability_size, whichever is smaller.
*
* \param availability_size The number of elements available in the
* \c availability array.
*
* \returns The number of platforms (N) for which availability information is
* available (which is unrelated to \c availability_size).
*
* Note that the client is responsible for calling
* \c clang_disposeCXPlatformAvailability to free each of the
* platform-availability structures returned. There are
* \c min(N, availability_size) such structures.
*/
clang_getCursorPlatformAvailability :: (cursor: CXCursor, always_deprecated: *s32, deprecated_message: *CXString, always_unavailable: *s32, unavailable_message: *CXString, availability: *CXPlatformAvailability, availability_size: s32) -> s32 #foreign libclang;

/**
* Free the memory associated with a \c CXPlatformAvailability structure.
*/
clang_disposeCXPlatformAvailability :: (availability: *CXPlatformAvailability) -> void #foreign libclang;

/**
* If cursor refers to a variable declaration and it has initializer returns
* cursor referring to the initializer otherwise return null cursor.
*/
clang_Cursor_getVarDeclInitializer :: (cursor: CXCursor) -> CXCursor #foreign libclang;

/**
* Describe the "language" of the entity referred to by a cursor.
*/
CXLanguageKind :: enum u32 {
    Invalid   :: 0;
    C         :: 1;
    ObjC      :: 2;
    CPlusPlus :: 3;
}

/**
* Determine the "language" of the entity referred to by a given cursor.
*/
clang_getCursorLanguage :: (cursor: CXCursor) -> CXLanguageKind #foreign libclang;

/**
* Describe the "thread-local storage (TLS) kind" of the declaration
* referred to by a cursor.
*/
CXTLSKind :: enum u32 {
    None    :: 0;
    Dynamic :: 1;
    Static  :: 2;
}

/**
* Determine the "thread-local storage (TLS) kind" of the declaration
* referred to by a cursor.
*/
clang_getCursorTLSKind :: (cursor: CXCursor) -> CXTLSKind #foreign libclang;

/**
* Returns the translation unit that a cursor originated from.
*/
clang_Cursor_getTranslationUnit :: (unknown0: CXCursor) -> CXTranslationUnit #foreign libclang;

CXCursorSetImpl :: struct {}
/**
* A fast container representing a set of CXCursors.
*/
CXCursorSet :: *CXCursorSetImpl;

/**
* Creates an empty CXCursorSet.
*/
clang_createCXCursorSet :: () -> CXCursorSet #foreign libclang;

/**
* Disposes a CXCursorSet and releases its associated memory.
*/
clang_disposeCXCursorSet :: (cset: CXCursorSet) -> void #foreign libclang;

/**
* Queries a CXCursorSet to see if it contains a specific CXCursor.
*
* \returns non-zero if the set contains the specified cursor.
*/
clang_CXCursorSet_contains :: (cset: CXCursorSet, cursor: CXCursor) -> u32 #foreign libclang;

/**
* Inserts a CXCursor into a CXCursorSet.
*
* \returns zero if the CXCursor was already in the set, and non-zero otherwise.
*/
clang_CXCursorSet_insert :: (cset: CXCursorSet, cursor: CXCursor) -> u32 #foreign libclang;

/**
* Determine the semantic parent of the given cursor.
*
* The semantic parent of a cursor is the cursor that semantically contains
* the given \p cursor. For many declarations, the lexical and semantic parents
* are equivalent (the lexical parent is returned by
* \c clang_getCursorLexicalParent()). They diverge when declarations or
* definitions are provided out-of-line. For example:
*
* \code
* class C {
*  void f();
* };
*
* void C::f() { }
* \endcode
*
* In the out-of-line definition of \c C::f, the semantic parent is
* the class \c C, of which this function is a member. The lexical parent is
* the place where the declaration actually occurs in the source code; in this
* case, the definition occurs in the translation unit. In general, the
* lexical parent for a given entity can change without affecting the semantics
* of the program, and the lexical parent of different declarations of the
* same entity may be different. Changing the semantic parent of a declaration,
* on the other hand, can have a major impact on semantics, and redeclarations
* of a particular entity should all have the same semantic context.
*
* In the example above, both declarations of \c C::f have \c C as their
* semantic context, while the lexical context of the first \c C::f is \c C
* and the lexical context of the second \c C::f is the translation unit.
*
* For global declarations, the semantic parent is the translation unit.
*/
clang_getCursorSemanticParent :: (cursor: CXCursor) -> CXCursor #foreign libclang;

/**
* Determine the lexical parent of the given cursor.
*
* The lexical parent of a cursor is the cursor in which the given \p cursor
* was actually written. For many declarations, the lexical and semantic parents
* are equivalent (the semantic parent is returned by
* \c clang_getCursorSemanticParent()). They diverge when declarations or
* definitions are provided out-of-line. For example:
*
* \code
* class C {
*  void f();
* };
*
* void C::f() { }
* \endcode
*
* In the out-of-line definition of \c C::f, the semantic parent is
* the class \c C, of which this function is a member. The lexical parent is
* the place where the declaration actually occurs in the source code; in this
* case, the definition occurs in the translation unit. In general, the
* lexical parent for a given entity can change without affecting the semantics
* of the program, and the lexical parent of different declarations of the
* same entity may be different. Changing the semantic parent of a declaration,
* on the other hand, can have a major impact on semantics, and redeclarations
* of a particular entity should all have the same semantic context.
*
* In the example above, both declarations of \c C::f have \c C as their
* semantic context, while the lexical context of the first \c C::f is \c C
* and the lexical context of the second \c C::f is the translation unit.
*
* For declarations written in the global scope, the lexical parent is
* the translation unit.
*/
clang_getCursorLexicalParent :: (cursor: CXCursor) -> CXCursor #foreign libclang;

/**
* Determine the set of methods that are overridden by the given
* method.
*
* In both Objective-C and C++, a method (aka virtual member function,
* in C++) can override a virtual method in a base class. For
* Objective-C, a method is said to override any method in the class's
* base class, its protocols, or its categories' protocols, that has the same
* selector and is of the same kind (class or instance).
* If no such method exists, the search continues to the class's superclass,
* its protocols, and its categories, and so on. A method from an Objective-C
* implementation is considered to override the same methods as its
* corresponding method in the interface.
*
* For C++, a virtual member function overrides any virtual member
* function with the same signature that occurs in its base
* classes. With multiple inheritance, a virtual member function can
* override several virtual member functions coming from different
* base classes.
*
* In all cases, this function determines the immediate overridden
* method, rather than all of the overridden methods. For example, if
* a method is originally declared in a class A, then overridden in B
* (which in inherits from A) and also in C (which inherited from B),
* then the only overridden method returned from this function when
* invoked on C's method will be B's method. The client may then
* invoke this function again, given the previously-found overridden
* methods, to map out the complete method-override set.
*
* \param cursor A cursor representing an Objective-C or C++
* method. This routine will compute the set of methods that this
* method overrides.
*
* \param overridden A pointer whose pointee will be replaced with a
* pointer to an array of cursors, representing the set of overridden
* methods. If there are no overridden methods, the pointee will be
* set to NULL. The pointee must be freed via a call to
* \c clang_disposeOverriddenCursors().
*
* \param num_overridden A pointer to the number of overridden
* functions, will be set to the number of overridden functions in the
* array pointed to by \p overridden.
*/
clang_getOverriddenCursors :: (cursor: CXCursor, overridden: **CXCursor, num_overridden: *u32) -> void #foreign libclang;

/**
* Free the set of overridden cursors returned by \c
* clang_getOverriddenCursors().
*/
clang_disposeOverriddenCursors :: (overridden: *CXCursor) -> void #foreign libclang;

/**
* Retrieve the file that is included by the given inclusion directive
* cursor.
*/
clang_getIncludedFile :: (cursor: CXCursor) -> CXFile #foreign libclang;

/**
* Map a source location to the cursor that describes the entity at that
* location in the source code.
*
* clang_getCursor() maps an arbitrary source location within a translation
* unit down to the most specific cursor that describes the entity at that
* location. For example, given an expression \c x + y, invoking
* clang_getCursor() with a source location pointing to "x" will return the
* cursor for "x"; similarly for "y". If the cursor points anywhere between
* "x" or "y" (e.g., on the + or the whitespace around it), clang_getCursor()
* will return a cursor referring to the "+" expression.
*
* \returns a cursor representing the entity at the given source location, or
* a NULL cursor if no such entity can be found.
*/
clang_getCursor :: (unknown0: CXTranslationUnit, unknown1: CXSourceLocation) -> CXCursor #foreign libclang;

/**
* Retrieve the physical location of the source constructor referenced
* by the given cursor.
*
* The location of a declaration is typically the location of the name of that
* declaration, where the name of that declaration would occur if it is
* unnamed, or some keyword that introduces that particular declaration.
* The location of a reference is where that reference occurs within the
* source code.
*/
clang_getCursorLocation :: (unknown0: CXCursor) -> CXSourceLocation #foreign libclang;

/**
* Retrieve the physical extent of the source construct referenced by
* the given cursor.
*
* The extent of a cursor starts with the file/line/column pointing at the
* first character within the source construct that the cursor refers to and
* ends with the last character within that source construct. For a
* declaration, the extent covers the declaration itself. For a reference,
* the extent covers the location of the reference (e.g., where the referenced
* entity was actually used).
*/
clang_getCursorExtent :: (unknown0: CXCursor) -> CXSourceRange #foreign libclang;

/**
* Describes the kind of type
*/
CXTypeKind :: enum u32 {
    Invalid                                              :: 0;
    Unexposed                                            :: 1;
    Void                                                 :: 2;
    Bool                                                 :: 3;
    Char_U                                               :: 4;
    UChar                                                :: 5;
    Char16                                               :: 6;
    Char32                                               :: 7;
    UShort                                               :: 8;
    UInt                                                 :: 9;
    ULong                                                :: 10;
    ULongLong                                            :: 11;
    UInt128                                              :: 12;
    Char_S                                               :: 13;
    SChar                                                :: 14;
    WChar                                                :: 15;
    Short                                                :: 16;
    Int                                                  :: 17;
    Long                                                 :: 18;
    LongLong                                             :: 19;
    Int128                                               :: 20;
    Float                                                :: 21;
    Double                                               :: 22;
    LongDouble                                           :: 23;
    NullPtr                                              :: 24;
    Overload                                             :: 25;
    Dependent                                            :: 26;
    ObjCId                                               :: 27;
    ObjCClass                                            :: 28;
    ObjCSel                                              :: 29;
    Float128                                             :: 30;
    Half                                                 :: 31;
    Float16                                              :: 32;
    ShortAccum                                           :: 33;
    Accum                                                :: 34;
    LongAccum                                            :: 35;
    UShortAccum                                          :: 36;
    UAccum                                               :: 37;
    ULongAccum                                           :: 38;
    BFloat16                                             :: 39;
    Ibm128                                               :: 40;
    HLSLInlineSpirv                                      :: 181;
    HLSLAttributedResource                               :: 180;
    Complex                                              :: 100;
    Pointer                                              :: 101;
    BlockPointer                                         :: 102;
    LValueReference                                      :: 103;
    RValueReference                                      :: 104;
    Record                                               :: 105;
    Enum                                                 :: 106;
    Typedef                                              :: 107;
    ObjCInterface                                        :: 108;
    ObjCObjectPointer                                    :: 109;
    FunctionNoProto                                      :: 110;
    FunctionProto                                        :: 111;
    ConstantArray                                        :: 112;
    Vector                                               :: 113;
    IncompleteArray                                      :: 114;
    VariableArray                                        :: 115;
    DependentSizedArray                                  :: 116;
    MemberPointer                                        :: 117;
    Auto                                                 :: 118;
    Elaborated                                           :: 119;
    Pipe                                                 :: 120;
    OCLImage1dRO                                         :: 121;
    OCLImage1dArrayRO                                    :: 122;
    OCLImage1dBufferRO                                   :: 123;
    OCLImage2dRO                                         :: 124;
    OCLImage2dArrayRO                                    :: 125;
    OCLImage2dDepthRO                                    :: 126;
    OCLImage2dArrayDepthRO                               :: 127;
    OCLImage2dMSAARO                                     :: 128;
    OCLImage2dArrayMSAARO                                :: 129;
    OCLImage2dMSAADepthRO                                :: 130;
    OCLImage2dArrayMSAADepthRO                           :: 131;
    OCLImage3dRO                                         :: 132;
    OCLImage1dWO                                         :: 133;
    OCLImage1dArrayWO                                    :: 134;
    OCLImage1dBufferWO                                   :: 135;
    OCLImage2dWO                                         :: 136;
    OCLImage2dArrayWO                                    :: 137;
    OCLImage2dDepthWO                                    :: 138;
    OCLImage2dArrayDepthWO                               :: 139;
    OCLImage2dMSAAWO                                     :: 140;
    OCLImage2dArrayMSAAWO                                :: 141;
    OCLImage2dMSAADepthWO                                :: 142;
    OCLImage2dArrayMSAADepthWO                           :: 143;
    OCLImage3dWO                                         :: 144;
    OCLImage1dRW                                         :: 145;
    OCLImage1dArrayRW                                    :: 146;
    OCLImage1dBufferRW                                   :: 147;
    OCLImage2dRW                                         :: 148;
    OCLImage2dArrayRW                                    :: 149;
    OCLImage2dDepthRW                                    :: 150;
    OCLImage2dArrayDepthRW                               :: 151;
    OCLImage2dMSAARW                                     :: 152;
    OCLImage2dArrayMSAARW                                :: 153;
    OCLImage2dMSAADepthRW                                :: 154;
    OCLImage2dArrayMSAADepthRW                           :: 155;
    OCLImage3dRW                                         :: 156;
    OCLSampler                                           :: 157;
    OCLEvent                                             :: 158;
    OCLQueue                                             :: 159;
    OCLReserveID                                         :: 160;
    ObjCObject                                           :: 161;
    ObjCTypeParam                                        :: 162;
    Attributed                                           :: 163;
    OCLIntelSubgroupAVCMcePayload                        :: 164;
    OCLIntelSubgroupAVCImePayload                        :: 165;
    OCLIntelSubgroupAVCRefPayload                        :: 166;
    OCLIntelSubgroupAVCSicPayload                        :: 167;
    OCLIntelSubgroupAVCMceResult                         :: 168;
    OCLIntelSubgroupAVCImeResult                         :: 169;
    OCLIntelSubgroupAVCRefResult                         :: 170;
    OCLIntelSubgroupAVCSicResult                         :: 171;
    OCLIntelSubgroupAVCImeResultSingleReferenceStreamout :: 172;
    OCLIntelSubgroupAVCImeResultDualReferenceStreamout   :: 173;
    OCLIntelSubgroupAVCImeSingleReferenceStreamin        :: 174;
    OCLIntelSubgroupAVCImeDualReferenceStreamin          :: 175;
    OCLIntelSubgroupAVCImeResultSingleRefStreamout       :: 172;
    OCLIntelSubgroupAVCImeResultDualRefStreamout         :: 173;
    OCLIntelSubgroupAVCImeSingleRefStreamin              :: 174;
    OCLIntelSubgroupAVCImeDualRefStreamin                :: 175;
    ExtVector                                            :: 176;
    Atomic                                               :: 177;
    BTFTagAttributed                                     :: 178;
    HLSLResource                                         :: 179;
    FirstBuiltin                                         :: 2;
    LastBuiltin                                          :: 40;
}

/**
* Describes the calling convention of a function type
*/
CXCallingConv :: enum u32 {
    Default            :: 0;
    C                  :: 1;
    X86StdCall         :: 2;
    X86FastCall        :: 3;
    X86ThisCall        :: 4;
    X86Pascal          :: 5;
    AAPCS              :: 6;
    AAPCS_VFP          :: 7;
    X86RegCall         :: 8;
    IntelOclBicc       :: 9;
    Win64              :: 10;
    X86_64Win64        :: 10;
    X86_64SysV         :: 11;
    X86VectorCall      :: 12;
    Swift              :: 13;
    PreserveMost       :: 14;
    PreserveAll        :: 15;
    AArch64VectorCall  :: 16;
    SwiftAsync         :: 17;
    AArch64SVEPCS      :: 18;
    M68kRTD            :: 19;
    PreserveNone       :: 20;
    RISCVVectorCall    :: 21;
    RISCVVLSCall_32    :: 22;
    RISCVVLSCall_64    :: 23;
    RISCVVLSCall_128   :: 24;
    RISCVVLSCall_256   :: 25;
    RISCVVLSCall_512   :: 26;
    RISCVVLSCall_1024  :: 27;
    RISCVVLSCall_2048  :: 28;
    RISCVVLSCall_4096  :: 29;
    RISCVVLSCall_8192  :: 30;
    RISCVVLSCall_16384 :: 31;
    RISCVVLSCall_32768 :: 32;
    RISCVVLSCall_65536 :: 33;
    Invalid            :: 100;
    Unexposed          :: 200;
}

/**
* The type of an element in the abstract syntax tree.
*
*/
CXType :: struct {
    kind: CXTypeKind;
    data: [2] *void;
}

/**
* Retrieve the type of a CXCursor (if any).
*/
clang_getCursorType :: (C: CXCursor) -> CXType #foreign libclang;

/**
* Pretty-print the underlying type using the rules of the
* language of the translation unit from which it came.
*
* If the type is invalid, an empty string is returned.
*/
clang_getTypeSpelling :: (CT: CXType) -> CXString #foreign libclang;

/**
* Retrieve the underlying type of a typedef declaration.
*
* If the cursor does not reference a typedef declaration, an invalid type is
* returned.
*/
clang_getTypedefDeclUnderlyingType :: (C: CXCursor) -> CXType #foreign libclang;

/**
* Retrieve the integer type of an enum declaration.
*
* If the cursor does not reference an enum declaration, an invalid type is
* returned.
*/
clang_getEnumDeclIntegerType :: (C: CXCursor) -> CXType #foreign libclang;

/**
* Retrieve the integer value of an enum constant declaration as a signed
*  long long.
*
* If the cursor does not reference an enum constant declaration, LLONG_MIN is
* returned. Since this is also potentially a valid constant value, the kind of
* the cursor must be verified before calling this function.
*/
clang_getEnumConstantDeclValue :: (C: CXCursor) -> s64 #foreign libclang;

/**
* Retrieve the integer value of an enum constant declaration as an unsigned
*  long long.
*
* If the cursor does not reference an enum constant declaration, ULLONG_MAX is
* returned. Since this is also potentially a valid constant value, the kind of
* the cursor must be verified before calling this function.
*/
clang_getEnumConstantDeclUnsignedValue :: (C: CXCursor) -> u64 #foreign libclang;

/**
* Returns non-zero if the cursor specifies a Record member that is a bit-field.
*/
clang_Cursor_isBitField :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Retrieve the bit width of a bit-field declaration as an integer.
*
* If the cursor does not reference a bit-field, or if the bit-field's width
* expression cannot be evaluated, -1 is returned.
*
* For example:
* \code
* if (clang_Cursor_isBitField(Cursor)) {
*   int Width = clang_getFieldDeclBitWidth(Cursor);
*   if (Width != -1) {
*     // The bit-field width is not value-dependent.
*   }
* }
* \endcode
*/
clang_getFieldDeclBitWidth :: (C: CXCursor) -> s32 #foreign libclang;

/**
* Retrieve the number of non-variadic arguments associated with a given
* cursor.
*
* The number of arguments can be determined for calls as well as for
* declarations of functions or methods. For other cursors -1 is returned.
*/
clang_Cursor_getNumArguments :: (C: CXCursor) -> s32 #foreign libclang;

/**
* Retrieve the argument cursor of a function or method.
*
* The argument cursor can be determined for calls as well as for declarations
* of functions or methods. For other cursors and for invalid indices, an
* invalid cursor is returned.
*/
clang_Cursor_getArgument :: (C: CXCursor, i: u32) -> CXCursor #foreign libclang;

/**
* Describes the kind of a template argument.
*
* See the definition of llvm::clang::TemplateArgument::ArgKind for full
* element descriptions.
*/
CXTemplateArgumentKind :: enum u32 {
    Null              :: 0;
    Type              :: 1;
    Declaration       :: 2;
    NullPtr           :: 3;
    Integral          :: 4;
    Template          :: 5;
    TemplateExpansion :: 6;
    Expression        :: 7;
    Pack              :: 8;
    Invalid           :: 9;
}

/**
* Returns the number of template args of a function, struct, or class decl
* representing a template specialization.
*
* If the argument cursor cannot be converted into a template function
* declaration, -1 is returned.
*
* For example, for the following declaration and specialization:
*   template <typename T, int kInt, bool kBool>
*   void foo() { ... }
*
*   template <>
*   void foo<float, -7, true>();
*
* The value 3 would be returned from this call.
*/
clang_Cursor_getNumTemplateArguments :: (C: CXCursor) -> s32 #foreign libclang;

/**
* Retrieve the kind of the I'th template argument of the CXCursor C.
*
* If the argument CXCursor does not represent a FunctionDecl, StructDecl, or
* ClassTemplatePartialSpecialization, an invalid template argument kind is
* returned.
*
* For example, for the following declaration and specialization:
*   template <typename T, int kInt, bool kBool>
*   void foo() { ... }
*
*   template <>
*   void foo<float, -7, true>();
*
* For I = 0, 1, and 2, Type, Integral, and Integral will be returned,
* respectively.
*/
clang_Cursor_getTemplateArgumentKind :: (C: CXCursor, I: u32) -> CXTemplateArgumentKind #foreign libclang;

/**
* Retrieve a CXType representing the type of a TemplateArgument of a
*  function decl representing a template specialization.
*
* If the argument CXCursor does not represent a FunctionDecl, StructDecl,
* ClassDecl or ClassTemplatePartialSpecialization whose I'th template argument
* has a kind of CXTemplateArgKind_Integral, an invalid type is returned.
*
* For example, for the following declaration and specialization:
*   template <typename T, int kInt, bool kBool>
*   void foo() { ... }
*
*   template <>
*   void foo<float, -7, true>();
*
* If called with I = 0, "float", will be returned.
* Invalid types will be returned for I == 1 or 2.
*/
clang_Cursor_getTemplateArgumentType :: (C: CXCursor, I: u32) -> CXType #foreign libclang;

/**
* Retrieve the value of an Integral TemplateArgument (of a function
*  decl representing a template specialization) as a signed long long.
*
* It is undefined to call this function on a CXCursor that does not represent a
* FunctionDecl, StructDecl, ClassDecl or ClassTemplatePartialSpecialization
* whose I'th template argument is not an integral value.
*
* For example, for the following declaration and specialization:
*   template <typename T, int kInt, bool kBool>
*   void foo() { ... }
*
*   template <>
*   void foo<float, -7, true>();
*
* If called with I = 1 or 2, -7 or true will be returned, respectively.
* For I == 0, this function's behavior is undefined.
*/
clang_Cursor_getTemplateArgumentValue :: (C: CXCursor, I: u32) -> s64 #foreign libclang;

/**
* Retrieve the value of an Integral TemplateArgument (of a function
*  decl representing a template specialization) as an unsigned long long.
*
* It is undefined to call this function on a CXCursor that does not represent a
* FunctionDecl, StructDecl, ClassDecl or ClassTemplatePartialSpecialization or
* whose I'th template argument is not an integral value.
*
* For example, for the following declaration and specialization:
*   template <typename T, int kInt, bool kBool>
*   void foo() { ... }
*
*   template <>
*   void foo<float, 2147483649, true>();
*
* If called with I = 1 or 2, 2147483649 or true will be returned, respectively.
* For I == 0, this function's behavior is undefined.
*/
clang_Cursor_getTemplateArgumentUnsignedValue :: (C: CXCursor, I: u32) -> u64 #foreign libclang;

/**
* Determine whether two CXTypes represent the same type.
*
* \returns non-zero if the CXTypes represent the same type and
*          zero otherwise.
*/
clang_equalTypes :: (A: CXType, B: CXType) -> u32 #foreign libclang;

/**
* Return the canonical type for a CXType.
*
* Clang's type system explicitly models typedefs and all the ways
* a specific type can be represented.  The canonical type is the underlying
* type with all the "sugar" removed.  For example, if 'T' is a typedef
* for 'int', the canonical type for 'T' would be 'int'.
*/
clang_getCanonicalType :: (T: CXType) -> CXType #foreign libclang;

/**
* Determine whether a CXType has the "const" qualifier set,
* without looking through typedefs that may have added "const" at a
* different level.
*/
clang_isConstQualifiedType :: (T: CXType) -> u32 #foreign libclang;

/**
* Determine whether a  CXCursor that is a macro, is
* function like.
*/
clang_Cursor_isMacroFunctionLike :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine whether a  CXCursor that is a macro, is a
* builtin one.
*/
clang_Cursor_isMacroBuiltin :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine whether a  CXCursor that is a function declaration, is an
* inline declaration.
*/
clang_Cursor_isFunctionInlined :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine whether a CXType has the "volatile" qualifier set,
* without looking through typedefs that may have added "volatile" at
* a different level.
*/
clang_isVolatileQualifiedType :: (T: CXType) -> u32 #foreign libclang;

/**
* Determine whether a CXType has the "restrict" qualifier set,
* without looking through typedefs that may have added "restrict" at a
* different level.
*/
clang_isRestrictQualifiedType :: (T: CXType) -> u32 #foreign libclang;

/**
* Returns the address space of the given type.
*/
clang_getAddressSpace :: (T: CXType) -> u32 #foreign libclang;

/**
* Returns the typedef name of the given type.
*/
clang_getTypedefName :: (CT: CXType) -> CXString #foreign libclang;

/**
* For pointer types, returns the type of the pointee.
*/
clang_getPointeeType :: (T: CXType) -> CXType #foreign libclang;

/**
* Retrieve the unqualified variant of the given type, removing as
* little sugar as possible.
*
* For example, given the following series of typedefs:
*
* \code
* typedef int Integer;
* typedef const Integer CInteger;
* typedef CInteger DifferenceType;
* \endcode
*
* Executing \c clang_getUnqualifiedType() on a \c CXType that
* represents \c DifferenceType, will desugar to a type representing
* \c Integer, that has no qualifiers.
*
* And, executing \c clang_getUnqualifiedType() on the type of the
* first argument of the following function declaration:
*
* \code
* void foo(const int);
* \endcode
*
* Will return a type representing \c int, removing the \c const
* qualifier.
*
* Sugar over array types is not desugared.
*
* A type can be checked for qualifiers with \c
* clang_isConstQualifiedType(), \c clang_isVolatileQualifiedType()
* and \c clang_isRestrictQualifiedType().
*
* A type that resulted from a call to \c clang_getUnqualifiedType
* will return \c false for all of the above calls.
*/
clang_getUnqualifiedType :: (CT: CXType) -> CXType #foreign libclang;

/**
* For reference types (e.g., "const int&"), returns the type that the
* reference refers to (e.g "const int").
*
* Otherwise, returns the type itself.
*
* A type that has kind \c CXType_LValueReference or
* \c CXType_RValueReference is a reference type.
*/
clang_getNonReferenceType :: (CT: CXType) -> CXType #foreign libclang;

/**
* Return the cursor for the declaration of the given type.
*/
clang_getTypeDeclaration :: (T: CXType) -> CXCursor #foreign libclang;

/**
* Returns the Objective-C type encoding for the specified declaration.
*/
clang_getDeclObjCTypeEncoding :: (C: CXCursor) -> CXString #foreign libclang;

/**
* Returns the Objective-C type encoding for the specified CXType.
*/
clang_Type_getObjCEncoding :: (type: CXType) -> CXString #foreign libclang;

/**
* Retrieve the spelling of a given CXTypeKind.
*/
clang_getTypeKindSpelling :: (K: CXTypeKind) -> CXString #foreign libclang;

/**
* Retrieve the calling convention associated with a function type.
*
* If a non-function type is passed in, CXCallingConv_Invalid is returned.
*/
clang_getFunctionTypeCallingConv :: (T: CXType) -> CXCallingConv #foreign libclang;

/**
* Retrieve the return type associated with a function type.
*
* If a non-function type is passed in, an invalid type is returned.
*/
clang_getResultType :: (T: CXType) -> CXType #foreign libclang;

/**
* Retrieve the exception specification type associated with a function type.
* This is a value of type CXCursor_ExceptionSpecificationKind.
*
* If a non-function type is passed in, an error code of -1 is returned.
*/
clang_getExceptionSpecificationType :: (T: CXType) -> s32 #foreign libclang;

/**
* Retrieve the number of non-variadic parameters associated with a
* function type.
*
* If a non-function type is passed in, -1 is returned.
*/
clang_getNumArgTypes :: (T: CXType) -> s32 #foreign libclang;

/**
* Retrieve the type of a parameter of a function type.
*
* If a non-function type is passed in or the function does not have enough
* parameters, an invalid type is returned.
*/
clang_getArgType :: (T: CXType, i: u32) -> CXType #foreign libclang;

/**
* Retrieves the base type of the ObjCObjectType.
*
* If the type is not an ObjC object, an invalid type is returned.
*/
clang_Type_getObjCObjectBaseType :: (T: CXType) -> CXType #foreign libclang;

/**
* Retrieve the number of protocol references associated with an ObjC object/id.
*
* If the type is not an ObjC object, 0 is returned.
*/
clang_Type_getNumObjCProtocolRefs :: (T: CXType) -> u32 #foreign libclang;

/**
* Retrieve the decl for a protocol reference for an ObjC object/id.
*
* If the type is not an ObjC object or there are not enough protocol
* references, an invalid cursor is returned.
*/
clang_Type_getObjCProtocolDecl :: (T: CXType, i: u32) -> CXCursor #foreign libclang;

/**
* Retrieve the number of type arguments associated with an ObjC object.
*
* If the type is not an ObjC object, 0 is returned.
*/
clang_Type_getNumObjCTypeArgs :: (T: CXType) -> u32 #foreign libclang;

/**
* Retrieve a type argument associated with an ObjC object.
*
* If the type is not an ObjC or the index is not valid,
* an invalid type is returned.
*/
clang_Type_getObjCTypeArg :: (T: CXType, i: u32) -> CXType #foreign libclang;

/**
* Return 1 if the CXType is a variadic function type, and 0 otherwise.
*/
clang_isFunctionTypeVariadic :: (T: CXType) -> u32 #foreign libclang;

/**
* Retrieve the return type associated with a given cursor.
*
* This only returns a valid type if the cursor refers to a function or method.
*/
clang_getCursorResultType :: (C: CXCursor) -> CXType #foreign libclang;

/**
* Retrieve the exception specification type associated with a given cursor.
* This is a value of type CXCursor_ExceptionSpecificationKind.
*
* This only returns a valid result if the cursor refers to a function or
* method.
*/
clang_getCursorExceptionSpecificationType :: (C: CXCursor) -> s32 #foreign libclang;

/**
* Return 1 if the CXType is a POD (plain old data) type, and 0
*  otherwise.
*/
clang_isPODType :: (T: CXType) -> u32 #foreign libclang;

/**
* Return the element type of an array, complex, or vector type.
*
* If a type is passed in that is not an array, complex, or vector type,
* an invalid type is returned.
*/
clang_getElementType :: (T: CXType) -> CXType #foreign libclang;

/**
* Return the number of elements of an array or vector type.
*
* If a type is passed in that is not an array or vector type,
* -1 is returned.
*/
clang_getNumElements :: (T: CXType) -> s64 #foreign libclang;

/**
* Return the element type of an array type.
*
* If a non-array type is passed in, an invalid type is returned.
*/
clang_getArrayElementType :: (T: CXType) -> CXType #foreign libclang;

/**
* Return the array size of a constant array.
*
* If a non-array type is passed in, -1 is returned.
*/
clang_getArraySize :: (T: CXType) -> s64 #foreign libclang;

/**
* Retrieve the type named by the qualified-id.
*
* If a non-elaborated type is passed in, an invalid type is returned.
*/
clang_Type_getNamedType :: (T: CXType) -> CXType #foreign libclang;

/**
* Determine if a typedef is 'transparent' tag.
*
* A typedef is considered 'transparent' if it shares a name and spelling
* location with its underlying tag type, as is the case with the NS_ENUM macro.
*
* \returns non-zero if transparent and zero otherwise.
*/
clang_Type_isTransparentTagTypedef :: (T: CXType) -> u32 #foreign libclang;

CXTypeNullabilityKind :: enum u32 {
    NonNull        :: 0;
    Nullable       :: 1;
    Unspecified    :: 2;
    Invalid        :: 3;
    NullableResult :: 4;
}

/**
* Retrieve the nullability kind of a pointer type.
*/
clang_Type_getNullability :: (T: CXType) -> CXTypeNullabilityKind #foreign libclang;

/**
* List the possible error codes for \c clang_Type_getSizeOf,
*   \c clang_Type_getAlignOf, \c clang_Type_getOffsetOf,
*   \c clang_Cursor_getOffsetOf, and \c clang_getOffsetOfBase.
*
* A value of this enumeration type can be returned if the target type is not
* a valid argument to sizeof, alignof or offsetof.
*/
CXTypeLayoutError :: enum s32 {
    Invalid          :: -1;
    Incomplete       :: -2;
    Dependent        :: -3;
    NotConstantSize  :: -4;
    InvalidFieldName :: -5;
    Undeduced        :: -6;
}

/**
* Return the alignment of a type in bytes as per C++[expr.alignof]
*   standard.
*
* If the type declaration is invalid, CXTypeLayoutError_Invalid is returned.
* If the type declaration is an incomplete type, CXTypeLayoutError_Incomplete
*   is returned.
* If the type declaration is a dependent type, CXTypeLayoutError_Dependent is
*   returned.
* If the type declaration is not a constant size type,
*   CXTypeLayoutError_NotConstantSize is returned.
*/
clang_Type_getAlignOf :: (T: CXType) -> s64 #foreign libclang;

/**
* Return the class type of an member pointer type.
*
* If a non-member-pointer type is passed in, an invalid type is returned.
*/
clang_Type_getClassType :: (T: CXType) -> CXType #foreign libclang;

/**
* Return the size of a type in bytes as per C++[expr.sizeof] standard.
*
* If the type declaration is invalid, CXTypeLayoutError_Invalid is returned.
* If the type declaration is an incomplete type, CXTypeLayoutError_Incomplete
*   is returned.
* If the type declaration is a dependent type, CXTypeLayoutError_Dependent is
*   returned.
*/
clang_Type_getSizeOf :: (T: CXType) -> s64 #foreign libclang;

/**
* Return the offset of a field named S in a record of type T in bits
*   as it would be returned by __offsetof__ as per C++11[18.2p4]
*
* If the cursor is not a record field declaration, CXTypeLayoutError_Invalid
*   is returned.
* If the field's type declaration is an incomplete type,
*   CXTypeLayoutError_Incomplete is returned.
* If the field's type declaration is a dependent type,
*   CXTypeLayoutError_Dependent is returned.
* If the field's name S is not found,
*   CXTypeLayoutError_InvalidFieldName is returned.
*/
clang_Type_getOffsetOf :: (T: CXType, S: *u8) -> s64 #foreign libclang;

/**
* Return the type that was modified by this attributed type.
*
* If the type is not an attributed type, an invalid type is returned.
*/
clang_Type_getModifiedType :: (T: CXType) -> CXType #foreign libclang;

/**
* Gets the type contained by this atomic type.
*
* If a non-atomic type is passed in, an invalid type is returned.
*/
clang_Type_getValueType :: (CT: CXType) -> CXType #foreign libclang;

/**
* Return the offset of the field represented by the Cursor.
*
* If the cursor is not a field declaration, -1 is returned.
* If the cursor semantic parent is not a record field declaration,
*   CXTypeLayoutError_Invalid is returned.
* If the field's type declaration is an incomplete type,
*   CXTypeLayoutError_Incomplete is returned.
* If the field's type declaration is a dependent type,
*   CXTypeLayoutError_Dependent is returned.
* If the field's name S is not found,
*   CXTypeLayoutError_InvalidFieldName is returned.
*/
clang_Cursor_getOffsetOfField :: (C: CXCursor) -> s64 #foreign libclang;

/**
* Determine whether the given cursor represents an anonymous
* tag or namespace
*/
clang_Cursor_isAnonymous :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine whether the given cursor represents an anonymous record
* declaration.
*/
clang_Cursor_isAnonymousRecordDecl :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine whether the given cursor represents an inline namespace
* declaration.
*/
clang_Cursor_isInlineNamespace :: (C: CXCursor) -> u32 #foreign libclang;

CXRefQualifierKind :: enum u32 {
    None   :: 0;
    LValue :: 1;
    RValue :: 2;
}

/**
* Returns the number of template arguments for given template
* specialization, or -1 if type \c T is not a template specialization.
*/
clang_Type_getNumTemplateArguments :: (T: CXType) -> s32 #foreign libclang;

/**
* Returns the type template argument of a template class specialization
* at given index.
*
* This function only returns template type arguments and does not handle
* template template arguments or variadic packs.
*/
clang_Type_getTemplateArgumentAsType :: (T: CXType, i: u32) -> CXType #foreign libclang;

/**
* Retrieve the ref-qualifier kind of a function or method.
*
* The ref-qualifier is returned for C++ functions or methods. For other types
* or non-C++ declarations, CXRefQualifier_None is returned.
*/
clang_Type_getCXXRefQualifier :: (T: CXType) -> CXRefQualifierKind #foreign libclang;

/**
* Returns 1 if the base class specified by the cursor with kind
*   CX_CXXBaseSpecifier is virtual.
*/
clang_isVirtualBase :: (unknown0: CXCursor) -> u32 #foreign libclang;

/**
* Returns the offset in bits of a CX_CXXBaseSpecifier relative to the parent
* class.
*
* Returns a small negative number if the offset cannot be computed. See
* CXTypeLayoutError for error codes.
*/
clang_getOffsetOfBase :: (Parent: CXCursor, Base: CXCursor) -> s64 #foreign libclang;

/**
* Represents the C++ access control level to a base class for a
* cursor with kind CX_CXXBaseSpecifier.
*/
CX_CXXAccessSpecifier :: enum u32 {
    CXXInvalidAccessSpecifier :: 0;
    CXXPublic                 :: 1;
    CXXProtected              :: 2;
    CXXPrivate                :: 3;
}

/**
* Returns the access control level for the referenced object.
*
* If the cursor refers to a C++ declaration, its access control level within
* its parent scope is returned. Otherwise, if the cursor refers to a base
* specifier or access specifier, the specifier itself is returned.
*/
clang_getCXXAccessSpecifier :: (unknown0: CXCursor) -> CX_CXXAccessSpecifier #foreign libclang;

/**
* Represents the storage classes as declared in the source. CX_SC_Invalid
* was added for the case that the passed cursor in not a declaration.
*/
CX_StorageClass :: enum u32 {
    Invalid              :: 0;
    None                 :: 1;
    Extern               :: 2;
    Static               :: 3;
    PrivateExtern        :: 4;
    OpenCLWorkGroupLocal :: 5;
    Auto                 :: 6;
    Register             :: 7;
}

/**
* Represents a specific kind of binary operator which can appear at a cursor.
*/
CX_BinaryOperatorKind :: enum u32 {
    Invalid   :: 0;
    PtrMemD   :: 1;
    PtrMemI   :: 2;
    Mul       :: 3;
    Div       :: 4;
    Rem       :: 5;
    Add       :: 6;
    Sub       :: 7;
    Shl       :: 8;
    Shr       :: 9;
    Cmp       :: 10;
    LT        :: 11;
    GT        :: 12;
    LE        :: 13;
    GE        :: 14;
    EQ        :: 15;
    NE        :: 16;
    And       :: 17;
    Xor       :: 18;
    Or        :: 19;
    LAnd      :: 20;
    LOr       :: 21;
    Assign    :: 22;
    MulAssign :: 23;
    DivAssign :: 24;
    RemAssign :: 25;
    AddAssign :: 26;
    SubAssign :: 27;
    ShlAssign :: 28;
    ShrAssign :: 29;
    AndAssign :: 30;
    XorAssign :: 31;
    OrAssign  :: 32;
    Comma     :: 33;
    LAST      :: 33;
}

/**
* \brief Returns the operator code for the binary operator.
*
* @deprecated: use clang_getCursorBinaryOperatorKind instead.
*/
clang_Cursor_getBinaryOpcode :: (C: CXCursor) -> CX_BinaryOperatorKind #foreign libclang;

/**
* \brief Returns a string containing the spelling of the binary operator.
*
* @deprecated: use clang_getBinaryOperatorKindSpelling instead
*/
clang_Cursor_getBinaryOpcodeStr :: (Op: CX_BinaryOperatorKind) -> CXString #foreign libclang;

/**
* Returns the storage class for a function or variable declaration.
*
* If the passed in Cursor is not a function or variable declaration,
* CX_SC_Invalid is returned else the storage class.
*/
clang_Cursor_getStorageClass :: (unknown0: CXCursor) -> CX_StorageClass #foreign libclang;

/**
* Determine the number of overloaded declarations referenced by a
* \c CXCursor_OverloadedDeclRef cursor.
*
* \param cursor The cursor whose overloaded declarations are being queried.
*
* \returns The number of overloaded declarations referenced by \c cursor. If it
* is not a \c CXCursor_OverloadedDeclRef cursor, returns 0.
*/
clang_getNumOverloadedDecls :: (cursor: CXCursor) -> u32 #foreign libclang;

/**
* Retrieve a cursor for one of the overloaded declarations referenced
* by a \c CXCursor_OverloadedDeclRef cursor.
*
* \param cursor The cursor whose overloaded declarations are being queried.
*
* \param index The zero-based index into the set of overloaded declarations in
* the cursor.
*
* \returns A cursor representing the declaration referenced by the given
* \c cursor at the specified \c index. If the cursor does not have an
* associated set of overloaded declarations, or if the index is out of bounds,
* returns \c clang_getNullCursor();
*/
clang_getOverloadedDecl :: (cursor: CXCursor, index: u32) -> CXCursor #foreign libclang;

/**
* For cursors representing an iboutletcollection attribute,
*  this function returns the collection element type.
*
*/
clang_getIBOutletCollectionType :: (unknown0: CXCursor) -> CXType #foreign libclang;

/**
* Describes how the traversal of the children of a particular
* cursor should proceed after visiting a particular child cursor.
*
* A value of this enumeration type should be returned by each
* \c CXCursorVisitor to indicate how clang_visitChildren() proceed.
*/
CXChildVisitResult :: enum u32 {
    Break    :: 0;
    Continue :: 1;
    Recurse  :: 2;
}

/**
* Visitor invoked for each cursor found by a traversal.
*
* This visitor function will be invoked for each cursor found by
* clang_visitCursorChildren(). Its first argument is the cursor being
* visited, its second argument is the parent visitor for that cursor,
* and its third argument is the client data provided to
* clang_visitCursorChildren().
*
* The visitor should return one of the \c CXChildVisitResult values
* to direct clang_visitCursorChildren().
*/
CXCursorVisitor :: #type (cursor: CXCursor, parent: CXCursor, client_data: CXClientData) -> CXChildVisitResult #c_call;

/**
* Visit the children of a particular cursor.
*
* This function visits all the direct children of the given cursor,
* invoking the given \p visitor function with the cursors of each
* visited child. The traversal may be recursive, if the visitor returns
* \c CXChildVisit_Recurse. The traversal may also be ended prematurely, if
* the visitor returns \c CXChildVisit_Break.
*
* \param parent the cursor whose child may be visited. All kinds of
* cursors can be visited, including invalid cursors (which, by
* definition, have no children).
*
* \param visitor the visitor function that will be invoked for each
* child of \p parent.
*
* \param client_data pointer data supplied by the client, which will
* be passed to the visitor each time it is invoked.
*
* \returns a non-zero value if the traversal was terminated
* prematurely by the visitor returning \c CXChildVisit_Break.
*/
clang_visitChildren :: (parent: CXCursor, visitor: CXCursorVisitor, client_data: CXClientData) -> u32 #foreign libclang;

/**
* Retrieve a Unified Symbol Resolution (USR) for the entity referenced
* by the given cursor.
*
* A Unified Symbol Resolution (USR) is a string that identifies a particular
* entity (function, class, variable, etc.) within a program. USRs can be
* compared across translation units to determine, e.g., when references in
* one translation refer to an entity defined in another translation unit.
*/
clang_getCursorUSR :: (unknown0: CXCursor) -> CXString #foreign libclang;

/**
* Construct a USR for a specified Objective-C class.
*/
clang_constructUSR_ObjCClass :: (class_name: *u8) -> CXString #foreign libclang;

/**
* Construct a USR for a specified Objective-C category.
*/
clang_constructUSR_ObjCCategory :: (class_name: *u8, category_name: *u8) -> CXString #foreign libclang;

/**
* Construct a USR for a specified Objective-C protocol.
*/
clang_constructUSR_ObjCProtocol :: (protocol_name: *u8) -> CXString #foreign libclang;

/**
* Construct a USR for a specified Objective-C instance variable and
*   the USR for its containing class.
*/
clang_constructUSR_ObjCIvar :: (name: *u8, classUSR: CXString) -> CXString #foreign libclang;

/**
* Construct a USR for a specified Objective-C method and
*   the USR for its containing class.
*/
clang_constructUSR_ObjCMethod :: (name: *u8, isInstanceMethod: u32, classUSR: CXString) -> CXString #foreign libclang;

/**
* Construct a USR for a specified Objective-C property and the USR
*  for its containing class.
*/
clang_constructUSR_ObjCProperty :: (property: *u8, classUSR: CXString) -> CXString #foreign libclang;

/**
* Retrieve a name for the entity referenced by this cursor.
*/
clang_getCursorSpelling :: (unknown0: CXCursor) -> CXString #foreign libclang;

/**
* Retrieve a range for a piece that forms the cursors spelling name.
* Most of the times there is only one range for the complete spelling but for
* Objective-C methods and Objective-C message expressions, there are multiple
* pieces for each selector identifier.
*
* \param pieceIndex the index of the spelling name piece. If this is greater
* than the actual number of pieces, it will return a NULL (invalid) range.
*
* \param options Reserved.
*/
clang_Cursor_getSpellingNameRange :: (unknown0: CXCursor, pieceIndex: u32, options: u32) -> CXSourceRange #foreign libclang;

/**
* Opaque pointer representing a policy that controls pretty printing
* for \c clang_getCursorPrettyPrinted.
*/
CXPrintingPolicy :: *void;

/**
* Properties for the printing policy.
*
* See \c clang::PrintingPolicy for more information.
*/
CXPrintingPolicyProperty :: enum u32 {
    Indentation                           :: 0;
    SuppressSpecifiers                    :: 1;
    SuppressTagKeyword                    :: 2;
    IncludeTagDefinition                  :: 3;
    SuppressScope                         :: 4;
    SuppressUnwrittenScope                :: 5;
    SuppressInitializers                  :: 6;
    ConstantArraySizeAsWritten            :: 7;
    AnonymousTagLocations                 :: 8;
    SuppressStrongLifetime                :: 9;
    SuppressLifetimeQualifiers            :: 10;
    SuppressTemplateArgsInCXXConstructors :: 11;
    Bool                                  :: 12;
    Restrict                              :: 13;
    Alignof                               :: 14;
    UnderscoreAlignof                     :: 15;
    UseVoidForZeroParams                  :: 16;
    TerseOutput                           :: 17;
    PolishForDeclaration                  :: 18;
    Half                                  :: 19;
    MSWChar                               :: 20;
    IncludeNewlines                       :: 21;
    MSVCFormatting                        :: 22;
    ConstantsAsWritten                    :: 23;
    SuppressImplicitBase                  :: 24;
    FullyQualifiedName                    :: 25;
    LastProperty                          :: 25;
}

/**
* Get a property value for the given printing policy.
*/
clang_PrintingPolicy_getProperty :: (Policy: CXPrintingPolicy, Property: CXPrintingPolicyProperty) -> u32 #foreign libclang;

/**
* Set a property value for the given printing policy.
*/
clang_PrintingPolicy_setProperty :: (Policy: CXPrintingPolicy, Property: CXPrintingPolicyProperty, Value: u32) -> void #foreign libclang;

/**
* Retrieve the default policy for the cursor.
*
* The policy should be released after use with \c
* clang_PrintingPolicy_dispose.
*/
clang_getCursorPrintingPolicy :: (unknown0: CXCursor) -> CXPrintingPolicy #foreign libclang;

/**
* Release a printing policy.
*/
clang_PrintingPolicy_dispose :: (Policy: CXPrintingPolicy) -> void #foreign libclang;

/**
* Pretty print declarations.
*
* \param Cursor The cursor representing a declaration.
*
* \param Policy The policy to control the entities being printed. If
* NULL, a default policy is used.
*
* \returns The pretty printed declaration or the empty string for
* other cursors.
*/
clang_getCursorPrettyPrinted :: (Cursor: CXCursor, Policy: CXPrintingPolicy) -> CXString #foreign libclang;

/**
* Pretty-print the underlying type using a custom printing policy.
*
* If the type is invalid, an empty string is returned.
*/
clang_getTypePrettyPrinted :: (CT: CXType, cxPolicy: CXPrintingPolicy) -> CXString #foreign libclang;

/**
* Get the fully qualified name for a type.
*
* This includes full qualification of all template parameters.
*
* Policy - Further refine the type formatting
* WithGlobalNsPrefix - If non-zero, function will prepend a '::' to qualified
* names
*/
clang_getFullyQualifiedName :: (CT: CXType, Policy: CXPrintingPolicy, WithGlobalNsPrefix: u32) -> CXString #foreign libclang;

/**
* Retrieve the display name for the entity referenced by this cursor.
*
* The display name contains extra information that helps identify the cursor,
* such as the parameters of a function or template or the arguments of a
* class template specialization.
*/
clang_getCursorDisplayName :: (unknown0: CXCursor) -> CXString #foreign libclang;

/** For a cursor that is a reference, retrieve a cursor representing the
* entity that it references.
*
* Reference cursors refer to other entities in the AST. For example, an
* Objective-C superclass reference cursor refers to an Objective-C class.
* This function produces the cursor for the Objective-C class from the
* cursor for the superclass reference. If the input cursor is a declaration or
* definition, it returns that declaration or definition unchanged.
* Otherwise, returns the NULL cursor.
*/
clang_getCursorReferenced :: (unknown0: CXCursor) -> CXCursor #foreign libclang;

/**
*  For a cursor that is either a reference to or a declaration
*  of some entity, retrieve a cursor that describes the definition of
*  that entity.
*
*  Some entities can be declared multiple times within a translation
*  unit, but only one of those declarations can also be a
*  definition. For example, given:
*
*  \code
*  int f(int, int);
*  int g(int x, int y) { return f(x, y); }
*  int f(int a, int b) { return a + b; }
*  int f(int, int);
*  \endcode
*
*  there are three declarations of the function "f", but only the
*  second one is a definition. The clang_getCursorDefinition()
*  function will take any cursor pointing to a declaration of "f"
*  (the first or fourth lines of the example) or a cursor referenced
*  that uses "f" (the call to "f' inside "g") and will return a
*  declaration cursor pointing to the definition (the second "f"
*  declaration).
*
*  If given a cursor for which there is no corresponding definition,
*  e.g., because there is no definition of that entity within this
*  translation unit, returns a NULL cursor.
*/
clang_getCursorDefinition :: (unknown0: CXCursor) -> CXCursor #foreign libclang;

/**
* Determine whether the declaration pointed to by this cursor
* is also a definition of that entity.
*/
clang_isCursorDefinition :: (unknown0: CXCursor) -> u32 #foreign libclang;

/**
* Retrieve the canonical cursor corresponding to the given cursor.
*
* In the C family of languages, many kinds of entities can be declared several
* times within a single translation unit. For example, a structure type can
* be forward-declared (possibly multiple times) and later defined:
*
* \code
* struct X;
* struct X;
* struct X {
*   int member;
* };
* \endcode
*
* The declarations and the definition of \c X are represented by three
* different cursors, all of which are declarations of the same underlying
* entity. One of these cursor is considered the "canonical" cursor, which
* is effectively the representative for the underlying entity. One can
* determine if two cursors are declarations of the same underlying entity by
* comparing their canonical cursors.
*
* \returns The canonical cursor for the entity referred to by the given cursor.
*/
clang_getCanonicalCursor :: (unknown0: CXCursor) -> CXCursor #foreign libclang;

/**
* If the cursor points to a selector identifier in an Objective-C
* method or message expression, this returns the selector index.
*
* After getting a cursor with #clang_getCursor, this can be called to
* determine if the location points to a selector identifier.
*
* \returns The selector index if the cursor is an Objective-C method or message
* expression and the cursor is pointing to a selector identifier, or -1
* otherwise.
*/
clang_Cursor_getObjCSelectorIndex :: (unknown0: CXCursor) -> s32 #foreign libclang;

/**
* Given a cursor pointing to a C++ method call or an Objective-C
* message, returns non-zero if the method/message is "dynamic", meaning:
*
* For a C++ method: the call is virtual.
* For an Objective-C message: the receiver is an object instance, not 'super'
* or a specific class.
*
* If the method/message is "static" or the cursor does not point to a
* method/message, it will return zero.
*/
clang_Cursor_isDynamicCall :: (C: CXCursor) -> s32 #foreign libclang;

/**
* Given a cursor pointing to an Objective-C message or property
* reference, or C++ method call, returns the CXType of the receiver.
*/
clang_Cursor_getReceiverType :: (C: CXCursor) -> CXType #foreign libclang;

/**
* Property attributes for a \c CXCursor_ObjCPropertyDecl.
*/
CXObjCPropertyAttrKind :: enum u32 {
    noattr            :: 0;
    readonly          :: 1;
    getter            :: 2;
    assign            :: 4;
    readwrite         :: 8;
    retain            :: 16;
    copy              :: 32;
    nonatomic         :: 64;
    setter            :: 128;
    atomic            :: 256;
    weak              :: 512;
    strong            :: 1024;
    unsafe_unretained :: 2048;
    class             :: 4096;
}

/**
* Given a cursor that represents a property declaration, return the
* associated property attributes. The bits are formed from
* \c CXObjCPropertyAttrKind.
*
* \param reserved Reserved for future use, pass 0.
*/
clang_Cursor_getObjCPropertyAttributes :: (C: CXCursor, reserved: u32) -> u32 #foreign libclang;

/**
* Given a cursor that represents a property declaration, return the
* name of the method that implements the getter.
*/
clang_Cursor_getObjCPropertyGetterName :: (C: CXCursor) -> CXString #foreign libclang;

/**
* Given a cursor that represents a property declaration, return the
* name of the method that implements the setter, if any.
*/
clang_Cursor_getObjCPropertySetterName :: (C: CXCursor) -> CXString #foreign libclang;

/**
* 'Qualifiers' written next to the return and parameter types in
* Objective-C method declarations.
*/
CXObjCDeclQualifierKind :: enum u32 {
    None   :: 0;
    In     :: 1;
    Inout  :: 2;
    Out    :: 4;
    Bycopy :: 8;
    Byref  :: 16;
    Oneway :: 32;
}

/**
* Given a cursor that represents an Objective-C method or parameter
* declaration, return the associated Objective-C qualifiers for the return
* type or the parameter respectively. The bits are formed from
* CXObjCDeclQualifierKind.
*/
clang_Cursor_getObjCDeclQualifiers :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Given a cursor that represents an Objective-C method or property
* declaration, return non-zero if the declaration was affected by "\@optional".
* Returns zero if the cursor is not such a declaration or it is "\@required".
*/
clang_Cursor_isObjCOptional :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Returns non-zero if the given cursor is a variadic function or method.
*/
clang_Cursor_isVariadic :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Returns non-zero if the given cursor points to a symbol marked with
* external_source_symbol attribute.
*
* \param language If non-NULL, and the attribute is present, will be set to
* the 'language' string from the attribute.
*
* \param definedIn If non-NULL, and the attribute is present, will be set to
* the 'definedIn' string from the attribute.
*
* \param isGenerated If non-NULL, and the attribute is present, will be set to
* non-zero if the 'generated_declaration' is set in the attribute.
*/
clang_Cursor_isExternalSymbol :: (C: CXCursor, language: *CXString, definedIn: *CXString, isGenerated: *u32) -> u32 #foreign libclang;

/**
* Given a cursor that represents a declaration, return the associated
* comment's source range.  The range may include multiple consecutive comments
* with whitespace in between.
*/
clang_Cursor_getCommentRange :: (C: CXCursor) -> CXSourceRange #foreign libclang;

/**
* Given a cursor that represents a declaration, return the associated
* comment text, including comment markers.
*/
clang_Cursor_getRawCommentText :: (C: CXCursor) -> CXString #foreign libclang;

/**
* Given a cursor that represents a documentable entity (e.g.,
* declaration), return the associated \paragraph; otherwise return the
* first paragraph.
*/
clang_Cursor_getBriefCommentText :: (C: CXCursor) -> CXString #foreign libclang;

/**
* Retrieve the CXString representing the mangled name of the cursor.
*/
clang_Cursor_getMangling :: (unknown0: CXCursor) -> CXString #foreign libclang;

/**
* Retrieve the CXStrings representing the mangled symbols of the C++
* constructor or destructor at the cursor.
*/
clang_Cursor_getCXXManglings :: (unknown0: CXCursor) -> *CXStringSet #foreign libclang;

/**
* Retrieve the CXStrings representing the mangled symbols of the ObjC
* class interface or implementation at the cursor.
*/
clang_Cursor_getObjCManglings :: (unknown0: CXCursor) -> *CXStringSet #foreign libclang;

/**
* Given a CXCursor_GCCAsmStmt cursor, return the assembly template string.
* As per LLVM IR Assembly Template language, template placeholders for
* inputs and outputs are either of the form $N where N is a decimal number
* as an index into the input-output specification,
* or ${N:M} where N is a decimal number also as an index into the
* input-output specification and M is the template argument modifier.
* The index N in both cases points into the the total inputs and outputs,
* or more specifically, into the list of outputs followed by the inputs,
* starting from index 0 as the first available template argument.
*
* This function also returns a valid empty string if the cursor does not point
* at a GCC inline assembly block.
*
* Users are responsible for releasing the allocation of returned string via
* \c clang_disposeString.
*/
clang_Cursor_getGCCAssemblyTemplate :: (unknown0: CXCursor) -> CXString #foreign libclang;

/**
* Given a CXCursor_GCCAsmStmt cursor, check if the assembly block has goto
* labels.
* This function also returns 0 if the cursor does not point at a GCC inline
* assembly block.
*/
clang_Cursor_isGCCAssemblyHasGoto :: (unknown0: CXCursor) -> u32 #foreign libclang;

/**
* Given a CXCursor_GCCAsmStmt cursor, count the number of outputs.
* This function also returns 0 if the cursor does not point at a GCC inline
* assembly block.
*/
clang_Cursor_getGCCAssemblyNumOutputs :: (unknown0: CXCursor) -> u32 #foreign libclang;

/**
* Given a CXCursor_GCCAsmStmt cursor, count the number of inputs.
* This function also returns 0 if the cursor does not point at a GCC inline
* assembly block.
*/
clang_Cursor_getGCCAssemblyNumInputs :: (unknown0: CXCursor) -> u32 #foreign libclang;

/**
* Given a CXCursor_GCCAsmStmt cursor, get the constraint and expression cursor
* to the Index-th input.
* This function returns 1 when the cursor points at a GCC inline assembly
* statement, `Index` is within bounds and both the `Constraint` and `Expr` are
* not NULL.
* Otherwise, this function returns 0 but leaves `Constraint` and `Expr`
* intact.
*
* Users are responsible for releasing the allocation of `Constraint` via
* \c clang_disposeString.
*/
clang_Cursor_getGCCAssemblyInput :: (Cursor: CXCursor, Index: u32, Constraint: *CXString, Expr: *CXCursor) -> u32 #foreign libclang;

/**
* Given a CXCursor_GCCAsmStmt cursor, get the constraint and expression cursor
* to the Index-th output.
* This function returns 1 when the cursor points at a GCC inline assembly
* statement, `Index` is within bounds and both the `Constraint` and `Expr` are
* not NULL.
* Otherwise, this function returns 0 but leaves `Constraint` and `Expr`
* intact.
*
* Users are responsible for releasing the allocation of `Constraint` via
* \c clang_disposeString.
*/
clang_Cursor_getGCCAssemblyOutput :: (Cursor: CXCursor, Index: u32, Constraint: *CXString, Expr: *CXCursor) -> u32 #foreign libclang;

/**
* Given a CXCursor_GCCAsmStmt cursor, count the clobbers in it.
* This function also returns 0 if the cursor does not point at a GCC inline
* assembly block.
*/
clang_Cursor_getGCCAssemblyNumClobbers :: (Cursor: CXCursor) -> u32 #foreign libclang;

/**
* Given a CXCursor_GCCAsmStmt cursor, get the Index-th clobber of it.
* This function returns a valid empty string if the cursor does not point
* at a GCC inline assembly block or `Index` is out of bounds.
*
* Users are responsible for releasing the allocation of returned string via
* \c clang_disposeString.
*/
clang_Cursor_getGCCAssemblyClobber :: (Cursor: CXCursor, Index: u32) -> CXString #foreign libclang;

/**
* Given a CXCursor_GCCAsmStmt cursor, check if the inline assembly is
* `volatile`.
* This function returns 0 if the cursor does not point at a GCC inline
* assembly block.
*/
clang_Cursor_isGCCAssemblyVolatile :: (Cursor: CXCursor) -> u32 #foreign libclang;

/**
* \defgroup CINDEX_MODULE Module introspection
*
* The functions in this group provide access to information about modules.
*
* @{
*/
CXModule :: *void;

/**
* Given a CXCursor_ModuleImportDecl cursor, return the associated module.
*/
clang_Cursor_getModule :: (C: CXCursor) -> CXModule #foreign libclang;

/**
* Given a CXFile header file, return the module that contains it, if one
* exists.
*/
clang_getModuleForFile :: (unknown0: CXTranslationUnit, unknown1: CXFile) -> CXModule #foreign libclang;

/**
* \param Module a module object.
*
* \returns the module file where the provided module object came from.
*/
clang_Module_getASTFile :: (Module: CXModule) -> CXFile #foreign libclang;

/**
* \param Module a module object.
*
* \returns the parent of a sub-module or NULL if the given module is top-level,
* e.g. for 'std.vector' it will return the 'std' module.
*/
clang_Module_getParent :: (Module: CXModule) -> CXModule #foreign libclang;

/**
* \param Module a module object.
*
* \returns the name of the module, e.g. for the 'std.vector' sub-module it
* will return "vector".
*/
clang_Module_getName :: (Module: CXModule) -> CXString #foreign libclang;

/**
* \param Module a module object.
*
* \returns the full name of the module, e.g. "std.vector".
*/
clang_Module_getFullName :: (Module: CXModule) -> CXString #foreign libclang;

/**
* \param Module a module object.
*
* \returns non-zero if the module is a system one.
*/
clang_Module_isSystem :: (Module: CXModule) -> s32 #foreign libclang;

/**
* \param Module a module object.
*
* \returns the number of top level headers associated with this module.
*/
clang_Module_getNumTopLevelHeaders :: (unknown0: CXTranslationUnit, Module: CXModule) -> u32 #foreign libclang;

/**
* \param Module a module object.
*
* \param Index top level header index (zero-based).
*
* \returns the specified top level header associated with the module.
*/
clang_Module_getTopLevelHeader :: (unknown0: CXTranslationUnit, Module: CXModule, Index: u32) -> CXFile #foreign libclang;

/**
* Determine if a C++ constructor is a converting constructor.
*/
clang_CXXConstructor_isConvertingConstructor :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ constructor is a copy constructor.
*/
clang_CXXConstructor_isCopyConstructor :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ constructor is the default constructor.
*/
clang_CXXConstructor_isDefaultConstructor :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ constructor is a move constructor.
*/
clang_CXXConstructor_isMoveConstructor :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ field is declared 'mutable'.
*/
clang_CXXField_isMutable :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ method is declared '= default'.
*/
clang_CXXMethod_isDefaulted :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ method is declared '= delete'.
*/
clang_CXXMethod_isDeleted :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ member function or member function template is
* pure virtual.
*/
clang_CXXMethod_isPureVirtual :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ member function or member function template is
* declared 'static'.
*/
clang_CXXMethod_isStatic :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ member function or member function template is
* explicitly declared 'virtual' or if it overrides a virtual method from
* one of the base classes.
*/
clang_CXXMethod_isVirtual :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ member function is a copy-assignment operator,
* returning 1 if such is the case and 0 otherwise.
*
* > A copy-assignment operator `X::operator=` is a non-static,
* > non-template member function of _class_ `X` with exactly one
* > parameter of type `X`, `X&`, `const X&`, `volatile X&` or `const
* > volatile X&`.
*
* That is, for example, the `operator=` in:
*
*    class Foo {
*        bool operator=(const volatile Foo&);
*    };
*
* Is a copy-assignment operator, while the `operator=` in:
*
*    class Bar {
*        bool operator=(const int&);
*    };
*
* Is not.
*/
clang_CXXMethod_isCopyAssignmentOperator :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ member function is a move-assignment operator,
* returning 1 if such is the case and 0 otherwise.
*
* > A move-assignment operator `X::operator=` is a non-static,
* > non-template member function of _class_ `X` with exactly one
* > parameter of type `X&&`, `const X&&`, `volatile X&&` or `const
* > volatile X&&`.
*
* That is, for example, the `operator=` in:
*
*    class Foo {
*        bool operator=(const volatile Foo&&);
*    };
*
* Is a move-assignment operator, while the `operator=` in:
*
*    class Bar {
*        bool operator=(const int&&);
*    };
*
* Is not.
*/
clang_CXXMethod_isMoveAssignmentOperator :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determines if a C++ constructor or conversion function was declared
* explicit, returning 1 if such is the case and 0 otherwise.
*
* Constructors or conversion functions are declared explicit through
* the use of the explicit specifier.
*
* For example, the following constructor and conversion function are
* not explicit as they lack the explicit specifier:
*
*     class Foo {
*         Foo();
*         operator int();
*     };
*
* While the following constructor and conversion function are
* explicit as they are declared with the explicit specifier.
*
*     class Foo {
*         explicit Foo();
*         explicit operator int();
*     };
*
* This function will return 0 when given a cursor pointing to one of
* the former declarations and it will return 1 for a cursor pointing
* to the latter declarations.
*
* The explicit specifier allows the user to specify a
* conditional compile-time expression whose value decides
* whether the marked element is explicit or not.
*
* For example:
*
*     constexpr bool foo(int i) { return i % 2 == 0; }
*
*     class Foo {
*          explicit(foo(1)) Foo();
*          explicit(foo(2)) operator int();
*     }
*
* This function will return 0 for the constructor and 1 for
* the conversion function.
*/
clang_CXXMethod_isExplicit :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ record is abstract, i.e. whether a class or struct
* has a pure virtual member function.
*/
clang_CXXRecord_isAbstract :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if an enum declaration refers to a scoped enum.
*/
clang_EnumDecl_isScoped :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Determine if a C++ member function or member function template is
* declared 'const'.
*/
clang_CXXMethod_isConst :: (C: CXCursor) -> u32 #foreign libclang;

/**
* Given a cursor that represents a template, determine
* the cursor kind of the specializations would be generated by instantiating
* the template.
*
* This routine can be used to determine what flavor of function template,
* class template, or class template partial specialization is stored in the
* cursor. For example, it can describe whether a class template cursor is
* declared with "struct", "class" or "union".
*
* \param C The cursor to query. This cursor should represent a template
* declaration.
*
* \returns The cursor kind of the specializations that would be generated
* by instantiating the template \p C. If \p C is not a template, returns
* \c CXCursor_NoDeclFound.
*/
clang_getTemplateCursorKind :: (C: CXCursor) -> CXCursorKind #foreign libclang;

/**
* Given a cursor that may represent a specialization or instantiation
* of a template, retrieve the cursor that represents the template that it
* specializes or from which it was instantiated.
*
* This routine determines the template involved both for explicit
* specializations of templates and for implicit instantiations of the template,
* both of which are referred to as "specializations". For a class template
* specialization (e.g., \c std::vector<bool>), this routine will return
* either the primary template (\c std::vector) or, if the specialization was
* instantiated from a class template partial specialization, the class template
* partial specialization. For a class template partial specialization and a
* function template specialization (including instantiations), this
* this routine will return the specialized template.
*
* For members of a class template (e.g., member functions, member classes, or
* static data members), returns the specialized or instantiated member.
* Although not strictly "templates" in the C++ language, members of class
* templates have the same notions of specializations and instantiations that
* templates do, so this routine treats them similarly.
*
* \param C A cursor that may be a specialization of a template or a member
* of a template.
*
* \returns If the given cursor is a specialization or instantiation of a
* template or a member thereof, the template or member that it specializes or
* from which it was instantiated. Otherwise, returns a NULL cursor.
*/
clang_getSpecializedCursorTemplate :: (C: CXCursor) -> CXCursor #foreign libclang;

/**
* Given a cursor that references something else, return the source range
* covering that reference.
*
* \param C A cursor pointing to a member reference, a declaration reference, or
* an operator call.
* \param NameFlags A bitset with three independent flags:
* CXNameRange_WantQualifier, CXNameRange_WantTemplateArgs, and
* CXNameRange_WantSinglePiece.
* \param PieceIndex For contiguous names or when passing the flag
* CXNameRange_WantSinglePiece, only one piece with index 0 is
* available. When the CXNameRange_WantSinglePiece flag is not passed for a
* non-contiguous names, this index can be used to retrieve the individual
* pieces of the name. See also CXNameRange_WantSinglePiece.
*
* \returns The piece of the name pointed to by the given cursor. If there is no
* name, or if the PieceIndex is out-of-range, a null-cursor will be returned.
*/
clang_getCursorReferenceNameRange :: (C: CXCursor, NameFlags: u32, PieceIndex: u32) -> CXSourceRange #foreign libclang;

CXNameRefFlags :: enum u32 {
    WantQualifier    :: 1;
    WantTemplateArgs :: 2;
    WantSinglePiece  :: 4;
}

/**
* Describes a kind of token.
*/
CXTokenKind :: enum u32 {
    Punctuation :: 0;
    Keyword     :: 1;
    Identifier  :: 2;
    Literal     :: 3;
    Comment     :: 4;
}

/**
* Describes a single preprocessing token.
*/
CXToken :: struct {
    int_data: [4] u32;
    ptr_data: *void;
}

/**
* Get the raw lexical token starting with the given location.
*
* \param TU the translation unit whose text is being tokenized.
*
* \param Location the source location with which the token starts.
*
* \returns The token starting with the given location or NULL if no such token
* exist. The returned pointer must be freed with clang_disposeTokens before the
* translation unit is destroyed.
*/
clang_getToken :: (TU: CXTranslationUnit, Location: CXSourceLocation) -> *CXToken #foreign libclang;

/**
* Determine the kind of the given token.
*/
clang_getTokenKind :: (unknown0: CXToken) -> CXTokenKind #foreign libclang;

/**
* Determine the spelling of the given token.
*
* The spelling of a token is the textual representation of that token, e.g.,
* the text of an identifier or keyword.
*/
clang_getTokenSpelling :: (unknown0: CXTranslationUnit, unknown1: CXToken) -> CXString #foreign libclang;

/**
* Retrieve the source location of the given token.
*/
clang_getTokenLocation :: (unknown0: CXTranslationUnit, unknown1: CXToken) -> CXSourceLocation #foreign libclang;

/**
* Retrieve a source range that covers the given token.
*/
clang_getTokenExtent :: (unknown0: CXTranslationUnit, unknown1: CXToken) -> CXSourceRange #foreign libclang;

/**
* Tokenize the source code described by the given range into raw
* lexical tokens.
*
* \param TU the translation unit whose text is being tokenized.
*
* \param Range the source range in which text should be tokenized. All of the
* tokens produced by tokenization will fall within this source range,
*
* \param Tokens this pointer will be set to point to the array of tokens
* that occur within the given source range. The returned pointer must be
* freed with clang_disposeTokens() before the translation unit is destroyed.
*
* \param NumTokens will be set to the number of tokens in the \c *Tokens
* array.
*
*/
clang_tokenize :: (TU: CXTranslationUnit, Range: CXSourceRange, Tokens: **CXToken, NumTokens: *u32) -> void #foreign libclang;

/**
* Annotate the given set of tokens by providing cursors for each token
* that can be mapped to a specific entity within the abstract syntax tree.
*
* This token-annotation routine is equivalent to invoking
* clang_getCursor() for the source locations of each of the
* tokens. The cursors provided are filtered, so that only those
* cursors that have a direct correspondence to the token are
* accepted. For example, given a function call \c f(x),
* clang_getCursor() would provide the following cursors:
*
*   * when the cursor is over the 'f', a DeclRefExpr cursor referring to 'f'.
*   * when the cursor is over the '(' or the ')', a CallExpr referring to 'f'.
*   * when the cursor is over the 'x', a DeclRefExpr cursor referring to 'x'.
*
* Only the first and last of these cursors will occur within the
* annotate, since the tokens "f" and "x' directly refer to a function
* and a variable, respectively, but the parentheses are just a small
* part of the full syntax of the function call expression, which is
* not provided as an annotation.
*
* \param TU the translation unit that owns the given tokens.
*
* \param Tokens the set of tokens to annotate.
*
* \param NumTokens the number of tokens in \p Tokens.
*
* \param Cursors an array of \p NumTokens cursors, whose contents will be
* replaced with the cursors corresponding to each token.
*/
clang_annotateTokens :: (TU: CXTranslationUnit, Tokens: *CXToken, NumTokens: u32, Cursors: *CXCursor) -> void #foreign libclang;

/**
* Free the given set of tokens.
*/
clang_disposeTokens :: (TU: CXTranslationUnit, Tokens: *CXToken, NumTokens: u32) -> void #foreign libclang;

/* for debug/testing */
clang_getCursorKindSpelling :: (Kind: CXCursorKind) -> CXString #foreign libclang;
clang_getDefinitionSpellingAndExtent :: (unknown0: CXCursor, startBuf: **u8, endBuf: **u8, startLine: *u32, startColumn: *u32, endLine: *u32, endColumn: *u32) -> void #foreign libclang;

clang_enableStackTraces :: () -> void #foreign libclang;
clang_executeOnThread :: (fn: #type (unknown0: *void) -> void #c_call, user_data: *void, stack_size: u32) -> void #foreign libclang;

/**
* A semantic string that describes a code-completion result.
*
* A semantic string that describes the formatting of a code-completion
* result as a single "template" of text that should be inserted into the
* source buffer when a particular code-completion result is selected.
* Each semantic string is made up of some number of "chunks", each of which
* contains some text along with a description of what that text means, e.g.,
* the name of the entity being referenced, whether the text chunk is part of
* the template, or whether it is a "placeholder" that the user should replace
* with actual code,of a specific kind. See \c CXCompletionChunkKind for a
* description of the different kinds of chunks.
*/
CXCompletionString :: *void;

/**
* A single result of code completion.
*/
CXCompletionResult :: struct {
    /**
    * The kind of entity that this completion refers to.
    *
    * The cursor kind will be a macro, keyword, or a declaration (one of the
    * *Decl cursor kinds), describing the entity that the completion is
    * referring to.
    *
    * \todo In the future, we would like to provide a full cursor, to allow
    * the client to extract additional information from declaration.
    */
    CursorKind:       CXCursorKind;
    /**
    * The code-completion string that describes how to insert this
    * code-completion result into the editing buffer.
    */
    CompletionString: CXCompletionString;
}

/**
* Describes a single piece of text within a code-completion string.
*
* Each "chunk" within a code-completion string (\c CXCompletionString) is
* either a piece of text with a specific "kind" that describes how that text
* should be interpreted by the client or is another completion string.
*/
CXCompletionChunkKind :: enum u32 {
    Optional         :: 0;
    TypedText        :: 1;
    Text             :: 2;
    Placeholder      :: 3;
    Informative      :: 4;
    CurrentParameter :: 5;
    LeftParen        :: 6;
    RightParen       :: 7;
    LeftBracket      :: 8;
    RightBracket     :: 9;
    LeftBrace        :: 10;
    RightBrace       :: 11;
    LeftAngle        :: 12;
    RightAngle       :: 13;
    Comma            :: 14;
    ResultType       :: 15;
    Colon            :: 16;
    SemiColon        :: 17;
    Equal            :: 18;
    HorizontalSpace  :: 19;
    VerticalSpace    :: 20;
}

/**
* Determine the kind of a particular chunk within a completion string.
*
* \param completion_string the completion string to query.
*
* \param chunk_number the 0-based index of the chunk in the completion string.
*
* \returns the kind of the chunk at the index \c chunk_number.
*/
clang_getCompletionChunkKind :: (completion_string: CXCompletionString, chunk_number: u32) -> CXCompletionChunkKind #foreign libclang;

/**
* Retrieve the text associated with a particular chunk within a
* completion string.
*
* \param completion_string the completion string to query.
*
* \param chunk_number the 0-based index of the chunk in the completion string.
*
* \returns the text associated with the chunk at index \c chunk_number.
*/
clang_getCompletionChunkText :: (completion_string: CXCompletionString, chunk_number: u32) -> CXString #foreign libclang;

/**
* Retrieve the completion string associated with a particular chunk
* within a completion string.
*
* \param completion_string the completion string to query.
*
* \param chunk_number the 0-based index of the chunk in the completion string.
*
* \returns the completion string associated with the chunk at index
* \c chunk_number.
*/
clang_getCompletionChunkCompletionString :: (completion_string: CXCompletionString, chunk_number: u32) -> CXCompletionString #foreign libclang;

/**
* Retrieve the number of chunks in the given code-completion string.
*/
clang_getNumCompletionChunks :: (completion_string: CXCompletionString) -> u32 #foreign libclang;

/**
* Determine the priority of this code completion.
*
* The priority of a code completion indicates how likely it is that this
* particular completion is the completion that the user will select. The
* priority is selected by various internal heuristics.
*
* \param completion_string The completion string to query.
*
* \returns The priority of this completion string. Smaller values indicate
* higher-priority (more likely) completions.
*/
clang_getCompletionPriority :: (completion_string: CXCompletionString) -> u32 #foreign libclang;

/**
* Determine the availability of the entity that this code-completion
* string refers to.
*
* \param completion_string The completion string to query.
*
* \returns The availability of the completion string.
*/
clang_getCompletionAvailability :: (completion_string: CXCompletionString) -> CXAvailabilityKind #foreign libclang;

/**
* Retrieve the number of annotations associated with the given
* completion string.
*
* \param completion_string the completion string to query.
*
* \returns the number of annotations associated with the given completion
* string.
*/
clang_getCompletionNumAnnotations :: (completion_string: CXCompletionString) -> u32 #foreign libclang;

/**
* Retrieve the annotation associated with the given completion string.
*
* \param completion_string the completion string to query.
*
* \param annotation_number the 0-based index of the annotation of the
* completion string.
*
* \returns annotation string associated with the completion at index
* \c annotation_number, or a NULL string if that annotation is not available.
*/
clang_getCompletionAnnotation :: (completion_string: CXCompletionString, annotation_number: u32) -> CXString #foreign libclang;

/**
* Retrieve the parent context of the given completion string.
*
* The parent context of a completion string is the semantic parent of
* the declaration (if any) that the code completion represents. For example,
* a code completion for an Objective-C method would have the method's class
* or protocol as its context.
*
* \param completion_string The code completion string whose parent is
* being queried.
*
* \param kind DEPRECATED: always set to CXCursor_NotImplemented if non-NULL.
*
* \returns The name of the completion parent, e.g., "NSObject" if
* the completion string represents a method in the NSObject class.
*/
clang_getCompletionParent :: (completion_string: CXCompletionString, kind: *CXCursorKind) -> CXString #foreign libclang;

/**
* Retrieve the brief documentation comment attached to the declaration
* that corresponds to the given completion string.
*/
clang_getCompletionBriefComment :: (completion_string: CXCompletionString) -> CXString #foreign libclang;

/**
* Retrieve a completion string for an arbitrary declaration or macro
* definition cursor.
*
* \param cursor The cursor to query.
*
* \returns A non-context-sensitive completion string for declaration and macro
* definition cursors, or NULL for other kinds of cursors.
*/
clang_getCursorCompletionString :: (cursor: CXCursor) -> CXCompletionString #foreign libclang;

/**
* Contains the results of code-completion.
*
* This data structure contains the results of code completion, as
* produced by \c clang_codeCompleteAt(). Its contents must be freed by
* \c clang_disposeCodeCompleteResults.
*/
CXCodeCompleteResults :: struct {
    /**
    * The code-completion results.
    */
    Results:    *CXCompletionResult;
    /**
    * The number of code-completion results stored in the
    * \c Results array.
    */
    NumResults: u32;
}

/**
* Retrieve the number of fix-its for the given completion index.
*
* Calling this makes sense only if CXCodeComplete_IncludeCompletionsWithFixIts
* option was set.
*
* \param results The structure keeping all completion results
*
* \param completion_index The index of the completion
*
* \return The number of fix-its which must be applied before the completion at
* completion_index can be applied
*/
clang_getCompletionNumFixIts :: (results: *CXCodeCompleteResults, completion_index: u32) -> u32 #foreign libclang;

/**
* Fix-its that *must* be applied before inserting the text for the
* corresponding completion.
*
* By default, clang_codeCompleteAt() only returns completions with empty
* fix-its. Extra completions with non-empty fix-its should be explicitly
* requested by setting CXCodeComplete_IncludeCompletionsWithFixIts.
*
* For the clients to be able to compute position of the cursor after applying
* fix-its, the following conditions are guaranteed to hold for
* replacement_range of the stored fix-its:
*  - Ranges in the fix-its are guaranteed to never contain the completion
*  point (or identifier under completion point, if any) inside them, except
*  at the start or at the end of the range.
*  - If a fix-it range starts or ends with completion point (or starts or
*  ends after the identifier under completion point), it will contain at
*  least one character. It allows to unambiguously recompute completion
*  point after applying the fix-it.
*
* The intuition is that provided fix-its change code around the identifier we
* complete, but are not allowed to touch the identifier itself or the
* completion point. One example of completions with corrections are the ones
* replacing '.' with '->' and vice versa:
*
* std::unique_ptr<std::vector<int>> vec_ptr;
* In 'vec_ptr.^', one of the completions is 'push_back', it requires
* replacing '.' with '->'.
* In 'vec_ptr->^', one of the completions is 'release', it requires
* replacing '->' with '.'.
*
* \param results The structure keeping all completion results
*
* \param completion_index The index of the completion
*
* \param fixit_index The index of the fix-it for the completion at
* completion_index
*
* \param replacement_range The fix-it range that must be replaced before the
* completion at completion_index can be applied
*
* \returns The fix-it string that must replace the code at replacement_range
* before the completion at completion_index can be applied
*/
clang_getCompletionFixIt :: (results: *CXCodeCompleteResults, completion_index: u32, fixit_index: u32, replacement_range: *CXSourceRange) -> CXString #foreign libclang;

/**
* Flags that can be passed to \c clang_codeCompleteAt() to
* modify its behavior.
*
* The enumerators in this enumeration can be bitwise-OR'd together to
* provide multiple options to \c clang_codeCompleteAt().
*/
CXCodeComplete_Flags :: enum_flags u32 {
    IncludeMacros                :: 0x1;
    IncludeCodePatterns          :: 0x2;
    IncludeBriefComments         :: 0x4;
    SkipPreamble                 :: 0x8;
    IncludeCompletionsWithFixIts :: 0x10;
}

/**
* Bits that represent the context under which completion is occurring.
*
* The enumerators in this enumeration may be bitwise-OR'd together if multiple
* contexts are occurring simultaneously.
*/
CXCompletionContext :: enum_flags u32 {
    Unexposed           :: 0x0;
    AnyType             :: 0x1;
    AnyValue            :: 0x2;
    ObjCObjectValue     :: 0x4;
    ObjCSelectorValue   :: 0x8;
    CXXClassTypeValue   :: 0x10;
    DotMemberAccess     :: 0x20;
    ArrowMemberAccess   :: 0x40;
    ObjCPropertyAccess  :: 0x80;
    EnumTag             :: 0x100;
    UnionTag            :: 0x200;
    StructTag           :: 0x400;
    ClassTag            :: 0x800;
    Namespace           :: 0x1000;
    NestedNameSpecifier :: 0x2000;
    ObjCInterface       :: 0x4000;
    ObjCProtocol        :: 0x8000;
    ObjCCategory        :: 0x10000;
    ObjCInstanceMessage :: 0x20000;
    ObjCClassMessage    :: 0x40000;
    ObjCSelectorName    :: 0x80000;
    MacroName           :: 0x100000;
    NaturalLanguage     :: 0x200000;
    IncludedFile        :: 0x400000;
    Unknown             :: 0x7fffff;
}

/**
* Returns a default set of code-completion options that can be
* passed to\c clang_codeCompleteAt().
*/
clang_defaultCodeCompleteOptions :: () -> u32 #foreign libclang;

/**
* Perform code completion at a given location in a translation unit.
*
* This function performs code completion at a particular file, line, and
* column within source code, providing results that suggest potential
* code snippets based on the context of the completion. The basic model
* for code completion is that Clang will parse a complete source file,
* performing syntax checking up to the location where code-completion has
* been requested. At that point, a special code-completion token is passed
* to the parser, which recognizes this token and determines, based on the
* current location in the C/Objective-C/C++ grammar and the state of
* semantic analysis, what completions to provide. These completions are
* returned via a new \c CXCodeCompleteResults structure.
*
* Code completion itself is meant to be triggered by the client when the
* user types punctuation characters or whitespace, at which point the
* code-completion location will coincide with the cursor. For example, if \c p
* is a pointer, code-completion might be triggered after the "-" and then
* after the ">" in \c p->. When the code-completion location is after the ">",
* the completion results will provide, e.g., the members of the struct that
* "p" points to. The client is responsible for placing the cursor at the
* beginning of the token currently being typed, then filtering the results
* based on the contents of the token. For example, when code-completing for
* the expression \c p->get, the client should provide the location just after
* the ">" (e.g., pointing at the "g") to this code-completion hook. Then, the
* client can filter the results based on the current token text ("get"), only
* showing those results that start with "get". The intent of this interface
* is to separate the relatively high-latency acquisition of code-completion
* results from the filtering of results on a per-character basis, which must
* have a lower latency.
*
* \param TU The translation unit in which code-completion should
* occur. The source files for this translation unit need not be
* completely up-to-date (and the contents of those source files may
* be overridden via \p unsaved_files). Cursors referring into the
* translation unit may be invalidated by this invocation.
*
* \param complete_filename The name of the source file where code
* completion should be performed. This filename may be any file
* included in the translation unit.
*
* \param complete_line The line at which code-completion should occur.
*
* \param complete_column The column at which code-completion should occur.
* Note that the column should point just after the syntactic construct that
* initiated code completion, and not in the middle of a lexical token.
*
* \param unsaved_files the Files that have not yet been saved to disk
* but may be required for parsing or code completion, including the
* contents of those files.  The contents and name of these files (as
* specified by CXUnsavedFile) are copied when necessary, so the
* client only needs to guarantee their validity until the call to
* this function returns.
*
* \param num_unsaved_files The number of unsaved file entries in \p
* unsaved_files.
*
* \param options Extra options that control the behavior of code
* completion, expressed as a bitwise OR of the enumerators of the
* CXCodeComplete_Flags enumeration. The
* \c clang_defaultCodeCompleteOptions() function returns a default set
* of code-completion options.
*
* \returns If successful, a new \c CXCodeCompleteResults structure
* containing code-completion results, which should eventually be
* freed with \c clang_disposeCodeCompleteResults(). If code
* completion fails, returns NULL.
*/
clang_codeCompleteAt :: (TU: CXTranslationUnit, complete_filename: *u8, complete_line: u32, complete_column: u32, unsaved_files: *CXUnsavedFile, num_unsaved_files: u32, options: u32) -> *CXCodeCompleteResults #foreign libclang;

/**
* Sort the code-completion results in case-insensitive alphabetical
* order.
*
* \param Results The set of results to sort.
* \param NumResults The number of results in \p Results.
*/
clang_sortCodeCompletionResults :: (Results: *CXCompletionResult, NumResults: u32) -> void #foreign libclang;

/**
* Free the given set of code-completion results.
*/
clang_disposeCodeCompleteResults :: (Results: *CXCodeCompleteResults) -> void #foreign libclang;

/**
* Determine the number of diagnostics produced prior to the
* location where code completion was performed.
*/
clang_codeCompleteGetNumDiagnostics :: (Results: *CXCodeCompleteResults) -> u32 #foreign libclang;

/**
* Retrieve a diagnostic associated with the given code completion.
*
* \param Results the code completion results to query.
* \param Index the zero-based diagnostic number to retrieve.
*
* \returns the requested diagnostic. This diagnostic must be freed
* via a call to \c clang_disposeDiagnostic().
*/
clang_codeCompleteGetDiagnostic :: (Results: *CXCodeCompleteResults, Index: u32) -> CXDiagnostic #foreign libclang;

/**
* Determines what completions are appropriate for the context
* the given code completion.
*
* \param Results the code completion results to query
*
* \returns the kinds of completions that are appropriate for use
* along with the given code completion results.
*/
clang_codeCompleteGetContexts :: (Results: *CXCodeCompleteResults) -> u64 #foreign libclang;

/**
* Returns the cursor kind for the container for the current code
* completion context. The container is only guaranteed to be set for
* contexts where a container exists (i.e. member accesses or Objective-C
* message sends); if there is not a container, this function will return
* CXCursor_InvalidCode.
*
* \param Results the code completion results to query
*
* \param IsIncomplete on return, this value will be false if Clang has complete
* information about the container. If Clang does not have complete
* information, this value will be true.
*
* \returns the container kind, or CXCursor_InvalidCode if there is not a
* container
*/
clang_codeCompleteGetContainerKind :: (Results: *CXCodeCompleteResults, IsIncomplete: *u32) -> CXCursorKind #foreign libclang;

/**
* Returns the USR for the container for the current code completion
* context. If there is not a container for the current context, this
* function will return the empty string.
*
* \param Results the code completion results to query
*
* \returns the USR for the container
*/
clang_codeCompleteGetContainerUSR :: (Results: *CXCodeCompleteResults) -> CXString #foreign libclang;

/**
* Returns the currently-entered selector for an Objective-C message
* send, formatted like "initWithFoo:bar:". Only guaranteed to return a
* non-empty string for CXCompletionContext_ObjCInstanceMessage and
* CXCompletionContext_ObjCClassMessage.
*
* \param Results the code completion results to query
*
* \returns the selector (or partial selector) that has been entered thus far
* for an Objective-C message send.
*/
clang_codeCompleteGetObjCSelector :: (Results: *CXCodeCompleteResults) -> CXString #foreign libclang;

/**
* Return a version string, suitable for showing to a user, but not
*        intended to be parsed (the format is not guaranteed to be stable).
*/
clang_getClangVersion :: () -> CXString #foreign libclang;

/**
* Enable/disable crash recovery.
*
* \param isEnabled Flag to indicate if crash recovery is enabled.  A non-zero
*        value enables crash recovery, while 0 disables it.
*/
clang_toggleCrashRecovery :: (isEnabled: u32) -> void #foreign libclang;

/**
* Visitor invoked for each file in a translation unit
*        (used with clang_getInclusions()).
*
* This visitor function will be invoked by clang_getInclusions() for each
* file included (either at the top-level or by \#include directives) within
* a translation unit.  The first argument is the file being included, and
* the second and third arguments provide the inclusion stack.  The
* array is sorted in order of immediate inclusion.  For example,
* the first element refers to the location that included 'included_file'.
*/
CXInclusionVisitor :: #type (included_file: CXFile, inclusion_stack: *CXSourceLocation, include_len: u32, client_data: CXClientData) -> void #c_call;

/**
* Visit the set of preprocessor inclusions in a translation unit.
*   The visitor function is called with the provided data for every included
*   file.  This does not include headers included by the PCH file (unless one
*   is inspecting the inclusions in the PCH file itself).
*/
clang_getInclusions :: (tu: CXTranslationUnit, visitor: CXInclusionVisitor, client_data: CXClientData) -> void #foreign libclang;

CXEvalResultKind :: enum u32 {
    Int            :: 1;
    Float          :: 2;
    ObjCStrLiteral :: 3;
    StrLiteral     :: 4;
    CFStr          :: 5;
    Other          :: 6;
    UnExposed      :: 0;
}

/**
* Evaluation result of a cursor
*/
CXEvalResult :: *void;

/**
* If cursor is a statement declaration tries to evaluate the
* statement and if its variable, tries to evaluate its initializer,
* into its corresponding type.
* If it's an expression, tries to evaluate the expression.
*/
clang_Cursor_Evaluate :: (C: CXCursor) -> CXEvalResult #foreign libclang;

/**
* Returns the kind of the evaluated result.
*/
clang_EvalResult_getKind :: (E: CXEvalResult) -> CXEvalResultKind #foreign libclang;

/**
* Returns the evaluation result as integer if the
* kind is Int.
*/
clang_EvalResult_getAsInt :: (E: CXEvalResult) -> s32 #foreign libclang;

/**
* Returns the evaluation result as a long long integer if the
* kind is Int. This prevents overflows that may happen if the result is
* returned with clang_EvalResult_getAsInt.
*/
clang_EvalResult_getAsLongLong :: (E: CXEvalResult) -> s64 #foreign libclang;

/**
* Returns a non-zero value if the kind is Int and the evaluation
* result resulted in an unsigned integer.
*/
clang_EvalResult_isUnsignedInt :: (E: CXEvalResult) -> u32 #foreign libclang;

/**
* Returns the evaluation result as an unsigned integer if
* the kind is Int and clang_EvalResult_isUnsignedInt is non-zero.
*/
clang_EvalResult_getAsUnsigned :: (E: CXEvalResult) -> u64 #foreign libclang;

/**
* Returns the evaluation result as double if the
* kind is double.
*/
clang_EvalResult_getAsDouble :: (E: CXEvalResult) -> float64 #foreign libclang;

/**
* Returns the evaluation result as a constant string if the
* kind is other than Int or float. User must not free this pointer,
* instead call clang_EvalResult_dispose on the CXEvalResult returned
* by clang_Cursor_Evaluate.
*/
clang_EvalResult_getAsStr :: (E: CXEvalResult) -> *u8 #foreign libclang;

/**
* Disposes the created Eval memory.
*/
clang_EvalResult_dispose :: (E: CXEvalResult) -> void #foreign libclang;

/** \defgroup CINDEX_HIGH Higher level API functions
*
* @{
*/
CXVisitorResult :: enum u32 {
    Break    :: 0;
    Continue :: 1;
}

CXCursorAndRangeVisitor :: struct {
    _context: *void;
    visit:    #type (_context: *void, unknown0: CXCursor, unknown1: CXSourceRange) -> CXVisitorResult #c_call;
}

CXResult :: enum u32 {
    Success    :: 0;
    Invalid    :: 1;
    VisitBreak :: 2;
}

/**
* Find references of a declaration in a specific file.
*
* \param cursor pointing to a declaration or a reference of one.
*
* \param file to search for references.
*
* \param visitor callback that will receive pairs of CXCursor/CXSourceRange for
* each reference found.
* The CXSourceRange will point inside the file; if the reference is inside
* a macro (and not a macro argument) the CXSourceRange will be invalid.
*
* \returns one of the CXResult enumerators.
*/
clang_findReferencesInFile :: (cursor: CXCursor, file: CXFile, visitor: CXCursorAndRangeVisitor) -> CXResult #foreign libclang;

/**
* Find #import/#include directives in a specific file.
*
* \param TU translation unit containing the file to query.
*
* \param file to search for #import/#include directives.
*
* \param visitor callback that will receive pairs of CXCursor/CXSourceRange for
* each directive found.
*
* \returns one of the CXResult enumerators.
*/
clang_findIncludesInFile :: (TU: CXTranslationUnit, file: CXFile, visitor: CXCursorAndRangeVisitor) -> CXResult #foreign libclang;

/**
* The client's data object that is associated with a CXFile.
*/
CXIdxClientFile :: *void;

/**
* The client's data object that is associated with a semantic entity.
*/
CXIdxClientEntity :: *void;

/**
* The client's data object that is associated with a semantic container
* of entities.
*/
CXIdxClientContainer :: *void;

/**
* The client's data object that is associated with an AST file (PCH
* or module).
*/
CXIdxClientASTFile :: *void;

/**
* Source location passed to index callbacks.
*/
CXIdxLoc :: struct {
    ptr_data: [2] *void;
    int_data: u32;
}

/**
* Data for ppIncludedFile callback.
*/
CXIdxIncludedFileInfo :: struct {
    /**
    * Location of '#' in the \#include/\#import directive.
    */
    hashLoc:        CXIdxLoc;
    /**
    * Filename as written in the \#include/\#import directive.
    */
    filename:       *u8;
    /**
    * The actual file that the \#include/\#import directive resolved to.
    */
    file:           CXFile;
    isImport:       s32;
    isAngled:       s32;
    /**
    * Non-zero if the directive was automatically turned into a module
    * import.
    */
    isModuleImport: s32;
}

/**
* Data for IndexerCallbacks#importedASTFile.
*/
CXIdxImportedASTFileInfo :: struct {
    /**
    * Top level AST file containing the imported PCH, module or submodule.
    */
    file:       CXFile;
    /**
    * The imported module or NULL if the AST file is a PCH.
    */
    module:     CXModule;
    /**
    * Location where the file is imported. Applicable only for modules.
    */
    loc:        CXIdxLoc;
    /**
    * Non-zero if an inclusion directive was automatically turned into
    * a module import. Applicable only for modules.
    */
    isImplicit: s32;
}

CXIdxEntityKind :: enum u32 {
    Unexposed             :: 0;
    Typedef               :: 1;
    Function              :: 2;
    Variable              :: 3;
    Field                 :: 4;
    EnumConstant          :: 5;
    ObjCClass             :: 6;
    ObjCProtocol          :: 7;
    ObjCCategory          :: 8;
    ObjCInstanceMethod    :: 9;
    ObjCClassMethod       :: 10;
    ObjCProperty          :: 11;
    ObjCIvar              :: 12;
    Enum                  :: 13;
    Struct                :: 14;
    Union                 :: 15;
    CXXClass              :: 16;
    CXXNamespace          :: 17;
    CXXNamespaceAlias     :: 18;
    CXXStaticVariable     :: 19;
    CXXStaticMethod       :: 20;
    CXXInstanceMethod     :: 21;
    CXXConstructor        :: 22;
    CXXDestructor         :: 23;
    CXXConversionFunction :: 24;
    CXXTypeAlias          :: 25;
    CXXInterface          :: 26;
    CXXConcept            :: 27;
}

CXIdxEntityLanguage :: enum u32 {
    None  :: 0;
    C     :: 1;
    ObjC  :: 2;
    CXX   :: 3;
    Swift :: 4;
}

/**
* Extra C++ template information for an entity. This can apply to:
* CXIdxEntity_Function
* CXIdxEntity_CXXClass
* CXIdxEntity_CXXStaticMethod
* CXIdxEntity_CXXInstanceMethod
* CXIdxEntity_CXXConstructor
* CXIdxEntity_CXXConversionFunction
* CXIdxEntity_CXXTypeAlias
*/
CXIdxEntityCXXTemplateKind :: enum u32 {
    NonTemplate                   :: 0;
    Template                      :: 1;
    TemplatePartialSpecialization :: 2;
    TemplateSpecialization        :: 3;
}

CXIdxAttrKind :: enum u32 {
    Unexposed          :: 0;
    IBAction           :: 1;
    IBOutlet           :: 2;
    IBOutletCollection :: 3;
}

CXIdxAttrInfo :: struct {
    kind:   CXIdxAttrKind;
    cursor: CXCursor;
    loc:    CXIdxLoc;
}

CXIdxEntityInfo :: struct {
    kind:          CXIdxEntityKind;
    templateKind:  CXIdxEntityCXXTemplateKind;
    lang:          CXIdxEntityLanguage;
    name:          *u8;
    USR:           *u8;
    cursor:        CXCursor;
    attributes:    **CXIdxAttrInfo;
    numAttributes: u32;
}

CXIdxContainerInfo :: struct {
    cursor: CXCursor;
}

CXIdxIBOutletCollectionAttrInfo :: struct {
    attrInfo:    *CXIdxAttrInfo;
    objcClass:   *CXIdxEntityInfo;
    classCursor: CXCursor;
    classLoc:    CXIdxLoc;
}

CXIdxDeclInfoFlags :: enum u32 {
    CXIdxDeclFlag_Skipped :: 1;
}

CXIdxDeclInfo :: struct {
    entityInfo:        *CXIdxEntityInfo;
    cursor:            CXCursor;
    loc:               CXIdxLoc;
    semanticContainer: *CXIdxContainerInfo;
    /**
    * Generally same as #semanticContainer but can be different in
    * cases like out-of-line C++ member functions.
    */
    lexicalContainer:  *CXIdxContainerInfo;
    isRedeclaration:   s32;
    isDefinition:      s32;
    isContainer:       s32;
    declAsContainer:   *CXIdxContainerInfo;
    /**
    * Whether the declaration exists in code or was created implicitly
    * by the compiler, e.g. implicit Objective-C methods for properties.
    */
    isImplicit:        s32;
    attributes:        **CXIdxAttrInfo;
    numAttributes:     u32;
    flags:             u32;
}

CXIdxObjCContainerKind :: enum u32 {
    ForwardRef     :: 0;
    Interface      :: 1;
    Implementation :: 2;
}

CXIdxObjCContainerDeclInfo :: struct {
    declInfo: *CXIdxDeclInfo;
    kind:     CXIdxObjCContainerKind;
}

CXIdxBaseClassInfo :: struct {
    base:   *CXIdxEntityInfo;
    cursor: CXCursor;
    loc:    CXIdxLoc;
}

CXIdxObjCProtocolRefInfo :: struct {
    protocol: *CXIdxEntityInfo;
    cursor:   CXCursor;
    loc:      CXIdxLoc;
}

CXIdxObjCProtocolRefListInfo :: struct {
    protocols:    **CXIdxObjCProtocolRefInfo;
    numProtocols: u32;
}

CXIdxObjCInterfaceDeclInfo :: struct {
    containerInfo: *CXIdxObjCContainerDeclInfo;
    superInfo:     *CXIdxBaseClassInfo;
    protocols:     *CXIdxObjCProtocolRefListInfo;
}

CXIdxObjCCategoryDeclInfo :: struct {
    containerInfo: *CXIdxObjCContainerDeclInfo;
    objcClass:     *CXIdxEntityInfo;
    classCursor:   CXCursor;
    classLoc:      CXIdxLoc;
    protocols:     *CXIdxObjCProtocolRefListInfo;
}

CXIdxObjCPropertyDeclInfo :: struct {
    declInfo: *CXIdxDeclInfo;
    getter:   *CXIdxEntityInfo;
    setter:   *CXIdxEntityInfo;
}

CXIdxCXXClassDeclInfo :: struct {
    declInfo: *CXIdxDeclInfo;
    bases:    **CXIdxBaseClassInfo;
    numBases: u32;
}

/**
* Data for IndexerCallbacks#indexEntityReference.
*
* This may be deprecated in a future version as this duplicates
* the \c CXSymbolRole_Implicit bit in \c CXSymbolRole.
*/
CXIdxEntityRefKind :: enum u32 {
    Direct   :: 1;
    Implicit :: 2;
}

/**
* Roles that are attributed to symbol occurrences.
*
* Internal: this currently mirrors low 9 bits of clang::index::SymbolRole with
* higher bits zeroed. These high bits may be exposed in the future.
*/
CXSymbolRole :: enum u32 {
    None        :: 0;
    Declaration :: 1;
    Definition  :: 2;
    Reference   :: 4;
    Read        :: 8;
    Write       :: 16;
    Call        :: 32;
    Dynamic     :: 64;
    AddressOf   :: 128;
    Implicit    :: 256;
}

/**
* Data for IndexerCallbacks#indexEntityReference.
*/
CXIdxEntityRefInfo :: struct {
    kind:             CXIdxEntityRefKind;
    /**
    * Reference cursor.
    */
    cursor:           CXCursor;
    loc:              CXIdxLoc;
    /**
    * The entity that gets referenced.
    */
    referencedEntity: *CXIdxEntityInfo;
    /**
    * Immediate "parent" of the reference. For example:
    *
    * \code
    * Foo *var;
    * \endcode
    *
    * The parent of reference of type 'Foo' is the variable 'var'.
    * For references inside statement bodies of functions/methods,
    * the parentEntity will be the function/method.
    */
    parentEntity:     *CXIdxEntityInfo;
    /**
    * Lexical container context of the reference.
    */
    container:        *CXIdxContainerInfo;
    /**
    * Sets of symbol roles of the reference.
    */
    role:             CXSymbolRole;
}

/**
* A group of callbacks used by #clang_indexSourceFile and
* #clang_indexTranslationUnit.
*/
IndexerCallbacks :: struct {
    /**
    * Called periodically to check whether indexing should be aborted.
    * Should return 0 to continue, and non-zero to abort.
    */
    abortQuery:             #type (client_data: CXClientData, reserved: *void) -> s32 #c_call;
    /**
    * Called at the end of indexing; passes the complete diagnostic set.
    */
    diagnostic:             #type (client_data: CXClientData, unknown0: CXDiagnosticSet, reserved: *void) -> void #c_call;
    enteredMainFile:        #type (client_data: CXClientData, mainFile: CXFile, reserved: *void) -> CXIdxClientFile #c_call;
    /**
    * Called when a file gets \#included/\#imported.
    */
    ppIncludedFile:         #type (client_data: CXClientData, unknown0: *CXIdxIncludedFileInfo) -> CXIdxClientFile #c_call;
    /**
    * Called when a AST file (PCH or module) gets imported.
    *
    * AST files will not get indexed (there will not be callbacks to index all
    * the entities in an AST file). The recommended action is that, if the AST
    * file is not already indexed, to initiate a new indexing job specific to
    * the AST file.
    */
    importedASTFile:        #type (client_data: CXClientData, unknown0: *CXIdxImportedASTFileInfo) -> CXIdxClientASTFile #c_call;
    /**
    * Called at the beginning of indexing a translation unit.
    */
    startedTranslationUnit: #type (client_data: CXClientData, reserved: *void) -> CXIdxClientContainer #c_call;
    indexDeclaration:       #type (client_data: CXClientData, unknown0: *CXIdxDeclInfo) -> void #c_call;
    /**
    * Called to index a reference of an entity.
    */
    indexEntityReference:   #type (client_data: CXClientData, unknown0: *CXIdxEntityRefInfo) -> void #c_call;
}

clang_index_isEntityObjCContainerKind :: (unknown0: CXIdxEntityKind) -> s32 #foreign libclang;

clang_index_getObjCContainerDeclInfo :: (unknown0: *CXIdxDeclInfo) -> *CXIdxObjCContainerDeclInfo #foreign libclang;

clang_index_getObjCInterfaceDeclInfo :: (unknown0: *CXIdxDeclInfo) -> *CXIdxObjCInterfaceDeclInfo #foreign libclang;

clang_index_getObjCCategoryDeclInfo :: (unknown0: *CXIdxDeclInfo) -> *CXIdxObjCCategoryDeclInfo #foreign libclang;

clang_index_getObjCProtocolRefListInfo :: (unknown0: *CXIdxDeclInfo) -> *CXIdxObjCProtocolRefListInfo #foreign libclang;

clang_index_getObjCPropertyDeclInfo :: (unknown0: *CXIdxDeclInfo) -> *CXIdxObjCPropertyDeclInfo #foreign libclang;

clang_index_getIBOutletCollectionAttrInfo :: (unknown0: *CXIdxAttrInfo) -> *CXIdxIBOutletCollectionAttrInfo #foreign libclang;

clang_index_getCXXClassDeclInfo :: (unknown0: *CXIdxDeclInfo) -> *CXIdxCXXClassDeclInfo #foreign libclang;

/**
* For retrieving a custom CXIdxClientContainer attached to a
* container.
*/
clang_index_getClientContainer :: (unknown0: *CXIdxContainerInfo) -> CXIdxClientContainer #foreign libclang;

/**
* For setting a custom CXIdxClientContainer attached to a
* container.
*/
clang_index_setClientContainer :: (unknown0: *CXIdxContainerInfo, unknown1: CXIdxClientContainer) -> void #foreign libclang;

/**
* For retrieving a custom CXIdxClientEntity attached to an entity.
*/
clang_index_getClientEntity :: (unknown0: *CXIdxEntityInfo) -> CXIdxClientEntity #foreign libclang;

/**
* For setting a custom CXIdxClientEntity attached to an entity.
*/
clang_index_setClientEntity :: (unknown0: *CXIdxEntityInfo, unknown1: CXIdxClientEntity) -> void #foreign libclang;

/**
* An indexing action/session, to be applied to one or multiple
* translation units.
*/
CXIndexAction :: *void;

/**
* An indexing action/session, to be applied to one or multiple
* translation units.
*
* \param CIdx The index object with which the index action will be associated.
*/
clang_IndexAction_create :: (CIdx: CXIndex) -> CXIndexAction #foreign libclang;

/**
* Destroy the given index action.
*
* The index action must not be destroyed until all of the translation units
* created within that index action have been destroyed.
*/
clang_IndexAction_dispose :: (unknown0: CXIndexAction) -> void #foreign libclang;

CXIndexOptFlags :: enum u32 {
    None                                :: 0;
    SuppressRedundantRefs               :: 1;
    IndexFunctionLocalSymbols           :: 2;
    IndexImplicitTemplateInstantiations :: 4;
    SuppressWarnings                    :: 8;
    SkipParsedBodiesInSession           :: 16;
}

/**
* Index the given source file and the translation unit corresponding
* to that file via callbacks implemented through #IndexerCallbacks.
*
* \param client_data pointer data supplied by the client, which will
* be passed to the invoked callbacks.
*
* \param index_callbacks Pointer to indexing callbacks that the client
* implements.
*
* \param index_callbacks_size Size of #IndexerCallbacks structure that gets
* passed in index_callbacks.
*
* \param index_options A bitmask of options that affects how indexing is
* performed. This should be a bitwise OR of the CXIndexOpt_XXX flags.
*
* \param[out] out_TU pointer to store a \c CXTranslationUnit that can be
* reused after indexing is finished. Set to \c NULL if you do not require it.
*
* \returns 0 on success or if there were errors from which the compiler could
* recover.  If there is a failure from which there is no recovery, returns
* a non-zero \c CXErrorCode.
*
* The rest of the parameters are the same as #clang_parseTranslationUnit.
*/
clang_indexSourceFile :: (unknown0: CXIndexAction, client_data: CXClientData, index_callbacks: *IndexerCallbacks, index_callbacks_size: u32, index_options: u32, source_filename: *u8, command_line_args: **u8, num_command_line_args: s32, unsaved_files: *CXUnsavedFile, num_unsaved_files: u32, out_TU: *CXTranslationUnit, TU_options: u32) -> s32 #foreign libclang;

/**
* Same as clang_indexSourceFile but requires a full command line
* for \c command_line_args including argv[0]. This is useful if the standard
* library paths are relative to the binary.
*/
clang_indexSourceFileFullArgv :: (unknown0: CXIndexAction, client_data: CXClientData, index_callbacks: *IndexerCallbacks, index_callbacks_size: u32, index_options: u32, source_filename: *u8, command_line_args: **u8, num_command_line_args: s32, unsaved_files: *CXUnsavedFile, num_unsaved_files: u32, out_TU: *CXTranslationUnit, TU_options: u32) -> s32 #foreign libclang;

/**
* Index the given translation unit via callbacks implemented through
* #IndexerCallbacks.
*
* The order of callback invocations is not guaranteed to be the same as
* when indexing a source file. The high level order will be:
*
*   -Preprocessor callbacks invocations
*   -Declaration/reference callbacks invocations
*   -Diagnostic callback invocations
*
* The parameters are the same as #clang_indexSourceFile.
*
* \returns If there is a failure from which there is no recovery, returns
* non-zero, otherwise returns 0.
*/
clang_indexTranslationUnit :: (unknown0: CXIndexAction, client_data: CXClientData, index_callbacks: *IndexerCallbacks, index_callbacks_size: u32, index_options: u32, unknown1: CXTranslationUnit) -> s32 #foreign libclang;

/**
* Retrieve the CXIdxFile, file, line, column, and offset represented by
* the given CXIdxLoc.
*
* If the location refers into a macro expansion, retrieves the
* location of the macro expansion and if it refers into a macro argument
* retrieves the location of the argument.
*/
clang_indexLoc_getFileLocation :: (loc: CXIdxLoc, indexFile: *CXIdxClientFile, file: *CXFile, line: *u32, column: *u32, offset: *u32) -> void #foreign libclang;

/**
* Retrieve the CXSourceLocation represented by the given CXIdxLoc.
*/
clang_indexLoc_getCXSourceLocation :: (loc: CXIdxLoc) -> CXSourceLocation #foreign libclang;

/**
* Visitor invoked for each field found by a traversal.
*
* This visitor function will be invoked for each field found by
* \c clang_Type_visitFields. Its first argument is the cursor being
* visited, its second argument is the client data provided to
* \c clang_Type_visitFields.
*
* The visitor should return one of the \c CXVisitorResult values
* to direct \c clang_Type_visitFields.
*/
CXFieldVisitor :: #type (C: CXCursor, client_data: CXClientData) -> CXVisitorResult #c_call;

/**
* Visit the fields of a particular type.
*
* This function visits all the direct fields of the given cursor,
* invoking the given \p visitor function with the cursors of each
* visited field. The traversal may be ended prematurely, if
* the visitor returns \c CXFieldVisit_Break.
*
* \param T the record type whose field may be visited.
*
* \param visitor the visitor function that will be invoked for each
* field of \p T.
*
* \param client_data pointer data supplied by the client, which will
* be passed to the visitor each time it is invoked.
*
* \returns a non-zero value if the traversal was terminated
* prematurely by the visitor returning \c CXFieldVisit_Break.
*/
clang_Type_visitFields :: (T: CXType, visitor: CXFieldVisitor, client_data: CXClientData) -> u32 #foreign libclang;

/**
* Visit the base classes of a type.
*
* This function visits all the direct base classes of a the given cursor,
* invoking the given \p visitor function with the cursors of each
* visited base. The traversal may be ended prematurely, if
* the visitor returns \c CXFieldVisit_Break.
*
* \param T the record type whose field may be visited.
*
* \param visitor the visitor function that will be invoked for each
* field of \p T.
*
* \param client_data pointer data supplied by the client, which will
* be passed to the visitor each time it is invoked.
*
* \returns a non-zero value if the traversal was terminated
* prematurely by the visitor returning \c CXFieldVisit_Break.
*/
clang_visitCXXBaseClasses :: (T: CXType, visitor: CXFieldVisitor, client_data: CXClientData) -> u32 #foreign libclang;

/**
* Visit the class methods of a type.
*
* This function visits all the methods of the given cursor,
* invoking the given \p visitor function with the cursors of each
* visited method. The traversal may be ended prematurely, if
* the visitor returns \c CXFieldVisit_Break.
*
* \param T The record type whose field may be visited.
*
* \param visitor The visitor function that will be invoked for each
* field of \p T.
*
* \param client_data Pointer data supplied by the client, which will
* be passed to the visitor each time it is invoked.
*
* \returns A non-zero value if the traversal was terminated
* prematurely by the visitor returning \c CXFieldVisit_Break.
*/
clang_visitCXXMethods :: (T: CXType, visitor: CXFieldVisitor, client_data: CXClientData) -> u32 #foreign libclang;

/**
* Describes the kind of binary operators.
*/
CXBinaryOperatorKind :: enum u32 {
    Invalid   :: 0;
    PtrMemD   :: 1;
    PtrMemI   :: 2;
    Mul       :: 3;
    Div       :: 4;
    Rem       :: 5;
    Add       :: 6;
    Sub       :: 7;
    Shl       :: 8;
    Shr       :: 9;
    Cmp       :: 10;
    LT        :: 11;
    GT        :: 12;
    LE        :: 13;
    GE        :: 14;
    EQ        :: 15;
    NE        :: 16;
    And       :: 17;
    Xor       :: 18;
    Or        :: 19;
    LAnd      :: 20;
    LOr       :: 21;
    Assign    :: 22;
    MulAssign :: 23;
    DivAssign :: 24;
    RemAssign :: 25;
    AddAssign :: 26;
    SubAssign :: 27;
    ShlAssign :: 28;
    ShrAssign :: 29;
    AndAssign :: 30;
    XorAssign :: 31;
    OrAssign  :: 32;
    Comma     :: 33;
    Last      :: 33;
}

/**
* Retrieve the spelling of a given CXBinaryOperatorKind.
*/
clang_getBinaryOperatorKindSpelling :: (kind: CXBinaryOperatorKind) -> CXString #foreign libclang;

/**
* Retrieve the binary operator kind of this cursor.
*
* If this cursor is not a binary operator then returns Invalid.
*/
clang_getCursorBinaryOperatorKind :: (cursor: CXCursor) -> CXBinaryOperatorKind #foreign libclang;

/**
* Describes the kind of unary operators.
*/
CXUnaryOperatorKind :: enum u32 {
    Invalid   :: 0;
    PostInc   :: 1;
    PostDec   :: 2;
    PreInc    :: 3;
    PreDec    :: 4;
    AddrOf    :: 5;
    Deref     :: 6;
    Plus      :: 7;
    Minus     :: 8;
    Not       :: 9;
    LNot      :: 10;
    Real      :: 11;
    Imag      :: 12;
    Extension :: 13;
    Coawait   :: 14;
}

/**
* Retrieve the spelling of a given CXUnaryOperatorKind.
*/
clang_getUnaryOperatorKindSpelling :: (kind: CXUnaryOperatorKind) -> CXString #foreign libclang;

/**
* Retrieve the unary operator kind of this cursor.
*
* If this cursor is not a unary operator then returns Invalid.
*/
clang_getCursorUnaryOperatorKind :: (cursor: CXCursor) -> CXUnaryOperatorKind #foreign libclang;

/* CINDEX_DEPRECATED - disabled to silence MSVC deprecation warnings */
CXRemapping :: *void;

clang_getRemappings :: (unknown0: *u8) -> CXRemapping #foreign libclang;

clang_getRemappingsFromFileList :: (unknown0: **u8, unknown1: u32) -> CXRemapping #foreign libclang;

clang_remap_getNumFiles :: (unknown0: CXRemapping) -> u32 #foreign libclang;

clang_remap_getFilenames :: (unknown0: CXRemapping, unknown1: u32, unknown2: *CXString, unknown3: *CXString) -> void #foreign libclang;

clang_remap_dispose :: (unknown0: CXRemapping) -> void #foreign libclang;

/**
* A parsed comment.
*/
CXComment :: struct {
    ASTNode:         *void;
    TranslationUnit: CXTranslationUnit;
}

/**
* Given a cursor that represents a documentable entity (e.g.,
* declaration), return the associated parsed comment as a
* \c CXComment_FullComment AST node.
*/
clang_Cursor_getParsedComment :: (C: CXCursor) -> CXComment #foreign libclang;

/**
* Describes the type of the comment AST node (\c CXComment).  A comment
* node can be considered block content (e. g., paragraph), inline content
* (plain text) or neither (the root AST node).
*/
CXCommentKind :: enum u32 {
    Null                 :: 0;
    Text                 :: 1;
    InlineCommand        :: 2;
    HTMLStartTag         :: 3;
    HTMLEndTag           :: 4;
    Paragraph            :: 5;
    BlockCommand         :: 6;
    ParamCommand         :: 7;
    TParamCommand        :: 8;
    VerbatimBlockCommand :: 9;
    VerbatimBlockLine    :: 10;
    VerbatimLine         :: 11;
    FullComment          :: 12;
}

/**
* The most appropriate rendering mode for an inline command, chosen on
* command semantics in Doxygen.
*/
CXCommentInlineCommandRenderKind :: enum u32 {
    Normal     :: 0;
    Bold       :: 1;
    Monospaced :: 2;
    Emphasized :: 3;
    Anchor     :: 4;
}

/**
* Describes parameter passing direction for \\param or \\arg command.
*/
CXCommentParamPassDirection :: enum u32 {
    In    :: 0;
    Out   :: 1;
    InOut :: 2;
}

/**
* \param Comment AST node of any kind.
*
* \returns the type of the AST node.
*/
clang_Comment_getKind :: (Comment: CXComment) -> CXCommentKind #foreign libclang;

/**
* \param Comment AST node of any kind.
*
* \returns number of children of the AST node.
*/
clang_Comment_getNumChildren :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \param Comment AST node of any kind.
*
* \param ChildIdx child index (zero-based).
*
* \returns the specified child of the AST node.
*/
clang_Comment_getChild :: (Comment: CXComment, ChildIdx: u32) -> CXComment #foreign libclang;

/**
* A \c CXComment_Paragraph node is considered whitespace if it contains
* only \c CXComment_Text nodes that are empty or whitespace.
*
* Other AST nodes (except \c CXComment_Paragraph and \c CXComment_Text) are
* never considered whitespace.
*
* \returns non-zero if \c Comment is whitespace.
*/
clang_Comment_isWhitespace :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \returns non-zero if \c Comment is inline content and has a newline
* immediately following it in the comment text.  Newlines between paragraphs
* do not count.
*/
clang_InlineContentComment_hasTrailingNewline :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \param Comment a \c CXComment_Text AST node.
*
* \returns text contained in the AST node.
*/
clang_TextComment_getText :: (Comment: CXComment) -> CXString #foreign libclang;

/**
* \param Comment a \c CXComment_InlineCommand AST node.
*
* \returns name of the inline command.
*/
clang_InlineCommandComment_getCommandName :: (Comment: CXComment) -> CXString #foreign libclang;

/**
* \param Comment a \c CXComment_InlineCommand AST node.
*
* \returns the most appropriate rendering mode, chosen on command
* semantics in Doxygen.
*/
clang_InlineCommandComment_getRenderKind :: (Comment: CXComment) -> CXCommentInlineCommandRenderKind #foreign libclang;

/**
* \param Comment a \c CXComment_InlineCommand AST node.
*
* \returns number of command arguments.
*/
clang_InlineCommandComment_getNumArgs :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \param Comment a \c CXComment_InlineCommand AST node.
*
* \param ArgIdx argument index (zero-based).
*
* \returns text of the specified argument.
*/
clang_InlineCommandComment_getArgText :: (Comment: CXComment, ArgIdx: u32) -> CXString #foreign libclang;

/**
* \param Comment a \c CXComment_HTMLStartTag or \c CXComment_HTMLEndTag AST
* node.
*
* \returns HTML tag name.
*/
clang_HTMLTagComment_getTagName :: (Comment: CXComment) -> CXString #foreign libclang;

/**
* \param Comment a \c CXComment_HTMLStartTag AST node.
*
* \returns non-zero if tag is self-closing (for example, &lt;br /&gt;).
*/
clang_HTMLStartTagComment_isSelfClosing :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \param Comment a \c CXComment_HTMLStartTag AST node.
*
* \returns number of attributes (name-value pairs) attached to the start tag.
*/
clang_HTMLStartTag_getNumAttrs :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \param Comment a \c CXComment_HTMLStartTag AST node.
*
* \param AttrIdx attribute index (zero-based).
*
* \returns name of the specified attribute.
*/
clang_HTMLStartTag_getAttrName :: (Comment: CXComment, AttrIdx: u32) -> CXString #foreign libclang;

/**
* \param Comment a \c CXComment_HTMLStartTag AST node.
*
* \param AttrIdx attribute index (zero-based).
*
* \returns value of the specified attribute.
*/
clang_HTMLStartTag_getAttrValue :: (Comment: CXComment, AttrIdx: u32) -> CXString #foreign libclang;

/**
* \param Comment a \c CXComment_BlockCommand AST node.
*
* \returns name of the block command.
*/
clang_BlockCommandComment_getCommandName :: (Comment: CXComment) -> CXString #foreign libclang;

/**
* \param Comment a \c CXComment_BlockCommand AST node.
*
* \returns number of word-like arguments.
*/
clang_BlockCommandComment_getNumArgs :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \param Comment a \c CXComment_BlockCommand AST node.
*
* \param ArgIdx argument index (zero-based).
*
* \returns text of the specified word-like argument.
*/
clang_BlockCommandComment_getArgText :: (Comment: CXComment, ArgIdx: u32) -> CXString #foreign libclang;

/**
* \param Comment a \c CXComment_BlockCommand or
* \c CXComment_VerbatimBlockCommand AST node.
*
* \returns paragraph argument of the block command.
*/
clang_BlockCommandComment_getParagraph :: (Comment: CXComment) -> CXComment #foreign libclang;

/**
* \param Comment a \c CXComment_ParamCommand AST node.
*
* \returns parameter name.
*/
clang_ParamCommandComment_getParamName :: (Comment: CXComment) -> CXString #foreign libclang;

/**
* \param Comment a \c CXComment_ParamCommand AST node.
*
* \returns non-zero if the parameter that this AST node represents was found
* in the function prototype and \c clang_ParamCommandComment_getParamIndex
* function will return a meaningful value.
*/
clang_ParamCommandComment_isParamIndexValid :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \param Comment a \c CXComment_ParamCommand AST node.
*
* \returns zero-based parameter index in function prototype.
*/
clang_ParamCommandComment_getParamIndex :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \param Comment a \c CXComment_ParamCommand AST node.
*
* \returns non-zero if parameter passing direction was specified explicitly in
* the comment.
*/
clang_ParamCommandComment_isDirectionExplicit :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \param Comment a \c CXComment_ParamCommand AST node.
*
* \returns parameter passing direction.
*/
clang_ParamCommandComment_getDirection :: (Comment: CXComment) -> CXCommentParamPassDirection #foreign libclang;

/**
* \param Comment a \c CXComment_TParamCommand AST node.
*
* \returns template parameter name.
*/
clang_TParamCommandComment_getParamName :: (Comment: CXComment) -> CXString #foreign libclang;

/**
* \param Comment a \c CXComment_TParamCommand AST node.
*
* \returns non-zero if the parameter that this AST node represents was found
* in the template parameter list and
* \c clang_TParamCommandComment_getDepth and
* \c clang_TParamCommandComment_getIndex functions will return a meaningful
* value.
*/
clang_TParamCommandComment_isParamPositionValid :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \param Comment a \c CXComment_TParamCommand AST node.
*
* \returns zero-based nesting depth of this parameter in the template parameter list.
*
* For example,
* \verbatim
*     template<typename C, template<typename T> class TT>
*     void test(TT<int> aaa);
* \endverbatim
* for C and TT nesting depth is 0,
* for T nesting depth is 1.
*/
clang_TParamCommandComment_getDepth :: (Comment: CXComment) -> u32 #foreign libclang;

/**
* \param Comment a \c CXComment_TParamCommand AST node.
*
* \returns zero-based parameter index in the template parameter list at a
* given nesting depth.
*
* For example,
* \verbatim
*     template<typename C, template<typename T> class TT>
*     void test(TT<int> aaa);
* \endverbatim
* for C and TT nesting depth is 0, so we can ask for index at depth 0:
* at depth 0 C's index is 0, TT's index is 1.
*
* For T nesting depth is 1, so we can ask for index at depth 0 and 1:
* at depth 0 T's index is 1 (same as TT's),
* at depth 1 T's index is 0.
*/
clang_TParamCommandComment_getIndex :: (Comment: CXComment, Depth: u32) -> u32 #foreign libclang;

/**
* \param Comment a \c CXComment_VerbatimBlockLine AST node.
*
* \returns text contained in the AST node.
*/
clang_VerbatimBlockLineComment_getText :: (Comment: CXComment) -> CXString #foreign libclang;

/**
* \param Comment a \c CXComment_VerbatimLine AST node.
*
* \returns text contained in the AST node.
*/
clang_VerbatimLineComment_getText :: (Comment: CXComment) -> CXString #foreign libclang;

/**
* Convert an HTML tag AST node to string.
*
* \param Comment a \c CXComment_HTMLStartTag or \c CXComment_HTMLEndTag AST
* node.
*
* \returns string containing an HTML tag.
*/
clang_HTMLTagComment_getAsString :: (Comment: CXComment) -> CXString #foreign libclang;

/**
* Convert a given full parsed comment to an HTML fragment.
*
* Specific details of HTML layout are subject to change.  Don't try to parse
* this HTML back into an AST, use other APIs instead.
*
* Currently the following CSS classes are used:
* \li "para-brief" for \paragraph and equivalent commands;
* \li "para-returns" for \\returns paragraph and equivalent commands;
* \li "word-returns" for the "Returns" word in \\returns paragraph.
*
* Function argument documentation is rendered as a \<dl\> list with arguments
* sorted in function prototype order.  CSS classes used:
* \li "param-name-index-NUMBER" for parameter name (\<dt\>);
* \li "param-descr-index-NUMBER" for parameter description (\<dd\>);
* \li "param-name-index-invalid" and "param-descr-index-invalid" are used if
* parameter index is invalid.
*
* Template parameter documentation is rendered as a \<dl\> list with
* parameters sorted in template parameter list order.  CSS classes used:
* \li "tparam-name-index-NUMBER" for parameter name (\<dt\>);
* \li "tparam-descr-index-NUMBER" for parameter description (\<dd\>);
* \li "tparam-name-index-other" and "tparam-descr-index-other" are used for
* names inside template template parameters;
* \li "tparam-name-index-invalid" and "tparam-descr-index-invalid" are used if
* parameter position is invalid.
*
* \param Comment a \c CXComment_FullComment AST node.
*
* \returns string containing an HTML fragment.
*/
clang_FullComment_getAsHTML :: (Comment: CXComment) -> CXString #foreign libclang;

/**
* Convert a given full parsed comment to an XML document.
*
* A Relax NG schema for the XML can be found in comment-xml-schema.rng file
* inside clang source tree.
*
* \param Comment a \c CXComment_FullComment AST node.
*
* \returns string containing an XML document.
*/
clang_FullComment_getAsXML :: (Comment: CXComment) -> CXString #foreign libclang;

CXAPISetImpl :: struct {}
/**
* CXAPISet is an opaque type that represents a data structure containing all
* the API information for a given translation unit. This can be used for a
* single symbol symbol graph for a given symbol.
*/
CXAPISet :: *CXAPISetImpl;

/**
* Traverses the translation unit to create a \c CXAPISet.
*
* \param tu is the \c CXTranslationUnit to build the \c CXAPISet for.
*
* \param out_api is a pointer to the output of this function. It is needs to be
* disposed of by calling clang_disposeAPISet.
*
* \returns Error code indicating success or failure of the APISet creation.
*/
clang_createAPISet :: (tu: CXTranslationUnit, out_api: *CXAPISet) -> CXErrorCode #foreign libclang;

/**
* Dispose of an APISet.
*
* The provided \c CXAPISet can not be used after this function is called.
*/
clang_disposeAPISet :: (api: CXAPISet) -> void #foreign libclang;

/**
* Generate a single symbol symbol graph for the given USR. Returns a null
* string if the associated symbol can not be found in the provided \c CXAPISet.
*
* The output contains the symbol graph as well as some additional information
* about related symbols.
*
* \param usr is a string containing the USR of the symbol to generate the
* symbol graph for.
*
* \param api the \c CXAPISet to look for the symbol in.
*
* \returns a string containing the serialized symbol graph representation for
* the symbol being queried or a null string if it can not be found in the
* APISet.
*/
clang_getSymbolGraphForUSR :: (usr: *u8, api: CXAPISet) -> CXString #foreign libclang;

/**
* Generate a single symbol symbol graph for the declaration at the given
* cursor. Returns a null string if the AST node for the cursor isn't a
* declaration.
*
* The output contains the symbol graph as well as some additional information
* about related symbols.
*
* \param cursor the declaration for which to generate the single symbol symbol
* graph.
*
* \returns a string containing the serialized symbol graph representation for
* the symbol being queried or a null string if it can not be found in the
* APISet.
*/
clang_getSymbolGraphForCursor :: (cursor: CXCursor) -> CXString #foreign libclang;

#scope_file

libclang :: #library,system "libclang";
#import "POSIX";
