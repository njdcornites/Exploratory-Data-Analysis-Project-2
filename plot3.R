##load the datafiles and ggplot package

NEI <- readRDS("C:/Users/nilrey/Desktop/datasciencecoursera/Exploratory Data Analysis/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/nilrey/Desktop/datasciencecoursera/Exploratory Data Analysis/Source_Classification_Code.rds")
library(ggplot2)

## subset Baltimore City, Maryland (fips == "24510") and plot total emissions from PM2.5 from 1999 to 2008
sub1<-subset(NEI, fips=="24510")
emission_by_year<-aggregate(Emissions~year+type, sub1,sum)

g<-ggplot(emission_by_year, aes(year, Emissions, color = type))

g+geom_line()+geom_point()+ylab(expression("Total PM"[2.5]*" Emissions"))+ggtitle(expression("Total PM"[2.5]*" emissions (tons) in Baltimore City, Maryland at various years"))


## create Plot 1 and save in PNG file
dev.copy(png, file="plot3.png",width=480, height=480)
dev.off()