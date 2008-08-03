\name{is.sorted}
\alias{is.sorted}
\alias{is.sorted<-}
\title{ Getting and setting 'is.sorted' physical attribute }
\description{
  Functions to mark an ff or ram object as 'is.sorted' and query this. Responsibility to maintain this attribute is with the user.
}
\usage{
is.sorted(x)
is.sorted(x) <- value
}
\arguments{
  \item{x}{ an ff or ram object }
  \item{value}{ NULL (to remove the 'is.sorted' attribute) or TRUE or FALSE }
}
\details{
  Sorting is slow, see \code{\link[base]{sort}}.
  Checking whether an object is sorted can avoid unnessary sorting -- see \code{\link[base]{is.unsorted}}, \code{\link[bit]{intisasc}} -- but still takes too much time with large objects stored on disk.
  Thus it makes sense to maintain an attribute, that tells us whether sorting can be skipped.
  Note that -- though you change it yourself -- \code{is.sorted} is a \code{\link[=physical.ff]{physical}} attribute of an object,
  because it represents an attribute of the \emph{data}, which is shared between different \code{\link[=physical.ff]{virtual}} views of the object.
}
\value{
  TRUE (if set to TRUE) or FALSE (if set to NULL or FALSE)
}
\note{
  \command{ff} will set \code{is.sorted(x) <- FALSE} if \code{\link{clone}} or \code{\link{length<-.ff}} have increased length.
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link{is.ordered.ff}} for testing factor levels, \code{\link[base]{is.unsorted}} for testing the data, \code{\link[bit]{intisasc}} for a quick version thereof, \code{\link{na.count}} for yet another \code{\link[=physical.ff]{physical}} attribute }
\examples{
  x <- 1:12
  is.sorted(x) <- !( is.na(is.unsorted(x)) || is.unsorted(x))  # actually calling is.unsorted twice is stupid
  is.sorted(x)
  x[1] <- 100L
  cat("don't forget to maintain once it's no longer TRUE")
  is.sorted(x) <- FALSE
  cat("check whether as 'is.sorted' attribute is maintained\n")
  !is.null(physical(x)$is.sorted)
  cat("remove the 'is.sorted' attribute\n")
  is.sorted(x) <- NULL
  cat("NOTE that querying 'is.sorted' still returns FALSE\n")
  is.sorted(x)
}
\keyword{ IO }
\keyword{ data }
\keyword{ arith }
