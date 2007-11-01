\name{seqpack}
\alias{seqpack}

\title{
  Packing of seqences
  }
\description{
  The function \command{seqpack} converts vectors of arbitrary indices into a matrix with row items \dQuote{from}, \dQuote{to} and \dQuote{by}. Sequences within the input vector are automatically detected. 
  }
\usage{
  seqpack(x)
  }
\arguments{
  \item{x}{a vector containing indices, i.e. integers.}
  } 
\value{
  A matrix with row items \dQuote{from}, \dQuote{to} and \dQuote{by}. The sub-sequences (and single indices) are given in the column in the same order that they appear in the input.
  }
\details{
  Extracting a subset of an \code{ff} object results in R to C calls. In order to avoid calling overhead resulting from a sequential processing of the indices, the indices of the subset are analysed and converted by \command{seqpack}. This way, an extraction of arbitrary sequences involves only a single R to C call. This feature is currently only implemented for \code{ff} objects.
  }
\seealso{
  \command{\link{ff}}
  }
\examples{
  seqpack(c(1:5,4,1,seq(2,20,4)))
  }
\keyword{iteration}
