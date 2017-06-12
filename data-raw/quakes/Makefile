LOGS=log.yhs log.yhs.supp11 log.yhs.supp14 log.yhs.supp15 log.yhs.supp16
HASH=yhs.hash.gz yhs_supp11_13.hash.gz yhs_supp14.hash.gz yhs_supp15.hash.gz yhs_supp16.hash.gz

RSCP=to.R
YHS=yhs.rda

all: clean $(LOGS) $(YHS)

$(YHS): $(RSCP) $(HASH)
	$(RSCP)

log.yhs:
	echo "main updated on `date`" > $@
	#prep_yhs > yhs.hash
	#curl https://web.gps.caltech.edu/~wenzheng/YHS2010/YSH_2010.hash >> yhs.hash
	#gzip -f yhs.hash

log.yhs.supp11:
	echo "2011 - 2013 supplement updated on `date`" > $@
	prep_yhs > yhs_supp11_13.hash
	curl https://service.scedc.caltech.edu/ftp/catalogs/hauksson/Socal_focal/fm_2011_2013.hash >> yhs_supp11_13.hash
	gzip -f yhs_supp11_13.hash

log.yhs.supp14:
	echo "2014 supplement updated on `date`" > $@
	prep_yhs > yhs_supp14.hash
	curl https://service.scedc.caltech.edu/ftp/catalogs/hauksson/Socal_focal/sc2014_hash_ABCD_so.focmec.scedc >> yhs_supp14.hash
	gzip -f yhs_supp14.hash

log.yhs.supp15:
	echo "2015 supplement updated on `date`" > $@
	prep_yhs > yhs_supp15.hash
	curl https://service.scedc.caltech.edu/ftp/catalogs/hauksson/Socal_focal/sc2015_hash_ABCD_so.focmec.scedc >> yhs_supp15.hash
	gzip -f yhs_supp15.hash
	
log.yhs.supp16:
	echo "2016 supplement updated on `date`" > $@

yhs_supp16.hash.gz: yhs_supp16.hash
	prep_yhs > yhs_supp16.hash
	curl https://service.scedc.caltech.edu/ftp/catalogs/hauksson/Socal_focal/sc2016_hash_ABCD_so.focmec.scedc >> yhs_supp16.hash
	gzip -f yhs_supp16.hash
	
clean:
	rm -f $(LOGS)
	
