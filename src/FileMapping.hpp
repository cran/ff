#ifndef FF_FILE_MAPPING_HPP
#define FF_FILE_MAPPING_HPP

/** abstraction to memory-mapped files (os-specific) */

#include "config.h"

#ifdef FF_USE_WIN32

#include "Win32FileMapping.hpp"

namespace ff {
typedef Win32FileMapping FileMapping;
typedef Win32FileSection FileSection;
}

#endif // FF_USE_WIN32

#ifdef FF_USE_MMAP

#include "MMapFileMapping.hpp"

namespace ff {
typedef MMapFileMapping FileMapping;
typedef MMapFileSection FileSection;
}

#endif // FF_USE_MMAP

#endif // FF_FILE_MAPPING_HPP

