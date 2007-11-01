#include "ff.h" 
#include "Array.hpp"

typedef ff::Array<double> ArrayType;

FF ff_new(const char* filepath, int nsize, int pagesize, int ro)
{    
  return new ArrayType(filepath, nsize, (pagesize == 0) ? FF_SECTION_SIZE : pagesize, (ro==0) ? false : true);
}

int  ff_geterror(FF handle)
{
  ArrayType* a = (ArrayType*)handle;
  return a->getError();  
}

void ff_delete(FF handle)
{
  ArrayType* a = (ArrayType*)handle;
  delete a;
}

void ff_close(FF handle)
{
  ArrayType* a = (ArrayType*)handle;
  a->close();
}

int ff_len(FF handle)
{
  ArrayType* a = (ArrayType*)handle;
  return static_cast<int>( a->size() );
}

double ff_get(FF handle, int index)
{
  ArrayType* a = (ArrayType*)handle;
  return a->get( index );
}

void ff_set(FF handle, int index, double x)
{
  ArrayType* a = (ArrayType*)handle;
  a->set(index,x);
}

void ff_read(FF handle, double* ptr, int index, int size)
{
  ArrayType* a = (ArrayType*)handle;
  for (int i = index, end = index+size ; i < end; ++i ) {
    ptr[i] = a->get(i);
  }
}

void ff_write(FF handle, double* ptr, int index, int size)
{
  ArrayType* a = (ArrayType*)handle;
  for (int i = index, end = index+size ; i < end; ++i ) {
    a->set(i, ptr[i]);
  }
}

int ff_getpagesize()
{
  return ff::FileMapping::getPageSize();
}

void ff_readseq(FF handle, double* ptr, int* seqlist, int size)
{
  int i = 0;
  ArrayType* a = (ArrayType*)handle;
  while(i<size) 
  {
    int from = *seqlist++;
    int to   = *seqlist++;
    int by   = *seqlist++;
    for(;;)
    {
      ptr[i] = a->get(from); ++i;       
      if (from == to) break;
      from += by;      
    }
  }
}

void ff_writeseq(FF handle, double* ptr, int* seqlist, int size)
{
  int i = 0;
  ArrayType* a = (ArrayType*)handle;
  while(i<size)
  {
    int from = *seqlist++;
    int to   = *seqlist++;
    int by   = *seqlist++;
    for(;;)
    {
      a->set(from, ptr[i]); ++i;       
      if (from == to) break;
      from += by;      
    }
  }
}

