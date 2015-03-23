.onUnload <- function(libpath) {
  #library.dynam.unload("yhs.catalog", libpath)
}
##
# executed after .onLoad is executed, once the namespace is visible to user
.onAttach <- function(...) {
  ##
  pack <- "yhs.catalog"
  packageStartupMessage(
    sprintf("Loaded %s (%s) -- Yang, Hauksson, and Shearer focal mechanism catalog", 
            pack, utils::packageVersion(pack)))
}
