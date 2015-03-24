---
output:
  html_document:
    theme: spacelab
---
# ysh.catalog [![Build Status](https://travis-ci.org/abarbour/ysh.catalog.svg?branch=master)](https://travis-ci.org/abarbour/ysh.catalog) [![License](http://img.shields.io/badge/license-GPL%203-brightgreen.svg?style=flat)](http://www.gnu.org/licenses/gpl-3.0.html)

The Yang, Hauksson, and Shearer (2012) [refined focal mechanism catalog][yhs] in an R package. 
A note on the version number: the patch version represents the year and month the dataset
was assembled (e.g. 201503 is March 2015).

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
    
    # plot in space
    plot(Lat.deg ~ Lon.deg, yhs, pch=".")
    
    # highlight the 'supplemental' subset in red
    plot(Lat.deg ~ Lon.deg, yhs, pch=".", col=as.numeric(factor(src)))

[yhs]: http://scedc.caltech.edu/research-tools/alt-2011-yang-hauksson-shearer.html
