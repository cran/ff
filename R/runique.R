runique <- function(size,total)
{
  stopifnot(size <= total)
  n <- size
  x <- c()
  while(TRUE) {
    x <- unique( c(x,as.integer( runif(n)*total )) )
    n <- size - length(x)
    if (length(x) == size)
      return(x)
  }  
}


