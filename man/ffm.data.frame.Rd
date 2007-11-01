\name{ffm.data.frame}
\alias{ffm.data.frame}

\title{
  Data frame adapter for ffm objects
  }
\description{
  Wrapping a \code{ffm} object into a data frame.
  }
\usage{
  ffm.data.frame(ffm, names)
  }
\arguments{
  \item{ffm}{a \code{ffm} object.}
  \item{names}{a vector with characters giving the column names.}
  } 
\details{
  The function \command{ffm.data.frame} wraps an \code{ffm} object into a data frame. 
The \dQuote{column names} of the resulting data frame are specified with the argument \code{names}. 
By applying \command{ffm.data.frame} to an \code{ffm} object it is possible to apply \command{\link[pkg:biglm]{bigglm}} to \code{ffm} objects.
  }
\seealso{
  \command{\link[pkg:base]{data.frame}}
  \command{\link{ffm}}
  \command{\link[pkg:biglm]{bigglm}}
  }
\keyword{manip}

