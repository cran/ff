# New generic functions for ff (and R.ff)
# (c) 2007 Jens Oehlschlägel
# Licence: GPL2
# Provided 'as is', use at your own risk
# Created: 2007-08-24
# Last changed: 2007-10-25

# source("d:/mwp/eanalysis/ff/R/generics.R")

# coerce to hybrid index (part of the HIP concept)
as.hi <- function(x, ...){
  UseMethod("as.hi")
}

# complementing 'length' generic
maxindex  <- function(x, ...)UseMethod("maxindex")  # max possible index length (required for negative indices)
poslength <- function(x, ...)UseMethod("poslength") # length of selected elements (even for negative indices)
maxlength <- function(x, ...)UseMethod("maxlength") # max physical length

# further physical and readonly attributes
filename    <- function(x, ...)UseMethod("filename")    # (physical attribute, part of the HCS concept)
is.readonly <- function(x, ...)UseMethod("is.readonly") # (physical attribute, part of the HCS concept)
is.open     <- function(x, ...)UseMethod("is.open")     # readonly

# querying and coercing vmode (physical attribute, part of the HCS concept)
    vmode <- function(x, ...)UseMethod("vmode")
 as.vmode <- function(x, ...)UseMethod("as.vmode")
"vmode<-" <- function(x, value)UseMethod("vmode<-")

# generics complementing 'open' and 'close' in ff file handling
delete     <- function(x, ...)UseMethod("delete")
deleteIfOpen <- function(x, ...)UseMethod("deleteIfOpen")

# complements 'ff' and 'update': cloning and convenience wrappers for swap in/out of cache
clone  <- function(x, ...)UseMethod("clone")
as.ff  <- function(x, ...)UseMethod("as.ff")
as.ram <- function(x, ...)UseMethod("as.ram")

# querying and setting dimorder (virtual attribute, part of the HCS concept)
 dimorder    <- function(x, ...)UseMethod("dimorder")
"dimorder<-" <- function(x, ..., value)UseMethod("dimorder<-")

# querying and setting virtual windows (virtual attribute, part of the HCS concept)
 vw    <- function(x, ...)UseMethod("vw")
"vw<-" <- function(x, ..., value)UseMethod("vw<-")

# querying is.factor and is.ordered
if (!exists("is.factor.default")){
  cat("creating generic 'is.factor'\n")
  is.factor.default <- get("is.factor", mode = "function") #pos = NULL,
  is.factor <- function (x)
    UseMethod("is.factor")
}
if (!exists("is.ordered.default")){
  cat("creating generic 'is.ordered'\n")
  is.ordered.default <- get("is.ordered", mode = "function") #pos = NULL,
  is.ordered <- function (x)
    UseMethod("is.ordered")
}

ramclass <- function (x, ...)
  UseMethod("ramclass")
ramattribs <- function (x, ...)
  UseMethod("ramattribs")

# maintaining NA counts (physical attritbute, part of the HCS concept)
 na.count    <- function(x, ...)UseMethod("na.count")
"na.count<-" <- function(x, ..., value)UseMethod("na.count<-")



# -- special access methods --

# add(x, value)  <==>  x[,add=TRUE] <- value  <==>  x += value
add <- function(x, ...)UseMethod("add")

# swap: combines existing generics '[' and '[<-' and is needed e.g. for maintaining NA counts
swap <- function(x, value, ...)UseMethod("swap")


# -- for future use in ff ------------------------------------------------------------

# check for 'hard' symmetric attribute as contrasted with R's isSymmetric() that checks for symmetry on the fly via all.equal()
symmetric <- function(x, ...)UseMethod("symmetric")

# read and write fixed diagonal in symmetric matrices
fixdiag <- function(x, ...)UseMethod("fixdiag")
"fixdiag<-" <- function(x, ..., value)UseMethod("fixdiag<-")


# -- R.ff stuff currently already in ff

# large sampling
bigsample <- function(x, ...)UseMethod("bigsample")

# virtual matrix transpose
vt <- function(x, ...)UseMethod("vt")

