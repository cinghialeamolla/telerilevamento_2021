#R_code_variability.r

library(raster)
library(RStoolbox)
setwd("C:/lab/") # Windows

#importare l'immagine sentinel completa di tutte e tre le bande su R
sent <- brick("sentinel.png")

#NIR 1,   RED 2,   GREEN 3
# r=1, g=2, b=3
plotRGB(sent, stretch="lin") #plotRGB(sent, r=1, g=2, b=3, stretch="lin")
plotRGB(sent, r=2, g=1, b=3, stretch="lin")
#DEVIAZIONE STANDARD, 2 metodi:
#Metodo 1:
#associazione bande nir e red dell'immagine a un oggetto
nir <- sent$sentinel.1
red <- sent$sentinel.2
#calcolo NDVI dell'immagine sentinel
ndvi <- (nir-red) / (nir+red)
#plot NDVI
plot(ndvi)
#cambio colorazione
cl <- colorRampPalette(c('black','white','red','magenta','green'))(100) # 
plot(ndvi,col=cl)
#calcolo deviazione standard dell'NDVI con una finestra mobile di 3x3 pixel
ndvisd3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=sd)
plot(ndvisd3)
#cambio colorazione dev standard
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) #
plot(ndvisd3, col=clsd)
# calcolo della media dell'NDVI
ndvimean3 <- focal(ndvi, w=matrix(1/9, nrow=3, ncol=3), fun=mean)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvimean3, col=clsd)
#dev.standard dell'NDVI con una finestra di 5x5
ndvisd5 <- focal(ndvi, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(ndvisd5, col=clsd)

#Metodo 2:
#Calcolo PCA per unire le bande in un unico strato
sentpca <- rasterPCA(sent)
plot(sentpca$map)
#serve per vedere quanto spiegano le singole componenti
summary(sentpca$model)
 #la prima PC spiega il 67,36804 % dell'informazione originale
