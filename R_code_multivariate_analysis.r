#R_code_multivariate_analysis.r

library(raster)
library(RStoolbox)
setwd("C:/lab/") # Windows

#questa funzione carica un set multiplo di dati su R
p224r63_2011 <- brick("p224r63_2011_masked.grd")
plot(p224r63_2011)

#questa funzione plotta i valori della banda 1 contro quelli della banda 2
plot(p224r63_2011$B1_sre, p224r63_2011$B2_sre, col="red", pch=19, cex=2)
plot(p224r63_2011$B2_sre, p224r63_2011$B1_sre, col="red", pch=19, cex=2)

#questa funzione plotta tutte le correlazioni possibili tra tutte le variabili del dataset (anche per tabelle), a due a due, con indice da -1 a 1.
pairs(p224r63_2011)

### DAY 3

library(raster)
library(RStoolbox)
setwd("C:/lab/") # Windows
p224r63_2011 <- brick("p224r63_2011_masked.grd")

#questa funzione aggrega i pixel rendendo il dato più leggero (ricampionamento)
p224r63_2011m_res <- aggregate(p224r63_2011, fact=10, fun=mean)
p224r63_2011m_res

par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="lin")
plotRGB(p224r63_2011m_res, r=4, g=3, b=2, stretch="lin")
