#' Prepare for use with Focal Mechanism Classification
# @param Catalog the seismic catalog to use
#' @param type character; the final format
#' @references url
#' @export
prep_for_fmc <- function(type=NULL){
  Lat.deg <- Lon.deg <- NULL
  type <- match.arg(type, c('x'))
  if (!exists('yhs')){
    env <- new.env()
    do.call("data", list('yhs', envir=env))
    yhs <- get('yhs', envir = env)
  }
  if (type=='x'){
    yhs %>% dplyr::transmute(Lat.deg, Lon.deg)
  } else {
    yhs
  }
  
}

#prep_for_fmc()