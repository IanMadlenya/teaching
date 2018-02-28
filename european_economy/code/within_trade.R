#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
# EU exports
# Last update: 2018 02 20
#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#
library(plyr)
d<-read.csv("data/eurostat_exports_eu.csv",stringsAsFactors=FALSE)

# Aggregate data to create average
d<-ddply(d,.(GEO),summarise,exports=mean(Value,na.rm=TRUE))
d<-na.omit(d[order(d$exports),])

# Change country names
d$GEO[d$GEO=="Germany (until 1990 former territory of the FRG)"]<-"Germany"
d$GEO[d$GEO=="Czech Republic"]<-"Czechia"

# Plot data
par(mar=c(5,10,2,2),pty="m",cex.axis=1.5,cex.lab=1.3)
barplot(d$exports,xaxt="n",yaxt="n",ylab="",border=F,width=c(.35),space=1.8,
        horiz=TRUE,col="black")
axis(2,at=(1:28)-.26,labels=d$GEO, tick=F)
axis(1,tick=F)
abline(v=seq(0,20,5),col="white",lwd=3)
abline(v=0,col="gray",lwd=2)