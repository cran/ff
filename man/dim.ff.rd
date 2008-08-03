\name{dim.ff}
\alias{dim.ff}
\alias{dim<-.ff}
\alias{dimorder}
\alias{dimorder.ff_array}
\alias{dimorder.default}
\alias{dimorder<-}
\alias{dimorder<-.ff_array}
\title{ Getting and setting dim and dimorder }
\description{
  Assigning \code{dim} to an \code{ff_vector} changes it to an \code{ff_array}.
  Beyond that \code{dimorder} can be assigned to change from column-major order to row-major order or generalizations for higher order \code{ff_array}.
}
\usage{
  \method{dim}{ff}(x)
  \method{dim}{ff}(x) <- value
   dimorder(x, \dots)
   dimorder(x, \dots) <- value
  \method{dimorder}{default}(x, \dots)
  \method{dimorder}{ff_array}(x, \dots)
  \method{dimorder}{ff_array}(x, \dots) <- value
}
\arguments{
  \item{x}{ a ff vector }
  \item{value}{ a character vector }
  \item{\dots}{ further arguments (not used) }
}
\details{
   \command{dim} and \command{dimorder} are \code{\link{virtual}} attributes. Thus two copies of an R ff object can point to the same file but interpret it differently.
   \command{dim} has the usual meaning, \command{dimorder} defines the dimension order of storage, i.e. \code{c(1,2)} corresponds to R's standard column-major order,
   \code{c(1,2)} corresponds to row-major order, and for higher dimensional arrays dimorder can also be used. Standard dimorder is \code{1:length(dim(x))}.
   An even higher level of virtualization is available using virtual windows, see \code{\link{vw}}.
}
\note{
  \code{x[]} returns a matrix like \code{x[,]} and thus respects dimorder, while \code{x[i:j]} returns a vector and simply returns elements in the stored order.
  Check the corresponding example twice, in order to make sure you understand that for non-standard dimorder \code{x[1:length(x)]} is \emph{not the same} as \code{as.vector(x[])}.
}
\value{
  \command{names} returns a character vector (or NULL)
}
\author{ Jens Oehlschlägel }
\seealso{ \code{\link[base]{dim}}, \code{\link{dimnames.ff_array}}, \code{\link{vw}}, \code{\link{virtual}} }
\examples{
  x <- ff(1:12, dim=c(3,4), dimorder=c(2:1))
  y <- x
  dim(y) <- c(4,3)
  dimorder(y) <- c(1:2)
  x
  y
  x[]
  y[]
  x[,bydim=c(2,1)]
  y[,bydim=c(2,1)]

  cat("NOTE that x[] like x[,] returns a matrix (respects dimorder),\n")
  cat("while x[1:12] returns a vector IN STORAGE ORDER\n")
  cat("check the following examples twice to make sure you understand this\n")
  x[,]
  x[]
  as.vector(x[])
  x[1:12]
  delete(x)
  delete(y)
  rm(x,y)

  \dontrun{
    cat("some performance comparison between different dimorders\n")
    n <- 100
    m <- 100000
    a <- ff(1L,dim=c(n,m))
    b <- ff(1L,dim=c(n,m), dimorder=2:1)
    system.time(lapply(1:n, function(i)sum(a[i,])))
    system.time(lapply(1:n, function(i)sum(b[i,])))
    system.time(lapply(1:n, function(i){i<-(i-1)*(m/n)+1; sum(a[,i:(i+m/n-1)])}))
    system.time(lapply(1:n, function(i){i<-(i-1)*(m/n)+1; sum(b[,i:(i+m/n-1)])}))
  }
}
\keyword{ IO }
\keyword{ data }
