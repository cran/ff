\name{update.ff}
\alias{update.ff}
\title{ Update ff content from another object }
\description{
  \command{update} copies updates one ff object with the content of another object.
}
\usage{
update.ff(object, from, delete = FALSE, bydim = NULL, fromdim = NULL, BATCHSIZE = .Machine$integer.max, BATCHBYTES = getOption("ffbatchbytes"), VERBOSE = FALSE, \dots)
}
\arguments{
  \item{object}{ an ff object to which to update }
  \item{from}{ an object from which to uodate  }
  \item{delete}{ TRUE to delete the 'from' object after the update, can speed up updating significantly }
  \item{bydim}{ how to interpret the content of the object, see \code{\link{ff}} }
  \item{fromdim}{ how to interpret the content of the 'from' object, see \code{\link{ff}} }
  \item{BATCHSIZE}{ \code{BATCHSIZE} }
  \item{BATCHBYTES}{ \code{BATCHBYTES} }
  \item{VERBOSE}{ \code{VERBOSE} }
  \item{\dots}{ further arguments }
}
\details{
  If the source object \code{is.ff} and \code{delete=TRUE} then instead of slow copying we swap and rename the files behind the ff objects.
}
\value{
  a copy of the input ff object
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{ff}}, \code{\link{clone}}, \code{\link{ffvecapply}}, \code{\link{vectorCompatible}} }
\examples{
  x <- ff(1:100)
  y <- ff(-(1:100))
  filename(x)
  filename(y)
  update(x, from=y)
  update(x, from=y, delete=TRUE)
  filename(x)
  x

  \dontrun{
    cat("timings\n")
    x <- ff(1:10000000)
    y <- ff(-(1:10000000))
    system.time(update(x, from=y))
    system.time(update(x, from=y, delete=TRUE))
  }

}
\keyword{ IO }
\keyword{ data }
