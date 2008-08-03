# bit <=> ff interface
# (c) 2009 Jens Oehlschägel
# Licence: GPL2
# Provided 'as is', use at your own risk
# Created: 2009-04-05
# Last changed: 2009-04-05

# source("d:/mwp/eanalysis/ff/R/ffbit.R")

maxindex.bitwhich <- function(x, ...)
  length(x, ...)

maxindex.bit <- function(x, ...)
  length(x, ...)

maxindex.ri <- function(x, ...)
  length(x, ...)

poslength.bitwhich <- function(x, ...)
  sum(x, ...)

poslength.bit <- function(x, ...)
  sum(x, ...)

poslength.ri <- function(x, ...)
  sum(x, ...)

as.hi.ri <- function(x
, maxindex  = length(x)
, ...
)
{
  # NOTE that we cannot call hi() here because it would not handle ...-paramters dim= dimorder=
  l <- list(...)
  l$envir <- NULL
  do.call("as.hi", c(list(quote(x[[1]]:x[[2]]), maxindex=maxindex), l))
}


as.bitwhich.hi <- function(x, ...){
  poslength <- poslength(x)
  maxindex <- maxindex(x)
  if (poslength==0){
    bitwhich(maxindex, poslength, FALSE)
  }else if (poslength==maxindex){
    bitwhich(maxindex, poslength, TRUE)
  }else{
    x <- as.integer(x, ...)
    if (poslength > (maxindex%/%2L)){
      if (x[[1]]<0)
        bitwhich(maxindex, poslength, x)
      else
        bitwhich(maxindex, poslength, -as.integer(seq.int(length = maxindex))[-x])
    }else{
      if (x[[1]]<0)
        bitwhich(maxindex, poslength, as.integer(seq.int(length = maxindex))[x])
      else
        bitwhich(maxindex, poslength, x)
    }
  }
}

as.hi.bitwhich <- function(x, maxindex=length(x), ...){
  poslength <- sum(x)
  if (poslength==0){
    as.hi(integer(), maxindex=maxindex, ...)
  }else if (poslength==maxindex){
    as.hi(quote(1L:poslength), maxindex=maxindex, ...)
  }else{
    as.hi(unclass(x), maxindex=maxindex, ...)
  }
}

as.bit.hi <- function(x, ...)
  as.bit(as.bitwhich(x, ...))


as.hi.bit <- function(x
, range     = NULL
, maxindex  = length(x)  # we want this parameter because we know that as.hi() is sometimes called with explicit maxindex from [.ff and friends
, vw = NULL
, dim = NULL
, dimorder = NULL
, ...
){
  if (is.null(dim) && is.null(dimorder) && is.null(dim(vw))){
    # fast R_bit_as_hi does handle vector vw but not dim, dimorder, dim(vw)

    if (is.null(range))
      range <- c(1L, maxindex)
    else{
      range <- as.integer(range)
      if (range[1]<1L || range[2]>maxindex)
        stop("illegal range")
    }

    if (is.null(vw)){
      dat <- .Call("R_bit_as_hi", x, range, 0L, PACKAGE="bit")
      ret <- as.hi(1L, ...)
      ret$length <- sum(x, range=range)
      dat$len <- NULL
      ret$maxindex <- maxindex
    }else{
      vw <- as.integer(vw)
      if (length(vw)!=3)
        stop("length(vw) != 3")

      dat <- .Call("R_bit_as_hi", x, range, vw[1], PACKAGE="bit")
      ret <- as.hi(1L, ...)
      ret$length <- sum(x, range=range)
      dat$len <- NULL
      ret$minindex <- vw[[1]]
      ret$maxindex <- sum(vw)
      ret$vw <- vw
    }
    ret$x <- dat
    ret
  }else{
    as.hi(as.bitwhich(x, range=range), maxindex=maxindex, vw=vw, dim=dim, dimorder=dimorder, ...)
  }
}


regtest.as.hi.bit <- function(){

  cat("testing correctness of max.bit\n")
  for (n in c(0, 1, 2, 31, 32, 33, 63, 64, 65, 95, 96, 97, 127,128,129)){
    for (to1 in seq.int(length=n)){
      cat("n", n, "to", to1, "\n")
      for (from1 in seq.int(from=1, to=to1, by=1L)){
      x <- bit(n)
      if (!identical(max(x, from=from1, to=to1), as.integer(NA)))
        stop("wrong")
      for (i in seq.int(length=n)){
        x[i] <- TRUE
        if (!identical(i, max(x, from=from1, to=to1)))
          stop("wrong")
      }
      }
    }
  }


  cat("testing correctness of min.bit\n")
  for (n in c(0, 1, 2, 31, 32, 33, 63, 64, 65, 95, 96, 97, 127,128,129)){
    for (to1 in seq.int(length=n)){
      cat("n", n, "to", to1, "\n")
      for (from1 in seq.int(from=1, to=to1, by=1L)){
      x <- bit(n)
      if (!identical(min(x, from=from1, to=to1), as.integer(NA)))
        stop("wrong")
      for (i in rev(seq.int(length=n))){
        x[i] <- TRUE
        if (!identical(i, min(x, from=from1, to=to1)))
          stop("wrong")
      }
      }
    }
  }


  cat("testing correctness of as.hi.bit()\n")
  for (n in c(0, 1, 2, 31, 32, 33, 63, 64, 65, 95, 96, 97, 127,128,129)){
    for (to1 in seq.int(length=n)){
      cat("n", n, "to", to1, "\n")
      for (from1 in seq.int(from=1, to=to1, by=1L)){
      x <- bit(n)
      if (!identical(min(x, from=from1, to=to1), as.integer(NA)))
        stop("wrong")
      for (i in seq.int(length=n)){
        x[i] <- TRUE
        if (!identical(as.vector(as.which(x)), (1:n)[as.vector(as.integer(as.hi.bit(x)))]))
          stop("wrong")
      }
      }
    }
  }

  return(TRUE)
}



#! \name{as.ff.bit}
#! \Rdversion{1.1}
#! \alias{as.ff.bit}
#! \alias{as.bit.ff}
#! \title{
#!   Conversion between bit and ff boolean
#! }
#! \description{
#!   Function \code{as.ff.bit} converts a \code{\link[bit]{bit}} vector to a boolean \code{\link{ff}} vector.
#!   Function \code{as.bit.ff} converts a boolean \code{\link{ff}} vector to a \code{\link{ff}} vector.
#! }
#! \usage{
#! as.ff.bit(x, filename = NULL, overwrite = FALSE, ...)
#! as.bit.ff(x, ...)
#! }
#! \arguments{
#!   \item{x}{ the source of conversion }
#!   \item{filename}{ optionally a desired filename }
#!   \item{overwrite}{ logical indicating whether we allow overwriting the target file }
#!   \item{\dots}{ further arguments passed to ff in case \code{as.ff.bit}, ignored in case of \code{as.bit.ff} }
#! }
#! \details{
#!   The data are copied bot bit-wise but integerwise, therefore these conversions are very fast.
#!   \code{as.bit.ff}  will attach the ff filename to the bit vector, and \code{as.ff.bit} will - if attached - use THIS filename and SILENTLY overwrite this file.
#! }
#! \note{
#!   NAs are mapped to TRUE in 'bit' and to FALSE in 'ff' booleans. Might be aligned in a future release. Don't use bit if you have NAs - or map NAs explicitely.
#! }
#! \value{
#!   A vector of the converted type
#! }
#! \author{
#!   Jens Oehlschlägel
#! }
#! \seealso{
#!   \code{\link[bit]{bit}}, \code{\link{ff}}, \code{\link{as.ff}}, \code{\link{as.hi.bit}}
#! }
#! \examples{
#!   l <- sample(c(FALSE,TRUE), 1000, TRUE)
#!   b <- as.bit(l)
#!   stopifnot(identical(l,b[]))
#!   b
#!   f <- as.ff(b)
#!   stopifnot(identical(l,f[]))
#!   f
#!   b2 <- as.bit(f)
#!   stopifnot(identical(l,b2[]))
#!   b2
#!   f2 <- as.ff(b2)
#!   stopifnot(identical(filename(f),filename(f2)))
#!   stopifnot(identical(l,f2[]))
#!   f
#!   rm(f,f2); gc()
#! }
#! \keyword{ classes }
#! \keyword{ logic }
#! \keyword{ IO }
#! \keyword{ data }



as.ff.bit <- function(
  x
, filename  = NULL
, overwrite = FALSE
, ...
)
{
  nb <- length(x)
  pattr <- physical(x)
  pattr$maxlength <- NULL
  pattr$readonly <- NULL

  class(x) <- NULL
  ni <- length(x)

  l <- list(...)
  if (length(l))
    pattr[names(l)] <- l

  if (!is.null(filename))
    pattr$filename <- filename
  pattr$overwrite <- overwrite
  pattr$length <- nb

  pattr1 <- pattr
  pattr1$finalizer <- "close"
  pattr1$vmode <- "integer"
  pattr1$length <- ni
  y <- do.call("ff", pattr1)
  i1 <- i2 <- 0L; ffvecapply( y[i1:i2] <- x[i1:i2], X=y )
  close(y)

  pattr$filename <- filename(y)
  do.call("ff", pattr)
}



as.bit.ff <- function(x, ...){
  if (vmode(x)=="boolean"){
    nb <- length(x)
    iso <- is.open(x)
    if (iso)
      close(x)
    y <- ff(vmode="integer", filename=filename(x), finalizer="close")
    b <- integer(length(y))
    i1 <- i2 <- 0L; ffvecapply( b[i1:i2] <- y[i1:i2], X=y )
    close(y)
    if (iso)
      open(x)
    pattr <- physical(x)
    physical(b) <- pattr[!is.na(match(names(pattr), c("vmode", ramphysical_includes)))]
    vattr <- virtual(x)
    virtual(b)  <- vattr[!is.na(match(names(vattr), c("Length", ramvirtual_includes )))]
    class(b) <- "bit"
    b
  }else{
    stop("not implemented")
  }
}
