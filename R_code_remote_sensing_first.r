# Il mio primo codice in R per il telerilevamento!

#questa funzione istalla il pacchetto raster
#install.packages("raster")
library(raster)

#questa funzione carica la cartella lab
setwd("C:/lab/")

#questa funzione carica l'immagine dalla cartella lab a R
p224r63_2011<-brick("p224r63_2011_masked.grd")
p224r63_2011

#questa funzione permette di visualizzare i dati
plot(p224r63_2011)

#questa funzione cambia scala di colori
cl <- colorRampPalette(c('black','grey','light grey'))(100) 
#questa funzione cambia colore all'immagine
plot(p224r63_2011, col=cl)
