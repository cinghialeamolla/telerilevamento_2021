#R_code_vegetation_indices.r

library(raster)
setwd("C:/lab/") # Windows
#questa funzione carica un'immagine su R
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

# Banda 1 = vicino infrarosso, Banda 2 = rosso, Banda 3 = verde
# b1=NIR, b2=red, b3=green
par(mfrow=c(2,1))
plotRGB(defor1, r=1, g=2, b=3, stretch="Lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="Lin")
