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
cld <- colorRampPalette(c('blue','white','red'))(100) 
plot(difdvi, col=cld)


