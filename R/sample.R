sample.default <- sample

sample <- function (x, size, replace = FALSE, prob = NULL)
UseMethod("sample")

sample.ff <- function (x, size, replace = FALSE, prob = NULL)
{  
  if (replace)
    indices <- as.integer(runif(size)*length(x)+1)
  else
    indices <- runique(size,length(x))+1
    
  return( x[sort(indices)] )
}

