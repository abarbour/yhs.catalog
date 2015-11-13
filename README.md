# yhs.catalog [![Build Status](https://travis-ci.org/abarbour/yhs.catalog.svg?branch=master)](https://travis-ci.org/abarbour/yhs.catalog) [![License](http://img.shields.io/badge/license-GPL%203-brightgreen.svg)](http://www.gnu.org/licenses/gpl-3.0.html)

This is an R package which bundles
the Yang, Hauksson, and Shearer (2012) [relocated focal mechanism catalog][yhs]
together. 

A note on the version number: the patch version represents the year and month the dataset
was last updated (e.g. 201503 is March 2015).

## Example ##

Install the package:

    if (!require(devtools)) install.packages("devtools")
    require(devtools)
    install_github("abarbour/yhs.catalog")

Load the package (lazy loading is enabled, so datasets are
attached by default):

    library(yhs.catalog)
    
Inspect the data:

    class(yhs)
    str(yhs)
    
Tabulate classifications:

    with(yhs, table(src, Quality))

Plot in spatial coordinates by year:

    library(ggplot2)
    library(maps)
    calif <- map_data("state", region = 'california')
    print(p <- ggplot(yhs, aes(x=Lon.deg, y=Lat.deg)) + 
			geom_path(data=calif, aes(x=long, y=lat, group = group), colour="grey") +
			geom_path(data=saltonsea, aes(x=Lon.deg, y=Lat.deg), colour="grey") +
			geom_point(shape='.', aes(colour=Mw)) + 
			coord_quickmap() + 
			facet_wrap(~Year) + 
			scale_colour_gradientn(colours=(topo.colors(4)))+
			theme_minimal() +
			theme(axis.text = element_text(size=7),
				  axis.title = element_text(size=10, hjust=0),
				  plot.title = element_text(size=12,face="bold"),
				  legend.position=c(0.73,0.06),
				  legend.direction="horizontal") +
			xlim(-123,-114) +
			ylim(31,37) +
			xlab("Longitude") + 
			ylab("Latitude") +
			ggtitle("Earthquakes in Southern California")

![alt text][years]

[yhs]: http://scedc.caltech.edu/research-tools/alt-2011-yang-hauksson-shearer.html
[years]: NOBUILD/readme/years.png "Earthquakes by year"
