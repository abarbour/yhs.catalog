.onAttach <- function(...) {
  ##
  pack <- "yhs.catalog"
  packv <- utils::packageVersion(pack)
  packvp <- strftime(as.Date(as.character(packv[1,3]), format='%Y%m%d', tz='UTC'), format='%a, %b %d, %Y')
  msg <- 'refined focal mechanism catalog for southern California'
  packageStartupMessage(
    sprintf("Loaded %s (%s) -- %s\nNotes: 1. %s\n       2. start with `data(yhs)`",
        pack, packv, msg, paste("* sub-version number shows last catalog update (", packvp, ')'))
  )
}
