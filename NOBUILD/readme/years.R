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
library(tidyverse)
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
        legend.direction="horizontal"
  ) +
  xlim(re[1], re[2])+
  ylim(re[3], re[4])+
  xlab("Longitude") + 
  ylab("Latitude") +
  ggtitle("Earthquake Densities in Southern California")

ggsave("years.png", p, width=6.5, height=7.5, dpi=400)

print(p)
