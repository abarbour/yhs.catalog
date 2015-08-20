#' @title Refined earthquake focal mechanism catalog for southern California
#' 
#' @description Provides access to the Yang, Hauksson, and Shearer (2012) catalog
#' of focal mechanisms for southern California.
#' 
#' @importFrom magrittr %>%
#' @importFrom dplyr as.tbl
#' @importFrom utils head tail
#' @docType package
#' @author A.J. Barbour
#' @name yhs.catalog
#' @aliases ysh.catalog yhs.catalog-package ysh.catalog-package
#' 
#' @references Yang, W., E. Hauksson and P. M. Shearer, 
#' Computing a large refined catalog of focal mechanisms for southern California 
#' (1981 - 2010): Temporal Stability of the Style of Faulting, 
#' Bull. Seismol. Soc. Am., 102(3), 2012.
#' \url{http://dx.doi.org/10.1785/0120110311}
#' 
#' @references Hauksson E., W. Yang and P.M. Shearer, 
#' Waveform relocated earthquake catalog for southern California (1981 - 2011), 
#' Bull. Seismol. Soc. Am., 102(5), 2012.
#' \url{http://dx.doi.org/10.1785/0120120010}
#' 
#' @seealso \code{\link{yhs}}
#' @examples
#' data(yhs)
#' str(yhs)
#' 
#' # plot all locations in space
#' plot(Lat.deg ~ Lon.deg, yhs, pch=".")
NULL

#' @title Yang, Hauksson, and Shearer refined focal mechanism catalog for southern California
#' 
#' @details This dataset consists of the original catalog and a supplement. These can be
#' identified with the \code{src} field: \code{src=='orig'} for the original
#' and \code{src=='supp'} for the supplemental.
#' 
#' @docType data
#' @name yhs
#' @aliases ysh
#' 
#' @format Classes \code{'tbl_df'}, \code{'tbl'} and \code{'data.frame'}:  
#' 193071 obs. of  22 variables in the HASH format: 
#' 179255 earthquakes from the original catalog, and 13816 from the supplemental catalog.
#' 
#' @source SCEC: \url{http://scedc.caltech.edu/research-tools/alt-2011-yang-hauksson-shearer.html}
#' 
#' @references HASH:
#' 
#' @references (1) Hardebeck, Jeanne L. and Peter M. Shearer, 
#' A new method for determining first-motion focal mechanisms, 
#' Bull. Seismol. Soc. Am., 92(6), 2002.
#' \url{http://dx.doi.org/10.1785/0120010200}
#' 
#' @references (2) Hardebeck, Jeanne L. and Peter M. Shearer, 
#' Using S/P Amplitude Ratios to Constrain the Focal Mechanisms of Small Earthquakes, 
#' Bull. Seismol. Soc. Am., 93(6), 2003.
#' \url{http://dx.doi.org/10.1785/0120020236}
#' 
#' @seealso \code{\link{yhs.catalog}}
#' @examples
#' require(dplyr)
#' print(yhs)
#' 
#' # source and quality distribution
#' print(tbl <- with(yhs, table(src, Quality)))
#' plot(tbl)
#' 
#' # plot all locations in space
#' plot(Lat.deg ~ Lon.deg, yhs, pch=".")
#' 
#' # highlight the supplemental catalog in red
#' plot(Lat.deg ~ Lon.deg, yhs, pch=".", col=as.numeric(factor(src)))
NULL

#' @title Salton Sea polygon
#' 
#' @description Coordinates of the current Salton Sea shoreline
#' 
#' @details The first and last coordinates are equal, which means this can be treated as a polygon.
#' 
#' @docType data
#' @name saltonsea
#' 
#' @format \code{'data.frame'}: latitudes and longitudes outlining the shoreline
#' 
#' @source Digitized from Google-maps in Feb-2015 with \url{http://www.birdtheme.org/useful/v3largemap.html}
#' @references For more information on the Salton Sea:
#' @references \url{http://saltonsea.ca.gov/}
#' @references \url{http://en.wikipedia.org/wiki/Salton_Trough}
#' 
#' @seealso \code{\link{yhs.catalog}}
#' @examples
#' plot(saltonsea, type='l', asp=1.19)
#' points(Lat.deg ~ Lon.deg, yhs, pch=".")
#' 
#' # first and last points are equal -- this is a polygon
#' try(identical(c(saltonsea[1,]), c(saltonsea[nrow(saltonsea),])))
NULL