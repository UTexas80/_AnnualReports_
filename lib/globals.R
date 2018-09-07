# Add any project specific configuration here.
add.config(
  apply.override = FALSE
)
currentYr <- as.numeric(format(Sys.Date(), format="%y"))
lastYr <- currentYr - 1
currentAY <- as.numeric(paste(lastYr, currentYr, sep = ""))
ay<-as.data.table(seq(as.numeric(currentAY), as.numeric(currentAY)+(101*(100-currentYr-1)),by=101))
# Add project specific configuration that can be overridden from load.project()
add.config(
  apply.override = TRUE
)
