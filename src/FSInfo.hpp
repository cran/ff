#ifndef FF_FSINFO_HPP
#define FF_FSINFO_HPP

#include "types.hpp"

namespace ff {

  /** File System Information */
  struct FSInfo
  {
    fsize_t free_space;
    msize_t block_size;
    msize_t optimal_size;
  };
  
  /** retrieve File System Information for a given filepath */
  void getFSInfo(const char* path, FSInfo& info);

}

#endif // FF_INFO_HPP

