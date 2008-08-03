# Utilities for ff
# (c) 2007 Jens Oehlschlägel
# Licence: GPL2
# Provided 'as is', use at your own risk
# Created: 2007-08-24
# Last changed: 2007-10-25

# source("d:/mwp/eanalysis/ff/R/util.R")

#! \name{unclass_-}
#! \alias{unclass<-}
#! \title{ Unclassed assignement }
#! \description{
#!   With \command{unclass<-} you can circumvent class dispatch on the assignment operator
#! }
#! \usage{
#! unclass(x) <- value
#! }
#! \arguments{
#!   \item{x}{ some object }
#!   \item{value}{ the value to be assigned }
#! }
#! \value{
#!   the modified object
#! }
#! \author{ Jens Oehlschlägel }
#! \seealso{ \code{\link{unclass}}, \code{\link{undim}} }
#! \examples{
#!   x <- factor(letters)
#!   unclass(x)[1:3] <- 1L
#!   x
#! }
#! \keyword{ IO }
#! \keyword{ data }

"unclass<-" <- function(x, value){
  cl <- class(x)
  x <- unclass(x)
  x <- value
  class(x) <- cl
  x
}


#! \name{undim}
#! \alias{undim}
#! \title{ Undim }
#! \description{
#!   \command{undim} returns its input with the dim attribute removed
#! }
#! \usage{
#! undim(x)
#! }
#! \arguments{
#!   \item{x}{ an object }
#! }
#! \value{
#!   x without dim attribute
#! }
#! \author{ Jens Oehlschlägel }
#! \seealso{ \code{\link{unclass<-}}, \code{\link{unclass}}, \code{\link{unname}}, \code{\link{dim}} }
#! \examples{
#!   x <- matrix(1:12, 3)
#!   x
#!   undim(x)
#! }
#! \keyword{ IO }
#! \keyword{ data }

undim <- function(x){
  dim(x) <- NULL
  x
}

