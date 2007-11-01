#ifndef FF_ARRAY_HPP
#define FF_ARRAY_HPP

#include "FileMapping.hpp"
#include <algorithm>

namespace ff {

  /** one-dimensional Array container type for a given valuetype ValueT */
  template<typename ValueT>
  class Array 
  {
  public:
  
    typedef ValueT            value_type;
    typedef fsize_t           size_type;
    
    /** constructor */
    Array(
      const char* path
    , fsize_t s=0
    , msize_t section_size=FileMapping::getPageSize() 
    , bool    readonly=false
    )
      : _fileMapping(0)
      , _fileSection(0)
      , _sectionSize(section_size)
    {
      _fileMapping = new FileMapping(path, s*sizeof(value_type), readonly );
      
      if ( _fileMapping->getError() == E_NO_ERROR ) 
      {
        msize_t size   = static_cast<msize_t>( std::min( _fileMapping->size(), static_cast<fsize_t>(_sectionSize) ) );
        _fileSection = _fileMapping->mapSection( 0, size );
      } 
    }
  
    /** destructor */
    ~Array()
    {
      close();
    }
  
    /** get last error code */
    Error getError() const
    {
      return _fileMapping->getError();
    }
  
    /** explicitly close */
    void close()
    {
      if (_fileSection) {
        delete _fileSection;
        _fileSection = 0;
      }
      if (_fileMapping) {
        delete _fileMapping;
        _fileMapping = 0;
      }
    }
  
    /** get pointer for element_index offset */
    inline value_type* getPointer(foff_t element_index)
    {
      foff_t byteIndex = element_index * sizeof(value_type);
  
      if ( !_fileSection->checkOffsetInSection(byteIndex) ) {
        
        fsize_t offset = byteIndex / _sectionSize * _sectionSize;
        msize_t size   = static_cast<msize_t>( std::min( _fileMapping->size() - offset, static_cast<fsize_t>(_sectionSize) ) );
  
        _fileSection->reset( offset, size );
      }
  
      return (value_type*) _fileSection->getPointer(byteIndex);
    }
  
    /** set value at element_index */
    inline void set(foff_t element_index, value_type v)
    {
      * getPointer(element_index) = v;
    }
  
    /** get value at element index */
    inline value_type get(foff_t element_index) 
    {
      return * getPointer(element_index);
    }
  
    /** get size of array (in terms of element units) */
    fsize_t size() const
    {
      if (_fileMapping) 
        return _fileMapping->size() / sizeof(value_type);
      return 0;
    }
  private:
    FileMapping* _fileMapping;
    FileSection* _fileSection;
    msize_t      _sectionSize;
  };

}

#endif // FF_ARRAY_HPP

