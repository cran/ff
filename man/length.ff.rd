\name{length.ff}
\alias{length.ff}
\alias{length<-.ff}
\title{ Getting and setting length }
\description{
  Gets and sets length of ff objects.
}
\usage{
\method{length}{ff}(x)
\method{length}{ff}(x) <- value
}
\arguments{
  \item{x}{ object to query }
  \item{value}{ new object length }
}
\details{
  Length of ff objects can be reduced below \code{\link{maxlength}}.
  Increasing length beyond \code{\link{maxlength}} should be avoided because it triggers \code{\link{clone}}.
}
\value{
  Integer scalar
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{maxlength}}, \code{\link{poslength}}, \code{\link{maxindex}}, \code{\link[ff:dim.ff]{dim}}, \code{\link{virtual}} }
\examples{
  x <- ff(1:12)
  maxlength(x)
  length(x)
  length(x) <- 10
  maxlength(x)
  length(x)
  length(x) <- 16
  maxlength(x)
  length(x)
  delete(x)
  rm(x)
}
\keyword{ IO }
\keyword{ data }
\keyword{ attribute }
