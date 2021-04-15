#R_code_copernicus.r
#Visualizzare dati Copernicus

#install.packages("ncdf4")
library(raster)
library(ncdf4)

setwd("C:/lab/")

#questa funzione (rinomina e) carica il dataset
fcover <- raster("FCOVER_global.nc")
fcover

clb <- colorRampPalette(c('yellow','light green','green', 'dark green'))(100) 
plot(fcover, col=clb)

#questa funzione diminuisce il numero di pixel, ricampionamento bilineare
fcoverres <- aggregate(fcover, fact=50)
fcoverres
plot(fcoverres)

