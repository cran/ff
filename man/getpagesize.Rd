\name{getpagesize}
\alias{getpagesize}
\alias{getdefaultpagesize}

\title{
  Obtaining page size information
  }
\description{
  The function is used for obtaining the natural OS-specific page size in Bytes. 
  \command{getpagesize} returns the OS-specific page size in Bytes for memory mapped files, while \command{getdefaultpagesize} returns a suggested page size.
  }
\usage{
  getpagesize()
  getdefaultpagesize
 }
\arguments{
  Arguments are not supported for \command{getpagesize} and \command{getdefaultpagesize}.
  }
\value{
  An integer giving the current page size in Bytes.
  } 
\details{
  The function is used for obtaining the page size in Bytes. \command{getpagesize} returns the currently set page size, while \command{getdefaultpagesize} returns the machine's default value.
  }
\examples{
  getpagesize()
  }
\keyword{IO}
