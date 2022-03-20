#!/usr/bin/env Rscript --no-save

message('Creating Y-H-S table...')

suppressPackageStartupMessages({
	#library(anytime)
	library(tidyverse)
})

processor <-  function(fi, src.="", ...){
	stopifnot(file.exists(fi))
	message("  --> processing ", fi, "...")
	read.table(fi, header=TRUE, ...) %>% 
		as_tibble %>% 
		dplyr::mutate(Source = src.) %>% 
		dplyr::select(Source, everything())
}

force.redo <- TRUE
if (force.redo | !exists('orig') | !exists('supp11_13') | !exists('supp14')  | !exists('supp15') | !exists('supp16')){
	'yhs.hash.gz'           %>% processor(src.='original') -> orig
	'yhs_supp11_13.hash.gz' %>% processor(src.="supplement_2011-2013") -> supp11_13 
	'yhs_supp14.hash.gz'    %>% processor(src.="supplement_2014") -> supp14
	'yhs_supp15.hash.gz'    %>% processor(src.="supplement_2015") -> supp15
	'yhs_supp16.hash.gz'    %>% processor(src.="supplement_2016") -> supp16
}
yhsl <- list(orig, supp11_13, supp14, supp15, supp16)

# update March 2022
if (force.redo | !exists('orig') | !exists('supp17')  | !exists('supp18') | !exists('supp19')){
	'yhs_supp17.hash.gz'    %>% processor(src.="supplement_2017") -> supp17
	'yhs_supp18.hash.gz'    %>% processor(src.="supplement_2018") -> supp18
	'yhs_supp19.hash.gz'    %>% processor(src.="supplement_2019") -> supp19
}

yhsl <- c(yhsl, list(supp17, supp18, supp19))

message('  forming full table...')
dplyr::bind_rows(yhsl) %>%
	dplyr::arrange(CID) %>% 
	unique %>%
	dplyr::mutate(CID = as.character(CID),
		DateTime = ISOdatetime(Year, Month, Day, Hour, pmax(0, Minute), pmax(0, Second), tz='UTC')) %>%
	dplyr::arrange(DateTime, CID) -> yhs

attr(yhs, 'yhs_assembly') <- list(Date=Sys.time(), SI=sessionInfo())


yhs
summary(yhs)

message('  checking for full table normalization...')

yhs %>% dplyr::group_by(CID) %>% dplyr::summarize(N=n()) %>% dplyr::filter(N>1) -> nonunique
if (nrow(nonunique)>0){
	warning('Duplicates!')
	print(as.data.frame(nonunique))
} else {
	message('  --> checks OK')
}

message('  writing yhs.rda...')
save(yhs, file='yhs.rda', compress='xz')


message('Done.')
