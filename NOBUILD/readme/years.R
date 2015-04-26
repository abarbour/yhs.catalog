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
				  legend.direction="horizontal"
				  ) +
			xlab("Longitude") + 
			ylab("Latitude") +
			ggtitle("Earthquakes in Southern California") )
			
ggsave("years.png", p, width=7.0, height=9, dpi=450)