getpagesize <- function()
{
  .Call("getpagesize", PACKAGE="ff")
}

getdefaultpagesize <- function()
{
  if (.Platform$OS.type == "windows") {
    return( getpagesize() ) 
  } else {
    return( getpagesize() )
  }
}

