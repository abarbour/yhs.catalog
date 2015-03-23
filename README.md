# ysh.catalog [![Build Status](https://travis-ci.org/abarbour/ysh.catalog.svg?branch=master)](https://travis-ci.org/abarbour/ysh.catalog) [![License](http://img.shields.io/badge/license-GPL%203-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html)

The Yang, Hauksson, and Shearer (2012) [refined focal mechanism catalog][yhs] in an R package

## Example ##

Install the package:

    if (!require(devtools)) install.packages("devtools", dependencies=TRUE)
    require(devtools)
    install_github("abarbour/yhs.catalog")

Load the package and dataset (lazy loading):

    library(yhs.catalog)
    
Inspect the data:

    class(yhs)
    str(yhs)

[yhs]: http://scedc.caltech.edu/research-tools/alt-2011-yang-hauksson-shearer.html
