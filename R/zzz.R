# Array utilities for ff
# (c) 2007 Jens Oehlschägel
# Licence: GPL2
# Provided 'as is', use at your own risk
# Created: 2007-08-24
# Last changed: 2007-10-25

# source("d:/mwp/eanalysis/ff/R/zzz.R")

.onLoad <- function(lib, pkg) {
  ##library.dynam("ff", pkg, lib) use useDynLib(ff) in NAMESPACE instead
  cat("Loading package ff", installed.packages()["ff","Version"], "\n")
  # allow fftempdir to be set before package is loaded
  if (is.null(getOption("fftempdir"))){
    # create tempdir and make tempdir name independent of platform (otherwise dirname(tempfile)!=getOption("fftempdir"))
    options(fftempdir=standardPathFile(tempdir()))
  }
  if (is.null(getOption("ffextension")))
    options(ffextension="ff")
  if (is.null(getOption("fffinonexit")))
    options(fffinonexit=TRUE)
  if (is.null(getOption("ffpagesize")))
    options(ffpagesize=getdefaultpagesize())
  if (is.null(getOption("ffcaching")))
    options(ffcaching="mmnoflush")
  if (is.null(getOption("ffdrop")))
    options(ffdrop=TRUE)
  if (is.null(getOption("ffbatchbytes"))){
    # memory.limit is windows specific
    if (.Platform$OS.type=="windows")
    {
      if (getRversion()>="2.6.0")  # memory.limit was silently changed from 2.6.0 to return in MB instead of bytes
        options(ffbatchbytes=as.integer(memory.limit()*(1024^2/100)))
      else
        options(ffbatchbytes=as.integer(memory.limit()/100))
    } else {
      # some magic constant
      options(ffbatchbytes=16*1024^2)
    }
  }
  cat('- getOption("fftempdir")=="',getOption("fftempdir"),'"\n',sep='')
  cat('- getOption("ffextension")=="',getOption("ffextension"),'"\n',sep='')
  cat('- getOption("ffdrop")==',getOption("ffdrop"),'\n',sep='')
  cat('- getOption("fffinonexit")==',getOption("fffinonexit"),'\n',sep='')
  cat('- getOption("ffpagesize")==',getOption("ffpagesize"),'\n',sep='')
  cat('- getOption("ffcaching")=="',getOption("ffcaching"),'"  -- consider "ffeachflush" if your system stalls on large writes\n',sep='')
  cat('- getOption("ffbatchbytes")==',getOption("ffbatchbytes"),' -- consider a different value for tuning your system\n',sep='')
  # if we want an explicit list of ff objects, we should store them in an environment with hash=TRUE (much faster than a list)
  #assign(".fftemp", new.env(hash=TRUE), envir=globalenv())

  assign(".vimplemented"
  , c(
      boolean   = .Call("ffmode_implemented", .ffmode["boolean"]  , PACKAGE="ff")
    , logical   = .Call("ffmode_implemented", .ffmode["logical"]  , PACKAGE="ff")
    , quad      = .Call("ffmode_implemented", .ffmode["quad"]     , PACKAGE="ff")
    , nibble    = .Call("ffmode_implemented", .ffmode["nibble"]   , PACKAGE="ff")
    , byte      = .Call("ffmode_implemented", .ffmode["byte"]     , PACKAGE="ff")
    , ubyte     = .Call("ffmode_implemented", .ffmode["ubyte"]    , PACKAGE="ff")
    , short     = .Call("ffmode_implemented", .ffmode["short"]    , PACKAGE="ff")
    , ushort    = .Call("ffmode_implemented", .ffmode["ushort"]   , PACKAGE="ff")
    , integer   = .Call("ffmode_implemented", .ffmode["integer"]  , PACKAGE="ff")
    , single    = .Call("ffmode_implemented", .ffmode["single"]   , PACKAGE="ff")
    , double    = .Call("ffmode_implemented", .ffmode["double"]   , PACKAGE="ff")
    , complex   = .Call("ffmode_implemented", .ffmode["complex"]  , PACKAGE="ff")
    , raw       = .Call("ffmode_implemented", .ffmode["raw"]      , PACKAGE="ff")
    , character = .Call("ffmode_implemented", .ffmode["character"], PACKAGE="ff")
    ), envir=globalenv()
  )

  # list of possible coercions without information loss
  assign(".vcoerceable"
  , lapply(
      list(
        boolean   = 1:13
      , logical   = c(2L, 5L, 7L, 9:12)
      , quad      = 3:13
      , nibble    = 4:13
      , byte      = c(5L, 7L, 9:12)
      , ubyte     = 6:13
      , short     = c(7L, 9:12)
      , ushort    = 8:12
      , integer   = 9:12
      , single    = 10:12
      , double    = 11:12
      , complex   = 12L
      , raw       = 6:12
      , character = 14L
      )
      , function(i)i[.vimplemented[i]]
    )
    , envir=globalenv()
  )
}

.onAttach <- function(libname, pkgname){
  cat("Attaching package ff\n")
  if (getRversion()<="2.10.0"){
    cat('fixing [.AsIs in base namespace because if the NextMethod("[") returns a different class, [.AsIs was reverting this\n')
    #assignInNamespace(
    #  "[.AsIs"
    #, function (x, i, ...){
    #    ret <- NextMethod("[")
    #    oldClass(ret) <- c("AsIs", oldClass(ret))
    #    ret
    #  }
    #, "base"
    #)
    assignInNamespace(
      "[.AsIs"
    , function (x, i, ...)I(NextMethod("["))
    , "base"
    )
  }
}

.Last.lib <- function(libpath) {
   cat("Detaching package ff\n")
  if (getRversion()<="2.10.0"){
    cat('restoring [.AsIs\n')
    assignInNamespace(
      "[.AsIs"
    , function (x, i, ...){
        ret <- NextMethod("[")
        oldClass(ret) <- c("AsIs", oldClass(x))
        ret
      }
    , "base"
    )
  }
}

.onUnload <- function(libpath){
   cat("Unloading package ff\n")
   #remove(list=".fftemp", envir=globalenv())
   #gc()
   library.dynam.unload("ff", libpath)
   if (unlink(getOption("fftempdir"), recursive = TRUE))
     cat("Error in unlinking fftempdir\n")
   else
     options(fftempdir=NULL, ffextension=NULL, fffinonexit=NULL, ffpagesize=NULL, ffcaching=NULL, ffdrop=NULL, ffbatchbytes=NULL)
}
