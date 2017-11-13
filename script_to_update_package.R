
library(devtools)
library(roxygen2)

# Script to use on my computer for when the documentation needs to be updated and the package reinstalled from my computer

# documentation

setwd("~/rel")
document()

#install
setwd("..")
install("rel")
