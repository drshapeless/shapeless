// This file is completely handcrafted to avoid putting freetype
// dependency in generation. deprecated function is not exported.
//
// This does not specify the foreign library name.

/*
 * Note: FreeType is not thread-safe.
 * Hence, these functions are not either.
 */

/*
 * hb-face from ft-face.
 */


/* This one creates a new hb-face for given ft-face.
 * When the returned hb-face is destroyed, the destroy
 * callback is called (if not NULL), with the ft-face passed
 * to it.
 *
 * The client is responsible to make sure that ft-face is
 * destroyed after hb-face is destroyed.
 *
 * Most often you don't want this function.  You should use either
 * hb_ft_face_create_cached(), or hb_ft_face_create_referenced().
 * In particular, if you are going to pass NULL as destroy, you
 * probably should use (the more recent) hb_ft_face_create_referenced()
 * instead.
 */
hb_ft_face_create :: (ft_face: FT_Face, destroy: hb_destroy_func_t) -> *hb_face_t #foreign;

/* This version is like hb_ft_face_create(), except that it caches
 * the hb-face using the generic pointer of the ft-face.  This means
 * that subsequent calls to this function with the same ft-face will
 * return the same hb-face (correctly referenced).
 *
 * Client is still responsible for making sure that ft-face is destroyed
 * after hb-face is.
 */
hb_ft_face_create_cached :: (ft_face: FT_Face) -> *hb_face_t #foreign;


/* This version is like hb_ft_face_create(), except that it calls
 * FT_Reference_Face() on ft-face, as such keeping ft-face alive
 * as long as the hb-face is.
 *
 * This is the most convenient version to use.  Use it unless you have
 * very good reasons not to.
 */
hb_ft_face_create_referenced :: (ft_face: FT_Face) -> *hb_face_t #foreign;

hb_ft_face_create_from_file_or_fail :: (file_name: *u8, index: u32) -> *hb_face_t #foreign;

hb_ft_face_create_from_blob_or_fail :: (blob: *hb_blob_t, index: u32) -> *hb_face_t #foreign;

/*
 * hb-font from ft-face.
 */

/*
 * Note:
 *
 * Set face size on ft-face before creating hb-font from it.
 * Otherwise hb-ft would NOT pick up the font size correctly.
 */

/* See notes on hb_ft_face_create().  Same issues re lifecycle-management
 * apply here.  Use hb_ft_font_create_referenced() if you can. */
hb_ft_font_create :: (ft_face: FT_Face, destroy: hb_destroy_func_t) -> *hb_font_t #foreign;

/* See notes on hb_ft_face_create_referenced() re lifecycle-management
 * issues. */
hb_ft_font_create_referenced :: (ft_face: FT_Face) -> *hb_font_t #foreign;

hb_ft_font_get_ft_face :: (font: *hb_font_t) -> FT_Face #foreign;

hb_ft_font_lock_face :: (font: *hb_font_t) -> FT_Face #foreign;

hb_ft_font_unlock_face :: (font: *hb_font_t) #foreign;

hb_ft_font_set_load_flags :: (font: *hb_font_t, load_flags: int) #foreign;

hb_ft_font_get_load_flags :: (font: *hb_font_t) -> int #foreign;

/* Call when size or variations settings on underlying FT_Face changed,
 * and you want to update the hb_font_t from it. */
hb_ft_font_changed :: (font: *hb_font_t) #foreign;

/* Call when size or variations settings on underlying hb_font_t may have
 * changed, and you want to update the FT_Face from it.  This call is fast
 * if nothing changed on hb_font_t. Returns true if changed. */
hb_ft_hb_font_changed :: (font: *hb_font_t) -> hb_bool_t #foreign;

/* Makes an hb_font_t use FreeType internally to implement font functions.
 * Note: this internally creates an FT_Face.  Use it when you create your
 * hb_face_t using hb_face_create(). */
hb_ft_font_set_funcs :: (font: *hb_font_t) #foreign;

#scope_file
#import "freetype";
