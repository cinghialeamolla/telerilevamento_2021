#R_code_land_cover.r

library(raster) #require(raster)
library(RStoolbox) #per fare la classificazione
#install.packages("ggplot2")
library(ggplot2) #per 
setwd("C:/lab/") # Windows

# NIR 1, RED 2, GREEN 3.

#carico il datatset su R
defor1 <- brick("defor1.jpg")
plotRGB(defor1, r=1, g=2, b=3, stretch="lin")

#
ggRGB()


defor2 <- brick("defor2.jpg")
