\name{as.ff}
\alias{as.ff}
\alias{as.ff.default}
\alias{as.ff.ff}
\alias{as.ram}
\alias{as.ram.default}
\alias{as.ram.ff}
\title{ Coercing ram to ff and ff to ram objects }
\description{
   Coercing ram to ff and ff to ram objects while optionally modifying object features.
}
\usage{
  as.ff(x, ...)
  as.ram(x, ...)
  \method{as.ff}{default}(x, filename = NULL, overwrite = FALSE, ...)
  \method{as.ff}{ff}(x, filename = NULL, overwrite = FALSE, ...)
  \method{as.ram}{default}(x, ...)
  \method{as.ram}{ff}(x, ...)
}
\arguments{
  \item{x}{ any object to be coerced }
  \item{filename}{ path and filename }
  \item{overwrite}{ TRUE to overwrite the old filename }
  \item{\dots}{ \code{\dots} }
}
\details{
  If \command{as.ff.ff} is called on an 'ff' object or \command{as.ram.default} is called on a non-ff object AND no changes are required, the input object 'x' is returned unchanged.
  Otherwise the workhorse \code{\link{clone.ff}} is called.
  If no change of features are requested, the filename attached to the object remains unchanged, otherwise a new filename is requested (or can be set by the user).
}
\note{
   If you use \code{ram <- as.ram(ff)} for caching, please note that you must \command{\link{close.ff}} before you can write back \code{as.ff(ram, overwrite=TRUE)} (see examples).
}
\value{
  A ram or ff object.
}
\author{ Jens Oehlschlägel }
\seealso{  \code{\link{as.ff.bit}}, \code{\link{ff}}, \code{\link{clone}} %, \code{\link{as.symm}}
         , \code{\link{as.vmode}}, \code{\link{vmode}}, \code{\link{as.hi}} }
\examples{
   cat("create ff\n")
   myintff <- ff(1:12)
   cat("coerce (=clone) integer ff to double ff\n")
   mydoubleff <- as.ff(myintff, vmode="double")
   cat("cache (=clone) integer ff to integer ram AND close original ff\n")
   myintram <- as.ram(myintff) # filename is retained
   close(myintff)
   cat("modify ram cache and write back (=clone) to ff\n")
   myintram[1] <- -1L
   myintff <- as.ff(myintram, overwrite=TRUE)
   cat("coerce (=clone) integer ram to double ram\n")
   mydoubleram <- as.ram(myintram, vmode="double")
   cat("coerce (inplace) integer ram to double ram\n")
   myintram <- as.ram(myintram, vmode="double")
   cat("more classic: coerce (inplace) double ram to integer ram\n")
   vmode(myintram) <- "integer"
   rm(myintff, myintram, mydoubleff, mydoubleram); gc()
}
\keyword{ IO }
\keyword{ data }
