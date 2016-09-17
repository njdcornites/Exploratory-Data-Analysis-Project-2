##load the datafiles and ggplot package

NEI <- readRDS("C:/Users/nilrey/Desktop/datasciencecoursera/Exploratory Data Analysis/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/nilrey/Desktop/datasciencecoursera/Exploratory Data Analysis/Source_Classification_Code.rds")
library(ggplot2)

## subset NEI data with emissions from coal combustion-related sources and plot total emissions from PM2.5 from 1999 to 2008
sub1<-subset(NEI, (fips=="24510"| fips == "06037") & type=="ON-ROAD")

emission_by_year<-aggregate(Emissions~year+fips, sub1,sum)

emission_by_year$fips<-gsub("24510", "Baltimore, MD", emission_by_year$fips)
emission_by_year$fips<-gsub("06037", "Los Angeles, CA", emission_by_year$fips)

g<-ggplot(emission_by_year, aes(as.factor(year), Emissions))
g<-g+facet_grid(.~fips)
g+geom_bar(stat = "identity")+xlab("years")+ylab(expression("Total PM"[2.5]*" Emissions"))+ggtitle(expression("Emissions from motor vehicle sources from 1999-2008 in Baltimore, MD and Los Angeles, CA"))

## create Plot 1 and save in PNG file
dev.copy(png, file="plot6.png",width=600, height=480)
dev.off()