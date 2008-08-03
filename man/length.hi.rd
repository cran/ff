\name{length.hi}
\alias{length.hi}
\alias{poslength}
\alias{poslength.hi}
\alias{poslength.default}
\alias{maxindex}
\alias{maxindex.hi}
\alias{maxindex.default}
\title{ Hybrid Index, querying }
\description{
  Functions to query some index attributes
}
\usage{
\method{length}{hi}(x)
maxindex(x, \dots)
poslength(x, \dots)
\method{maxindex}{hi}(x, \dots)
\method{maxindex}{default}(x, \dots)
\method{poslength}{hi}(x, \dots)
\method{poslength}{default}(x, \dots)
}
\arguments{
  \item{x}{ an object of class \code{\link{hi}} }
  \item{\dots}{ further arguments (not used) }
}
\details{
  \command{length.hi} returns the number of the subsript elements in the index (even if they are negative).
  By contrast the generic \command{poslength} returns the number of selected elements (which for negative indices is \code{maxindex(x) - length(x)}).
  The generic \command{maxindex} returns the highest possible index position.
}
\value{
  an integer scalar
}
\author{ Jens Oehlschlägel }
\note{ duplicated negative indices are removed }
\seealso{ \code{\link{hi}}, \code{\link{as.hi}}, \code{\link{length.ff}}, \code{\link{length}} }
\examples{
  length(as.hi(-1, maxindex=12))
  poslength(as.hi(-1, maxindex=12))
  maxindex(as.hi(-1, maxindex=12))
  cat("note that\n")
  length(as.hi(c(-1, -1), maxindex=12))
  length(as.hi(c(1,1), maxindex=12))
}
\keyword{ IO }
\keyword{ data }
