#R_code_land_cover.r

library(raster) #require(raster)
library(RStoolbox) #per fare la classificazione
#install.packages("ggplot2")
library(ggplot2) #per 
#install.packages("gridExtra")
library(gridExtra) #
setwd("C:/lab/") # Windows

# NIR 1, RED 2, GREEN 3.

#carico il datatset su R
defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

#creare immagine singola con le 3 bande (usa ggplot2 e RStoolbox)
ggRGB(defor1, r=1, g=2, b=3, stretch="lin")

#carico il secondo dataset
defor2 <- brick("defor2.jpg")
ggRGB(defor2, r=1, g=2, b=3, stretch="lin")

par(mfrow=c(1,2))
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")
plotRGB(defor2, r=1, g=2, b=3, stretch="lin")

#immagini multiple con ggplot2 (non funziona "par"), unisce diversi pezzi in un grafico
p1 <- ggRGB(defor1, r=1, g=2, b=3, stretch="lin")
p2 <- ggRGB(defor2, r=1, g=2, b=3, stretch="lin")
grid.arrange(p1, p2, nrow=2)

### DAY 2
library(raster)
library(RStoolbox)
library(ggplot2)
library(gridExtra)
setwd("C:/lab/") # Windows
defor1 <- brick("defor1.jpg")
defor2 <- brick("defor2.jpg")

#Classificazione non-supervisionata (sceglie il softwere i pixel in modo randomizzato) 
#classe 2: Foresta 
#classe 1: Agricoltura
d1c <- unsuperClass(defor1, nClasses=2)
#plot della mappa 
plot(d1c$map)
#set.seed()

#Immagine 2
#classe 1: Foresta 
#classe 2: Agricoltura
d2c <- unsuperClass(defor2, nClasses=2)
plot(d2c$map)

#immagine 2 con 3 classi
d2c3 <- unsuperClass(defor2, nClasses=3)
plot(d2c3$map)
