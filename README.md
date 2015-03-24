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
    
Tabulate classifications:

    with(yhs, table(src, Quality))

Plot in spatial coordinates by year:

    library(ggplot2)
    print( p <- ggplot(yhs, aes(x=Lon.deg, y=Lat.deg)) + 
                geom_point(shape='.', aes(colour=Mw)) + 
                coord_map() + 
                facet_wrap(~Year) + 
                scale_colour_gradientn(colours=(topo.colors(4)))+
                theme_minimal() +
                theme(axis.text = element_text(size=7),
                      axis.title = element_text(size=10, hjust=0),
                      plot.title = element_text(size=12,face="bold"),
                      legend.position=c(0.73,0.06),
                      legend.direction="horizontal") +
                xlab("Longitude") + 
                ylab("Latitude") +
                ggtitle("Earthquakes in Southern California") )

![alt text][years]

[yhs]: http://scedc.caltech.edu/research-tools/alt-2011-yang-hauksson-shearer.html
[years]: NOBUILD/readme/years.png "Earthquakes by year"
