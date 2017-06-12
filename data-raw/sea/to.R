library(dplyr, warn.conflicts = FALSE, quietly = TRUE)
read.csv("saltonsea.csv", header=TRUE, comment.char = "#") %>%
	rename(Lon.deg = Long, Lat.deg = Lat) %>%
	select(-Elev) -> saltonsea

save(saltonsea, file="saltonsea.rda", compress='xz')
