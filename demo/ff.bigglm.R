# load 'biglm' package and 'trees' data
require("biglm")
data("trees")

# create ffm object and convert 'trees' data
m <- ffm("foom.ff", c(31, 3))
m[1:31, 1:3] <- trees[1:31, 1:3]

# create a ffm.data.frame wrapper around the ffm object
ffmdf <- ffm.data.frame(m, c("Girth", "Height", "Volume"))

# define formula and fit the model 
fg        <- log(Volume) ~ log(Girth) + log(Height)
trees.out <- bigglm(fg, data = trees, chunksize = 10, sandwich = TRUE)  
ffmdf.out <- bigglm(fg, data = ffmdf, chunksize = 10, sandwich = TRUE)

# show summaries of fitted models
summary(trees.out)  
summary(ffmdf.out)  

# cleanup
rm(m, ffmdf); invisible(gc(verbose = FALSE))

