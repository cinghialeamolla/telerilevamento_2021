#Analisi serie multitemporale di dati satellitari
#aumento delle temperature in Groenlandia
#dati e codice da Emanuela Cosma (tesista)

library(raster)
setwd("C:/lab/greenland")

#funzione per importare i singoli dati
lst_2000 <- raster("lst_2000.tif")
#plot del I dataset
plot(lst_2000)

#importazione dei 4 file
lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

#panel con i plottaggi delle 4 immagini insieme
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

#questa funzione crea una lista di file con punti in comune nel nome (list)
rlist <- list.files(pattern="lst")
rlist
#questa funzione applica uno stesso comando a una lista di file
import <- lapply(rlist,raster)
import
#questa funzione crea un blocco di file raster uniti insieme in un solo file
TGr <- stack(import)
TGr
#plotto il gruppo di file uniti
plot(TGr)
#plot con sovrapposizione delle 3 immagini(2000,2005,2010)
plotRGB(TGr, 1, 2, 3, stretch="lin")
#plot con sovrapposizione delle 3 immagini(2005,2010,2015)
plotRGB(TGr, 2, 3, 4, stretch="lin")

### DAY 2
library(raster)
library(rasterVis)
setwd("C:/lab/greenland")

rlist <- list.files(pattern="lst")
rlist
import <- lapply(rlist,raster)
import
TGr <- stack(import)
TGr
#plottaggio tutto insieme
levelplot(TGr)
#plottaggio singola immagine
levelplot(TGr$lst_2000)

cl<-colorRampPalette(c("blue","light blue","pink","red"))(100)



