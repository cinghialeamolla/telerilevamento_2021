#R_code_knitr.r

#Settaggio working directory
#setwd("~/lab/") # Linux
setwd("C:/lab/") # Windows
#setwd("/Users/name/Desktop/lab/") # Mac
 
library(knitr)

stitch("R_code_greenland.txt", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
require(knitr)
