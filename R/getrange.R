getrange <- function(index)
{
  if ( is.language(index) )
  {
    if ( length(index) == 3 ) {
      if ( index[[1]] == ':' ) {
        from <- eval( index[[2]], -2 )
        to   <- eval( index[[3]], -2 )
        return(rbind(from, to, by=ifelse(from < to, 1, -1)))
      }
    }
  }
  return(NULL)
}

