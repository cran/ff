#include <R.h>
#include <Rinternals.h>
#include <R_ext/Rdynload.h>

/* --- forward declarations ------------------------------------------------ */


/* ff functions */

SEXP r_ff_open(SEXP name, SEXP len, SEXP pagesize, SEXP ro);
SEXP r_ff_geterror(SEXP ff);
SEXP r_ff_close(SEXP ff);
void r_ff_delete(SEXP x);
SEXP r_ff_len(SEXP ff);
SEXP r_ff_get(SEXP ff, SEXP index);
SEXP r_ff_set(SEXP ff, SEXP index, SEXP value);
SEXP r_ff_read(SEXP ff, SEXP index, SEXP sizeexp);
SEXP r_ff_write(SEXP ff, SEXP index, SEXP size, SEXP data);
SEXP r_ff_readseq(SEXP ff, SEXP index, SEXP sizeexp);
SEXP r_ff_writeseq(SEXP ff, SEXP index, SEXP size, SEXP data);


/* ffm functions */

SEXP r_ffm_open(SEXP name, SEXP dim, SEXP pagesize, SEXP ro);
SEXP r_ffm_geterror(SEXP ffm);
SEXP r_ffm_close(SEXP ffm);
void r_ffm_delete(SEXP x);
SEXP r_ffm_ndims(SEXP ffm);
SEXP r_ffm_dimlength(SEXP ffm, SEXP index);
SEXP r_ffm_get(SEXP ffm, SEXP index);
SEXP r_ffm_set(SEXP ffm, SEXP index, SEXP value);


/* utility functions */

SEXP r_getpagesize();


/* --- R FUNCTION REGISTRATION -------------------------------------------- */

R_CallMethodDef callMethods[] = 
{
 {"open", (DL_FUNC) &r_ff_open,  4},
 {"geterror", (DL_FUNC) &r_ff_geterror, 1},
 {"len",  (DL_FUNC) &r_ff_len,   1},
 {"get",  (DL_FUNC) &r_ff_get,   2},
 {"set",  (DL_FUNC) &r_ff_set,   3},
 {"close",(DL_FUNC) &r_ff_close, 1},
 {"read", (DL_FUNC) &r_ff_read,  3},
 {"write", (DL_FUNC) &r_ff_write, 4},
 {"readseq", (DL_FUNC) &r_ff_readseq, 3},
 {"writeseq", (DL_FUNC) &r_ff_writeseq, 4},
 {"m_open", (DL_FUNC) &r_ffm_open,  4},
 {"m_geterror", (DL_FUNC) &r_ffm_geterror, 1},
 {"m_ndims",  (DL_FUNC) &r_ffm_ndims,   1},
 {"m_dimlength", (DL_FUNC) &r_ffm_dimlength, 2},
 {"m_get",  (DL_FUNC) &r_ffm_get,   2},
 {"m_set",  (DL_FUNC) &r_ffm_set,   3},
 {"m_close",(DL_FUNC) &r_ffm_close, 1},
 {"getpagesize", (DL_FUNC) &r_getpagesize, 0},
 {NULL, NULL, 0}
};

void R_init_ff(DllInfo *info)
{
  R_registerRoutines(info, NULL, callMethods, NULL, NULL);
}

void R_unload_ff(DllInfo *info)
{
}

/* ------------------------------------------------------------------------ */

#include "config.h"

/* --- FF ----------------------------------------------------------------- */

#include "ff.h"

SEXP r_ff_open(SEXP name, SEXP len, SEXP pagesize, SEXP ro)
{
  SEXP x = R_NilValue;

  void* p = (void*) ff_new( CHAR(STRING_ELT(name,0)), INTEGER(len)[0], INTEGER(pagesize)[0], LOGICAL(ro)[0] );
  
  if ( p ) {
    PROTECT( x = R_MakeExternalPtr(p, R_NilValue, R_NilValue) );
    R_RegisterCFinalizer(x, r_ff_delete);
    UNPROTECT(1);
  } 
  
  return x;
}

SEXP r_ff_geterror(SEXP ff)
{
  SEXP r;
  PROTECT( r = allocVector(INTSXP,1) );
  INTEGER(r)[0] = ff_geterror( R_ExternalPtrAddr(ff) ); 
  UNPROTECT(1);
  return r;
}

SEXP r_ff_close(SEXP ff)
{
  ff_close( R_ExternalPtrAddr(ff) );
  return ff;
}

void r_ff_delete(SEXP x)
{   
  ff_delete( R_ExternalPtrAddr(x) );
}

SEXP r_ff_len(SEXP ff)
{
  SEXP r;
  int l;
  PROTECT( r = allocVector(INTSXP, 1) );
  l = ff_len( R_ExternalPtrAddr(ff) );
  INTEGER(r)[0] = l;
  UNPROTECT(1);
  return(r);
}

SEXP r_ff_get(SEXP ff, SEXP index)
{
  SEXP y;
  double x = ff_get( R_ExternalPtrAddr(ff), INTEGER(index)[0] );
  PROTECT( y = allocVector(REALSXP, 1) );
  REAL(y)[0] = x;
  UNPROTECT(1);
  return(y);
}

SEXP r_ff_set(SEXP ff, SEXP index, SEXP value)
{
  ff_set( R_ExternalPtrAddr(ff), INTEGER(index)[0], REAL(value)[0] );
  return value;
}


SEXP r_ff_read(SEXP ff, SEXP index, SEXP sizeexp)
{
  SEXP r;
  int size = INTEGER(sizeexp)[0];
  PROTECT( r = allocVector(REALSXP, size) );  
  ff_read( R_ExternalPtrAddr(ff), &REAL(r)[0], INTEGER(index)[0], size );
  UNPROTECT(1);
  return r;  
}

SEXP r_ff_write(SEXP ff, SEXP index, SEXP size, SEXP data)
{
  ff_write( R_ExternalPtrAddr(ff), &REAL(data)[0], INTEGER(index)[0], INTEGER(size)[0] );
  return R_NilValue;
}

SEXP r_ff_readseq(SEXP ff, SEXP index, SEXP sizeexp)
{
  SEXP r;
  int size = INTEGER(sizeexp)[0];
  PROTECT( r = allocVector(REALSXP, size) );
  ff_readseq( R_ExternalPtrAddr(ff), &REAL(r)[0], &INTEGER(index)[0], size );
  UNPROTECT(1);
  return r;
}

SEXP r_ff_writeseq(SEXP ff, SEXP index, SEXP size, SEXP data)
{
  ff_writeseq(R_ExternalPtrAddr(ff), &REAL(data)[0], &INTEGER(index)[0], INTEGER(size)[0] );
  return R_NilValue;
}

// --- FFM -------------------------------------------------------------------

#include "ffm.h"

SEXP r_ffm_open(SEXP name, SEXP dim, SEXP pagesize, SEXP ro)
{
  int* pdiminfo = NULL;
  int diminfo[FFM_MAX_DIMS];
  SEXP x = R_NilValue;
  const char* filepath = CHAR(STRING_ELT(name,0));
  
  if (INTEGER(dim)[0] != 0) {
    
    int l = LENGTH(dim), i;
  
    if (l > FFM_MAX_DIMS) l = FFM_MAX_DIMS;
    
    diminfo[0] = l;
    for (i = 0 ; i < l ; ++i ) {
      diminfo[i+1] = INTEGER(dim)[i];
    }
    
    pdiminfo = diminfo;    
  }
  
  void* p = (void*) ffm_new(filepath, pdiminfo, INTEGER(pagesize)[0], LOGICAL(ro)[0] );
  
  if ( p ) {
    PROTECT( x = R_MakeExternalPtr(p, R_NilValue, R_NilValue) );
    R_RegisterCFinalizer(x, r_ffm_delete);
    UNPROTECT(1);
  } 
  
  return x;
}

SEXP r_ffm_geterror(SEXP ffm)
{
  SEXP r;
  PROTECT( r = allocVector(INTSXP,1) );
  INTEGER(r)[0] = ffm_geterror( R_ExternalPtrAddr(ffm) ); 
  UNPROTECT(1);
  return r;
}

SEXP r_ffm_close(SEXP ffm)
{
  ffm_close( R_ExternalPtrAddr(ffm) );
  return ffm;
}

void r_ffm_delete(SEXP x)
{   
  ffm_delete( R_ExternalPtrAddr(x) );
}


SEXP r_ffm_ndims(SEXP ffm)
{
  SEXP r;
  int l;
  PROTECT( r = allocVector(INTSXP, 1) );
  l = ffm_ndims( R_ExternalPtrAddr(ffm) );
  INTEGER(r)[0] = l;
  UNPROTECT(1);
  return(r);
}

SEXP r_ffm_dimlength(SEXP ffm, SEXP index)
{
  SEXP r;
  int l;
  PROTECT( r = allocVector(INTSXP, 1) );
  l = ffm_dimlength( R_ExternalPtrAddr(ffm), INTEGER(index)[0] );
  INTEGER(r)[0] = l;
  UNPROTECT(1);
  return(r);
}


SEXP r_ffm_get(SEXP ffm, SEXP index)
{
  SEXP y;  
  double x = ffm_get( R_ExternalPtrAddr(ffm), &INTEGER(index)[0] );
  PROTECT( y = allocVector(REALSXP, 1) );
  REAL(y)[0] = x;
  UNPROTECT(1);
  return(y);
}

SEXP r_ffm_set(SEXP ffm, SEXP index, SEXP value)
{
  ffm_set( R_ExternalPtrAddr(ffm), &INTEGER(index)[0], REAL(value)[0] );
  return value;
}

/* --- UTILITIES ---------------------------------------------------------- */

SEXP r_getpagesize()
{
  SEXP r;
  PROTECT( r = allocVector(INTSXP, 1) );
  INTEGER(r)[0] = ff_getpagesize(); 
  UNPROTECT(1);
  return r;
}

