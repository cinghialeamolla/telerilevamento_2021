#R_code_vegetation_indices.r

library(raster) #require(raster)
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

cl <- colorRampPalette(c('darkblue','yellow','red','black'))(100) # specifying a color scheme
plot(dvi1, col=cl)



