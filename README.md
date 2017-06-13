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

    library(viridis)
    library(raster)

    calif <- ggplot2::map_data("state", region = 'california')

    r <- raster(xmn=-123, xmx=-114, ymn=31, ymx=37, resolution=0.1)
    coordinates(r) %>% as_data_frame %>% dplyr::rename(Lon=x, Lat=y) -> crds
    re <- extent(r)

    year_raster <- function(DatY){
	  DatY %>% dplyr::select(Lon.deg, Lat.deg) -> dmat
	  as.data.frame(rasterize(dmat, r, fun='count')) %>% 
		dplyr::rename(Count = layer) %>%
		dplyr::mutate(Density = Count / max(Count, na.rm=TRUE), logCount = log10(Count)) -> .ry.
	  cbind(crds, .ry.)
	}

    yhs %>% dplyr::group_by(Year) %>% dplyr::do(year_raster(.)) -> Allyears

    p <- ggplot(Allyears, aes(x=Lon, y=Lat)) + 
	  geom_raster(aes(fill = logCount)) +
	  coord_quickmap() + 
	  facet_wrap(~Year)+
	  scale_fill_viridis(option="plasma", direction=-1, na.value="grey90")+
	  geom_path(data=calif, aes(x=long, y=lat, group = group), colour="lightgrey")+
	  geom_path(data=saltonsea, aes(x=Lon.deg, y=Lat.deg), colour="lightgrey")+
	  theme_minimal() +
	  theme(axis.text = element_text(size=6),
			axis.title = element_text(size=10, hjust=0),
			plot.title = element_text(size=12,face="bold"),
			legend.position=c(0.83,-0.07),
			legend.direction="horizontal") +
	  xlim(re[1], re[2])+
	  ylim(re[3], re[4])+
	  xlab("Longitude") + 
	  ylab("Latitude") +
	  ggtitle("Earthquake Densities in Southern California")

![alt text][years]

[yhs]: http://scedc.caltech.edu/research-tools/alt-2011-yang-hauksson-shearer.html
[years]: NOBUILD/readme/years.png "Earthquakes by year"
