\name{ffxtensions}
\alias{ffxtensions}
\title{ Test for availability of ff extensions }
\description{
  checks if this version of package ff supports ff extensions.
}
\usage{
 ffxtensions()
}
\value{
  logical scalar
}
\details{
  ff extensions are needed for certain bitcompressed vmodes and symmetric matrices.
}
\author{ Jens Oehlschlägel }
\seealso{  \code{\link{vmode}}%, \code{\link{symm}}
}
\examples{
  ffxtensions()
}
\keyword{ IO }
\keyword{ data }
