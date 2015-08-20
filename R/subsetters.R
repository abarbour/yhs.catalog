#' Extract quakes in the Salton trough
#' @export
#' @param ... additional parameters to
#' @examples
#' salt <- salton_trough_yhs()
#' plot(Lat.deg ~ Lon.deg, salt, pch=".", asp=1.19)
#' lines(saltonsea)
salton_trough_yhs <- function(...){
  Lat.deg <- Lat.deg <- Lon.deg <- Lon.deg <- NULL
  yhs %>% dplyr::filter(Lat.deg > 32.5 & Lat.deg < 33.7 & Lon.deg > -116.3 & Lon.deg < -115.0)
}