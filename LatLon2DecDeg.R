#function to convert lat lon in deg, min, sec to decimal degrees

degminsec2decdeg <- function(infile,indir){
  
library(spaa)
setwd(indir)
plot <- read.csv(infile)


plot.c.lon <- as.character(plot$lon)
deg.lon<-as.numeric(substr(plot.c.lon,start=1,stop=2))
min.lon<-as.numeric(substr(plot.c.lon,start=4,stop=5))
sec.lon<-as.numeric(substr(plot.c.lon,start=7,stop=length(plot.c.lon)))


lon <- deg2dec(deg.lon,min.lon,sec.lon) #longitude in decimal degrees

plot.c.lat <- as.character(plot$Lat)
deg.lat<-as.numeric(substr(plot.c.lat,start=1,stop=2))
min.lat<-as.numeric(substr(plot.c.lat,start=4,stop=5))
sec.lat<-as.numeric(substr(plot.c.lat,start=7,stop=length(plot.c.lat)))

lat <- deg2dec(deg.lat,min.lat,sec.lat)

coords <- cbind(lon,lat)

write.csv(x=coords,file = paste0(substr(infile,start=1,stop=nchar(infile)-4),"_decdeg"))
}
