\name{open.ff}
\alias{open.ff}
\title{ Opening an ff file }
\description{
  \command{open.ff} opens an ff file, optionally marking it readonly and optionally specifying a caching scheme.
}
\usage{
open.ff(con, readonly = FALSE, pagesize = NULL, caching = NULL, \dots)
}
\arguments{
  \item{con}{ an ff object }
  \item{readonly}{ \code{readonly} }
  \item{pagesize}{ number of bytes to use as pagesize or NULL to take the pagesize stored in the \code{\link{physical}} attribute of the ff object, see \code{\link{getalignedpagesize}} }
  \item{caching}{ one of 'mmnoflush' or 'mmeachflush', see \code{\link{ff}} }
  \item{\dots}{ further arguments (not used) }
}
\details{
  ff objects will be opened automatically when accessing their content and the file is still closed
}
\value{
  an opened ff object
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{ff}}, \code{\link{close.ff}}, \code{\link{delete}}, \code{\link{deleteIfOpen}}, \code{\link{getalignedpagesize}} }
\examples{
  x <- ff(1:12)
  close(x)
  is.open(x)
  open(x)
  is.open(x)
  close(x)
  is.open(x)
  x[]
  is.open(x)
  y <- x
  close(y)
  is.open(x)
}
\keyword{ IO }
\keyword{ data }
