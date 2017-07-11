#pontus.skoglund@gmail.com

library(fields)
library(RColorBrewer)

pdf("mymap.pdf",useDingbats=F,width=14,height=7)


data<-read.table("input.txt")

Latitude<-data[,1]
Longitude<-data[,2]
statistic<-data[,3]



#rgb.palette<-colorRampPalette(c("white","white","white","red","brown")) #

rgb.palette<-colorRampPalette(c("white","white","white","white","gold","red","brown")) #



rgb.palette<-colorRampPalette(c("black","black","black","black","black","black","midnightblue","blue","steelblue","lightskyblue3","lightskyblue","yellow","gold","red")) #


rgb.palette<-colorRampPalette(c("steelblue","blue","midnightblue","black","yellow","gold","red")) #


colours<-rgb.palette(100)

x<-statistic

cols <- as.character(cut(statistic, breaks = length(colours),labels =colours)) 
plot(Longitude,Latitude,type="n",main="",xlim=c(-170,182),ylim=c(-50,75)) #,xlim=c(-25,25),ylim=c(40,70)
#world(add=TRUE,fill=TRUE,shift=FALSE,col.land="white",col.water="lightskyblue3")
world(add=TRUE,fill=TRUE,col="grey80",bg="lightskyblue3")



points(Longitude,Latitude,pch=21,bg=cols,col="black",cex=3)


#points(Longitude[1:23],Latitude[1:23],pch=21,bg=cols[1:23],col="black",cex=3)
#points(Longitude[24:194],Latitude[24:194],pch=21,bg=cols[24:194],col="black",cex=3)

#text(Longitude,Latitude,data[,5],cex=0.7)
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
  #text((legendposx+15),(legendtop-(legendincrement*i-legendincrement/2)),"hello")
}
text(legendposx+3.5,legendtop+3,round(max(statistic),3),cex=0.8)
text(legendposx+3.5,legendbottom-3,round(min(statistic),3),cex=0.8)
rect(legendposx,legendtop,(legendposx+legendwidth),legendbottom,col=NA)


dev.off()














