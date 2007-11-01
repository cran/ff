ffm.data.frame<-function( ffm, names )
{
  x <- list( Data = ffm, NameColumns = names )
  class(x) <- c("ffm.data.frame","data.frame")
  return( x )
}

"[.ffm.data.frame" <- function(dataframe, ...)
{
  #create list
  n <- length( dataframe$NameColumns )

  #create list template
  x <- data.frame(1)

  if ( n > 1)
    for ( i in 1:(n-1) )
    {
      x <- data.frame(x,1)
    }

  names(x) <- dataframe$NameColumns

  z <- ffm.doget( dataframe$Data, eval( substitute(alist(...)) ), env=sys.frame(sys.parent()) )
  
  x[1:nrow(z),1:ncol(z)] <- z
  x
}

"names<-.ffm.data.frame" <- function(x,value)
{
  x$NameColumns <- value
  x
}

names.ffm.data.frame <- function(x)
{
  return( x$NameColumns )
}

dim.ffm.data.frame <-function(x)
{
  as.vector(attr(x$Data,"ffmdim"))
}

