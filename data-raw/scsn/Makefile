SCPT=01.get
SRC=catalog_current.fwf.gz qtm_current_12dev.fwf.gz
FMT=catalog_format
RDA=scsn.rda
TO=to.R

ALL=$(RDA) $(FMT)

all: $(ALL)

$(FMT):
	wget -O $(FMT) https://scedc.caltech.edu/ftp/catalogs/hauksson/Socal_DD/hs_1981_2011_catalog_v01.format

$(RDA): $(SRC)
	Rscript $(TO)

%.fwf.gz: $(SCPT)
	$(SCPT)
