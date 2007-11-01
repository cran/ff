# --- ff low-level -----------------------------------------------------------

ff.open  <- function(file,len,pagesize,readonly) 
{
  stopifnot( pagesize  %% getpagesize() == 0 && pagesize / getpagesize() > 0 )
  stopifnot( !readonly || !len )    
  .Call("open", as.character(file), as.integer(len), as.integer(pagesize), as.logical(readonly), PACKAGE="ff")
}

ff.geterror <- function(x)
{
  .Call("geterror", x)
}

ff.close <- function(x) 
{
  is.ff(x)
  .Call("close", x, PACKAGE="ff")
}

ff.get   <- function(x,index)
{
  stopifnot( index > 0 && length(x) >= index )
  .Call("get", x, as.integer(index-1), PACKAGE="ff")
}

ff.set   <- function(x,index,value)
{  
  stopifnot( !attr(x,"readonly") )
  stopifnot( index > 0 && length(x) >= index )
  .Call("set", x, as.integer(index-1), as.numeric(value), PACKAGE="ff")
}

ff.len   <- function(x) 
{
  .Call("len", x, PACKAGE="ff")
}

is.ff <- function(x)
{
  inherits(x,"ff")
}

ff.read <- function(x,index,size)
{
  stopifnot( is.ff(x) ) 
  stopifnot( index > 0 && length(x) >= index+size-1 )
  .Call("read", x, as.integer(index-1), as.integer(size), PACKAGE="ff")
}

ff.write <- function(x,index,size,data)
{
  stopifnot( is.ff(x) )
  stopifnot( !attr(x,"readonly") )
  stopifnot( index > 0 && length(x) >= index+size-1 )
  data <- rep(data,length.out=size)
  .Call("write", x, as.integer(index-1), as.integer(size), as.numeric(data), PACKAGE="ff")
}

checkseq <- function(len,seq)
{
  stopifnot( 0 < seq[1,] && seq[1,] <= len )
  stopifnot( 0 < seq[2,] && seq[2,] <= len )  
}

ff.readseqs <- function(x,seqs, size)
{
  stopifnot( is.ff(x) )
  checkseq( length(x), seqs)
  .Call("readseq", x, as.integer(seqs-c(1,1,0)), as.integer(size), PACKAGE="ff" )
}

ff.writeseqs <- function(x,seqs,size,data)
{
  stopifnot( is.ff(x) )
  stopifnot( !attr(x,"readonly") )  
  checkseq( length(x), seqs)
  data <- rep(data,length.out=size)
  .Call("writeseq", x, as.integer(seqs-c(1,1,0)), as.integer(size), as.numeric(data), PACKAGE="ff" ) 
}

# --- ff high-level ----------------------------------------------------------

ff <- function(file,length=0,pagesize=getdefaultpagesize(),readonly=FALSE)
{
  readonly <- testfile(file,length,readonly)
  
  x <- ff.open(file,length,pagesize,readonly)
  
  stopifnot( !is.null(x) )

  errorcode <- ff.geterror(x)
  if ( errorcode ) 
  {
    x <- 0
    gc()
    stop( errorToMessage(errorcode) )
  }
  
  class(x) <- "ff"
  attr(x, "file") <- file
  attr(x, "pagesize") <- pagesize
  attr(x, "readonly") <- readonly
  return(x)
}

"[.ff" <- function(x,index)
{
    
   r <- getrange(substitute(index))
   if (!is.null(r))
   {
     ff.readseqs(x, r, abs(r[2]-r[1])+1)     
   }
   else
   {
     ff.readseqs(x, seqpack(index), length(index) )
   }
}

"[<-.ff" <- function(x,index,value) 
{ 
  r <- getrange(substitute(index))
  if (!is.null(r))
  {
     ff.writeseqs(x, r, abs(r[2]-r[1])+1, value)     
  }
  else
  {
    ff.writeseqs(x, seqpack(index), length(index), value )
  }     
  return(x)    
}

length.ff <- function(x) 
{
  ff.len(x)
}

dim.ff <- function(x)
{
  attr(x,"dim")
}

print.ff <- function(x, ...) 
{  
  print( list(ff.attributes = unlist(attributes(x)), first.values=x[1:min(10000,length(x))]) )
}

