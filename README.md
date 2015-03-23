# ysh.catalog

Access the Yang, Hauksson, and Shearer (2012) refined focal mechanism catalog in R

Example

    library(yhs.catalog)

    data(yhs) # catalog is not loaded by default
    str(yhs)  # inspect contents

    if (!require(devtools)) install.packages("devtools", dependencies=TRUE)
    require(devtools)
    install_github("abarbour/yhs.catalog")
