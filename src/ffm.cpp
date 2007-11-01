#include "ffm.h"
#include "MultiArray.hpp"

typedef ff::MultiArray<double> MultiArrayType;

FFM ffm_new(const char* filepath, int* diminfo, int pagesize, int ro)
{
  return new MultiArrayType(filepath, diminfo, (pagesize == 0) ? FF_SECTION_SIZE : pagesize, (ro==0) ? false : true);
}

int  ffm_geterror(FFM handle)
{
  MultiArrayType* a = (MultiArrayType*) handle;
  return a->getError();
}

void ffm_close(FFM handle)
{
  MultiArrayType* a = (MultiArrayType*) handle;
  a->close();
}

void ffm_delete(FFM handle)
{
  MultiArrayType* a = (MultiArrayType*) handle;
  delete a;
}

int ffm_ndims(FFM handle)
{
  MultiArrayType* a = (MultiArrayType*) handle;
  return a->ndims();
}

int ffm_dimlength(FFM handle, int dimindex)
{
  MultiArrayType* a = (MultiArrayType*) handle;
  return a->dimlength(dimindex);
}

double ffm_get(FFM handle, int* index)
{
  MultiArrayType* a = (MultiArrayType*) handle;
  return a->get(index);
}

void ffm_set(FFM handle, int* index, double value)
{
  MultiArrayType* a = (MultiArrayType*) handle;
  a->set(index,value);
}

