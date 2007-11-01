#include "config.h"
#ifdef FF_USE_MMAP
#include "MMapFileMapping.hpp"
#include "FSInfo.hpp"
#ifdef HAVE_FCNTL_H
#include <fcntl.h>
#endif
#ifdef HAVE_UNISTD_H
#include <unistd.h>
#endif
#ifdef HAVE_SYS_TYPES_H
#include <sys/types.h>
#endif
#ifdef HAVE_SYS_MMAN_H
#include <sys/mman.h>
#endif
#ifdef HAVE_SYS_STAT_H
#include <sys/stat.h>
#endif
#ifdef HAVE_SYS_FILE_H
#include <sys/file.h>
#endif
#include <cstdlib>
#include <cstring>
namespace ff {

static msize_t getZeroPageSize()
{
  return MMapFileMapping::getPageSize();
}

static void* getZeroPage()
{
  static void* ptr = 0;
  if (!ptr) {
    ptr = (void*) malloc( getZeroPageSize() );
    bzero(ptr, getZeroPageSize());
  }
  return ptr;
}

MMapFileMapping::MMapFileMapping(const char* path, fsize_t size, bool readonly)
 : _fd(-1)
 , _size(0)
 , _error(E_NO_ERROR)
 , _readonly(readonly)
{
  // check path
  struct stat sb;
  int err;
  err = stat(path, &sb);
  if (!err) { // file already existing
    // check if regular file
    if (!(sb.st_mode & S_IFREG)) {
      _error = E_UNABLE_TO_OPEN;
      return;
    }
  }
  int flags = (_readonly) ? O_RDONLY : O_RDWR;
  flags |= O_CREAT;
  if (size) flags |= O_TRUNC;
  _fd = open(path, flags, 0777);
  if (_fd == -1) {
    _error = E_UNABLE_TO_OPEN;
    return; 
  }
  err = ::flock(_fd, LOCK_EX|LOCK_NB);
  if (err) { 
    close(_fd); 
    _fd = -1; 
    _error = E_UNABLE_TO_OPEN;
    return; 
  }
  if (size) { // create new file
      
    // clamp size to page-size

    // size += getPageSize()-1;
    // size = size / getPageSize() * getPageSize();
 
    // check space on device

    FSInfo fsinfo;
    getFSInfo(path,fsinfo);
    if (fsinfo.free_space < size) { 
      close(_fd); 
      _fd = -1; 
      _error = E_NO_DISKSPACE;
      return; 
    } 

    // write zero pages to file with given size

    fsize_t total = size;
    size_t zpsize = getZeroPageSize();
    void*  zpbuf  = getZeroPage();
    while (total > 0 ) {
      size_t wsize = ( total > zpsize ) ? zpsize : total;
      size_t written = write(_fd, zpbuf, wsize);
      total -= written;
    }
    _size = size;
  } else { // open existing file
    // get filesize
    struct stat sb;
    fstat(_fd, &sb); 
    _size = sb.st_size;
  }
}

MMapFileMapping::~MMapFileMapping()
{
  if (_fd != -1) {
    close(_fd);
    flock(_fd, LOCK_UN);
  }
}

MMapFileSection* MMapFileMapping::mapSection(foff_t offset, msize_t size, void* baseaddr)
{
  return new MMapFileSection(_fd,offset,size,baseaddr,_readonly);
}

void MMapFileMapping::remapSection(MMapFileSection& section, foff_t offset, msize_t size, void* addr)
{
  section.reset(offset,size,addr);
}

msize_t MMapFileMapping::getPageSize()
{
  static int _pagesize = -1;
  if (_pagesize == -1) 
    _pagesize = getpagesize();
  return _pagesize;
}

MMapFileSection::MMapFileSection(int fd, foff_t offset, msize_t size, void* addr, bool readonly)
 : _fd(fd)
 , _addr(0)
 , _offset(0)
 , _end(0)
 , _size(0)
 , _readonly(readonly)
{
  reset(offset,size,addr);
}

MMapFileSection::~MMapFileSection()
{
  reset(0,0,0);
}

void MMapFileSection::reset(foff_t offset, msize_t size, void* addr)
{
  if (_addr) {
    munmap(_addr, _size);
    _addr = 0;
    _size = 0;
  }

  if ( (size) && (_fd != -1) ) {
    int prot = PROT_READ | (( _readonly) ? 0 : PROT_WRITE );
    _addr = mmap(addr, size, prot,MAP_FILE|MAP_SHARED, _fd, offset);
    if (_addr) {
      _offset = offset;
      _size   = size;
	  _end    = _offset + size;
    }
  }
}

}

#endif

