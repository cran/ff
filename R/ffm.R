# --- ffm low-level ----------------------------------------------------------

ffm.open <- function(file,dim=0,pagesize,readonly)
{
  stopifnot( pagesize  %% getpagesize() == 0 && pagesize / getpagesize() > 0 )
  stopifnot( !readonly || !dim )      
  .Call("m_open", as.character(file), as.integer(dim), as.integer(pagesize), as.logical(readonly), PACKAGE="ff")  
}

ffm.geterror <- function(x)
{
  .Call("m_geterror", x)
}

ffm.ndims <- function(x)
{
  .Call("m_ndims", x, PACKAGE="ff")
}

ffm.dimlength <- function(x,dimindex)
{
  .Call("m_dimlength", x, as.integer(dimindex-1), PACKAGE="ff")
}

ffm.close <- function(x)
{
  .Call("m_close", x, PACKAGE="ff")
}

ffm.get <- function(x,index)
{
  stopifnot( is.ffm(x) )   
  stopifnot( dim(x) >= index )
  .Call("m_get", x, as.integer(index-1), PACKAGE="ff")
}

ffm.set <- function(x,index,value)
{
  stopifnot( is.ffm(x) )   
  stopifnot( !attr(x,"readonly") )  
  stopifnot( dim(x) >= index )
  .Call("m_set", x, as.integer(index-1), as.numeric(value), PACKAGE="ff")
}

# --- ffm high-level ---------------------------------------------------------

is.ffm <- function(x)
{
  inherits(x,"ffm")
}

ffm <- function(file,dim=0,pagesize=getdefaultpagesize(),readonly=FALSE)
{
  readonly <- testfile(paste(file,"ffd",sep="."),dim,readonly)
  
  x <- ffm.open(file,dim,pagesize,readonly)
  
  stopifnot( !is.null(x) )
  
  errorcode <- ffm.geterror(x)
  if (errorcode)
  {
    x <- 0
    gc()
    stop( errorToMessage(errorcode) )
  }

  indices <- 1:ffm.ndims(x)
  ffmdim <- sapply( indices, ffm.dimlength, x=x)

  class(x) <- "ffm"
  attr(x,"ffmdim") <- ffmdim
  attr(x,"readonly") <- readonly
  attr(x,"pagesize") <- pagesize
  
  return(x)
}

ffm.doget <- function(x,args,env)
{
  stopifnot( length(dim(x)) == length(args))  
  indexlist <- evalmindex( dim(x), args, env )
  m <- indmat(indexlist)  
  array(apply( m, 1, FUN=ffm.get, x=x), dim = unlist(lapply(indexlist, length)))  
}

ffm.doset <- function(x,args,value,env)
{
  stopifnot( length(dim(x)) == length(args) )  
  indexlist <- evalmindex( dim(x), args, env )  
  index <- indmat(indexlist)
  m <- cbind( index, value )  
  apply( m, 1, FUN=function(x, args) { ffm.set(x, head(args,length(args)-1),tail(args,1) ) }, x=x)
}

"[.ffm" <- function(x,...)
{
  ffm.doget( x, eval( substitute(alist(...)) ), env=sys.frame(sys.parent()) )
}

"[<-.ffm" <- function(x,...,value)
{  
  ffm.doset( x, eval( substitute(alist(...)) ), as.vector( as.matrix(value) ), env=sys.frame(sys.parent()) )
  return(x)  
}

length.ffm <- function(x)
{
  prod(dim(x))
}

dim.ffm <- function(x)
{
  attr(x,"ffmdim")
}

print.ffm <- function(x, ...) 
{  
  print( list(ff.attributes = unlist(attributes(x))) )
}

