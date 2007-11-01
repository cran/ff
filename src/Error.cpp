#include "Error.hpp"

namespace ff {

  const char* getErrorString(Error error)
  {
    switch(error) {
    case E_NO_ERROR:          return "no error";
    case E_INVALID:           return "invalid";
    case E_NO_DISKSPACE:      return "no diskspace";
    case E_UNABLE_TO_OPEN:    return "unable to open";
    case E_NOT_EXISTING:      return "not existing";
    case E_WRITE_ERROR:       return "write error";
    case E_FILE_IS_READONLY:  return "file is read-only";
    default:                  return "unknown error";
    }
  }

}

