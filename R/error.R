errorMessageTable <- c(
 "invalid"
,"no diskspace"
,"unable to open"
,"not existing"
,"write error"
,"file is readonly"
)

errorToMessage <- function(code)
{
  if (code) {
    return( errorMessageTable[code] )
  } else {
    return( "no errror" )
  }
}

