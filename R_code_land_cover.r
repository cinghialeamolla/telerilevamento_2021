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
