#include "MultiIndex.hpp"
#include <cstdio>

namespace ff {

MultiIndex::MultiIndex(const int* diminfo)
: _size(0)
{
  if (diminfo)
    reset(diminfo);
}

void MultiIndex::clear()
{
  _diminfo.clear();
  _factors.clear();
  _size = 0;
}

bool MultiIndex::readFromFile(const char* filepath) 
{
  clear();
  FILE* f = fopen( filepath, "rb");
  if (f) {
    int diminfo[1024];
    fread( diminfo, sizeof(int), sizeof(diminfo)/sizeof(int), f ); 
    fclose(f);
    reset(diminfo);
    return true;
  }
  return false;
}

bool MultiIndex::writeToFile(const char* filepath) const 
{
  FILE* f = fopen( filepath, "wb");
  if (f) {
    fwrite( &_diminfo[0], sizeof(int), _diminfo.size(), f);
    fclose(f);
    return true;
  }
  return false;
}

void MultiIndex::reset(const int* diminfo)
{
  clear();

  int ndims = diminfo[0];  

  _diminfo.resize( diminfo[0]+1 );
  int i;
  for (i = 0 ; i <= ndims; ++i )
    _diminfo[i] = diminfo[i];

  fsize_t factor = 1;
  _size = 1;
  i = 0;
  while ( i < ndims ) {
    _factors.push_back( factor );
    factor *= diminfo[i+1];
    _size   *= (fsize_t) diminfo[i+1];
    ++i; if (i == ndims) break;
  }
}

foff_t MultiIndex::indexToOffset(const int* index) const
{
  fsize_t offset = 0;
  for (size_t i = 0, end = _factors.size(); i < end ; ++i ) {
    offset += index[i] * _factors[i];
  }
  return offset;
}

int MultiIndex::ndims() const
{
  return (int) _factors.size();
}

fsize_t MultiIndex::size() const
{
  return _size;
}

int MultiIndex::dimlength(int index) const
{
  return _diminfo[index+1];
}

}
