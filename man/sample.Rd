\name{sample}
\alias{sample}
\title{Random Samples and Permutations}
\description{
  \code{sample} takes a sample of the specified size from the elements
  of \code{x} using either with or without replacement.
}
\note{
  \strong{The function \command{\link[pkg:base]{sample}} is set up as a generic function; the \command{sample} function now becomes the default method.}
  }
\usage{
sample(x, size, replace = FALSE, prob = NULL)
}
\arguments{
  \item{x}{Either a (numeric, complex, character or logical) vector of
    more than one element from which to choose, or a positive integer.}
  \item{size}{non-negative integer giving the number of items to choose.}
  \item{replace}{Should sampling be with replacement?}
  \item{prob}{A vector of probability weights for obtaining the elements
    of the vector being sampled.}
}
\details{
  See the corresponding help file of \command{\link[pkg:base]{sample}} for further details and examples. 
  }
\keyword{distribution}