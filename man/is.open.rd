\name{is.open}
\alias{is.open}
\alias{is.open.ff}
\alias{is.open.ff_pointer}
\title{ Test if object is opened }
\description{
  Test whether an ff object or an \code{ff_pointer} is opened.
}
\usage{
is.open(x, \dots)
\method{is.open}{ff}(x, \dots)
\method{is.open}{ff_pointer}(x, \dots)
}
\arguments{
  \item{x}{ \code{x} }
  \item{\dots}{ further arguments (not used) }
}
\value{
  TRUE or FALSE
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{is.readonly}}, \code{\link{open.ff}}, \code{\link{close.ff}} }
\examples{
  x <- ff(1:12)
  is.open(x)
  close(x)
  is.open(x)
  delete(x)
  rm(x)
}
\keyword{ IO }
\keyword{ data }
