### seqpack: compressing sequences
### no animals or crop harvests harmed for this function!


seqpack <- function(x){
  x <- as.integer(x)
  if (length(x) == 1)
  {
    from <- x
    to   <- x
    by   <- 0
    return(rbind(from=from,to=to,by=by)) 
  }
  dx     <- c(diff(x),0)
  ldx    <- length(dx)
  repdx  <- c((dx[-ldx] == dx[-1]) & dx[-ldx]!= 0, FALSE)
  repdx2 <- c(FALSE, repdx[-ldx] & repdx[-1])

 # cut out subsequent entries of sequences
  x1     <- x[!repdx2]
  dx1    <- dx[!repdx2]
  repdx1 <- repdx[!repdx2]
  xs     <- c(x1[-(1:2)],x1[rep(length(x1),2)])

 # from, to, by:
  repdx2 <- c(FALSE, repdx1[-length(repdx1)])
  fr0    <- x1[!repdx2]
  to0    <- ifelse(repdx1, xs, x1)[!repdx2]
  by0    <- ifelse(repdx1, dx1, 0)[!repdx2]

 # final cut out:
  cut0   <- c(FALSE, (to0[-length(to0)] == fr0[-1]) & (by0[-1] == 0) & (fr0[-length(fr0)] != fr0[-1]))
  clash0 <- c(FALSE, (to0[-length(to0)] == fr0[-1]) & (by0[-1] != 0))
  fr0    <- ifelse(clash0, fr0+by0, fr0)

  return(rbind(from = fr0[!cut0], to = to0[!cut0], by = by0[!cut0]))
}



