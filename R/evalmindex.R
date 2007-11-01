# function
#   evalmindex
# description
#   translate multi-indices replacing missing values with sequences 
# author
#   dadler
#

evalmindex <- function(dim, index, env)
{ 
  r <- vector( mode="list",length=length(index) )
  for( i in 1:length(index) ) 
  {     
    if ( index[[i]] == "" ) 
    {
      r[i] <- list(1:dim[i])
    } 
    else
    {
      r[i] <- list( eval( index[[i]], env ) ) 
    }
  }
  r
}
