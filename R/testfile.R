testfile <- function(file,length=0,readonly=FALSE)
{
  do_create   <- ( length[1] != 0 )  
  does_exist  <- ( file.access(file,0) == 0 )
  is_writable <- ( file.access(file,2) == 0 )
  
  if (do_create)
  {
    if (readonly)
    {
      stop("invalid operation: create a read-only file")
    }
    if (does_exist)
    { 
      if (!is_writable)
      {
        stop("file already exists and read-only")
      }
    }
  } 
  else
  { 
    # open existing file
    
    if( !does_exist )
    {
      stop("file not found")
    }
    if ( missing(readonly) )
    {
      readonly <- ( is_writable == FALSE )
    }
    else
    {
      if (!readonly && !is_writable)
      {
        warning("opening file in read-only mode")
        readonly <- TRUE
      }
    }
  }
  return(readonly)  
}

