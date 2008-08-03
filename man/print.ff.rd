\name{print.ff}
\alias{print.ff}
\alias{print.ff_vector}
\alias{print.ff_matrix}
\alias{str.ff}
\title{ Print and str methods }
\description{
  printing ff objects and compactly showing their structure
}
\usage{
print.ff(x, \dots)
print.ff_vector(x, maxlength = 16, \dots)
print.ff_matrix(x, maxdim = c(16, 16), \dots)
str.ff(object, \dots)
}
\arguments{
  \item{x}{ a ff object }
  \item{object}{ a ff object }
  \item{maxlength}{ max number of elements to print from an \code{ff_vector} }
  \item{maxdim}{ max number of elements to print from each dimension from an \code{ff_array} }
  \item{\dots}{ further arguments to print }
}
\details{
  The print methods just print a few exmplary elements from the beginning and end of the dimensions.
}
\value{
  \code{invisible()}
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{ff}}, \code{\link{print}}, \code{\link{str}} }
\examples{
  x <- ff(1:10000)
  x
  print(x, maxlength=30)
  dim(x) <- c(100,100)
  x
  delete(x)
  rm(x)
}
\keyword{ IO }
\keyword{ data }
\keyword{ print }
