#include "config.h"
#ifdef FF_USE_STATFS

#include "FSInfo.hpp"

#ifdef HAVE_SYS_VFS_H
#include <sys/vfs.h>
#endif
#ifdef HAVE_SYS_PARAM_H
#include <sys/param.h>
#endif
#ifdef HAVE_SYS_MOUNT_H
#include <sys/mount.h>
#endif

namespace ff {

void getFSInfo(const char* path, FSInfo& info)
{
  struct statfs sfs;
  statfs(path, &sfs);
  info.free_space = ((fsize_t)sfs.f_bsize) * ((fsize_t)sfs.f_bavail );
  info.block_size = sfs.f_bsize;
#ifdef HAVE_STRUCT_STATFS_F_IOSIZE
  info.optimal_size = sfs.f_iosize;
#else
  info.optimal_size = info.block_size;
#endif
}

}

#endif

