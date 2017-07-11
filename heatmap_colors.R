#pontus.skoglund@gmail.com

library(fields)
library(RColorBrewer)

pdf("mymap.pdf",useDingbats=F,width=14,height=7)

data<-read.table("input.txt")

Latitude<-data[,1]
Longitude<-data[,2]
statistic<-data[,3]

rgb.palette<-colorRampPalette(c("white","white","white","white","gold","red","brown")) # option1
rgb.palette<-colorRampPalette(c("black","black","black","black","black","black","midnightblue","blue","steelblue","lightskyblue3","lightskyblue","yellow","gold","red")) # option2

colours<-rgb.palette(100)

x<-statistic

cols <- as.character(cut(statistic, breaks = length(colours),labels =colours)) 
plot(Longitude,Latitude,type="n",main="",xlim=c(-170,182),ylim=c(-50,75)) #,xlim=c(-25,25),ylim=c(40,70)
world(add=TRUE,fill=TRUE,col="grey80",bg="lightskyblue3")

points(Longitude,Latitude,pch=21,bg=cols,col="black",cex=3)

box()

###legend
tempcolours=rev(colours)
legendposx= -110
legendwidth=10
legendtop=0
legendbottom= -30
legendspan=legendtop-legendbottom
legendincrement=legendspan/length(colours)
for(i in 1:length(tempcolours)) {
  rect(legendposx,legendtop-(legendincrement*i),(legendposx+legendwidth),legendtop-(legendincrement*i-legendincrement),col=tempcolours[i],border=NA)
}
text(legendposx+3.5,legendtop+3,round(max(statistic),3),cex=0.8)
text(legendposx+3.5,legendbottom-3,round(min(statistic),3),cex=0.8)
rect(legendposx,legendtop,(legendposx+legendwidth),legendbottom,col=NA)


dev.off()
