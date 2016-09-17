##load the datafiles and ggplot package

NEI <- readRDS("C:/Users/nilrey/Desktop/datasciencecoursera/Exploratory Data Analysis/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/nilrey/Desktop/datasciencecoursera/Exploratory Data Analysis/Source_Classification_Code.rds")
library(ggplot2)

## subset NEI data with emissions from coal combustion-related sources and plot total emissions from PM2.5 from 1999 to 2008
source_coal<-grepl("coal",SCC$EI.Sector, ignore.case = T)
subSCC<-SCC[source_coal,]

sub1<-NEI[NEI$SCC%in%subSCC$SCC,]
emission_by_year<-aggregate(Emissions~year, sub1,sum)
g<-ggplot(emission_by_year, aes(as.factor(year), Emissions))
g+geom_bar(stat = "identity")+xlab("years")+ylab(expression("Total PM"[2.5]*" Emissions"))+ggtitle(expression("Total PM"[2.5]*" Emissions from coal combustion-related sources"))


## create Plot 1 and save in PNG file
dev.copy(png, file="plot4.png",width=480, height=480)
dev.off()