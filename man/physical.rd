\name{physical}
\alias{physical}
\alias{physical<-}
\alias{print.physical}
\alias{virtual}
\alias{virtual<-}
\alias{print.virtual}
\title{ Getting and setting physical and virtual attributes }
\description{
  Functions for getting and setting physical and virtual attributes.
}
\usage{
physical(x)
virtual(x)
physical(x) <- value
virtual(x) <- value
\method{print}{physical}(x, \dots)
\method{print}{virtual}(x, \dots)
}
\arguments{
  \item{x}{ a ff or ram object }
  \item{value}{ a list with named elements }
  \item{\dots}{ further arguments }
}
\details{
  ff objects have physical and virtual attributes, which have different copying semantics:
  physical attributes are shared between copies of ff objects while virtual attributes might differ between copies.
  \code{\link{as.ram}} will retain some physical and virtual atrributes in the ram clone,
  such that \code{\link{as.ff}} can restore an ff object with the same attributes.
}
\value{
  \command{physical} and \command{virtual} returns a list with named elements
}
\author{ Jens Oehlschlägel }
\seealso{
 \code{\link{ff}}, \code{\link{as.ram}}; \cr
 \code{\link{is.sorted}} and \code{\link{na.count}} for applications of physical attributes; \cr
 \code{\link{levels.ff}} and \code{\link{ramattribs}} for applications of virtual attributes
}
\examples{
  x <- ff(1:12)
  x
  physical(x)
  virtual(x)
  y <- as.ram(x)
  physical(y)
  virtual(y)
  delete(x)
  rm(x,y)
}
\keyword{ IO }
\keyword{ data }
\keyword{ attribute }
