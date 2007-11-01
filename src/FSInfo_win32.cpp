#include "config.h"
#ifdef FF_USE_WIN32
#define WIN32_MEAN_AND_LEAN
#include <windows.h>

#include "FSInfo.hpp"

namespace ff {

void getFSInfo(const char* path, FSInfo& info)
{
  struct {
    ULARGE_INTEGER freeBytesAvailable;
    ULARGE_INTEGER totalNumberOfBytes;
    ULARGE_INTEGER totalNumberOfFreeBytes;
  } data;
 
  GetDiskFreeSpaceExA(path, &data.freeBytesAvailable,0,0);  
  info.free_space = (fsize_t) data.freeBytesAvailable.QuadPart;
  SYSTEM_INFO systemInfo;
  GetSystemInfo(&systemInfo);
  info.block_size = systemInfo.dwPageSize;
  info.optimal_size = systemInfo.dwPageSize;
}

}

#endif
