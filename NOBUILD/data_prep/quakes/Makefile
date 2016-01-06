LOGS=log.yhs log.yhs.supp log.yhs.supp2
HASH=yhs.hash.gz yhs_supp.hash.gz yhs_supp2.hash.gz

all: clean $(LOGS) yhs.rda

yhs.rda: to_rda $(HASH)
	to_rda

log.yhs:
	echo "updated on `date`" > $@
	prep_yhs > yhs.hash
	curl http://web.gps.caltech.edu/~wenzheng/YHS2010/YSH_2010.hash >> yhs.hash
	gzip -f yhs.hash

log.yhs.supp:
	echo "updated on `date`" > $@
	prep_yhs > yhs_supp.hash
	curl http://service.scedc.caltech.edu/ftp/catalogs/hauksson/Socal_focal/fm_2011_2013.hash >> yhs_supp.hash
	gzip -f yhs_supp.hash

log.yhs.supp2:
	echo "updated on `date`" > $@
	prep_yhs > yhs_supp2.hash
	curl http://service.scedc.caltech.edu/ftp/catalogs/hauksson/Socal_focal/sc2014_hash_ABCD_so.focmec.scedc >> yhs_supp2.hash
	gzip -f yhs_supp2.hash

clean:
	rm -f $(LOGS)
	
