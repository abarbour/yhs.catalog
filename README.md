# ysh.catalog

Access the Yang, Hauksson, and Shearer (2012) refined focal mechanism catalog in R

## Example

Install the package:

    if (!require(devtools)) install.packages("devtools", dependencies=TRUE)
    require(devtools)
    install_github("abarbour/yhs.catalog")

Load the package and dataset:

    library(yhs.catalog)
    data(yhs)
    
Inspect the data:

    str(yhs)
