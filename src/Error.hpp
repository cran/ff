#ifndef FF_ERROR_HPP
#define FF_ERROR_HPP

namespace ff {

  /** ff error codes */
  enum Error {
    E_NO_ERROR = 0
  , E_INVALID
  , E_NO_DISKSPACE
  , E_UNABLE_TO_OPEN
  , E_NOT_EXISTING
  , E_WRITE_ERROR
  , E_FILE_IS_READONLY
  };
  
  /** translate error code to english error message */
  const char* getErrorString(Error error);

}

#endif // FF_ERROR_HPP

