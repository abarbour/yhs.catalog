# ysh.catalog [![Build Status](https://travis-ci.org/abarbour/ysh.catalog.svg?branch=master)](https://travis-ci.org/abarbour/ysh.catalog) [![License](http://img.shields.io/badge/license-GPL%203-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html)

Access the Yang, Hauksson, and Shearer (2012) refined focal mechanism catalog in R

## Example ##

Install the package:

    if (!require(devtools)) install.packages("devtools", dependencies=TRUE)
    require(devtools)
    install_github("abarbour/yhs.catalog")

Load the package and dataset:

    library(yhs.catalog)
    data(yhs)
    
Inspect the data:

    str(yhs)
