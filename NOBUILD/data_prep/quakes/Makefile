LOGS=log.yhs.supp log.yhs

all: clean $(LOGS)

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

clean:
	rm -f $(LOGS)
	
