# Function to compute the individual indices 
#
# indmat(indlist)
# 
#
# indlist         a list containing the index entries for each dimension
#
# returns a matrix with the indices
#
# author: wzucchini

indmat<-function(indlist)
{
  ndim<-length(indlist)
  n<-sapply(indlist,length)
  len<-prod(n)
  ieach<-1
  itimes<-len/n[1]
  indmat<-cbind(rep(indlist[[1]],each=ieach,times=itimes))
  if (ndim==1) return(indmat)
  for (i in 2:ndim)
  {
    ieach<-ieach*n[i-1]
    itimes<-itimes/n[i]
    indmat<-cbind(indmat,rep(indlist[[i]],each=ieach,times=itimes))
  }
  return(indmat)
}

