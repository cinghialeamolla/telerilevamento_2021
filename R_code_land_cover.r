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
library(ggplot2)  #per il grafico
library(gridExtra) #per arrangiare insieme i plot
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

#questa funzione calcola la frequenza dei pixel assegnati ad ogni classe (Es: Foresta, Agricoltura)
freq(d1c$map)
#value  count
#[1,]     1 306992
#[2,]     2  34300

#sommo i valori totali delle classi
s1 <- 306992 + 34300
#questa funzione calcola la proporzione delle due classi
prop1 <- freq(d1c$map) / s1
# Proporzione Foresta:   0.8994995 
# Proporzione Agricolo:  0.1005005 

#proporzioni nella seconda mappa
s2 <- 342726
prop2 <- freq(d2c$map) / s2
# Proporzione Foresta:   0.5216908
# Proporzione Agricolo:  0.4783092

#creare un dataset
#colonne
copertura <- c("Agricultura","Foresta") #prima colonna
percentuale_1992 <- c(10.05,89.95)
percentuale_2006 <- c(47.83,52.17)
#tabella
percentuali <- data.frame(copertura, percentuale_1992, percentuale_2006)
percentuali
#plot del grafico  del 1992
p1<-ggplot(percentuali, aes(x=copertura, y=percentuale_1992, color=copertura)) + geom_bar(stat="identity", fill="white")
#plot del grafico  del 2006
p2<-ggplot(percentuali, aes(x=copertura, y=percentuale_2006, color=copertura)) + geom_bar(stat="identity", fill="white")
#arrangiare i due grafici in una pagina
grid.arrange(p1, p2, nrow=1)


