#!/usr/bin/Rscript --no-save
#
#	ysh.catalog/NOBUILD/readme/years.R
#
#	Created by 
#		/Users/abarbour/bin/ropen
#	on 
#		2015:083
#

library(yhs.catalog)
#library(maps)
library(tidyverse)
library(viridis)

calif <- ggplot2::map_data("state", region = 'california')

dplyr::filter(yhs, Mw >= 3) %>% 
  dplyr::arrange(Year, Mw) -> yhss

p <- ggplot(yhss, aes(x=Lon.deg, y=Lat.deg)) + 
      geom_path(data=calif, aes(x=long, y=lat, group = group), colour="grey")+
      geom_path(data=saltonsea, aes(x=Lon.deg, y=Lat.deg), colour="grey")+
      geom_point(shape='.', aes(colour=Mw)) + 
			coord_quickmap() + 
			facet_wrap(~Year) + 
      #scale_colour_gradientn(colours=(topo.colors(4)))+
      scale_colour_gradientn(colours=rev(viridis::magma(7)))+
			theme_minimal() +
			theme(axis.text = element_text(size=7),
				  axis.title = element_text(size=10, hjust=0),
				  plot.title = element_text(size=12,face="bold"),
				  legend.position=c(0.83,-0.07),
				  legend.direction="horizontal"
				  ) +
			xlim(-123,-114)+
			ylim(31,37)+
			xlab("Longitude") + 
			ylab("Latitude") +
			ggtitle("Earthquakes in Southern California")
			
ggsave("years.png", p, width=7.0, height=8.0, dpi=450)

#print(p)
