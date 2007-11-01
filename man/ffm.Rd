\name{ffm}
\alias{ffm}
\alias{[.ffm}
\alias{[<-.ffm}
\alias{dim.ffm}
\alias{length.ffm}
\alias{print.ffm}

\title{
  flat-file database designed for large, multi-dimensional data arrays
  }
\description{
  The function \command{ffm} and its methods allow for handling data using a flat file with memory mapped pages.
  It is a constructor function for \code{ffm} objects, which are multi-dimensional numeric arrays stored in a flat file.  
  }
\usage{
  x <- ffm(file, dim = 0, pagesize = getdefaultpagesize(), readonly = FALSE)
  \method{[}{ffm}(x, ...)
  \method{[}{ffm}(x, ...) <- value    
  \method{dim}{ffm}(x)
  \method{length}{ffm}(x)
  \method{print}{ffm}(x, \dots)  
}

\arguments{
  \item{file}{character string giving the name of a file to load or create.}
  \item{dim}{dimension of the array if object should be (re-)created.}
  \item{pagesize}{page size or 0 for default system page size (OS-specific).}
  \item{readonly}{logical, specifying whether access to the resource is read-only.}
  \item{value}{suitable replacement value or vector of values.}
  \item{x}{a \code{ffm} object.}
  \item{\dots}{indices specifying elements to extract or replace (indexing); further arguments passed to or from other methods (print method).}
  } 
\details{
  On 32-bit R platforms the indexing is limited to a maximum number of \eqn{2^{31}-1}{2^31-1}. 
  By using a multi-dimensional array, the data vector can be greater to overcome this limitation. 
  The limit for \code{ffm} objects is 64 bit, even on 32-bit platforms (if supported by the virtual file system). 
  A \code{ffm} object is stored on two files, \file{foo.ffd} for the actual binary data and \file{foo.ffh} for a header containing meta-information.

  As \code{ffm} objects are held by external pointers, they are copied as a reference. 
  The connection life-time of the \code{ffm} object and its implementation part (written in C++) is under control of the garbage collector \command{\link[pkg:base]{gc}}. 
  To explicitly close an \code{ffm} object, one should call the garbage collector after deleting the reference(!).
  \command{ff} depends on the OS and file-system facilities. 
  E.g. it is not possible to create files > 4GB on FAT32 systems. 
  The following table gives an overview of file size limits for common file systems (see \url{http://en.wikipedia.org/wiki/Comparison_of_file_systems} for further details):
  
\tabular{ll}{
  \emph{File System} \tab \emph{File size limit} \cr
  FAT16              \tab 2GB \cr
  FAT32              \tab 4GB \cr
  NTFS               \tab 16GB \cr
  ext2/3/4           \tab 16GB to 2TB \cr
  ReiserFS           \tab 4GB (up to version 3.4) / 8TB (from version 3.5) \cr
  XFS                \tab 8EB \cr
  JFS                \tab 4PB \cr
  HFS                \tab 2GB \cr
  HFS Plus           \tab 16GB \cr
  USF1               \tab 4GB to 256TB \cr
  USF2               \tab 512GB to 32PB \cr
  UDF                \tab 16EB \cr
  }

}
\examples{
  b <- ffm("foom",c(10,20,30))   # create a multi-dimensional vector
  b[1,2,3] <- 23                 # set data cell
  b[1,2,3]                       # set data cell
  b[1:5,,] <- rnorm(20)          # complex addressing
  b[1,,]                         # show first row
  }
\keyword{IO}
\keyword{file}
\keyword{connection}
\keyword{database}

