\name{chunk.ffdf}
\Rdversion{1.1}
\alias{chunk.ffdf}
\title{
   Chunk ffdf
}
\description{
   Row-wise chunking method for ffdf objects automatically considering RAM requirements from recordsize as calculated from \code{\link{sum}(\link{.rambytes}[\link[=vmode.ffdf]{vmode}])}
}
\usage{
\method{chunk}{ffdf}(x, \dots, BATCHBYTES = getOption("ffbatchbytes"))
}
\arguments{
  \item{x}{\code{\link{ffdf}}}
  \item{\dots}{further arguments passed to \code{\link[bit]{chunk}}}
  \item{BATCHBYTES}{ integer scalar limiting the number of bytes to be processed in one chunk, default from \code{getOption("ffbatchbytes")}, see also \code{\link{.rambytes}} }
}
\value{
  A list with \code{\link[bit]{ri}} indexes each representing one chunk
}
\author{
  Jens Oehlschlägel
}
\seealso{ \code{\link[bit]{chunk}}, \code{\link{ffdf}} }
\examples{
  x <- data.frame(x=as.double(1:26), y=factor(letters), z=ordered(LETTERS))
  a <- as.ffdf(x)
  ceiling(26 / (300 \%/\% sum(.rambytes[vmode(a)])))
  chunk(a, BATCHBYTES=300)
  ceiling(13 / (100 \%/\% sum(.rambytes[vmode(a)])))
  chunk(a, from=1, to = 13, BATCHBYTES=100)
  rm(a); gc()

 cat("dummy example for linear regression with biglm on ffdf\n")
  library(biglm)

  cat("NOTE that . in formula requires calculating terms manually because . as a data-dependant term is not allowed in biglm\n")
  form <- Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species

  lmfit <- lm(form, data=iris)

  firis <- as.ffdf(iris)
  for (i in chunk(firis, by=50)){
    if (i[1]==1){
      cat("first chunk is: "); print(i)
      biglmfit <- biglm(form, data=firis[i,,drop=FALSE])
    }else{
      cat("next chunk is: "); print(i)
      biglmfit <- update(biglmfit, firis[i,,drop=FALSE])
    }
  }

  summary(lmfit)
  summary(biglmfit)
  stopifnot(all.equal(coef(lmfit), coef(biglmfit)))
}
\keyword{ IO }
\keyword{ data }
