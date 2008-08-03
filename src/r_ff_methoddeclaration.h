/*
# R-C layer: forward declarations
# (c) 2007 Jens Oehlschägel
# Licence: GPL2
# Provided 'as is', use at your own risk
# Created: 2007-08-24
# Last changed: 2009-12-12
*/

/* All combinations of
   - getset, get set addgetset addset
   - (single), contiguous, vec, vector, array
   - boolean, logical, quad, nibble, byte, ubyte, short, ushort, integer, single, double, complex
*/


/* { -- getset ----------------------------------------------------------

SEXP r_ff__getset(      SEXP ffmode_, SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff__get(         SEXP ffmode_, SEXP ff_, SEXP index_             );
SEXP r_ff__set(         SEXP ffmode_, SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff__addgetset(   SEXP ffmode_, SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff__addset(      SEXP ffmode_, SEXP ff_, SEXP index_, SEXP value_);

#if VMODE_COMPILE_BOOLEAN
SEXP r_ff_boolean_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_boolean_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_boolean_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_boolean_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_boolean_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_LOGICAL
SEXP r_ff_logical_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_logical_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_logical_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_logical_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_logical_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_QUAD
SEXP r_ff_quad_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_quad_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_quad_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_quad_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_quad_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_NIBBLE
SEXP r_ff_nibble_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_nibble_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_nibble_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_nibble_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_nibble_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_BYTE
SEXP r_ff_byte_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_byte_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_byte_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_byte_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_byte_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_UBYTE
SEXP r_ff_ubyte_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_ubyte_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_ubyte_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_ubyte_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_ubyte_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_SHORT
SEXP r_ff_short_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_short_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_short_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_short_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_short_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_USHORT
SEXP r_ff_ushort_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_ushort_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_ushort_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_ushort_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_ushort_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_INTEGER
SEXP r_ff_integer_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_integer_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_integer_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_integer_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_integer_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_SINGLE
SEXP r_ff_single_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_single_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_single_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_single_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_single_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_DOUBLE
SEXP r_ff_double_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_double_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_double_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_double_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_double_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_COMPLEX
SEXP r_ff_complex_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_complex_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_complex_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_complex_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_complex_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif
#if VMODE_COMPILE_RAW
SEXP r_ff_raw_getset(      SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_raw_get(         SEXP ff_, SEXP index_             );
SEXP r_ff_raw_set(         SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_raw_addgetset(   SEXP ff_, SEXP index_, SEXP value_);
SEXP r_ff_raw_addset(      SEXP ff_, SEXP index_, SEXP value_);
#endif

 } -- getset ---------------------------------------------------------- */


/* { -- getset_contiguous ---------------------------------------------------------- */

SEXP r_ff__getset_contiguous(   SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff__get_contiguous(      SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff__set_contiguous(      SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff__addgetset_contiguous(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff__addset_contiguous(   SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);

#if VMODE_COMPILE_BOOLEAN
SEXP r_ff_boolean_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_boolean_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_boolean_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_boolean_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_boolean_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_LOGICAL
SEXP r_ff_logical_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_logical_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_logical_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_logical_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_logical_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_QUAD
SEXP r_ff_quad_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_quad_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_quad_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_quad_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_quad_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_NIBBLE
SEXP r_ff_nibble_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_nibble_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_nibble_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_nibble_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_nibble_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_BYTE
SEXP r_ff_byte_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_byte_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_byte_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_byte_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_byte_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_UBYTE
SEXP r_ff_ubyte_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ubyte_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_ubyte_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ubyte_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ubyte_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_SHORT
SEXP r_ff_short_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_short_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_short_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_short_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_short_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_USHORT
SEXP r_ff_ushort_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ushort_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_ushort_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ushort_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ushort_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_INTEGER
SEXP r_ff_integer_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_integer_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_integer_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_integer_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_integer_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_SINGLE
SEXP r_ff_single_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_single_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_single_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_single_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_single_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_DOUBLE
SEXP r_ff_double_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_double_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_double_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_double_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_double_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_COMPLEX
SEXP r_ff_complex_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_complex_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_complex_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_complex_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_complex_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_RAW
SEXP r_ff_raw_getset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_raw_get_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_raw_set_contiguous(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_raw_addgetset_contiguous(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_raw_addset_contiguous(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif

/* } -- getset_contiguous ---------------------------------------------------------- */


/* { -- getset_vec ---------------------------------------------------------- */

SEXP r_ff__getset_vec(   SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff__get_vec(      SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff__set_vec(      SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff__addgetset_vec(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff__addset_vec(   SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);

#if VMODE_COMPILE_BOOLEAN
SEXP r_ff_boolean_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_boolean_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_boolean_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_boolean_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_boolean_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_LOGICAL
SEXP r_ff_logical_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_logical_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_logical_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_logical_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_logical_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_QUAD
SEXP r_ff_quad_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_quad_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_quad_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_quad_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_quad_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_NIBBLE
SEXP r_ff_nibble_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_nibble_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_nibble_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_nibble_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_nibble_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_BYTE
SEXP r_ff_byte_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_byte_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_byte_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_byte_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_byte_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_UBYTE
SEXP r_ff_ubyte_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ubyte_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_ubyte_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ubyte_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ubyte_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_SHORT
SEXP r_ff_short_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_short_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_short_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_short_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_short_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_USHORT
SEXP r_ff_ushort_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ushort_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_ushort_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ushort_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ushort_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_INTEGER
SEXP r_ff_integer_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_integer_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_integer_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_integer_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_integer_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_SINGLE
SEXP r_ff_single_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_single_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_single_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_single_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_single_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_DOUBLE
SEXP r_ff_double_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_double_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_double_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_double_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_double_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_COMPLEX
SEXP r_ff_complex_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_complex_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_complex_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_complex_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_complex_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_RAW
SEXP r_ff_raw_getset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_raw_get_vec(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_raw_set_vec(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_raw_addgetset_vec(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_raw_addset_vec(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif

/* } -- getset_vec ---------------------------------------------------------- */


/* { -- getset_vector ---------------------------------------------------------- */

//SEXP r_ff_double_getset_vector_iteration(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_); /* dito, not used: demonstrating basic iterators */
SEXP r_ff__getset_vector(   SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff__get_vector(      SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff__set_vector(      SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff__addgetset_vector(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff__addset_vector(   SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);

#if VMODE_COMPILE_BOOLEAN
SEXP r_ff_boolean_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_boolean_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_boolean_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_boolean_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_boolean_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_LOGICAL
SEXP r_ff_logical_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_logical_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_logical_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_logical_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_logical_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_QUAD
SEXP r_ff_quad_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_quad_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_quad_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_quad_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_quad_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_NIBBLE
SEXP r_ff_nibble_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_nibble_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_nibble_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_nibble_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_nibble_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_BYTE
SEXP r_ff_byte_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_byte_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_byte_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_byte_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_byte_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_UBYTE
SEXP r_ff_ubyte_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ubyte_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_ubyte_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ubyte_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ubyte_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_SHORT
SEXP r_ff_short_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_short_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_short_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_short_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_short_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_USHORT
SEXP r_ff_ushort_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ushort_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_ushort_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ushort_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_ushort_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_INTEGER
SEXP r_ff_integer_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_integer_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_integer_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_integer_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_integer_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_SINGLE
SEXP r_ff_single_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_single_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_single_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_single_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_single_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_DOUBLE
SEXP r_ff_double_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_double_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_double_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_double_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_double_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_COMPLEX
SEXP r_ff_complex_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_complex_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_complex_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_complex_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_complex_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif
#if VMODE_COMPILE_RAW
SEXP r_ff_raw_getset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_raw_get_vector(      SEXP ff_, SEXP index_, SEXP nreturn_             );
SEXP r_ff_raw_set_vector(      SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_raw_addgetset_vector(SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
SEXP r_ff_raw_addset_vector(   SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_);
#endif

/* } -- getset_vector ---------------------------------------------------------- */


/* { -- getset_array ---------------------------------------------------------- */

SEXP r_ff__getset_array(    SEXP ffmode_, SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff__get_array(       SEXP ffmode_, SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff__set_array(       SEXP ffmode_, SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff__addgetset_array( SEXP ffmode_, SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff__addset_array(    SEXP ffmode_, SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);

#if VMODE_COMPILE_BOOLEAN
SEXP r_ff_boolean_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_boolean_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_boolean_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_boolean_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_boolean_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_LOGICAL
SEXP r_ff_logical_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_logical_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_logical_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_logical_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_logical_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_QUAD
SEXP r_ff_quad_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_quad_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_quad_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_quad_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_quad_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_NIBBLE
SEXP r_ff_nibble_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_nibble_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_nibble_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_nibble_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_nibble_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_BYTE
SEXP r_ff_byte_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_byte_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_byte_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_byte_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_byte_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_UBYTE
SEXP r_ff_ubyte_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_ubyte_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_ubyte_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_ubyte_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_ubyte_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_SHORT
SEXP r_ff_short_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_short_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_short_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_short_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_short_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_USHORT
SEXP r_ff_ushort_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_ushort_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_ushort_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_ushort_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_ushort_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_INTEGER
SEXP r_ff_integer_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_integer_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_integer_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_integer_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_integer_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_SINGLE
SEXP r_ff_single_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_single_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_single_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_single_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_single_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_DOUBLE
SEXP r_ff_double_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_double_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_double_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_double_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_double_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_COMPLEX
SEXP r_ff_complex_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_complex_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_complex_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_complex_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_complex_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif
#if VMODE_COMPILE_RAW
SEXP r_ff_raw_getset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_raw_get_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_             );
SEXP r_ff_raw_set_array(       SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_raw_addgetset_array( SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
SEXP r_ff_raw_addset_array(    SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_);
#endif

/* } -- getset_array ---------------------------------------------------------- */
