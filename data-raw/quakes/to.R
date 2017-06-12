#!/usr/bin/Rscript --no-save

library(dplyr)

orig <- read.table('yhs.hash.gz', header=TRUE)
orig$src <- "orig"

supp <- read.table('yhs_supp.hash.gz', header=TRUE)
supp$src <- "supp"

supp2 <- read.table('yhs_supp2.hash.gz', header=TRUE)
supp2$src <- "supp2"

yhs <- as.tbl(rbind(orig, supp, supp2))

save(yhs, file='yhs.rda', compress='xz')
