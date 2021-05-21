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

#DAY 2
library(raster)
library(RStoolbox)
library(ggplot2) #per i plot ggplot
library(gridExtra) #per unire i plot di ggplot insieme
#install.packages("viridis")
library(viridis) #per i colori
setwd("C:/lab/") # Windows
#importare l'immagine sentinel completa di tutte e tre le bande su R
sent <- brick("sentinel.png")

#Calcolo PCA per unire le bande in un unico strato
sentpca <- rasterPCA(sent)
plot(sentpca$map)
#serve per vedere quanto spiegano le singole componenti
summary(sentpca$model)

#prendo solo la pc1, con maggior parte della variabilità
pc1<-sentpca$map$PC1
#calcolo dev. standard della pc1
pc1sd5 <- focal(pc1, w=matrix(1/25, nrow=5, ncol=5), fun=sd)
clsd <- colorRampPalette(c('blue','green','pink','magenta','orange','brown','red','yellow'))(100) # 
plot(pc1sd5, col=clsd)

#inserire pezzi di codice direttamente su R con la funzione "source"
source("source_test_lezione.r")
source("source_ggplot.r")

#creare la finestra vuota su ggplot
p1 <- ggplot()+
#definire la geometria del plot grafico e le estetiche (cosa si plotta, il layer)
geom_raster(pc1sd5, mapping = aes (x = x, y = y, fill = layer))+
#usare una legenda viridis (quella di defalt si una senza scrivere nulla all'interno)
scale_fill_viridis()+
#mettere un titolo
ggtitle("Deviazione standard della pc1 con una scala di colore viridis")

# The package contains eight color scales: “viridis”, the primary choice, and five alternatives with similar properties - “magma”, “plasma”, “inferno”, “civids”, “mako”, and “rocket” -, and a rainbow color map - “turbo”.
#creare la finestra vuota su ggplot
p2 <- ggplot()+
#definire la geometria del plot grafico e le estetiche (cosa si plotta, il layer)
geom_raster(pc1sd5, mapping = aes (x = x, y = y, fill = layer))+
#usare una legenda viridis (quella di defalt si una senza scrivere nulla all'interno)
scale_fill_viridis(option ="magma")+
#mettere un titolo
ggtitle("Deviazione standard della pc1 con la scala di colore viridis Magma")

# Scala "inferno"
p3 <- ggplot() +
geom_raster(pc1sd5, mapping = aes(x = x, y = y, fill = layer)) +
scale_fill_viridis(option = "inferno")  +
ggtitle("Standard deviation of PC1 by inferno colour scale"
        
# finestra di plot uniti
grid.arrange(p1, p2, p3, nrow = 1) # this needs griExtra



