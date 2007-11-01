\name{runique}
\alias{runique}

\title{
  Sampling unique indices
  }
\description{
  The function \command{runique(size, total)} gives the same output as \command{sample(total, size, replace = FALSE)} considering \code{total} as an integer. This function is preferable over \command{sample} when taking a small sample of a large population.
  }
\usage{
  runique(size, total)
  }
\arguments{
  \item{size}{non-negative integer giving the number of items to choose.}
  \item{total}{the size of the population as a positive integer, i.e. the length n in \code{1:n} over which to sample.}
  } 
\seealso{
  \command{\link[pkg:base]{sample}}
  }
\examples{
  seqpack(c(1:5,4,2,seq(2,20,4)))
  }
\keyword{arith}

