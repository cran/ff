/*
# R-C layer of ff: vmode method switch
# (c) 2007 Jens Oehlschägel
# Licence: GPL2
# Provided 'as is', use at your own risk
# Created: 2007-08-24
# Last changed: 2007-11-29
*/

/* All combinations of
   - getset, get set addgetset addset
   - (single), contiguous, vector, array
   - boolean, logical, quad, nibble, byte, ubyte, short, ushort, integer, single, double, complex
*/


/* --- r_ff__getset --- */

SEXP r_ff__getset(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ = r_ff_single_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ = r_ff_double_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ = r_ff_double_getset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_getset( ff_, index_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}
SEXP r_ff__get(SEXP ffmode_, SEXP ff_, SEXP index_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ = r_ff_single_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ = r_ff_double_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ = r_ff_double_get( ff_, index_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_get( ff_, index_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}
SEXP r_ff__set(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ = r_ff_single_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ = r_ff_double_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ = r_ff_double_set( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_set( ff_, index_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}
SEXP r_ff__addgetset(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ = r_ff_single_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ = r_ff_double_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ = r_ff_double_addgetset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_addgetset( ff_, index_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}
SEXP r_ff__addset(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ = r_ff_single_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ = r_ff_double_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ = r_ff_double_addset( ff_, index_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_addset( ff_, index_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}




/* --- r_ff__getset_contiguous --- */

SEXP r_ff__getset_contiguous(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_getset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_getset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_getset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_getset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_getset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_getset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_getset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_getset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_getset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ = r_ff_single_getset_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ = r_ff_double_getset_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ = r_ff_double_getset_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_getset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__get_contiguous(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_get_contiguous( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_get_contiguous( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_get_contiguous( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_get_contiguous( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_get_contiguous( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_get_contiguous( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_get_contiguous( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_get_contiguous( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_get_contiguous( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ = r_ff_single_get_contiguous(  ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ = r_ff_double_get_contiguous(  ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ = r_ff_double_get_contiguous(  ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_get_contiguous( ff_, index_, nreturn_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__set_contiguous(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_set_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_set_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_set_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_set_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_set_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_set_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_set_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_set_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_set_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ = r_ff_single_set_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ = r_ff_double_set_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ = r_ff_double_set_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_set_contiguous( ff_, index_, nreturn_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__addgetset_contiguous(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_addgetset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_addgetset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_addgetset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_addgetset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_addgetset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_addgetset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_addgetset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_addgetset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_addgetset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ = r_ff_single_addgetset_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ = r_ff_double_addgetset_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ = r_ff_double_addgetset_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_addgetset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__addset_contiguous(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_addset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_addset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_addset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_addset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_addset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_addset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_addset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_addset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_addset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ = r_ff_single_addset_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ = r_ff_double_addset_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ = r_ff_double_addset_contiguous(  ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_addset_contiguous( ff_, index_, nreturn_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}





/* --- r_ff__getset_vector --- */

SEXP r_ff__getset_vector(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ =  r_ff_single_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ =  r_ff_double_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ =  r_ff_double_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_getset_vector( ff_, index_, nreturn_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__get_vector(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ =  r_ff_single_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ =  r_ff_double_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ =  r_ff_double_get_vector( ff_, index_, nreturn_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_get_vector( ff_, index_, nreturn_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__set_vector(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ =  r_ff_single_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ =  r_ff_double_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ =  r_ff_double_set_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_set_vector( ff_, index_, nreturn_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__addgetset_vector(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ =  r_ff_single_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ =  r_ff_double_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ =  r_ff_double_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_addgetset_vector( ff_, index_, nreturn_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__addset_vector(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP nreturn_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ =  r_ff_single_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ =  r_ff_double_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ =  r_ff_double_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_addset_vector( ff_, index_, nreturn_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}



/* --- r_ff__getset_array --- */

SEXP r_ff__getset_array(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ =  r_ff_single_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ =  r_ff_double_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ =  r_ff_double_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_getset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__get_array(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ =  r_ff_single_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ =  r_ff_double_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ =  r_ff_double_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_get_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__set_array(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ =  r_ff_single_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ =  r_ff_double_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ =  r_ff_double_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_set_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__addgetset_array(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ =  r_ff_single_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ =  r_ff_double_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ =  r_ff_double_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_addgetset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}

SEXP r_ff__addset_array(SEXP ffmode_, SEXP ff_, SEXP index_, SEXP indexdim_, SEXP ffdim_, SEXP ndim_, SEXP nreturn_, SEXP cumindexdim_, SEXP cumffdim_, SEXP value_)
{
  SEXP ret_ = R_NilValue;
  switch (asInteger(ffmode_)) {
#if VMODE_COMPILE_BOOLEAN
  case 1: ret_ = r_ff_boolean_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_LOGICAL
  case 2: ret_ = r_ff_logical_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_QUAD
  case 3: ret_ = r_ff_quad_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_NIBBLE
  case 4: ret_ = r_ff_nibble_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_BYTE
  case 5: ret_ = r_ff_byte_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_UBYTE
  case 6: ret_ = r_ff_ubyte_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_SHORT
  case 7: ret_ = r_ff_short_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_USHORT
  case 8: ret_ = r_ff_ushort_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_INTEGER
  case 9: ret_ = r_ff_integer_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_SINGLE
  case 10: ret_ =  r_ff_single_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_DOUBLE
  case 11: ret_ =  r_ff_double_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_COMPLEX
  case 12: ret_ =  r_ff_double_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
#if VMODE_COMPILE_RAW
  case 13: ret_ = r_ff_raw_addset_array( ff_, index_, indexdim_, ffdim_, ndim_, nreturn_, cumindexdim_, cumffdim_, value_); break;
#endif
  default: error("unknown .ffmode[vmode(ffobj)]");
  }
  return ret_;
}


