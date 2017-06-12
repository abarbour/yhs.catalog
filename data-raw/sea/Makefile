DAT=saltonsea.csv
SRC=shoreline_poly.csv

all: clean $(DAT).rda

$(DAT).rda: log.sea
	Rscript --no-save to.R

log.sea: $(SRC)
	echo "updated on `date`" > $@
	cp $(SRC) $(DAT)
	

clean:
	rm -f log.sea $(DAT).???
