\name{file.resize}
\alias{file.resize}
\title{ Change size of an existing file }
\description{
  Change size of an existing file. On some platforms spare files are
  used.
}
\usage{
  file.resize(path, size)
}
\arguments{
   \item{path}{ file path (on windows it uses a 'windows' backslash path!)  }
   \item{size}{ new filesize in bytes as double }
}
\value{
  logical scalar repesenting the success of this operation
}
\details{
  Either the file is enlarged or shrinked. When enlarged, the file
  is filled up with zeros. Some platform implementations feature
  sparse files, so that this operation is very fast. We have tested:
  \itemize{
   \item Ubuntu Linux 8, i386
   \item FreeBSD 7, i386
   \item Gentoo Linux Virtual-Server, i386
   \item Gentoo Linux, x86_64
   \item Windows XP
  }
  The following work but do not support sparse files
  \itemize{
   \item Mac OS X 10.5, i386
   \item Mac OS X 10.4, PPC
  }
}
\author{ Daniel Adler }
\seealso{ \code{\link[base]{file.create}}, \code{\link[base]{file.rename}}, \code{\link[base]{file.info}} }
\examples{
 x <- tempfile()
 newsize <- 23       # resize and size to 23 bytes.
 file.resize(x, newsize)
 file.info(x)$size == newsize
 \dontrun{
   newsize <- 8*(2^30) # create new file and size to 8 GB.
   file.resize(x, newsize)
   file.info(x)$size == newsize
 }
 file.remove(x)
}
\keyword{ IO }
\keyword{ data }
