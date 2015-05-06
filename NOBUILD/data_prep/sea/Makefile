DAT=saltonsea
SRC=https://raw.githubusercontent.com/abarbour/projects/master/SaltonGeothermal/deformation/data/shoreline_poly.csv?token=AAT0j4NpduedEjIfFCY2Uo8YBdqPoSYfks5VRmuSwA%3D%3D

all: clean $(DAT).rda

$(DAT).rda: log.sea
	Rscript --no-save to.R

log.sea:
	echo "updated on `date`" > $@
	curl --silent $(SRC) > $(DAT).csv

clean:
	rm -f log.sea
	rm -f $(DAT).???
