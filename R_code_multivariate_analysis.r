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

#questa funzione plotta tutte le correlazioni possibili tra tutte le variabili del dataset (anche per tabelle)
pairs(p224r63_2011)
