.onAttach <- function(...) {
  ##
  pack <- "yhs.catalog"
  packv <- utils::packageVersion(pack)
  packvp <- strftime(as.Date(as.character(packv[1,3]), format='%Y%m%d', tz='UTC'), format='%a, %b %d, %Y')
  packageStartupMessage(
    sprintf("Loaded %s (%s) -- refined focal mechanism catalog for southern California\n  Note:  %s",
            pack, packv,
            paste("* sub-version number shows last catalog update (", packvp, ')'))
  )
}
