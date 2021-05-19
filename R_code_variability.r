#R_code_variability.r

library(raster)
library(RStoolbox)
setwd("C:/lab/") # Windows

#importare l'immagine sentinel completa di tutte e tre le bande su R
sent <- brick("sentinel.png")
#NIR 1,   RED 2   GREEN 3
# r=1, g=2, b=3
plotRGB(sent, stretch="lin") #plotRGB(sent, r=1, g=2, b=3, stretch="lin")

plotRGB(sent, r=2, g=1, b=3, stretch="lin")


