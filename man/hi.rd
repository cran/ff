\name{hi}
\alias{hi}
\title{ Hybrid index class }
\description{
  Class for hybrid index representation, plain and rle-packed
}
\usage{
hi(from, to, by = 1L, maxindex = NA, vw = NULL, pack = TRUE, NAs = NULL)
}
\arguments{
  \item{from}{ integer vector of lower sequence bounds }
  \item{to}{ integer vector of upper sequence bounds }
  \item{by}{ integer of stepsizes }
  \item{maxindex}{ maximum indep position (needed for negative indices) }
  \item{vw}{ virtual window information, see \code{\link{vw}} }
  \item{pack}{ FALSE to suppress rle-packing }
  \item{NAs}{ a vector of NA positions (not yet used) }
}
\details{
  Class \code{hi} will represent index data either as a plain positive or negative index vector or as an rle-packed version thereof.
  The current implementation switches from plain index positions \code{i} to rle-packed storage of \code{diff(i)} as soon as the compression ratio is 3 or higher.
  Note that sequences shorter than 2 must never be packed (could cause C-side crash).
  Furthermore hybrid indices are guaranteed to be sorted ascending, which helps \code{\link{ff}s} access method avoiding to swap repeatedly over the same memory pages (or file positions).
}
\value{
  A list of class 'hi' with components
  \item{ x      }{ directly accessed by the C-code: the sorted index as returned by \code{\link{rlepack}} }
  \item{ ix     }{ NULL or positions to restore original order }
  \item{ re     }{ logical scalar indicating if sequence was reversed from descending to ascending (in this case \code{is.null(ix)}) }
  \item{ minindex  }{ directly accessed by the C-code: represents the lowest positive subscript to be enumerated in case of negative subscripts }
  \item{ maxindex  }{ directly accessed by the C-code: represents the highest positive subscript to be enumerated in case of negative subscripts }
  \item{ length    }{ number of subscripts, whether negative or positive, not the number of selected elements }
  \item{ dim      }{ NULL or dim -- used by \code{\link{as.matrix.hi}} }
  \item{ dimorder  }{ NULL or \code{\link{dimorder}} }
  \item{ symmetric }{ logical scalar indicating whether we have a symmetric matrix }
  \item{ fixdiag   }{ logical scalar indicating whether we have a fixed diagonal (can only be true for symmetric matrices) }
  \item{ vw     }{ virtual window information \code{\link{vw}} }
  \item{ NAs      }{ NULL or NA positions as returned by \code{\link{rlepack}} }
}
\author{ Jens Oehlschlägel }
\note{ \command{hi} defines the class structure, however usually \code{\link{as.hi}} is used to acturally Hybrid Index Preprocessing for \code{\link{ff}} }
\seealso{ \code{\link{as.hi}} for coercion, \code{\link{rlepack}}, \code{\link{intrle}}, \code{\link{maxindex}}, \code{\link{poslength}} }
\examples{
  hi(c(1, 11, 29), c(9, 19, 21), c(1,1,-2))
  as.integer(hi(c(1, 11, 29), c(9, 19, 21), c(1,1,-2)))
}
\keyword{ IO }
\keyword{ data }
