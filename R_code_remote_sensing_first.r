# Il mio primo codice in R per il telerilevamento!

#questa funzione istalla il pacchetto raster
#install.packages("raster")
#questafunzione richiama il pacchetto raster
library(raster)

#questa funzione carica la cartella lab
setwd("C:/lab/")

#questa funzione assegna un nome e carica l'immagine dalla cartella lab a R
p224r63_2011<-brick("p224r63_2011_masked.grd")
#questa funzione visualizza le informazioni sull'immagine
p224r63_2011

#questa funzione permette di visualizzare i dati
plot(p224r63_2011)

## DAY 2

#questa funzione cambia scala di colori
cl <- colorRampPalette(c('black','grey','light grey'))(100) 
#questa funzione cambia colore all'immagine
plot(p224r63_2011, col=cl)

### DAY 3

#questa funzione carica il plottaggio con colori scelti
cl <- colorRampPalette(c("red","pink","orange","purple")) (200)
plot(p224r63_2011, col=cl)

#Bande Landsat
#B1: Blu
#B2: Verde
#B3: Rosso
#B4: Infrarosso Vicino
#B5: Infrarosso Medio
#B6: Infrarosso Termico
#B7: Infrarosso Medio

#questa funzione ripulisce la finestra grafica
dev.off()

#questa funzione plotta solo la banda 1, selezionata
plot(p224r63_2011$B1_sre)

#questa funzione cambia colore alla banda 1
cl <- colorRampPalette(c("blue","orange","green")) (200)
plot(p224r63_2011$B1_sre,col=cl)

#questa funzione plotta le prime due bande una accanto all'altra (stabilisce come mettere le immagini nel software)
#prepara lo schermo per 1 riga e 2 colonne
par(mfrow=c(1,2))
plot(pplot(p224r63_2011$B1_sre)224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

#1 colonna e 2 righe
par(mfrow=c(2,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)

#inserisce prima le colonne
par(mfcol=c(2,1))

#plottiamo le prime 4 bande di Landsat
par(mfrow=c(4,1))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

#plottiamo un 2x2
par(mfrow=c(2,2))
plot(p224r63_2011$B1_sre)
plot(p224r63_2011$B2_sre)
plot(p224r63_2011$B3_sre)
plot(p224r63_2011$B4_sre)

#plottiamo un 2x2 cambiando palette di colori
par(mfrow=c(2,2))
clb<-colorRampPalette(c("dark blue","blue","light blue")) (100)
plot(p224r63_2011$B1_sre,col=clb)
clg<-colorRampPalette(c("dark green","green","light green")) (100)
plot(p224r63_2011$B2_sre,col=clg)
clr<-colorRampPalette(c("dark red","red","orange")) (100)
plot(p224r63_2011$B3_sre,col=clr)
clnir<-colorRampPalette(c("red","orange","yellow")) (100)
plot(p224r63_2011$B4_sre,col=clnir)

