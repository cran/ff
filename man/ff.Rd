\name{ff}
\alias{ff}
\alias{[.ff}
\alias{[<-.ff}
\alias{dim.ff}
\alias{length.ff}
\alias{print.ff}
\alias{sample.ff}
\title{
  Flat file database designed for large data vectors
  }
\description{
  The function \command{ff} and its methods allow for handling data using a flat file with memory mapped pages.  
  It is a constructor function for \code{ff} objects, which are numerical vectors stored in a flat file.  
  The maximum size of the flat file is 16 GB on 32-bit platforms; however possible limitations of the file system apply.  
  }
\usage{
  ff(file, length = 0, pagesize = getdefaultpagesize(), readonly = FALSE)
  \method{[}{ff}(x, index)
  \method{[}{ff}(x, index) <- value
  \method{dim}{ff}(x)
  \method{length}{ff}(x)
  \method{sample}{ff}(x, size, replace = FALSE, prob = NULL)
  \method{print}{ff}(x, \dots)
  }
\arguments{
  \item{file}{character string giving the name of a file to load or create.}
  \item{length}{size/length of double vector if object should be (re-)created.}
  \item{pagesize}{page size (in multiples of the system page size, see \command{\link{getpagesize}}).}
  \item{readonly}{boolean indicating whether the flat file should be accessed as read-only.}
  \item{x}{a \code{ff} object.}
  \item{index}{indices specifying elements to extract or replace.}
  \item{value}{suitable replacement value or vector of values.}
  \item{size}{non-negative integer giving the number of items to choose.}
  \item{replace}{should sampling be with replacement?}
  \item{prob}{a vector of probability weights for obtaining the elements of the vector being sampled. The argument \code{prob} is ignored in the \command{sample} method for \code{ff}.}
  \item{\dots}{further arguments passed to or from other methods.}
  } 
\details{
  On 32-bit R platforms the indexing is limited to a maximum number of \eqn{2^{31}-1}{2^31-1}. 
  By using a multi-dimensional array, the data vector can be greater to overcome this limitation (see \command{\link{ffm}}).

  As \code{ff} objects are held by external pointers, they are copied as a reference. 
  The connection life-time of the \code{ff} object and its implementation part (written in C++) is under control of the garbage collector \command{\link[pkg:base]{gc}}. 
  To explicitly close an \code{ff} object, one should call the garbage collector after deleting the reference(!).
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
  a <- ff("foo.ff", 8192)        # create a big vector
  a[1:10] <- rnorm(10)           # set data cells
  a[1:10]                        # get data cells
  }
\keyword{IO}
\keyword{file}
\keyword{connection}
\keyword{database}

