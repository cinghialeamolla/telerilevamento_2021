#R_code_classification.r

library(raster)
library(RStoolbox)
#Settaggio working directory
#setwd("~/lab/") # Linux
setwd("C:/lab/") # Windows
#setwd("/Users/name/Desktop/lab/") # Mac

#questa funzione esce da R, prende le bande dell'immagine e le porta dentro
so <- brick("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
so

#questa funzione visualizza i livelli RGB
plotRGB(so, 1,2,3, stretch="lin")

#classificazione non supervisionata
soc <- unsuperClass(so, nClasses=3)
#plottaggio della mappa
plot(soc$map)
#questa funzione stabiliscele regole per il modello di classificazione
set.seed(42)

#classificazione non supervisionata con 20 classi
soc2 <- unsuperClass(so, nClasses=20)
plot(soc2$map)

#Scaricare immagine da: https://www.esa.int/ESA_Multimedia/Missions/Solar_Orbiter/(result_type)/images

sun <- brick("Sun.png")
sunc <- unsuperClass(sun, nClasses=3)
plot(sunc$map)

### DAY 2
# Grand Canyon
# https://landsat.visibleearth.nasa.gov/view.php?id=80948
library(raster)
library(RStoolbox)
setwd("C:/lab/") # Windows

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
plotRGB(gc, r=1, g=2, b=3, stretch="lin")
plotRGB(gc, r=1, g=2, b=3, stretch="hist")
#classificazione non supervisionata immagine
gcc2 <- unsuperClass(gc, nClasses=2)
gcc2
#questa funzione plotta la mappa classificata
plot(gcc2$map)

gcc4 <- unsuperClass(gc, nClasses=4)
gcc4
plot(gcc4$map)









