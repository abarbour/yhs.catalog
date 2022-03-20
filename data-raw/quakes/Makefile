LOGS=log.yhs.supp11 log.yhs.supp14 log.yhs.supp15 log.yhs.supp16 \
log.yhs.supp17 \
log.yhs.supp18 \
log.yhs.supp19

HASH=yhs.hash.gz yhs_supp11_13.hash.gz yhs_supp14.hash.gz yhs_supp15.hash.gz yhs_supp16.hash.gz \
yhs_supp17.hash.gz \
yhs_supp18.hash.gz \
yhs_supp19.hash.gz

RSCP=to.R
YHS=yhs.rda
PREP=prep_yhs

all: clean $(LOGS) $(YHS)

# Make the final product
$(YHS): $(RSCP) $(HASH)
	$(RSCP)

CURL = curl -k
GZIP = gzip -f

URL = https://service.scedc.caltech.edu/ftp/catalogs/hauksson/Socal_focal

# Updated: March 2022

#log.yhs:
	#echo "main updated on `date`" > $@
	#prep_yhs > yhs.hash
	#curl https://web.gps.caltech.edu/~wenzheng/YHS2010/YSH_2010.hash >> yhs.hash
	#gzip -f yhs.hash

# Make the individual catalogs

log.yhs.supp11:
	echo "2011 - 2013 supplement updated on `date`" > $@
	prep_yhs > yhs_supp11_13.hash
	$(CURL) https://service.scedc.caltech.edu/ftp/catalogs/hauksson/Socal_focal/fm_2011_2013.hash >> yhs_supp11_13.hash
	gzip -f yhs_supp11_13.hash

log.yhs.supp14:
	echo "2014 supplement updated on `date`" > $@
	prep_yhs > yhs_supp14.hash
	$(CURL) https://service.scedc.caltech.edu/ftp/catalogs/hauksson/Socal_focal/sc2014_hash_ABCD_so.focmec.scedc >> yhs_supp14.hash
	gzip -f yhs_supp14.hash

log.yhs.supp15:
	echo "2015 supplement updated on `date`" > $@
	prep_yhs > yhs_supp15.hash
	$(CURL) https://service.scedc.caltech.edu/ftp/catalogs/hauksson/Socal_focal/sc2015_hash_ABCD_so.focmec.scedc >> yhs_supp15.hash
	gzip -f yhs_supp15.hash
	
log.yhs.supp16: 
	echo "2016 supplement updated on `date`" > $@
	prep_yhs > yhs_supp16.hash
	$(CURL) https://service.scedc.caltech.edu/ftp/catalogs/hauksson/Socal_focal/sc2016_hash_ABCD_so.focmec.scedc >> yhs_supp16.hash
	gzip -f yhs_supp16.hash

# update on March 20 2022
log.yhs.supp17: $(PREP)
	$(eval Yr = 17)
	$(eval Ha = yhs_supp$(Yr).hash)
	$(eval Fi = sc20$(Yr)_hash_ABCD_so.focmec.scedc)
	echo "20$(Yr) supplement updated on `date`" > $@
	$(PREP) > $(Ha)
	$(CURL) $(URL)/$(Fi) >> $(Ha)
	$(GZIP) $(Ha)

log.yhs.supp18: $(PREP)
	$(eval Yr = 18)
	$(eval Ha = yhs_supp$(Yr).hash)
	$(eval Fi = sc20$(Yr)_hash_ABCD_so.focmec.scedc)
	echo "20$(Yr) supplement updated on `date`" > $@
	$(PREP) > $(Ha)
	$(CURL) $(URL)/$(Fi) >> $(Ha)
	$(GZIP) $(Ha)

log.yhs.supp19: $(PREP)
	$(eval Yr = 19)
	$(eval Ha = yhs_supp$(Yr).hash)
	$(eval Fi = sc20$(Yr)_hash_ABCD_so.focmec.scedc)
	echo "20$(Yr) supplement updated on `date`" > $@
	$(PREP) > $(Ha)
	$(CURL) $(URL)/$(Fi) >> $(Ha)
	$(GZIP) $(Ha)
	
clean:
	rm -f log.yhs.*
	
