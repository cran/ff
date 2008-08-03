\name{filename}
\alias{filename}
\alias{filename.ff}
\alias{filename.ff_pointer}
\alias{filename.default}
\title{ Get filename }
\description{
  Get filename from ram or ff object
}
\usage{
filename(x, \dots)
\method{filename}{default}(x, \dots)
\method{filename}{ff}(x, \dots)
\method{filename}{ff_pointer}(x, \dots)
}
\arguments{
  \item{x}{ a ram or ff object }
  \item{\dots}{ dummy to keep R CMD CHECK quiet }
}
\value{
  character filename
}
\author{ Jens Oehlschlägel }
\seealso{  \code{\link{ff}}, \code{\link{as.ff}}, \code{\link{as.ram}} }
\examples{
  x <- ff(1:12)
  filename(x)
  delete(x)
  rm(x)
}
\keyword{ IO }
\keyword{ data }
