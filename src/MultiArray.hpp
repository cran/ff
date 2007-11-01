#ifndef FF_MULTI_ARRAY_HPP
#define FF_MULTI_ARRAY_HPP

#include "Array.hpp"
#include "MultiIndex.hpp"
#include <cstring>

namespace ff {

/** multi-dimensional vector type */
template<typename ValueType>
class MultiArray
{
public:
  /** constructor */
  MultiArray(
    const char* filepath
  , const int* diminfo=0
  , msize_t section_size=FileMapping::getPageSize() 
  , bool readonly=false
  )
  : _multiIndex()
  , _array(0)
  {    
    char ffh_name[1024];
    char ffd_name[1024];
    strcpy(ffh_name, filepath);
    strcat(ffh_name, ".ffh");
    strcpy(ffd_name, filepath);
    strcat(ffd_name, ".ffd");
    if (!diminfo) {
      // read existing
      bool s = _multiIndex.readFromFile( ffh_name );
      if (!s) {
        return;
      }
      if ( _multiIndex.size() )
        _array = new Array<ValueType>( ffd_name, 0, section_size, readonly );
    } else {
      // create new
      _multiIndex.reset(diminfo);
      
      if ( _multiIndex.size() ) {
        bool s = _multiIndex.writeToFile( ffh_name );
        if (!s) {
          return;
        }
        _array = new Array<ValueType>( ffd_name, _multiIndex.size(), section_size, readonly );
      }
    }
  }
  
  /** destructor */
  ~MultiArray()
  {    
    if (_array)
      delete _array;
  }

  /** get error code */
  Error getError() const
  {
    if (_array)
      return _array->getError();
    return E_INVALID;
  }
  
  /** close connection */
  void close()
  {
    if (_array)
      _array->close();
  }

  /** get cell */
  ValueType get(const int* index)
  {
    return _array->get( _multiIndex.indexToOffset(index) ) ;
  }

  /** set cell */
  void    set(const int* index, ValueType v)
  {
    _array->set( _multiIndex.indexToOffset(index), v );
  }

  /** get number of dimensions */
  int     ndims() const { return _multiIndex.ndims(); }
  /** get size of dimension n */
  int     dimlength(int index) const { return _multiIndex.dimlength(index); }

private:   
  MultiIndex        _multiIndex;
  Array<ValueType>* _array;
};

}

#endif // FF_MULTI_ARRAY_HPP

