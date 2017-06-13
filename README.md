# yhs.catalog [![Build Status](https://travis-ci.org/abarbour/yhs.catalog.svg?branch=master)](https://travis-ci.org/abarbour/yhs.catalog) [![License](http://img.shields.io/badge/license-GPL%203-grey.svg)](http://www.gnu.org/licenses/gpl-3.0.html) [![DOI](https://zenodo.org/badge/1277/abarbour/yhs.catalog.svg)](https://zenodo.org/badge/latestdoi/1277/abarbour/yhs.catalog)


This is an R package which bundles
the Yang, Hauksson, and Shearer (2012) [relocated focal mechanism catalog][yhs]
together. 

A note on the version number: the patch version represents the year and month the dataset
was last updated (e.g. 20150301 would be 01-March-2015).

## Example ##

Install the package:

    if (!require(devtools)) install.packages("devtools")
    devtools::install_github("abarbour/yhs.catalog")

Load the package (lazy loading is enabled, so datasets are
attached by default):

    library(yhs.catalog)
    
Inspect the data:

    class(yhs)
    str(yhs)
    
Tabulate classifications:

    with(yhs,{
    	Tsr <- table(Source, Quality)
	Tyr <- table(Year, Quality)
    })
    plot(Tsr)
    plot(Tyr)

Plot in spatial coordinates by year:

    library(tidyverse)
    library(viridis)
    calif <- ggplot2::map_data("state", region = 'california')
    yhs %>% dplyr::arrange(Year, Mw) -> yhss
    print(p <- ggplot(yhss, aes(x=Lon.deg, y=Lat.deg)) + 
			geom_path(data=calif, aes(x=long, y=lat, group = group), colour="grey") +
			geom_path(data=saltonsea, aes(x=Lon.deg, y=Lat.deg), colour="grey") +
			geom_point(shape='.', aes(colour=Mw)) + 
			coord_quickmap() + 
			facet_wrap(~Year) + 
			scale_colour_gradientn(colours=rev(viridis::inferno(7)))+
			theme_minimal() +
			theme(axis.text = element_text(size=7),
				  axis.title = element_text(size=10, hjust=0),
				  plot.title = element_text(size=12,face="bold"),
				  legend.position=c(0.83,-0.07),
				  legend.direction="horizontal") +
			xlim(-123,-114) +
			ylim(31,37) +
			xlab("Longitude") + 
			ylab("Latitude") +
			ggtitle("Earthquakes in Southern California")

![alt text][years]

[yhs]: http://scedc.caltech.edu/research-tools/alt-2011-yang-hauksson-shearer.html
[years]: NOBUILD/readme/years.png "Earthquakes by year"
