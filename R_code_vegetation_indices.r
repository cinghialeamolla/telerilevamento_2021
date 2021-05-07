#R_code_vegetation_indices.r

library(raster) #require(raster)
library(RStoolbox) #per calcolare indici di vegetazione
#install.packages("rasterdiv")
library(rasterdiv) #per l'NDVI globale
library(rasterVis)
setwd("C:/lab/") # Windows

#questa funzione carica un'immagine su R
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

# Banda 1 = vicino infrarosso, Banda 2 = rosso, Banda 3 = verde
# b1=NIR, b2=red, b3=green
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")

### DAY 2

#questa funzione calcola il DVI della prima immagine
dvi1 <- defor1$defor1.1 - defor1$defor1.2
#plot DVI1
cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)
plot(dvi1, col=cl, main="DVI at time 1")

#calcolo del DVI 2
dvi2 <- defor2$defor2.1 - defor2$defor2.2
#plot DVI2
plot(dvi2, col=cl, main="DVI at time 2")

par(mfrow=c(2,1))
plot(dvi1, col=cl, main="DVI at time 1")
plot(dvi2, col=cl, main="DVI at time 2")

#DVI1-DVI2
difdvi<- dvi1 - dvi2
#palette molto adatta per le differenze
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)

#questa funzione calcola l'NDVI
# (NIR-RED) / (NIR+RED)
#NDVI1
ndvi1 <- (defor1$defor1.1 - defor1$defor1.2) / (defor1$defor1.1 + defor1$defor1.2)
plot(ndvi1, col=cl)
#NDVI2
ndvi2 <- (defor2$defor2.1 - defor2$defor2.2) / (defor2$defor2.1 + defor2$defor2.2)
plot(ndvi2, col=cl)

#NDVI1-NDVI2
difndvi<- ndvi1 - ndvi2
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difndvi, col=cld)

#RStoolbox: spectralIndices
#questa funzione calcola diversi tipi di indici
vi1 <- spectralIndices(defor1, green=3, red=2, nir=1)
plot(vi1, col=cl)
vi2 <- spectralIndices(defor2, green=3, red=2, nir=1)
plot(vi2, col=cl)

### DAY 3
# worldwide NDVI (dal dataset Copernicus, caricato nel pacchetto rasterdiv)
plot(copNDVI)

#i pixel con valori 253, 254 e 255 possono essere trasformati in "non-valori"(Not Assigne)
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))
plot(copNDVI)
#questa funzione fa vedere la media dei valori su righe e colonne
levelplot(copNDVI)









