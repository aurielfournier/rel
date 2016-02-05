
library(devtools)
library(roxygen2)

# documentation

setwd("~/rel")
document()

#install
setwd("..")
install("rel")
