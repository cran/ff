pkgname <- "ff"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('ff')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("CFUN")
### * CFUN

flush(stderr()); flush(stdout())

### Name: CFUN
### Title: Collapsing functions for batch processing
### Aliases: CFUN ccbind crbind cfun cquantile csummary cmedian clength
###   csum cmean
### Keywords: manip list

### ** Examples

   X <- lapply(split(rnorm(1000), 1:10), summary)
   do.call("crbind", X)
   do.call("csummary", X)
   do.call("cmean", X)
   do.call("cfun", c(X, list(FUN=mean, FUNARGS=list(na.rm=TRUE))))
   rm(X)



cleanEx()
nameEx("Extract.ff")
### * Extract.ff

flush(stderr()); flush(stdout())

### Name: Extract.ff
### Title: Reading and writing vectors and arrays (high-level)
### Aliases: Extract.ff [.ff [<-.ff [.ff_array [<-.ff_array [[.ff [[<-.ff
### Keywords: IO data array

### ** Examples

   message("look at different dimorders")
   x <- ff(1:12, dim=c(3,4), dimorder=c(1,2))
   x[]
   as.vector(x[])
   x[1:12]
   x <- ff(1:12, dim=c(3,4), dimorder=c(2,1))
   x[]
   as.vector(x[])
   message("Beware (might be changed)")
   x[1:12]

   message("look at different bydim")
   matrix(1:12, nrow=3, ncol=4, byrow=FALSE)
   x <- ff(1:12, dim=c(3,4), bydim=c(1,2))
   x
   matrix(1:12, nrow=3, ncol=4, byrow=TRUE)
   x <- ff(1:12, dim=c(3,4), bydim=c(2,1))
   x
   x[,, bydim=c(2,1)]
   as.vector(x[,, bydim=c(2,1)])
   message("even consistent interpretation of vectors in assignments")
   x[,, bydim=c(1,2)] <- x[,, bydim=c(1,2)]
   x
   x[,, bydim=c(2,1)] <- x[,, bydim=c(2,1)]
   x
   rm(x); gc()

  ## Not run: 
##D    message("some performance implications of different dimorders")
##D    n <- 100
##D    m <- 100000
##D    a <- ff(1L,dim=c(n,m))
##D    b <- ff(1L,dim=c(n,m), dimorder=2:1)
##D    system.time(lapply(1:n, function(i)sum(a[i,])))
##D    system.time(lapply(1:n, function(i)sum(b[i,])))
##D    system.time(lapply(1:n, function(i){i<-(i-1)*(m/n)+1; sum(a[,i:(i+m/n-1)])}))
##D    system.time(lapply(1:n, function(i){i<-(i-1)*(m/n)+1; sum(b[,i:(i+m/n-1)])}))
##D 
##D    n <- 100
##D    a <- ff(1L,dim=c(n,n,n,n))
##D    b <- ff(1L,dim=c(n,n,n,n), dimorder=4:1)
##D    system.time(lapply(1:n, function(i)sum(a[i,,,])))
##D    system.time(lapply(1:n, function(i)sum(a[,i,,])))
##D    system.time(lapply(1:n, function(i)sum(a[,,i,])))
##D    system.time(lapply(1:n, function(i)sum(a[,,,i])))
##D    system.time(lapply(1:n, function(i)sum(b[i,,,])))
##D    system.time(lapply(1:n, function(i)sum(b[,i,,])))
##D    system.time(lapply(1:n, function(i)sum(b[,,i,])))
##D    system.time(lapply(1:n, function(i)sum(b[,,,i])))
##D 
##D    n <- 100
##D    m <- 100000
##D    a <- ff(1L,dim=c(n,m))
##D    b <- ff(1L,dim=c(n,m), dimorder=2:1)
##D    system.time(ffrowapply(sum(a[i1:i2,]), a, RETURN=TRUE, CFUN="csum", BATCHBYTES=16104816%/%20))
##D    system.time(ffcolapply(sum(a[,i1:i2]), a, RETURN=TRUE, CFUN="csum", BATCHBYTES=16104816%/%20))
##D    system.time(ffrowapply(sum(b[i1:i2,]), b, RETURN=TRUE, CFUN="csum", BATCHBYTES=16104816%/%20))
##D    system.time(ffcolapply(sum(b[,i1:i2]), b, RETURN=TRUE, CFUN="csum", BATCHBYTES=16104816%/%20))
##D 
##D    rm(a,b); gc()
##D   
## End(Not run)



cleanEx()
nameEx("Extract.ffdf")
### * Extract.ffdf

flush(stderr()); flush(stdout())

### Name: Extract.ffdf
### Title: Reading and writing data.frames (ffdf)
### Aliases: Extract.ffdf [.ffdf [<-.ffdf [[.ffdf [[<-.ffdf $.ffdf $<-.ffdf
### Keywords: IO data

### ** Examples

   d <- data.frame(a=letters, b=rev(letters), c=1:26)
   x <- as.ffdf(d)

   d[1,]
   x[1,]

   d[1:2,]
   x[1:2,]

   d[,1]
   x[,1]

   d[,1:2]
   x[,1:2]

   d[cbind(1:2,2:1)]
   x[cbind(1:2,2:1)]

   d[1]
   x[1]

   d[[1]]
   x[[1]]

   d$a
   x$a

   d$a[1:2]
   x$a[1:2]

   rm(x); gc()



cleanEx()
nameEx("add")
### * add

flush(stderr()); flush(stdout())

### Name: add
### Title: Incrementing an ff or ram object
### Aliases: add add.ff add.default
### Keywords: IO data

### ** Examples

   message("incrementing parts of a vector")
   x <- ff(0, length=12)
   y <- rep(0, 12)
   add(x, 1, 1:6)
   add(y, 1, 1:6)
   x
   y

   message("incrementing parts of a matrix")
   x <- ff(0, dim=3:4)
   y <- array(0, dim=3:4)
   add(x, 1, 1:2, 1:2)
   add(y, 1, 1:2, 1:2)
   x
   y

   message("BEWARE that ff and ram methods differ in treatment of duplicated index positions")
   add(x, 1, c(3,3))
   add(y, 1, c(3,3))
   x
   y

   rm(x); gc()



cleanEx()
nameEx("array2vector")
### * array2vector

flush(stderr()); flush(stdout())

### Name: array2vector
### Title: Array: make vector from array
### Aliases: array2vector
### Keywords: array data

### ** Examples

  array2vector(matrix(1:12, 3, 4))
  array2vector(matrix(1:12, 3, 4, byrow=TRUE), dimorder=2:1)



cleanEx()
nameEx("arrayIndex2vectorIndex")
### * arrayIndex2vectorIndex

flush(stderr()); flush(stdout())

### Name: arrayIndex2vectorIndex
### Title: Array: make vector positions from array index
### Aliases: arrayIndex2vectorIndex
### Keywords: array data

### ** Examples

  x <- matrix(1:12, 3, 4)
  x
  arrayIndex2vectorIndex(cbind(as.vector(row(x)), as.vector(col(x))), dim=dim(x))
  arrayIndex2vectorIndex(cbind(as.vector(row(x)), as.vector(col(x))), dim=dim(x), dimorder=2:1)
  matrix(1:30, 5, 6)
  arrayIndex2vectorIndex(cbind(as.vector(row(x)), as.vector(col(x))), vw=rbind(c(0,1), c(3,4), c(2,1)))
  arrayIndex2vectorIndex(cbind(as.vector(row(x)), as.vector(col(x))), vw=rbind(c(0,1), c(3,4), c(2,1)), dimorder=2:1)



cleanEx()
nameEx("as.ff")
### * as.ff

flush(stderr()); flush(stdout())

### Name: as.ff
### Title: Coercing ram to ff and ff to ram objects
### Aliases: as.ff as.ff.default as.ff.ff as.ram as.ram.default as.ram.ff
### Keywords: IO data

### ** Examples

   message("create ff")
   myintff <- ff(1:12)
   message("coerce (=clone) integer ff to double ff")
   mydoubleff <- as.ff(myintff, vmode="double")
   message("cache (=clone) integer ff to integer ram AND close original ff")
   myintram <- as.ram(myintff) # filename is retained
   close(myintff)
   message("modify ram cache and write back (=clone) to ff")
   myintram[1] <- -1L
   myintff <- as.ff(myintram, overwrite=TRUE)
   message("coerce (=clone) integer ram to double ram")
   mydoubleram <- as.ram(myintram, vmode="double")
   message("coerce (inplace) integer ram to double ram")
   myintram <- as.ram(myintram, vmode="double")
   message("more classic: coerce (inplace) double ram to integer ram")
   vmode(myintram) <- "integer"
   rm(myintff, myintram, mydoubleff, mydoubleram); gc()



cleanEx()
nameEx("as.ff.bit")
### * as.ff.bit

flush(stderr()); flush(stdout())

### Name: as.ff.bit
### Title: Conversion between bit and ff boolean
### Aliases: as.ff.bit as.bit.ff
### Keywords: classes logic IO data

### ** Examples

  l <- as.boolean(sample(c(FALSE,TRUE), 1000, TRUE))

  b <- as.bit(l)
  stopifnot(identical(l,b[]))
  b
  f <- as.ff(b)
  stopifnot(identical(l,f[]))
  f
  b2 <- as.bit(f)
  stopifnot(identical(l,b2[]))
  b2
  f2 <- as.ff(b2)
  stopifnot(identical(filename(f),filename(f2)))
  stopifnot(identical(l,f2[]))
  f
  rm(f,f2); gc()



cleanEx()
nameEx("as.ffdf")
### * as.ffdf

flush(stderr()); flush(stdout())

### Name: as.ffdf
### Title: Coercing to ffdf and data.frame
### Aliases: as.ffdf as.ffdf.ff_vector as.ffdf.ff_matrix as.ffdf.data.frame
###   as.data.frame.ffdf
### Keywords: IO data

### ** Examples

  d <- data.frame(x=1:26, y=letters, z=Sys.time()+1:26)
  ffd <- as.ffdf(d)
  stopifnot(identical(d, as.data.frame(ffd)))
  rm(ffd); gc()



cleanEx()
nameEx("as.hi")
### * as.hi

flush(stderr()); flush(stdout())

### Name: as.hi
### Title: Hybrid Index, coercion to
### Aliases: as.hi as.hi.hi as.hi.ri as.hi.bit as.hi.bitwhich as.hi.call
###   as.hi.name as.hi.( as.hi.integer as.hi.which as.hi.double
###   as.hi.logical as.hi.character as.hi.matrix
### Keywords: IO data

### ** Examples

  message("integer indexing with and without rel-packing")
  as.hi(1:12)
  as.hi(1:12, pack=FALSE)
  message("if index is double, the wrapper method just converts to integer")
  as.hi(as.double(1:12))
  message("if index is character, the wrapper method just converts to integer")
  as.hi(c("a","b","c"), names=letters)
  message("negative index must use maxindex (or vw)")
  as.hi(-(1:3), maxindex=12)
  message("logical index can use maxindex")
  as.hi(c(FALSE, FALSE, TRUE, TRUE))
  as.hi(c(FALSE, FALSE, TRUE, TRUE), maxindex=12)

  message("matrix index")
  x <- matrix(1:12, 6)
  as.hi(rbind(c(1,1), c(1,2), c(2,1)), dim=dim(x))

  message("first ten positions within virtual window")
  i <- as.hi(1:10, vw=c(10, 80, 10))
  i
  message("back-coerce relativ to virtual window")
  as.integer(i)
  message("back-coerce relativ to absolute origin")
  as.integer(i, vw.convert=FALSE)

  message("parsed index expressions save index RAM")
    as.hi(quote(1:1000000000))
## Not run: 
##D   message("compare to RAM requirement when the index experssion is evaluated")
##D     as.hi(1:1000000000)
## End(Not run)

message("example of parsable index expression")
  a <- seq(100, 200, 20)
  as.hi(substitute(c(1:5, 4:9, a)))
  hi(c(1,4, 100),c(5,9, 200), by=c(1,1,20))

message("example of index expression partially expanded and accepting token")
  as.hi(quote(1+(1:16)))  # non-supported use of brackets '(' and mathematical operators '+' expands 1:16, parsing is aborted because length>16

message("example of index expression completely evaluated after token has been rejected")
  as.hi(quote(1+(1:17)))  # non-supported use of brackets '(' and mathematical operators '+' expands 1:17, parsing is aborted because length>16



cleanEx()
nameEx("as.integer.hi")
### * as.integer.hi

flush(stderr()); flush(stdout())

### Name: as.integer.hi
### Title: Hybrid Index, coercing from
### Aliases: as.which.hi as.bitwhich.hi as.bit.hi as.integer.hi
###   as.logical.hi as.character.hi as.matrix.hi
### Keywords: IO data

### ** Examples

  x <- 1:6
  names(x) <- letters[1:6]
  as.integer(as.hi(c(1:3)))
  as.logical(as.hi(c(TRUE,TRUE,TRUE,FALSE,FALSE,FALSE)))
  as.character(as.hi(letters[1:3], names=names(x)), names=names(x))
  x <- matrix(1:12, 6)
  as.matrix(as.hi(rbind(c(1,1), c(1,2), c(2,1)), dim=dim(x)), dim=dim(x))



cleanEx()
nameEx("as.vmode")
### * as.vmode

flush(stderr()); flush(stdout())

### Name: as.vmode
### Title: Coercing to virtual mode
### Aliases: as.vmode as.vmode.default as.vmode.ff as.boolean
###   as.boolean.default as.quad as.quad.default as.nibble
###   as.nibble.default as.byte as.byte.default as.ubyte as.ubyte.default
###   as.short as.short.default as.ushort as.ushort.default
### Keywords: IO data attribute

### ** Examples

  as.vmode(1:3,"double")
  as.vmode(1:3,"byte")
  as.double(1:3)
  as.byte(1:3)



cleanEx()
nameEx("bigsample")
### * bigsample

flush(stderr()); flush(stdout())

### Name: bigsample
### Title: Sampling from large pools
### Aliases: bigsample bigsample.default bigsample.ff
### Keywords: distribution data

### ** Examples

message("Specify pool size")
bigsample(1e8, 10)
message("Sample ff elements")
bigsample(ff(1:100 / 10), 10) # same as x[bigsample(length(ff(1:100 / 10)), 10)]
 ## Not run: 
##D    message("Speed factor")
##D    (system.time(for(i in 1:10)sample(1e8, 10))[3]/10) / (system.time(for(i in 1:1000)bigsample(1e8, 10))[3]/1000)
##D  
## End(Not run)



cleanEx()
nameEx("chunk.bit")
### * chunk.bit

flush(stderr()); flush(stdout())

### Name: chunk.bit
### Title: Chunk bit vectors
### Aliases: chunk.bit
### Keywords: IO data

### ** Examples

  n <- 1000
  x <- bit(n)
  ceiling(n / (300 %/% sum(.rambytes["logical"])))
  chunk(x, BATCHBYTES=300)
  ceiling((n/2) / (100 %/% sum(.rambytes["logical"])))
  chunk(x, from=1, to = n/2, BATCHBYTES=100)
  rm(x, n)




cleanEx()
nameEx("chunk.ffdf")
### * chunk.ffdf

flush(stderr()); flush(stdout())

### Name: chunk.ffdf
### Title: Chunk ff_vector and ffdf
### Aliases: chunk.ffdf chunk.ff_vector
### Keywords: IO data

### ** Examples

  x <- data.frame(x=as.double(1:26), y=factor(letters), z=ordered(LETTERS))
  a <- as.ffdf(x)
  ceiling(26 / (300 %/% sum(.rambytes[vmode(a)])))
  chunk(a, BATCHBYTES=300)
  ceiling(13 / (100 %/% sum(.rambytes[vmode(a)])))
  chunk(a, from=1, to = 13, BATCHBYTES=100)
  rm(a); gc()

  message("dummy example for linear regression with biglm on ffdf")
  library(biglm)

  message("NOTE that . in formula requires calculating terms manually because . as a data-dependant term is not allowed in biglm")
  form <- Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width + Species

  lmfit <- lm(form, data=iris)

  firis <- as.ffdf(iris)
  for (i in chunk(firis, by=50)){
    if (i[1]==1){
      message("first chunk is: ", i[[1]],":",i[[2]])
      biglmfit <- biglm(form, data=firis[i,,drop=FALSE])
    }else{
      message("next chunk is: ", i[[1]],":",i[[2]])
      biglmfit <- update(biglmfit, firis[i,,drop=FALSE])
    }
  }

  summary(lmfit)
  summary(biglmfit)
  stopifnot(all.equal(coef(lmfit), coef(biglmfit)))



cleanEx()
nameEx("clone")
### * clone

flush(stderr()); flush(stdout())

### Name: clone
### Title: Cloning ff and ram objects
### Aliases: clone clone.ff clone.default
### Keywords: IO data

### ** Examples

  x <- ff(letters, levels=letters)
  y <- clone(x, length=52)
  rm(x,y); gc()



cleanEx()
nameEx("clone.ffdf")
### * clone.ffdf

flush(stderr()); flush(stdout())

### Name: clone.ffdf
### Title: Cloning ffdf objects
### Aliases: clone.ffdf
### Keywords: IO data

### ** Examples

  x <- as.ffdf(data.frame(a=1:26, b=letters))

  message("Here we change the content of both x and y by reference")
  y <- x
  x$a[1] <- -1
  y$a[1]

  message("Here we change the content only of x because y is a deep copy")
  y <- clone(x)
  x$a[2] <- -2
  y$a[2]
  rm(x, y); gc()



cleanEx()
nameEx("close.ff")
### * close.ff

flush(stderr()); flush(stdout())

### Name: close.ff
### Title: Closing ff files
### Aliases: close.ff close.ffdf close.ff_pointer
### Keywords: IO data

### ** Examples

  x <- ff(1:12)
  close(x)
  x
  open(x)
  x
  rm(x); gc()



cleanEx()
nameEx("delete")
### * delete

flush(stderr()); flush(stdout())

### Name: delete
### Title: Deleting the file behind an ff object
### Aliases: delete delete.ff delete.ffdf delete.ff_pointer delete.default
###   deleteIfOpen deleteIfOpen.ff deleteIfOpen.ff_pointer
### Keywords: IO data

### ** Examples

  message('create the ff file outside getOption("fftempir"), it will have default finalizer "close", so you need to delete it explicitely')
  x <- ff(1:12, pattern="./ffexample")
  delete(x)
  rm(x)



cleanEx()
nameEx("dim.ff")
### * dim.ff

flush(stderr()); flush(stdout())

### Name: dim.ff
### Title: Getting and setting dim and dimorder
### Aliases: dim.ff dim.ffdf dim<-.ff dim<-.ffdf dimorder dimorder.default
###   dimorder.ff_array dimorder.ffdf dimorder<- dimorder<-.ff_array
###   dimorder<-.ffdf
### Keywords: IO data

### ** Examples

  x <- ff(1:12, dim=c(3,4), dimorder=c(2:1))
  y <- x
  dim(y) <- c(4,3)
  dimorder(y) <- c(1:2)
  x
  y
  x[]
  y[]
  x[,bydim=c(2,1)]
  y[,bydim=c(2,1)]

  message("NOTE that x[] like x[,] returns a matrix (respects dimorder),")
  message("while x[1:12] returns a vector IN STORAGE ORDER")
  message("check the following examples twice to make sure you understand this")
  x[,]
  x[]
  as.vector(x[])
  x[1:12]
  rm(x,y); gc()

  ## Don't show: 
    message("some regression test with regard to different dimorders")
    k <- 24
    d <- 3:5
    n <- prod(d)
    for (i in 1:k){
      a <- array(sample(n), dim=sample(d))
      x <- as.ff(a, dimorder=sample(seq_along(d)))
      if (!identical(a[1:n], x[1:n]))
        stop("error in caclulating access positions")
      if (!identical(a[1:dim(a)[1],,], x[1:dim(a)[1],,]))
        stop("error in caclulating access positions")
    }
    rm(x); gc()
  
## End Don't show
  ## Not run: 
##D     message("some performance comparison between different dimorders")
##D     n <- 100
##D     m <- 100000
##D     a <- ff(1L,dim=c(n,m))
##D     b <- ff(1L,dim=c(n,m), dimorder=2:1)
##D     system.time(lapply(1:n, function(i)sum(a[i,])))
##D     system.time(lapply(1:n, function(i)sum(b[i,])))
##D     system.time(lapply(1:n, function(i){i<-(i-1)*(m/n)+1; sum(a[,i:(i+m/n-1)])}))
##D     system.time(lapply(1:n, function(i){i<-(i-1)*(m/n)+1; sum(b[,i:(i+m/n-1)])}))
##D     rm(a,b); gc()
##D   
## End(Not run)



cleanEx()
nameEx("dimnames.ff_array")
### * dimnames.ff_array

flush(stderr()); flush(stdout())

### Name: dimnames.ff_array
### Title: Getting and setting dimnames
### Aliases: dimnames.ff dimnames.ff_array dimnames<-.ff_array
### Keywords: IO data

### ** Examples

  x <- ff(1:12, dim=c(3,4), dimnames=list(letters[1:3], LETTERS[1:4]))
  dimnames(x)
  dimnames(x) <- list(LETTERS[1:3], letters[1:4])
  dimnames(x)
  dimnames(x) <- NULL
  dimnames(x)
  rm(x); gc()



cleanEx()
nameEx("dimnames.ffdf")
### * dimnames.ffdf

flush(stderr()); flush(stdout())

### Name: dimnames.ffdf
### Title: Getting and setting dimnames of ffdf
### Aliases: dimnames.ffdf dimnames<-.ffdf names.ffdf names<-.ffdf
###   row.names.ffdf row.names<-.ffdf

### ** Examples

  ffd <- as.ffdf(data.frame(a=1:26, b=letters))
  dimnames(ffd)
  row.names(ffd) <- letters
  dimnames(ffd)
  ffd
  rm(ffd); gc()



cleanEx()
nameEx("dummy.dimnames")
### * dummy.dimnames

flush(stderr()); flush(stdout())

### Name: dummy.dimnames
### Title: Array: make dimnames
### Aliases: dummy.dimnames
### Keywords: array data

### ** Examples

  dummy.dimnames(matrix(1:12, 3, 4))



cleanEx()
nameEx("ff")
### * ff

flush(stderr()); flush(stdout())

### Name: ff
### Title: ff classes for representing (large) atomic data
### Aliases: ff ff_pointer
### Keywords: IO array attribute classes package

### ** Examples

  message("make sure you understand the following ff options before you start using the ff package!!")
  oldoptions <- options(fffinalizer="deleteIfOpen", fffinonexit="TRUE", fftempdir=tempdir())
  ff(1:12)                        # an integer vector
  ff(0, 12)                       # a double vector of length 12
  ff(vmode="logical", length=12)  # a logical vector of length 12 (due to NA using 2 bit per cell on disk, vmode="boolean" uses 1 bit)
  ff(1:12, dim=c(3,4))            # an integer matrix 3x4 (standard colwise physical layout)
  ff(1:12, dim=c(3,4), dimorder=c(2,1)) # an integer matrix 3x4 (rowwise physical layout, but filled in standard colwise order)
  ff(1:12, dim=c(3,4), bydim=c(2,1)) # an integer matrix 3x4 (standard colwise physical layout, but filled in rowwise order aka matrix(, byrow=TRUE))
  gc()
  options(oldoptions)

  if (ffxtensions()){
     a <- ff(vmode="boolean", dim=rep(2, 26)) # a 26-dimensional boolean array using 1-bit representation (file size 8 MB compared to 256 MB int in ram)
     dimnames(a) <- dummy.dimnames(a)
     rm(a); gc()
  }

  ## Not run: 
##D 
##D      message("This 2GB biglm example can take long, you might want to change the size in order to define a size appropriate for your computer")
##D      require(biglm)
##D 
##D      b <- 1000
##D      n <- 100000
##D      k <- 3
##D      memory.size(max = TRUE)
##D      system.time(
##D      x <- ff(vmode="double", dim=c(b*n,k), dimnames=list(NULL, LETTERS[1:k]))
##D      )
##D      memory.size(max = TRUE)
##D      system.time(
##D      ffrowapply({
##D         l <- i2 - i1 + 1
##D         z <- rnorm(l)
##D         x[i1:i2,] <- z + matrix(rnorm(l*k), l, k)
##D      }, X=x, VERBOSE=TRUE, BATCHSIZE=n)
##D      )
##D      memory.size(max = TRUE)
##D 
##D      form <- A ~ B + C
##D      first <- TRUE
##D      system.time(
##D      ffrowapply({
##D         if (first){
##D           first <- FALSE
##D           fit <- biglm(form, as.data.frame(x[i1:i2,,drop=FALSE]))
##D         }else
##D           fit <- update(fit, as.data.frame(x[i1:i2,,drop=FALSE]))
##D      }, X=x, VERBOSE=TRUE, BATCHSIZE=n)
##D      )
##D      memory.size(max = TRUE)
##D      first
##D      fit
##D      summary(fit)
##D      rm(x); gc()
##D   
## End(Not run)



cleanEx()
nameEx("ffapply")
### * ffapply

flush(stderr()); flush(stdout())

### Name: ffapply
### Title: Apply for ff objects
### Aliases: ffapply ffvecapply ffrowapply ffcolapply
### Keywords: array data

### ** Examples

   message("ffvecapply examples")
   x <- ff(vmode="integer", length=1000)
   message("loop evaluate expression without returning anything")
   ffvecapply(x[i1:i2] <- i1:i2, X=x, VERBOSE=TRUE)
   ffvecapply(x[i1:i2] <- i1:i2, X=x, BATCHSIZE=200, VERBOSE=TRUE)
   ffvecapply(x[i1:i2] <- i1:i2, X=x, BATCHSIZE=199, VERBOSE=TRUE)
   message("lets return the combined expressions as a new ff object")
   ffvecapply(i1:i2, N=length(x), VMODE="integer", RETURN=TRUE, BATCHSIZE=200)
   message("lets return the combined expressions as a new ram object")
   ffvecapply(i1:i2, N=length(x), VMODE="integer", RETURN=TRUE, FF_RETURN=FALSE, BATCHSIZE=200)
   message("lets return the combined expressions in existing ff object x")
   x[] <- 0L
   ffvecapply(i1:i2, N=length(x), VMODE="integer", RETURN=TRUE, FF_RETURN=x, BATCHSIZE=200)
   x
   message("aggregate and collapse")
   ffvecapply(summary(x[i1:i2]), X=x, RETURN=TRUE, CFUN="list", BATCHSIZE=200)
   ffvecapply(summary(x[i1:i2]), X=x, RETURN=TRUE, CFUN="crbind", BATCHSIZE=200)
   ffvecapply(summary(x[i1:i2]), X=x, RETURN=TRUE, CFUN="cmean", BATCHSIZE=200)

   message("how to do colSums with ffrowapply")
   x <- ff(1:10000, vmode="integer", dim=c(1000, 10))
   ffrowapply(colSums(x[i1:i2,,drop=FALSE]), X=x, RETURN=TRUE, CFUN="list", BATCHSIZE=200)
   ffrowapply(colSums(x[i1:i2,,drop=FALSE]), X=x, RETURN=TRUE, CFUN="crbind", BATCHSIZE=200)
   ffrowapply(colSums(x[i1:i2,,drop=FALSE]), X=x, RETURN=TRUE, CFUN="csum", BATCHSIZE=200)

   message("further ffrowapply examples")
   x <- ff(1:10000, vmode="integer", dim=c(1000, 10))
   message("loop evaluate expression without returning anything")
   ffrowapply(x[i1:i2, ] <- i1:i2, X=x, BATCHSIZE=200)
   message("lets return the combined expressions as a new ff object (x unchanged)")
   ffrowapply(2*x[i1:i2, ], X=x, RETURN=TRUE, BATCHSIZE=200)
   message("lets return a single row aggregate")
   ffrowapply(t(apply(x[i1:i2,,drop=FALSE], 1, mean)), X=x, RETURN=TRUE, RETCOL=NULL, BATCHSIZE=200)
   message("lets return a 6 column aggregates")
   y <- ffrowapply( t(apply(x[i1:i2,,drop=FALSE], 1, summary)), X=x, RETURN=TRUE, RETCOL=length(summary(0)), BATCHSIZE=200)
   colnames(y) <- names(summary(0))
   y
   message("determine column minima if a complete column does not fit into RAM")
   ffrowapply(apply(x[i1:i2,], 2, min), X=x, RETURN=TRUE, CFUN="pmin", BATCHSIZE=200)

   message("ffapply examples")
   x <- ff(1:720, dim=c(8,9,10))
   dimnames(x) <- dummy.dimnames(x)
   message("apply function with scalar return value")
   apply(X=x[], MARGIN=3:2, FUN=sum)
   apply(X=x[], MARGIN=2:3, FUN=sum)
   ffapply(X=x, MARGIN=3:2, AFUN="sum", RETURN=TRUE, BATCHSIZE=8)
   message("this is what CFUN is based on")
   ffapply(X=x, MARGIN=2:3, AFUN="sum", RETURN=TRUE, CFUN="list", BATCHSIZE=8)

   message("apply functions with vector or array return value currently have limited support")
   apply(X=x[], MARGIN=3:2, FUN=summary)
   message("you must use CFUN, the rest is up to you")
   y <- ffapply(X=x, MARGIN=3:2, AFUN="summary", RETURN=TRUE, CFUN="list", BATCHSIZE=8)
   y
   y[[1]]

   rm(x); gc()



cleanEx()
nameEx("ffconform")
### * ffconform

flush(stderr()); flush(stdout())

### Name: ffconform
### Title: Get most conforming argument
### Aliases: ffconform
### Keywords: IO data

### ** Examples

  a <- ff(1:10)
  b <- clone(a)
  c <- ff(1:20)
  d <- ff(1:21)
  ffconform(a,b)
  ffconform(c,a)
  ffconform(a,c)
  ffconform(c,a,b)

  d1 <- ff(1:20, dim=c(2,10))
  d2 <- ff(1:20, dim=c(10,2))
  ffconform(c,d1)
  ffconform(c,d2)
  ffconform(d1,c)
  ffconform(d2,c)
  try(ffconform(d1,d2))
  ffconform(d1,d1)

  rm(a,b,c,d1,d2); gc()



cleanEx()
nameEx("ffdf")
### * ffdf

flush(stderr()); flush(stdout())

### Name: ffdf
### Title: ff class for data.frames
### Aliases: ffdf
### Keywords: IO data

### ** Examples

 m <- matrix(1:12, 3, 4, dimnames=list(c("r1","r2","r3"), c("m1","m2","m3","m4")))
 v <- 1:3
 ffm <- as.ff(m)
 ffv <- as.ff(v)

 d <- data.frame(m, v)
 ffd <- ffdf(ffm, v=ffv, row.names=row.names(ffm))
 all.equal(d, ffd[,])
 ffd
 physical(ffd)

 d <- data.frame(m, v)
 ffd <- ffdf(ffm, v=ffv, row.names=row.names(ffm), ff_split=1)
 all.equal(d, ffd[,])
 ffd
 physical(ffd)

 d <- data.frame(m, v)
 ffd <- ffdf(ffm, v=ffv, row.names=row.names(ffm), ff_join=list(newff=c(1,2)))
 all.equal(d, ffd[,])
 ffd
 physical(ffd)

 d <- data.frame(I(m), I(v))
 ffd <- ffdf(m=I(ffm), v=I(ffv), row.names=row.names(ffm))
 all.equal(d, ffd[,])
 ffd
 physical(ffd)

 rm(ffm,ffv,ffd); gc()



cleanEx()
nameEx("ffdfindexget")
### * ffdfindexget

flush(stderr()); flush(stdout())

### Name: ffdfindexget
### Title: Reading and writing ffdf data.frame using ff subscripts
### Aliases: ffdfindexget ffdfindexset
### Keywords: IO data

### ** Examples

message("ff integer subscripts with ffdf return/assign values")
x <- ff(factor(letters))
y <- ff(1:26)
d <- ffdf(x,y)
i <- ff(2:9)
di <- d[i,]
di
d[i,] <- di
message("ff integer subscripts: more control with ffindexget/ffindexset")
di <- ffdfindexget(d, i, FF_RETURN=di)
d <- ffdfindexset(d, i, di)
rm(x, y, d, i, di)
gc()



cleanEx()
nameEx("ffdfsort")
### * ffdfsort

flush(stderr()); flush(stdout())

### Name: ffdfsort
### Title: Sorting: convenience wrappers for data.frames
### Aliases: dfsort dforder ramdfsort ramdforder ffdfsort ffdforder
### Keywords: univar manip arith IO data

### ** Examples

   x <- ff(sample(1e5, 1e6, TRUE))
   y <- ff(sample(1e5, 1e6, TRUE))
   z <- ff(sample(1e5, 1e6, TRUE))
   d <- ffdf(x, y, z)
   d2 <- ffdfsort(d)
   d2
   d
   d2 <- d[1:2]
   i <- ffdforder(d2)
   d[i,]
   rm(x, y, z, i, d, d2)
   gc()



cleanEx()
nameEx("ffindexget")
### * ffindexget

flush(stderr()); flush(stdout())

### Name: ffindexget
### Title: Reading and writing ff vectors using ff subscripts
### Aliases: ffindexget ffindexset
### Keywords: IO data

### ** Examples

message("ff integer subscripts with ff return/assign values")
x <- ff(factor(letters))
i <- ff(2:9)
xi <- x[i]
xi
xi[] <- NA
xi
x[i] <- xi
x
message("ff integer subscripts: more control with ffindexget/ffindexset")
xi <- ffindexget(x, i, FF_RETURN=xi)
x <- ffindexset(x, i, xi)
rm(x, i, xi)
gc()



cleanEx()
nameEx("ffindexorder")
### * ffindexorder

flush(stderr()); flush(stdout())

### Name: ffindexorder
### Title: Sorting: chunked ordering of integer suscript positions
### Aliases: ffindexorder ffindexordersize
### Keywords: IO data

### ** Examples

     x <- ff(sample(40))
     message("fforder requires sorting")
     i <- fforder(x)
     message("applying this order i is done by ffindexget")
     x[i]
     message("applying this order i requires random access, therefore ffindexget does chunkwise sorting")
     ffindexget(x, i)
     message("if we want to apply the order i multiple times, we can do the chunkwise sorting once and store it")
     s <- ffindexordersize(length(i), vmode(i), BATCHBYTES = 100)
     o <- ffindexorder(i, s$b)
     message("this is how the stored chunkwise sorting is used")
     ffindexget(x, i, o)
     message("")
     rm(x,i,s,o)
     gc()



cleanEx()
nameEx("fforder")
### * fforder

flush(stderr()); flush(stdout())

### Name: fforder
### Title: Sorting: order from ff vectors
### Aliases: fforder
### Keywords: univar manip arith IO data

### ** Examples

   x <- ff(sample(1e5, 1e6, TRUE))
   y <- ff(sample(1e5, 1e6, TRUE))
   d <- ffdf(x, y)

   i <- fforder(y)
   y[i]
   i <- fforder(x, index=i)
   x[i]
   d[i,]

   i <- fforder(x, y)
   d[i,]

   i <- ffdforder(d)
   d[i,]

   rm(x, y, d, i)
   gc()



cleanEx()
nameEx("ffsave")
### * ffsave

flush(stderr()); flush(stdout())

### Name: ffsave
### Title: Save R and ff objects
### Aliases: ffsave ffsave.image
### Keywords: IO file

### ** Examples

  ## Not run: 
##D   message("let's create some ff objects")
##D   n <- 8e3
##D   a <- ff(sample(n, n, TRUE), vmode="integer", length=n, filename="d:/tmp/a.ff")
##D   b <- ff(sample(255, n, TRUE), vmode="ubyte", length=n, filename="d:/tmp/b.ff")
##D   x <- ff(sample(255, n, TRUE), vmode="ubyte", length=n, filename="d:/tmp/x.ff")
##D   y <- ff(sample(255, n, TRUE), vmode="ubyte", length=n, filename="d:/tmp/y.ff")
##D   z <- ff(sample(255, n, TRUE), vmode="ubyte", length=n, filename="d:/tmp/z.ff")
##D   df <- ffdf(x=x, y=y, z=z)
##D   rm(x,y,z)
##D 
##D   message("save all of them")
##D   ffsave.image("d:/tmp/x")
##D   str(ffinfo("d:/tmp/x"))
##D 
##D   message("save some of them with shorter relative pathnames ...")
##D   ffsave(a, b, file="d:/tmp/y", rootpath="d:/tmp")
##D   str(ffinfo("d:/tmp/y"))
##D 
##D   message("... and add others later")
##D   ffsave(df, add=TRUE, file="d:/tmp/y", rootpath="d:/tmp")
##D   str(ffinfo("d:/tmp/y"))
##D 
##D   message("... and add others later")
##D   system.time(ffsave(a, file="d:/tmp/z", move=TRUE))
##D   ffinfo("d:/tmp/z")
##D 
##D   message("let's delete/close/remove all objects")
##D   close(a)  # no file anymore, since we moved a into the ffarchive
##D   delete(b, df)
##D   rm(df, a, b, n)
##D   message("prove it")
##D   ls()
##D 
##D   message("restore all but ff files in a different directory")
##D   system.time(ffload("d:/tmp/x", rootpath="d:/tmp2"))
##D   lapply(ls(), function(i)filename(get(i)))
##D 
##D   delete(a, b, df)
##D   rm(df, a, b)
##D 
##D   ffdrop(c("d:/tmp/x", "d:/tmp/y", "d:/tmp/z"))
##D   
## End(Not run)



cleanEx()
nameEx("ffsort")
### * ffsort

flush(stderr()); flush(stdout())

### Name: ffsort
### Title: Sorting of ff vectors
### Aliases: ffsort
### Keywords: univar manip arith IO data

### ** Examples

   n <- 1e6
   x <- ff(c(NA, 999999:1), vmode="double", length=n)
   x <- ffsort(x)
   x
   is.sorted(x)
   na.count(x)
   x <- ffsort(x, decorate=TRUE)
   is.sorted(x)
   na.count(x)
   x <- ffsort(x, BATCHBYTES=n, VERBOSE=TRUE)



cleanEx()
nameEx("ffxtensions")
### * ffxtensions

flush(stderr()); flush(stdout())

### Name: ffxtensions
### Title: Test for availability of ff extensions
### Aliases: ffxtensions ffsymmxtensions
### Keywords: IO data

### ** Examples

  ffxtensions()
  ffsymmxtensions()



cleanEx()
nameEx("file.resize")
### * file.resize

flush(stderr()); flush(stdout())

### Name: file.resize
### Title: Change size of an existing file
### Aliases: file.resize
### Keywords: IO data

### ** Examples

 x <- tempfile()
 newsize <- 23       # resize and size to 23 bytes.
 file.resize(x, newsize)
 file.info(x)$size == newsize
 ## Not run: 
##D    newsize <- 8*(2^30) # create new file and size to 8 GB.
##D    file.resize(x, newsize)
##D    file.info(x)$size == newsize
##D  
## End(Not run)
 file.remove(x)



cleanEx()
nameEx("filename")
### * filename

flush(stderr()); flush(stdout())

### Name: filename
### Title: Get or set filename
### Aliases: filename filename.default filename.ff_pointer filename.ffdf
###   filename<- filename<-.ff pattern pattern<- pattern.ff pattern<-.ff
###   pattern<-.ffdf
### Keywords: IO data

### ** Examples

  ## Not run: 
##D   message("Neither giving pattern nor filename gives a random filename with extension ffextension in fftempdir")
##D   x <- ff(1:12)
##D   finalizer(x)
##D   filename(x)
##D   message("Giving a pattern with just a prefix moves to a random filename beginning with the prefix in fftempdir")
##D   pattern(x) <- "myprefix_"
##D   filename(x)
##D   message("Giving a pattern with a path and prefix moves to a random filename beginning with prefix in path (use . for getwd) ")
##D   pattern(x) <- "./myprefix"
##D   filename(x)
##D   message("Giving a filename moves to exactly this filename and extension in the R-expected place) ")
##D   if (!file.exists("./myfilename.myextension")){
##D     filename(x) <- "./myfilename.myextension"
##D     filename(x)
##D   }
##D 
##D   message("NOTE that the finalizer has changed from 'delete' to 'close': now WE are responsible for deleting the file - NOT the finalizer")
##D   finalizer(x)
##D   delete(x)
##D   rm(x)
##D   
## End(Not run)



cleanEx()
nameEx("finalize")
### * finalize

flush(stderr()); flush(stdout())

### Name: finalize
### Title: Call finalizer
### Aliases: finalize finalize.ff_pointer finalize.ff finalize.ffdf
### Keywords: IO

### ** Examples

  x <- ff(1:12, pattern="./finalizerdemo")
  fnam <- filename(x)
  finalizer(x)
  is.open(x)
  file.exists(fnam)

  finalize(x)

  finalizer(x)
  is.open(x)
  file.exists(fnam)

  delete(x)
  finalizer(x)
  is.open(x)
  file.exists(fnam)

  rm(x)
  gc()



cleanEx()
nameEx("finalizer")
### * finalizer

flush(stderr()); flush(stdout())

### Name: finalizer
### Title: Get and set finalizer (name)
### Aliases: finalizer finalizer<- finalizer.ff finalizer<-.ff
### Keywords: IO

### ** Examples

  x <- ff(1:12, pattern="./finalizerdemo")
  fnam <- filename(x)
  finalizer(x)
  finalizer(x) <- "delete"
  finalizer(x)
  rm(x)
  file.exists(fnam)
  gc()
  file.exists(fnam)



cleanEx()
nameEx("fixdiag")
### * fixdiag

flush(stderr()); flush(stdout())

### Name: fixdiag
### Title: Test for fixed diagonal
### Aliases: fixdiag fixdiag<- fixdiag.ff fixdiag.default fixdiag.dist
### Keywords: IO data

### ** Examples

  fixdiag(matrix(1:16, 4, 4))
  fixdiag(dist(rnorm(1:4)))



cleanEx()
nameEx("geterror.ff")
### * geterror.ff

flush(stderr()); flush(stdout())

### Name: geterror.ff
### Title: Get error and error string
### Aliases: geterror.ff geterrstr.ff
### Keywords: IO data

### ** Examples

  x <- ff(1:12)
  geterror.ff(x)
  geterrstr.ff(x)
  rm(x); gc()



cleanEx()
nameEx("getpagesize")
### * getpagesize

flush(stderr()); flush(stdout())

### Name: getpagesize
### Title: Get page size information
### Aliases: getpagesize getdefaultpagesize getalignedpagesize
### Keywords: IO

### ** Examples

  getpagesize()
  getdefaultpagesize()
  getalignedpagesize(2000000)
  


cleanEx()
nameEx("getset.ff")
### * getset.ff

flush(stderr()); flush(stdout())

### Name: getset.ff
### Title: Reading and writing vectors of values (low-level)
### Aliases: getset.ff get.ff set.ff
### Keywords: IO data

### ** Examples

 x <- ff(0, length=12)
 get.ff(x, 3L)
 set.ff(x, 3L, 1)
 x
 set.ff(x, 3L, 1, add=TRUE)
 x
 getset.ff(x, 3L, 1, add=TRUE)
 getset.ff(x, 3L, 1)
 x
 rm(x); gc()



cleanEx()
nameEx("hi")
### * hi

flush(stderr()); flush(stdout())

### Name: hi
### Title: Hybrid index class
### Aliases: hi print.hi str.hi
### Keywords: IO data

### ** Examples

  hi(c(1, 11, 29), c(9, 19, 21), c(1,1,-2))
  as.integer(hi(c(1, 11, 29), c(9, 19, 21), c(1,1,-2)))



cleanEx()
nameEx("is.ff")
### * is.ff

flush(stderr()); flush(stdout())

### Name: is.ff
### Title: Test for class ff
### Aliases: is.ff
### Keywords: IO data

### ** Examples

  is.ff(integer())



cleanEx()
nameEx("is.ffdf")
### * is.ffdf

flush(stderr()); flush(stdout())

### Name: is.ffdf
### Title: Test for class ff
### Aliases: is.ffdf
### Keywords: IO data

### ** Examples

  is.ffdf(integer())



cleanEx()
nameEx("is.open")
### * is.open

flush(stderr()); flush(stdout())

### Name: is.open
### Title: Test if object is opened
### Aliases: is.open is.open.ff is.open.ffdf is.open.ff_pointer
### Keywords: IO data

### ** Examples

  x <- ff(1:12)
  is.open(x)
  close(x)
  is.open(x)
  rm(x); gc()



cleanEx()
nameEx("is.readonly")
### * is.readonly

flush(stderr()); flush(stdout())

### Name: is.readonly
### Title: Get readonly status
### Aliases: is.readonly is.readonly.ff
### Keywords: IO data

### ** Examples

  x <- ff(1:12)
  is.readonly(x)
  close(x)
  open(x, readonly=TRUE)
  is.readonly(x)
  close(x)
  is.readonly(x)
  rm(x)



cleanEx()
nameEx("is.sorted")
### * is.sorted

flush(stderr()); flush(stdout())

### Name: is.sorted
### Title: Getting and setting 'is.sorted' physical attribute
### Aliases: is.sorted.default is.sorted<-.default
### Keywords: IO data arith

### ** Examples

  x <- 1:12
  is.sorted(x) <- !( is.na(is.unsorted(x)) || is.unsorted(x))  # actually calling is.unsorted twice is stupid
  is.sorted(x)
  x[1] <- 100L
  message("don't forget to maintain once it's no longer TRUE")
  is.sorted(x) <- FALSE
  message("check whether as 'is.sorted' attribute is maintained")
  !is.null(physical(x)$is.sorted)
  message("remove the 'is.sorted' attribute")
  is.sorted(x) <- NULL
  message("NOTE that querying 'is.sorted' still returns FALSE")
  is.sorted(x)



cleanEx()
nameEx("length.ff")
### * length.ff

flush(stderr()); flush(stdout())

### Name: length.ff
### Title: Getting and setting length
### Aliases: length.ff length<-.ff
### Keywords: IO data attribute

### ** Examples

  x <- ff(1:12)
  maxlength(x)
  length(x)
  length(x) <- 10
  maxlength(x)
  length(x)
  length(x) <- 16
  maxlength(x)
  length(x)
  rm(x); gc()



cleanEx()
nameEx("length.ffdf")
### * length.ffdf

flush(stderr()); flush(stdout())

### Name: length.ffdf
### Title: Getting length of a ffdf dataframe
### Aliases: length.ffdf
### Keywords: IO data

### ** Examples

  length(as.ffdf(data.frame(a=1:26, b=letters)))
  gc()



cleanEx()
nameEx("length.hi")
### * length.hi

flush(stderr()); flush(stdout())

### Name: length.hi
### Title: Hybrid Index, querying
### Aliases: length.hi poslength poslength.hi poslength.ri poslength.bit
###   poslength.bitwhich poslength.logical poslength.default maxindex
###   maxindex.hi maxindex.ri maxindex.bit maxindex.bitwhich
###   maxindex.logical maxindex.default
### Keywords: IO data

### ** Examples

  length(as.hi(-1, maxindex=12))
  poslength(as.hi(-1, maxindex=12))
  maxindex(as.hi(-1, maxindex=12))
  message("note that")
  length(as.hi(c(-1, -1), maxindex=12))
  length(as.hi(c(1,1), maxindex=12))



cleanEx()
nameEx("levels.ff")
### * levels.ff

flush(stderr()); flush(stdout())

### Name: levels.ff
### Title: Getting and setting factor levels
### Aliases: levels.ff levels<-.ff is.factor is.factor.default is.factor.ff
###   is.ordered is.ordered.default is.ordered.ff
### Keywords: IO data attribute

### ** Examples

  message("--- create an ff factor including NA as last level")
  x <- ff("a", levels=c(letters, NA), length=99)
  message('    we expect a warning because "A" is an unknown level')
  x[] <- c("a", NA,"A")
  x
  levels(x)

  message("--- create an ff ordered factor")
  x <- ff(letters, levels=letters, ramclass=c("ordered","factor"), length=260)
  x
  levels(x)

  message("    make it a non-ordered factor")
  virtual(x)$ramclass <- "factor"
  x
  rm(x); gc()

 ## Not run: 
##D   message("--- create an unsigned quad factor")
##D   x <- ff(c("A","T","G","C"), levels=c("A","T","G","C"), vmode="quad", length=100)
##D   x
##D   message("  0:3 coding usually invisible to the user")
##D   unclass(x[1:4])
##D   message("    after removing levels, the 0:3 coding becomes visible to the user")
##D   message("    we expect a warning here")
##D   levels(x) <- NULL
##D   x[1:4]
##D   rm(x); gc()
##D  
## End(Not run)




cleanEx()
nameEx("matcomb")
### * matcomb

flush(stderr()); flush(stdout())

### Name: matcomb
### Title: Array: make matrix indices from row and columns positions
### Aliases: matcomb
### Keywords: array data

### ** Examples

  matcomb(1:3, 1:4)
  matcomb(2:3, 2:4)



cleanEx()
nameEx("matprint")
### * matprint

flush(stderr()); flush(stdout())

### Name: matprint
### Title: Print beginning and end of big matrix
### Aliases: matprint print.matprint
### Keywords: array print

### ** Examples

  matprint(matrix(1:(300*400), 300, 400))



cleanEx()
nameEx("maxffmode")
### * maxffmode

flush(stderr()); flush(stdout())

### Name: maxffmode
### Title: Lossless vmode coercability
### Aliases: maxffmode
### Keywords: IO data

### ** Examples

   maxffmode(c("quad","logical"), "ushort")



cleanEx()
nameEx("maxlength")
### * maxlength

flush(stderr()); flush(stdout())

### Name: maxlength
### Title: Get physical length of an ff or ram object
### Aliases: maxlength maxlength.ff maxlength.default
### Keywords: IO data

### ** Examples

  x <- ff(1:12)
  length(x) <- 10
  length(x)
  maxlength(x)
  x
  rm(x); gc()



cleanEx()
nameEx("mismatch")
### * mismatch

flush(stderr()); flush(stdout())

### Name: mismatch
### Title: Test for recycle mismatch
### Aliases: mismatch ymismatch
### Keywords: IO data

### ** Examples

  ymismatch(4,0)
  ymismatch(4,2)
  ymismatch(4,3)
  ymismatch(2,4)
  mismatch(4,0)
  mismatch(4,2)
  mismatch(4,3)
  mismatch(2,4)



cleanEx()
nameEx("na.count")
### * na.count

flush(stderr()); flush(stdout())

### Name: na.count
### Title: Getting and setting 'na.count' physical attribute
### Aliases: na.count.ff na.count.default na.count<-.ff na.count<-.default
### Keywords: IO data

### ** Examples

  message("--- ff examples ---")
  x <- ff(1:12)
  na.count(x)
  message("activate the 'na.count' physical attribute and set the current na.count manually")
  na.count(x) <- 0L
  message("add one NA with a method that maintains na.count")
  swap(x, NA, 1)
  na.count(x)
  message("remove the 'na.count' physical attribute (and stop automatic maintenance)")
  na.count(x) <- NULL
  message("activate the 'na.count' physical attribute and have ff automatically calculate the current na.count")
  na.count(x) <- TRUE
  na.count(x)
  message("--- ram examples ---")
  x <- 1:12
  na.count(x)
  x[1] <- NA
  message("activate the 'na.count' physical attribute and have R automatically calculate the current na.count")
  na.count(x) <- TRUE
  na.count(x)
  message("remove the 'na.count' physical attribute (and stop automatic maintenance)")
  na.count(x) <- NULL
  na.count(x)
  rm(x); gc()



cleanEx()
nameEx("names.ff")
### * names.ff

flush(stderr()); flush(stdout())

### Name: names.ff
### Title: Getting and setting names
### Aliases: names.ff names<-.ff names.ff_array names<-.ff_array
### Keywords: IO data

### ** Examples

  x <- ff(1:26, names=letters)
  names(x)
  names(x) <- LETTERS
  names(x)
  names(x) <- NULL
  names(x)
  rm(x); gc()



cleanEx()
nameEx("nrowAssign")
### * nrowAssign

flush(stderr()); flush(stdout())

### Name: nrowAssign
### Title: Assigning the number of rows or columns
### Aliases: nrow<- ncol<-
### Keywords: array

### ** Examples

  a <- as.ff(1:26)
  b <- as.ff(factor(letters)) # vmode="integer"
  c <- as.ff(factor(letters), vmode="ubyte")
  df <- ffdf(a,b,c)
  nrow(df) <- 2*26
  df
  message("NOTE that the new rows have silently the first level 'a' for UNSIGNED vmodes")
  message("NOTE that the new rows have an illegal factor level <0> for SIGNED vmodes")
  message("It is your responsibility to put meaningful content here")
  message("As an example we replace the illegal zeros by NA")
  df$b[27:52] <- NA
  df

  rm(a,b,c,df); gc()



cleanEx()
nameEx("open.ff")
### * open.ff

flush(stderr()); flush(stdout())

### Name: open.ff
### Title: Opening an ff file
### Aliases: open.ff open.ffdf
### Keywords: IO data

### ** Examples

  x <- ff(1:12)
  close(x)
  is.open(x)
  open(x)
  is.open(x)
  close(x)
  is.open(x)
  x[]
  is.open(x)
  y <- x
  close(y)
  is.open(x)
  rm(x,y); gc()



cleanEx()
nameEx("pagesize")
### * pagesize

flush(stderr()); flush(stdout())

### Name: pagesize
### Title: Pagesize of ff object
### Aliases: pagesize pagesize.ff
### Keywords: IO data

### ** Examples

  x <- ff(1:12)
  pagesize(x)



cleanEx()
nameEx("physical.ff")
### * physical.ff

flush(stderr()); flush(stdout())

### Name: physical.ff
### Title: Getting and setting physical and virtual attributes of ff
###   objects
### Aliases: physical.ff physical<-.ff virtual.ff virtual<-.ff
### Keywords: IO data attribute

### ** Examples

  x <- ff(1:12)
  x
  physical(x)
  virtual(x)
  y <- as.ram(x)
  physical(y)
  virtual(y)
  rm(x,y); gc()



cleanEx()
nameEx("physical.ffdf")
### * physical.ffdf

flush(stderr()); flush(stdout())

### Name: physical.ffdf
### Title: Getting physical and virtual attributes of ffdf objects
### Aliases: physical.ffdf virtual.ffdf
### Keywords: IO data

### ** Examples

  x <- 1:2
  y <- matrix(1:4, 2, 2)
  z <- matrix(1:4, 2, 2)

  message("Here the y matrix is first converted to single columns by data.frame, then those columns become ff")
  d <- as.ffdf(data.frame(x=x, y=y, z=I(z)))
  physical(d)
  virtual(d)

  message("Here the y matrix is first converted to ff, and then stored still as matrix in the ffdf object (although virtually treated as columns of ffdf)")
  d <- ffdf(x=as.ff(x), y=as.ff(y), z=I(as.ff(z)))
  physical(d)
  virtual(d)

  message("Apply the usual methods extracting physical attributes")
  lapply(physical(d), filename)
  lapply(physical(d), vmode)
  message("And don't confuse with virtual vmode")
  vmode(d)

  rm(d); gc()



cleanEx()
nameEx("print.ff")
### * print.ff

flush(stderr()); flush(stdout())

### Name: print.ff
### Title: Print and str methods
### Aliases: print.ff print.ffdf print.ff_vector print.ff_matrix str.ff
###   str.ffdf
### Keywords: IO data print

### ** Examples

  x <- ff(1:10000)
  x
  print(x, maxlength=30)
  dim(x) <- c(100,100)
  x
  rm(x); gc()



cleanEx()
nameEx("ram2ffcode")
### * ram2ffcode

flush(stderr()); flush(stdout())

### Name: ram2ffcode
### Title: Factor codings
### Aliases: ram2ffcode ram2ramcode
### Keywords: IO data

### ** Examples

 ram2ffcode(letters, letters, vmode="byte")
 ram2ffcode(letters, letters, vmode="ubyte")
 ram2ffcode(letters, letters, vmode="nibble")
 message('note that ram2ffcode() does NOT warn that vmode="nibble" cannot store 26 levels')



cleanEx()
nameEx("ramattribs")
### * ramattribs

flush(stderr()); flush(stdout())

### Name: ramattribs
### Title: Get ramclass and ramattribs
### Aliases: ramclass ramclass.ff ramclass.default ramclass_excludes
###   ramattribs ramattribs.ff ramattribs.default ramattribs_excludes
### Keywords: IO data attribute classes

### ** Examples

  x <- ff(as.POSIXct(as.POSIXlt(Sys.time(), "GMT")), length=12)
  x
  ramclass(x)
  ramattribs(x)
  class(x[])
  attributes(x[])
  virtual(x)$ramattribs$tzone = NULL
  attributes(x[])
  rm(x); gc()



cleanEx()
nameEx("ramorder.default")
### * ramorder.default

flush(stderr()); flush(stdout())

### Name: ramorder.default
### Title: Sorting: order R vector in-RAM and in-place
### Aliases: ramorder.default mergeorder.default radixorder.default
###   keyorder.default shellorder.default
### Keywords: univar manip arith

### ** Examples

   n <- 50
   x <- sample(c(NA, NA, 1:26), n, TRUE)
   order(x)
   i <- 1:n
   ramorder(x, i)
   i
   x[i]

   ## Not run: 
##D       message("Note how the datatype influences sorting speed")
##D       n <- 1e7
##D       x <- sample(1:26, n, TRUE)
##D 
##D       y <- as.double(x)
##D       i <- 1:n
##D       system.time(ramorder(y, i))
##D 
##D       y <- as.integer(x)
##D       i <- 1:n
##D       system.time(ramorder(y, i))
##D 
##D       y <- as.short(x)
##D       i <- 1:n
##D       system.time(ramorder(y, i))
##D 
##D       y <- factor(letters)[x]
##D       i <- 1:n
##D       system.time(ramorder(y, i))
##D    
## End(Not run)



cleanEx()
nameEx("ramsort.default")
### * ramsort.default

flush(stderr()); flush(stdout())

### Name: ramsort.default
### Title: Sorting: Sort R vector in-RAM and in-place
### Aliases: ramsort.default mergesort.default radixsort.default
###   keysort.default shellsort.default
### Keywords: univar manip arith

### ** Examples

   n <- 50
   x <- sample(c(NA, NA, 1:26), n, TRUE)
   sort(x)
   ramsort(x)
   x

   ## Not run: 
##D       message("Note how the datatype influences sorting speed")
##D       n <- 5e6
##D       x <- sample(1:26, n, TRUE)
##D 
##D       y <- as.double(x)
##D       system.time(ramsort(y))
##D 
##D       y <- as.integer(x)
##D       system.time(ramsort(y))
##D 
##D       y <- as.short(x)
##D       system.time(ramsort(y))
##D 
##D       y <- as.factor(letters)[x]
##D       system.time(ramsort(y))
##D    
## End(Not run)



cleanEx()
nameEx("read.table.ffdf")
### * read.table.ffdf

flush(stderr()); flush(stdout())

### Name: read.table.ffdf
### Title: Importing csv files into ff data.frames
### Aliases: read.table.ffdf read.csv.ffdf read.csv2.ffdf read.delim.ffdf
###   read.delim2.ffdf
### Keywords: IO file connection

### ** Examples

    x <- data.frame(log=rep(c(FALSE, TRUE), length.out=26), int=1:26, dbl=1:26 + 0.1, fac=factor(letters), ord=ordered(LETTERS), dct=Sys.time()+1:26, dat=seq(as.Date("1910/1/1"), length.out=26, by=1))
    x <- x[c(13:1, 13:1),]
    csvfile <- tempPathFile(path=getOption("fftempdir"), extension="csv")
    write.csv(x, file=csvfile, row.names=FALSE)

    y <- read.csv(file=csvfile, header=TRUE)
    y
    cat("Read csv with header\n")
    ffx <- read.csv.ffdf(file=csvfile, header=TRUE)
    ffx
    sapply(ffx[,], class)

    message("NOTE that read.table fails for ordered factors, this is fixed in read.table.ffdf")
    try(read.csv(file=csvfile, header=TRUE, colClasses=c(ord="ordered")))
    # could fix this with the following two lines (Gabor Grothendieck) but does not know what bad side-effects this could have
     #setOldClass("ordered")
     #setAs("character", "ordered", function(from) ordered(from))
    y <- read.csv(file=csvfile, header=TRUE, colClasses=c(dct="POSIXct", dat="Date"))  # "ordered" gives an error
    y

    ffx <- read.csv.ffdf(file=csvfile, header=TRUE, colClasses=c(ord="ordered", dct="POSIXct", dat="Date"))
    ffx
    sapply(ffx[,], class)

    message("NOTE that reading in chunks can change the sequence of levels and thus the coding")
    message("(Sorting levels during chunked reading can be too expensive)")
    ffx <- read.csv.ffdf(file=csvfile, header=TRUE, colClasses=c(ord="ordered", dct="POSIXct", dat="Date"), first.rows=6, next.rows=10, VERBOSE=TRUE)
    y <- ffx$fac[]
    print(levels(y))
    data.frame(values=as.character(y), codes=as.integer(y))

    message("If we don't know the levels we can sort then after reading")
    message("(Will rewrite all factor codes)")
    message("NOTE that you MUST assign the return value of sortLevels()")
    ffx <- sortLevels(ffx)
    y <- ffx$fac[]
    print(levels(y))
    data.frame(values=as.character(y), codes=as.integer(y))

    message("If we KNOW the levels we can fix levels upfront")
    ffx <- read.csv.ffdf(file=csvfile, header=TRUE, colClasses=c(ord="ordered", dct="POSIXct", dat="Date"), first.rows=6, next.rows=10, levels=list(fac=letters, ord=LETTERS))
    y <- ffx$fac[]
    print(levels(y))
    data.frame(values=as.character(y), codes=as.integer(y))

    message("Or we inspect a sufficiently large chunk of data and use those")
    ffx1 <- read.csv.ffdf(file=csvfile, header=TRUE, colClasses=c(ord="ordered", dct="POSIXct", dat="Date"), nrows=13)
    ffx <- read.csv.ffdf(x=ffx1, file=csvfile, header=FALSE, skip=1+nrow(ffx1), VERBOSE=TRUE)

    message("We can check for unexpected factor levels, say we only allowed a:l")
    ffx <- read.csv.ffdf(file=csvfile, header=TRUE, colClasses=c(ord="ordered", dct="POSIXct", dat="Date"), levels=list(fac=letters[1:12], ord=LETTERS[1:12]), appendLevels=FALSE)
    sapply(colnames(ffx), function(i)sum(is.na(ffx[[i]][])))

    message("We can fine-tune the creation of the ffdf:")
    message("- let's create the ff files outside of fftempdir")
    message("- let's reduce required disk space and thus file.system cache RAM")
    vmode(ffx)
    message("By default we had record size")
    sum(.ffbytes[vmode(ffx)])

    ffy <- read.csv.ffdf(file=csvfile, header=TRUE, colClasses=c(ord="ordered", dct="POSIXct", dat="Date")
    , asffdf_args=list(
        vmode = c(log="boolean", int="byte", dbl="single", fac="nibble", ord="nibble", dct="single", dat="single")
      , col_args=list(pattern = "./csv")  # create in getwd() with prefix csv
      )
    )
    vmode(ffy)
    message("This recordsize is more than 50% reduced")
    sum(.ffbytes[vmode(ffy)])

    message("Don't forget to wrap-up files that are not in fftempdir")
    delete(ffy); rm(ffy)
    message("It's a good habit to also wrap-up temporary stuff (or at least know how this is done)")
    rm(ffx); gc()

    fwffile <- tempfile()

    cat(file=fwffile, "123456", "987654", sep="\n")
    x <- read.fwf(fwffile, widths=c(1,2,3))    #> 1 23 456 \ 9 87 654
    y <- read.table.ffdf(file=fwffile, FUN="read.fwf", widths=c(1,2,3))
    stopifnot(identical(x, y[,]))
    x <- read.fwf(fwffile, widths=c(1,-2,3))   #> 1 456 \ 9 654
    y <- read.table.ffdf(file=fwffile, FUN="read.fwf", widths=c(1,-2,3))
    stopifnot(identical(x, y[,]))
    unlink(fwffile)

    cat(file=fwffile, "123", "987654", sep="\n")
    x <- read.fwf(fwffile, widths=c(1,0, 2,3))    #> 1 NA 23 NA \ 9 NA 87 654
    y <- read.table.ffdf(file=fwffile, FUN="read.fwf", widths=c(1,0, 2,3))
    stopifnot(identical(x, y[,]))
    unlink(fwffile)

    cat(file=fwffile, "123456", "987654", sep="\n")
    x <- read.fwf(fwffile, widths=list(c(1,0, 2,3), c(2,2,2))) #> 1 NA 23 456 98 76 54
    y <- read.table.ffdf(file=fwffile, FUN="read.fwf", widths=list(c(1,0, 2,3), c(2,2,2)))
    stopifnot(identical(x, y[,]))
    unlink(fwffile)

    ## Don't show: 
       x <- read.csv(file=csvfile, header=TRUE)

       y <- read.csv.ffdf(file=csvfile, header=TRUE)
       stopifnot(identical(x, y[,]))

       y <- read.csv.ffdf(file=csvfile, header=TRUE, nrows=13)
       stopifnot(identical(x[1:13,], y[,]))

       y <- read.csv.ffdf(file=csvfile, header=TRUE, first.rows=12)
       y <- sortLevels(y)
       stopifnot(identical(x, y[,]))

       y <- read.csv.ffdf(file=csvfile, header=TRUE, nrows=13, first.rows=12)
       y <- sortLevels(y)
       stopifnot(identical(x[1:13,], y[,]))

       y <- read.csv.ffdf(file=csvfile, header=TRUE, nrows=12, first.rows=12)
       y <- sortLevels(y)
       stopifnot(!identical(x[1:12,], y[,]))
       stopifnot(identical(as.character(as.matrix(x[1:12,])), as.character(as.matrix(y[,]))))

       y <- read.csv.ffdf(file=csvfile, header=TRUE, nrows=11, first.rows=12)
       y <- sortLevels(y)
       stopifnot(!identical(x[1:11,], y[,]))
       stopifnot(identical(as.character(as.matrix(x[1:11,])), as.character(as.matrix(y[,]))))

       y <- read.csv.ffdf(file=csvfile, header=TRUE, first.rows=-1)
       stopifnot(identical(x, y[,]))

       y <- read.csv.ffdf(file=csvfile, header=TRUE, nrows=13, first.rows=12, appendLevels=c(ord=FALSE))
       stopifnot(is.na(y$ord[13]) && !is.na(y$fac[13]))
    
## End Don't show

    unlink(csvfile)



cleanEx()
nameEx("readwrite.ff")
### * readwrite.ff

flush(stderr()); flush(stdout())

### Name: readwrite.ff
### Title: Reading and writing vectors (low-level)
### Aliases: read.ff write.ff readwrite.ff
### Keywords: IO data

### ** Examples

  x <- ff(0, length=12)
  read.ff(x, 3, 6)
  write.ff(x, 3, rep(1, 6))
  x
  write.ff(x, 3, rep(1, 6), add=TRUE)
  x
  readwrite.ff(x, 3, rep(1, 6), add=TRUE)
  readwrite.ff(x, 3, rep(1, 6))
  x
  rm(x); gc()



cleanEx()
nameEx("regtest.fforder")
### * regtest.fforder

flush(stderr()); flush(stdout())

### Name: regtest.fforder
### Title: Sorting: regression tests
### Aliases: regtest.fforder
### Keywords: univar manip arith

### ** Examples

  regtest.fforder()

 ## Not run: 
##D     n <- 5e6
##D     message("performance comparison at n=", n, "")
##D 
##D     message("sorting doubles")
##D     x <- y <- as.double(runif(n))
##D 
##D     x[] <- y
##D     system.time(sort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x))[3]
##D     x[] <- y
##D     system.time(mergesort(x, has.na=FALSE))[3]
##D 
##D     x[] <- y
##D     system.time(sort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE, has.na=FALSE))[3]
##D 
##D 
##D     x <- y <- as.double(sample(c(rep(NA, n/2), runif(n/2))))
##D 
##D     x[] <- y
##D     system.time(sort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x))[3]
##D     x[] <- y
##D     system.time(mergesort(x))[3]
##D 
##D     x[] <- y
##D     system.time(sort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE))[3]
##D 
##D 
##D 
##D     x <- y <- sort(as.double(runif(n)))
##D 
##D     x[] <- y
##D     system.time(sort(x))  # only here R is faster because R checks for beeing sorted
##D     x[] <- y
##D     system.time(shellsort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x))[3]
##D     x[] <- y
##D     system.time(mergesort(x, has.na=FALSE))[3]
##D 
##D     x[] <- y
##D     system.time(sort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE, has.na=FALSE))[3]
##D 
##D     y <- rev(y)
##D     x[] <- y
##D     system.time(sort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x))[3]
##D     x[] <- y
##D     system.time(shellsort(x, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x))[3]
##D     x[] <- y
##D     system.time(mergesort(x, has.na=FALSE))[3]
##D 
##D     x[] <- y
##D     system.time(sort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(shellsort(x, decreasing=TRUE, has.na=FALSE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE))[3]
##D     x[] <- y
##D     system.time(mergesort(x, decreasing=TRUE, has.na=FALSE))[3]
##D 
##D     rm(x,y)
##D 
##D 
##D     message("ordering doubles")
##D 
##D     x <- as.double(runif(n))
##D     system.time(order(x))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i))[3]
##D 
##D     x <- as.double(sample(c(rep(NA, n/2), runif(n/2))))
##D     system.time(order(x))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i))[3]
##D 
##D     x <- as.double(sort(runif(n)))
##D     system.time(order(x))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i))[3]
##D 
##D     x <- rev(x)
##D     system.time(order(x))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i))[3]
##D 
##D 
##D     x <- as.double(runif(n))
##D     system.time(order(x, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i, decreasing=TRUE))[3]
##D 
##D     x <- as.double(sample(c(rep(NA, n/2), runif(n/2))))
##D     system.time(order(x, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i, decreasing=TRUE))[3]
##D 
##D     x <- as.double(sort(runif(n)))
##D     system.time(order(x, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i, decreasing=TRUE))[3]
##D 
##D     x <- rev(x)
##D     system.time(order(x, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE))[3]
##D     i <- 1:n
##D     system.time(shellorder(x, i, decreasing=TRUE, stabilize=TRUE))[3]
##D     i <- 1:n
##D     system.time(mergeorder(x, i, decreasing=TRUE))[3]
##D 
##D 
##D     keys <- c("short","ushort")
##D     for (v in c("integer", keys)){
##D 
##D       if (v %in% keys){
##D         k <- .vmax[v]-.vmin[v]+1L
##D         if (is.na(.vNA[v])){
##D           y <- sample(c(rep(NA, k), .vmin[v]:.vmax[v]), n, TRUE)
##D         }else{
##D           y <- sample(.vmin[v]:.vmax[v], n, TRUE)
##D         }
##D       }else{
##D         k <- .Machine$integer.max
##D         y <- sample(k, n, TRUE)
##D       }
##D 
##D       message("sorting ",v)
##D 
##D       x <- y
##D       message("sort(x) ", system.time(sort(x))[3])
##D       x <- y
##D       message("shellsort(x) ", system.time(shellsort(x))[3])
##D       x <- y
##D       message("mergesort(x) ", system.time(mergesort(x))[3])
##D       x <- y
##D       message("radixsort(x) ", system.time(radixsort(x))[3])
##D       if (v %in% keys){
##D         x <- y
##D         message("keysort(x) ", system.time(keysort(x))[3])
##D         x <- y
##D         message("keysort(x, keyrange=c(.vmin[v],.vmax[v])) ", system.time(keysort(x, keyrange=c(.vmin[v],.vmax[v])))[3])
##D       }
##D 
##D       if (!is.na(.vNA[v])){
##D         x <- y
##D         message("shellsort(x, has.na=FALSE) ", system.time(shellsort(x, has.na=FALSE))[3])
##D         x <- y
##D         message("mergesort(x, has.na=FALSE) ", system.time(mergesort(x, has.na=FALSE))[3])
##D         x <- y
##D         message("radixsort(x, has.na=FALSE) ", system.time(radixsort(x, has.na=FALSE))[3])
##D         if (v %in% keys){
##D           x <- y
##D           message("keysort(x, has.na=FALSE) ", system.time(keysort(x, has.na=FALSE))[3])
##D           x <- y
##D           message("keysort(x, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])) ", system.time(keysort(x, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])))[3])
##D         }
##D       }
##D 
##D 
##D       message("ordering",v)
##D 
##D       x[] <- y
##D       i <- 1:n
##D       message("order(x) ", system.time(order(x))[3])
##D       x[] <- y
##D       i <- 1:n
##D       message("shellorder(x, i) ", system.time(shellorder(x, i))[3])
##D       x[] <- y
##D       i <- 1:n
##D       message("mergeorder(x, i) ", system.time(mergeorder(x, i))[3])
##D       x[] <- y
##D       i <- 1:n
##D       message("radixorder(x, i) ", system.time(radixorder(x, i))[3])
##D       if (v %in% keys){
##D         x[] <- y
##D         i <- 1:n
##D         message("keyorder(x, i) ", system.time(keyorder(x, i))[3])
##D         x[] <- y
##D         i <- 1:n
##D         message("keyorder(x, i, keyrange=c(.vmin[v],.vmax[v])) ", system.time(keyorder(x, i, keyrange=c(.vmin[v],.vmax[v])))[3])
##D       }
##D 
##D       if (!is.na(.vNA[v])){
##D         x[] <- y
##D         i <- 1:n
##D         message("shellorder(x, i, has.na=FALSE) ", system.time(shellorder(x, i, has.na=FALSE))[3])
##D         x[] <- y
##D         i <- 1:n
##D         message("mergeorder(x, i, has.na=FALSE) ", system.time(mergeorder(x, i, has.na=FALSE))[3])
##D         x[] <- y
##D         i <- 1:n
##D         message("radixorder(x, i, has.na=FALSE) ", system.time(radixorder(x, i, has.na=FALSE))[3])
##D         if (v %in% keys){
##D           x[] <- y
##D           i <- 1:n
##D           message("keyorder(x, i, has.na=FALSE) ", system.time(keyorder(x, i, has.na=FALSE))[3])
##D           x[] <- y
##D           i <- 1:n
##D           message("keyorder(x, i, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])) ", system.time(keyorder(x, i, has.na=FALSE, keyrange=c(.vmin[v],.vmax[v])))[3])
##D         }
##D       }
##D 
##D     }
##D   
## End(Not run)



cleanEx()
nameEx("repnam")
### * repnam

flush(stderr()); flush(stdout())

### Name: repnam
### Title: Replicate with names
### Aliases: repnam
### Keywords: utilities

### ** Examples

 message("a list example")
 repnam(list(y=c(1,2), z=3), letters)
 repnam(list(c(1,2), 3), letters)

 message("a vector example")
 repnam(c(y=1, z=3), letters, default=NA)
 repnam(c(1, 3), letters, default=NA)




cleanEx()
nameEx("sortLevels")
### * sortLevels

flush(stderr()); flush(stdout())

### Name: sortLevels
### Title: Factor level manipulation
### Aliases: appendLevels recodeLevels recodeLevels.factor recodeLevels.ff
###   sortLevels sortLevels.factor sortLevels.ff sortLevels.ffdf
### Keywords: attribute

### ** Examples

  message("Let's create a factor with little levels")
  x <- ff(letters[4:6], levels=letters[4:6])
  message("Let's interpret the same ff file without levels in order to see the codes")
  y <- x
  levels(y) <- NULL

  levels(x)
  data.frame(factor=x[], codes=y[])

  levels(x) <- appendLevels(levels(x), letters)
  levels(x)
  data.frame(factor=x[], codes=y[])

  x <- sortLevels(x) # implicit recoding is chunked were necessary
  levels(x)
  data.frame(factor=x[], codes=y[])

  message("NEVER forget to reassign the result of recodeLevels or sortLevels, look at the following mess")
  recodeLevels(x, rev(levels(x)))
  message("NOW the codings have changed, but not the levels, the result is wrong data")
  levels(x)
  data.frame(factor=x[], codes=y[])

  rm(x);gc()

## Not run: 
##D  n <- 5e7
##D 
##D  message("reading a factor from a file ist as fast ...")
##D  system.time(
##D  fx <- ff(factor(letters[1:25]), length=n)
##D  )
##D  system.time(x <- fx[])
##D  str(x)
##D  rm(x); gc()
##D 
##D 
##D  message("... as creating it in-RAM (R-2.11.1) which is theoretically impossible ...")
##D  system.time({
##D  x <- integer(n)
##D  x[] <- 1:25
##D  levels(x) <- letters[1:25]
##D  class(x) <- "factor"
##D  })
##D  str(x)
##D  rm(x); gc()
##D 
##D 
##D  message("... but is possible if we avoid some  unnecessary copying that is triggered by assignment functions")
##D  system.time({
##D  x <- integer(n)
##D  x[] <- 1:25
##D  setattr(x, "levels", letters[1:25])
##D  setattr(x, "class", "factor")
##D  })
##D  str(x)
##D  rm(x); gc()
##D 
##D  rm(n)
## End(Not run)




cleanEx()
nameEx("splitPathFile")
### * splitPathFile

flush(stderr()); flush(stdout())

### Name: splitPathFile
### Title: Analyze pathfile-strings
### Aliases: standardPathFile splitPathFile unsplitPathFile tempPathFile
###   fftempfile
### Keywords: file

### ** Examples

  pathfile <- c("", ".", "/.", "./", "./.", "/", "a", "a/", "/a", "a/a", "./a", "a/.", "c:/a/b/c", "c:/a/b/c/"
  , "..", "../", "/..", "../..", "//", "\\\\a\\", "\\\\a/", "\\\\a/b", "\\\\a/b/", "~", "~/", "~/a", "~/a/")
  splitted <- splitPathFile(pathfile)
  restored <- unsplitPathFile(splitted)
  stopifnot(all(gsub("\\\\","/",restored)==gsub("\\\\","/",pathfile)))

  dirnam <- dirname(pathfile)
  basnam <- basename(pathfile)

  db  <- file.path(dirnam,basnam)
  ident = gsub("\\\\","/",db) == gsub("\\\\","/",pathfile)
  sum(!ident)

  do.call("data.frame", c(list(ident=ident, pathfile=pathfile, dirnam=dirnam, basnam=basnam), splitted))

  ## Not run: 
##D     message("show the difference between tempfile and fftempfile")
##D     do.call("data.frame", c(list(ident=ident, pathfile=pathfile, dirnam=dirnam, basnam=basnam), splitted, list(filename=tempPathFile(splitted), fftempfile=fftempfile(pathfile))))
##D 
##D     message("for a single string splitPathFile is slower, for vectors of strings it scales much better than dirname+basename")
##D 
##D     system.time(for (i in 1:1000){
##D       d <- dirname(pathfile)
##D       b <- basename(pathfile)
##D     })
##D     system.time(for (i in 1:1000){
##D       s <- splitPathFile(pathfile)
##D     })
##D 
##D     len <- c(1,10,100,1000)
##D     timings <- matrix(0, 2, length(len), dimnames=list(c("dir.base.name", "splitPathFile"), len))
##D     for (j in seq(along=len)){
##D       l <- len[j]
##D       r <- 10000 / l
##D       x <- rep("\\\\a/b/", l)
##D       timings[1,j] <- system.time(for (i in 1:r){
##D           d <- dirname(x)
##D           b <- basename(x)
##D         })[3]
##D       timings[2,j] <- system.time(for (i in 1:r){
##D           s <- splitPathFile(x)
##D         })[3]
##D     }
##D     timings
##D   
## End(Not run)



cleanEx()
nameEx("swap")
### * swap

flush(stderr()); flush(stdout())

### Name: swap
### Title: Reading and writing in one operation (high-level)
### Aliases: swap swap.ff swap.ff_array swap.default
### Keywords: IO data array

### ** Examples

  x <- ff("a", levels=letters, length=52)
  y <- swap(x, "b", sample(length(x), 26))
  x
  y
  rm(x,y); gc()



cleanEx()
nameEx("symmIndex2vectorIndex")
### * symmIndex2vectorIndex

flush(stderr()); flush(stdout())

### Name: symmIndex2vectorIndex
### Title: Array: make vector positions from symmetric array index
### Aliases: symmIndex2vectorIndex
### Keywords: array data

### ** Examples

  symmIndex2vectorIndex(rbind(
   c(1,1)
  ,c(1,10)
  ,c(10,1)
  ,c(10,10)
  ), dim=c(10,10))
  symmIndex2vectorIndex(rbind(
   c(1,1)
  ,c(1,10)
  ,c(10,1)
  ,c(10,10)
  ), dim=c(10,10), fixdiag=1)



cleanEx()
nameEx("symmetric")
### * symmetric

flush(stderr()); flush(stdout())

### Name: symmetric
### Title: Test for symmetric structure
### Aliases: symmetric symmetric.ff symmetric.default symmetric.dist
### Keywords: IO data

### ** Examples

  symmetric(matrix(1:16, 4, 4))
  symmetric(dist(rnorm(1:4)))



cleanEx()
nameEx("unclass_-")
### * unclass_-

flush(stderr()); flush(stdout())

### Name: unclass_-
### Title: Unclassed assignement
### Aliases: unclass<-
### Keywords: IO data

### ** Examples

  x <- factor(letters)
  unclass(x)[1:3] <- 1L
  x



cleanEx()
nameEx("undim")
### * undim

flush(stderr()); flush(stdout())

### Name: undim
### Title: Undim
### Aliases: undim
### Keywords: IO data

### ** Examples

  x <- matrix(1:12, 3)
  x
  undim(x)



cleanEx()
nameEx("update.ff")
### * update.ff

flush(stderr()); flush(stdout())

### Name: update.ff
### Title: Update ff content from another object
### Aliases: update.ff update.ffdf
### Keywords: IO data

### ** Examples

  x <- ff(1:100)
  y <- ff(-(1:100))
  message("You should make it a habit to re-assign the return value of update although this is not needed currently.")
  x <- update(x, from=y)
  x
  y
  x[] <- 1:100
  x <- update(x, from=y, delete=NA)
  x
  y
  x <- update(x, from=y, delete=TRUE)
  x
  y
  x
  rm(x,y); gc()

  ## Not run: 
##D     message("timings")
##D     x <- ff(1:10000000)
##D     y <- ff(-(1:10000000))
##D     system.time(update(x, from=y))
##D     system.time(update(y, from=x, delete=NA))
##D     system.time(update(x, from=y, delete=TRUE))
##D     rm(x,y); gc()
##D   
## End(Not run)




cleanEx()
nameEx("vecprint")
### * vecprint

flush(stderr()); flush(stdout())

### Name: vecprint
### Title: Print beginning and end of big vector
### Aliases: vecprint print.vecprint
### Keywords: print

### ** Examples

  vecprint(10000:1)



cleanEx()
nameEx("vector.vmode")
### * vector.vmode

flush(stderr()); flush(stdout())

### Name: vector.vmode
### Title: Create vector of virtual mode
### Aliases: vector.vmode vector.vmode.default vector.vmode.ff boolean quad
###   nibble byte ubyte short ushort
### Keywords: IO data attribute

### ** Examples

  vector.vmode("byte",12)
  vector.vmode("double",12)
  byte(12)
  double(12)



cleanEx()
nameEx("vector2array")
### * vector2array

flush(stderr()); flush(stdout())

### Name: vector2array
### Title: Array: make array from vector
### Aliases: vector2array
### Keywords: array data

### ** Examples

  vector2array(1:12, dim=c(3, 4))               # matrix(1:12, 3, 4)
  vector2array(1:12, dim=c(3, 4), dimorder=2:1) # matrix(1:12, 3, 4, byrow=TRUE)



cleanEx()
nameEx("vectorIndex2arrayIndex")
### * vectorIndex2arrayIndex

flush(stderr()); flush(stdout())

### Name: vectorIndex2arrayIndex
### Title: Array: make array from index vector positions
### Aliases: vectorIndex2arrayIndex
### Keywords: array data

### ** Examples

  matrix(1:12, 3, 4)
  vectorIndex2arrayIndex(1:12, dim=3:4)
  vectorIndex2arrayIndex(1:12, dim=3:4, dimorder=2:1)
  matrix(1:30, 5, 6)
  vectorIndex2arrayIndex(c(6L, 7L, 8L, 11L, 12L, 13L, 16L, 17L, 18L, 21L, 22L, 23L), vw=rbind(c(0,1), c(3,4), c(2,1)))
  vectorIndex2arrayIndex(c(2L, 8L, 14L, 3L, 9L, 15L, 4L, 10L, 16L, 5L, 11L, 17L), vw=rbind(c(0,1), c(3,4), c(2,1)), dimorder=2:1)

  ## Don't show: 
    # incomplete regression tests
    x <- matrix(1:12, 3, 4)
    i <- cbind(as.vector(row(x)), as.vector(col(x)))
    stopifnot(identical( array(arrayIndex2vectorIndex(i, dim=dim(x)), dim=dim(x)), x ))
    stopifnot(identical( vectorIndex2arrayIndex(arrayIndex2vectorIndex(i, dim=dim(x), dimorder=1:2), dim=dim(x)), i ))

    y <- vector2array(1:12, c(3,4), 2:1)
    i <- cbind(as.vector(row(y)), as.vector(col(y)))
    stopifnot(identical( array(arrayIndex2vectorIndex(i, dim=dim(y), dimorder=2:1), dim=dim(y)), y ))
    stopifnot(identical( vectorIndex2arrayIndex(arrayIndex2vectorIndex(i, dim=dim(y), dimorder=dimorder(y)), dim=dim(y), dimorder=dimorder(y)), i ))

    z <- vector2array(1:24, dim=4:2, dimorder=c(2,1,3))
    stopifnot(identical( arrayIndex2vectorIndex(vectorIndex2arrayIndex(z, dim=dim(z), dimorder=c(2,1,3)), dim=dim(z), dimorder=c(2,1,3)), as.vector(z) ))
  
## End Don't show



cleanEx()
nameEx("vmode")
### * vmode

flush(stderr()); flush(stdout())

### Name: vmode
### Title: Virtual storage mode
### Aliases: vmode vmode.default vmode.ff vmode<- vmode<-.default
###   vmode<-.ff .vmode .vunsigned .vvalues .vimplemented .rammode .ffmode
###   .vmin .vmax .vNA .rambytes .ffbytes .vcoerceable regtest.vmode
### Keywords: IO data attribute

### ** Examples

 data.frame(.vmode=.vmode, .vimplemented=.vimplemented, .rammode=.rammode, .ffmode=.ffmode, .vmin=.vmin, .vmax=.vmax, .vNA=.vNA, .rambytes=.rambytes, .ffbytes=.ffbytes)
  vmode(1)
  vmode(1L)
  .vcoerceable[["byte"]]
  .vcoerceable[["ubyte"]]



cleanEx()
nameEx("vmode.ffdf")
### * vmode.ffdf

flush(stderr()); flush(stdout())

### Name: vmode.ffdf
### Title: Virtual storage mode of ffdf
### Aliases: vmode.ffdf
### Keywords: IO data

### ** Examples

  vmode(as.ffdf(data.frame(a=as.double(1:26), b=letters)))
  gc()



cleanEx()
nameEx("vt")
### * vt

flush(stderr()); flush(stdout())

### Name: vt
### Title: Virtual transpose
### Aliases: vt vt.ff vt.default t.ff
### Keywords: IO data array

### ** Examples

  x <- ff(1:20, dim=c(4,5))
  x
  vt(x)
  y <- t(x)
  y
  vw(x) <- cbind(c(1,3,0),c(1,4,0))
  x
  vt(x)
  y <- t(x)
  y
  rm(x,y); gc()



cleanEx()
nameEx("vw")
### * vw

flush(stderr()); flush(stdout())

### Name: vw
### Title: Getting and setting virtual windows
### Aliases: vw vw<- vw.ff vw.default vw<-.ff_vector vw<-.ff_array
### Keywords: IO data array

### ** Examples

  x <- ff(1:26, names=letters)
  y <- x
  vw(x) <- c(0, 13, 13)
  vw(y) <- c(13, 13, 0)
  x
  y
  x[1] <- -1
  y[1] <- -2
  vw(x) <- NULL
  x[]

  z <- ff(1:24, dim=c(4,6), dimnames=list(letters[1:4], LETTERS[1:6]))
  z
  vw(z) <- rbind(c(1,1), c(2,4), c(1,1))
  z

  rm(x,y,z); gc()



cleanEx()
nameEx("write.table.ffdf")
### * write.table.ffdf

flush(stderr()); flush(stdout())

### Name: write.table.ffdf
### Title: Exporting csv files from ff data.frames
### Aliases: write.table.ffdf write.csv.ffdf write.csv2.ffdf write.csv
###   write.csv2
### Keywords: IO file connection

### ** Examples

   x <- data.frame(log=rep(c(FALSE, TRUE), length.out=26), int=1:26, dbl=1:26 + 0.1, fac=factor(letters), ord=ordered(LETTERS), dct=Sys.time()+1:26, dat=seq(as.Date("1910/1/1"), length.out=26, by=1))
   ffx <- as.ffdf(x)

   csvfile <- tempPathFile(path=getOption("fftempdir"), extension="csv")

   write.csv.ffdf(ffx, file=csvfile)
   write.csv.ffdf(ffx, file=csvfile, append=TRUE)

   ffy <- read.csv.ffdf(file=csvfile, header=TRUE, colClasses=c(ord="ordered", dct="POSIXct", dat="Date"))

   rm(ffx, ffy); gc()
   unlink(csvfile)

 ## Not run: 
##D   # Attention, this takes very long
##D   vmodes <- c(log="boolean", int="byte", dbl="single", fac="short", ord="short", dct="single", dat="single")
##D 
##D   message("create a ffdf with 7 columns and 78 mio rows")
##D   system.time({
##D     x <- data.frame(log=rep(c(FALSE, TRUE), length.out=26), int=1:26, dbl=1:26 + 0.1, fac=factor(letters), ord=ordered(LETTERS), dct=Sys.time()+1:26, dat=seq(as.Date("1910/1/1"), length.out=26, by=1))
##D     x <- do.call("rbind", rep(list(x), 10))
##D     x <- do.call("rbind", rep(list(x), 10))
##D     x <- do.call("rbind", rep(list(x), 10))
##D     x <- do.call("rbind", rep(list(x), 10))
##D     ffx <- as.ffdf(x, vmode = vmodes)
##D     for (i in 2:300){
##D       message(i, "\n")
##D       last <- nrow(ffx) + nrow(x)
##D       first <- last - nrow(x) + 1L
##D       nrow(ffx) <- last
##D       ffx[first:last,] <- x
##D     }
##D   })
##D 
##D 
##D   csvfile <- tempPathFile(path=getOption("fftempdir"), extension="csv")
##D 
##D   write.csv.ffdf(ffx, file=csvfile, VERBOSE=TRUE)
##D   ffy <- read.csv.ffdf(file=csvfile, header=TRUE, colClasses=c(ord="ordered", dct="POSIXct", dat="Date"), asffdf_args=list(vmode = vmodes), VERBOSE=TRUE)
##D 
##D   rm(ffx, ffy); gc()
##D   unlink(csvfile)
##D  
## End(Not run)



### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
