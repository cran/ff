\name{regtest.fforder}
\alias{regtest.fforder}
\title{
Sorting: regression tests
}
\description{
  Some tests verfying the correctness of the sorting routines
}
\usage{
regtest.fforder(n = 100)
}
\arguments{
  \item{n}{
  size of vector to be sorted
}
}
\details{
 stops in case of an error
}
\value{
 Invisible()
}
\author{
  Jens Oehlschlägel
}
\seealso{
  \code{\link{ramsort}}
}
\examples{
  regtest.fforder()

 \dontrun{
    n <- 5e6
    cat("performance comparison at n=", n, "\n")

    cat("sorting doubles\n")
    x <- y <- as.double(runif(n))

    x[] <- y
    system.time(sort(x))[3]
    x[] <- y
    system.time(shellsort(x))[3]
    x[] <- y
    system.time(shellsort(x, has.na=FALSE))[3]
    x[] <- y
    system.time(mergesort(x))[3]
    x[] <- y
    system.time(mergesort(x, has.na=FALSE))[3]

    x[] <- y
    system.time(sort(x, decreasing=TRUE))[3]
    x[] <- y
    system.time(shellsort(x, decreasing=TRUE))[3]
    x[] <- y
    system.time(shellsort(x, decreasing=TRUE, has.na=FALSE))[3]
    x[] <- y
    system.time(mergesort(x, decreasing=TRUE))[3]
    x[] <- y
    system.time(mergesort(x, decreasing=TRUE, has.na=FALSE))[3]


    x <- y <- as.double(sample(c(rep(NA, n/2), runif(n/2))))

    x[] <- y
    system.time(sort(x))[3]
    x[] <- y
    system.time(shellsort(x))[3]
    x[] <- y
    system.time(mergesort(x))[3]

    x[] <- y
    system.time(sort(x, decreasing=TRUE))[3]
    x[] <- y
    system.time(shellsort(x, decreasing=TRUE))[3]
    x[] <- y
    system.time(mergesort(x, decreasing=TRUE))[3]



    x <- y <- sort(as.double(runif(n)))

    x[] <- y
    system.time(sort(x))  # only here R is faster because R checks for beeing sorted
    x[] <- y
    system.time(shellsort(x))[3]
    x[] <- y
    system.time(shellsort(x, has.na=FALSE))[3]
    x[] <- y
    system.time(mergesort(x))[3]
    x[] <- y
    system.time(mergesort(x, has.na=FALSE))[3]

    x[] <- y
    system.time(sort(x, decreasing=TRUE))[3]
    x[] <- y
    system.time(shellsort(x, decreasing=TRUE))[3]
    x[] <- y
    system.time(shellsort(x, decreasing=TRUE, has.na=FALSE))[3]
    x[] <- y
    system.time(mergesort(x, decreasing=TRUE))[3]
    x[] <- y
    system.time(mergesort(x, decreasing=TRUE, has.na=FALSE))[3]

    y <- rev(y)
    x[] <- y
    system.time(sort(x))[3]
    x[] <- y
    system.time(shellsort(x))[3]
    x[] <- y
    system.time(shellsort(x, has.na=FALSE))[3]
    x[] <- y
    system.time(mergesort(x))[3]
    x[] <- y
    system.time(mergesort(x, has.na=FALSE))[3]

    x[] <- y
    system.time(sort(x, decreasing=TRUE))[3]
    x[] <- y
    system.time(shellsort(x, decreasing=TRUE))[3]
    x[] <- y
    system.time(shellsort(x, decreasing=TRUE, has.na=FALSE))[3]
    x[] <- y
    system.time(mergesort(x, decreasing=TRUE))[3]
    x[] <- y
    system.time(mergesort(x, decreasing=TRUE, has.na=FALSE))[3]

    rm(x,y)


    cat("ordering doubles\n")

    x <- as.double(runif(n))
    system.time(order(x))[3]
    i <- 1:n
    system.time(shellorder(x, i))[3]
    i <- 1:n
    system.time(shellorder(x, i, stabilize=TRUE))[3]
    i <- 1:n
    system.time(mergeorder(x, i))[3]

    x <- as.double(sample(c(rep(NA, n/2), runif(n/2))))
    system.time(order(x))[3]
    i <- 1:n
    system.time(shellorder(x, i))[3]
    i <- 1:n
    system.time(shellorder(x, i, stabilize=TRUE))[3]
    i <- 1:n
    system.time(mergeorder(x, i))[3]

    x <- as.double(sort(runif(n)))
    system.time(order(x))[3]
    i <- 1:n
    system.time(shellorder(x, i))[3]
    i <- 1:n
    system.time(shellorder(x, i, stabilize=TRUE))[3]
    i <- 1:n
    system.time(mergeorder(x, i))[3]

    x <- rev(x)
    system.time(order(x))[3]
    i <- 1:n
    system.time(shellorder(x, i))[3]
    i <- 1:n
    system.time(shellorder(x, i, stabilize=TRUE))[3]
    i <- 1:n
    system.time(mergeorder(x, i))[3]


    x <- as.double(runif(n))
    system.time(order(x, decreasing=TRUE))[3]
    i <- 1:n
    system.time(shellorder(x, i, decreasing=TRUE))[3]
    i <- 1:n
    system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
    i <- 1:n
    system.time(mergeorder(x, i, decreasing=TRUE))[3]

    x <- as.double(sample(c(rep(NA, n/2), runif(n/2))))
    system.time(order(x, decreasing=TRUE))[3]
    i <- 1:n
    system.time(shellorder(x, i, decreasing=TRUE))[3]
    i <- 1:n
    system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
    i <- 1:n
    system.time(mergeorder(x, i, decreasing=TRUE))[3]

    x <- as.double(sort(runif(n)))
    system.time(order(x, decreasing=TRUE))[3]
    i <- 1:n
    system.time(shellorder(x, i, decreasing=TRUE))[3]
    i <- 1:n
    system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
    i <- 1:n
    system.time(mergeorder(x, i, decreasing=TRUE))[3]

    x <- rev(x)
    system.time(order(x, decreasing=TRUE))[3]
    i <- 1:n
    system.time(shellorder(x, i, decreasing=TRUE))[3]
    i <- 1:n
    system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
    i <- 1:n
    system.time(mergeorder(x, i, decreasing=TRUE))[3]


    keys <- c("short","ushort")
    for (v in c("integer", keys)){

      if (v \%in\% keys){
        k <- .vmax[v]-.vmin[v]+1L
        if (is.na(.vNA[v])){
          y <- sample(c(rep(NA, k), .vmin[v]:.vmax[v]), n, TRUE)
        }else{
          y <- sample(.vmin[v]:.vmax[v], n, TRUE)
        }
      }else{
        k <- .Machine$integer.max
        y <- sample(k, n, TRUE)
      }

      cat("sorting",v,"\n")

      x <- y
      cat("sort(x) ");print(system.time(sort(x))[3])
      x <- y
      cat("shellsort(x) ");print(system.time(shellsort(x))[3])
      x <- y
      cat("mergesort(x) ");print(system.time(mergesort(x))[3])
      x <- y
      cat("radixsort(x) ");print(system.time(radixsort(x))[3])
      if (v \%in\% keys){
        x <- y
        cat("keysort(x) ");print(system.time(keysort(x))[3])
        x <- y
        cat("keysort(x, keyrange=c(.vmin[v],.vmax[v])) ");print(system.time(keysort(x, keyrange=c(.vmin[v],.vmax[v])))[3])
      }

      if (!is.na(.vNA[v])){
        x <- y
        cat("shellsort(x, has.na=FALSE) ");print(system.time(shellsort(x, has.na=FALSE))[3])
        x <- y
        cat("mergesort(x, has.na=FALSE) ");print(system.time(mergesort(x, has.na=FALSE))[3])
        x <- y
        cat("radixsort(x, has.na=FALSE) ");print(system.time(radixsort(x, has.na=FALSE))[3])
        if (v \%in\% keys){
          x <- y
          cat("keysort(x, has.na=FALSE) ");print(system.time(keysort(x, has.na=FALSE))[3])
          x <- y
          cat("keysort(x, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])) ");print(system.time(keysort(x, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])))[3])
        }
      }


      cat("ordering",v,"\n")

      x[] <- y
      i <- 1:n
      cat("order(x) ");print(system.time(order(x))[3])
      x[] <- y
      i <- 1:n
      cat("shellorder(x, i) ");print(system.time(shellorder(x, i))[3])
      x[] <- y
      i <- 1:n
      cat("mergeorder(x, i) ");print(system.time(mergeorder(x, i))[3])
      x[] <- y
      i <- 1:n
      cat("radixorder(x, i) ");print(system.time(radixorder(x, i))[3])
      if (v \%in\% keys){
        x[] <- y
        i <- 1:n
        cat("keyorder(x, i) ");print(system.time(keyorder(x, i))[3])
        x[] <- y
        i <- 1:n
        cat("keyorder(x, i, keyrange=c(.vmin[v],.vmax[v])) ");print(system.time(keyorder(x, i, keyrange=c(.vmin[v],.vmax[v])))[3])
      }

      if (!is.na(.vNA[v])){
        x[] <- y
        i <- 1:n
        cat("shellorder(x, i, has.na=FALSE) ");print(system.time(shellorder(x, i, has.na=FALSE))[3])
        x[] <- y
        i <- 1:n
        cat("mergeorder(x, i, has.na=FALSE) ");print(system.time(mergeorder(x, i, has.na=FALSE))[3])
        x[] <- y
        i <- 1:n
        cat("radixorder(x, i, has.na=FALSE) ");print(system.time(radixorder(x, i, has.na=FALSE))[3])
        if (v \%in\% keys){
          x[] <- y
          i <- 1:n
          cat("keyorder(x, i, has.na=FALSE) ");print(system.time(keyorder(x, i, has.na=FALSE))[3])
          x[] <- y
          i <- 1:n
          cat("keyorder(x, i, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])) ");print(system.time(keyorder(x, i, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])))[3])
        }
      }

    }
  }
}
\keyword{univar}
\keyword{manip}
\keyword{arith}
