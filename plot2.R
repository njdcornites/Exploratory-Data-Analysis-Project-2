##load the datafiles

NEI <- readRDS("C:/Users/nilrey/Desktop/datasciencecoursera/Exploratory Data Analysis/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/nilrey/Desktop/datasciencecoursera/Exploratory Data Analysis/Source_Classification_Code.rds")

## subset Baltimore City, Maryland (fips == "24510") and plot total emissions from PM2.5 from 1999 to 2008
sub1<-subset(NEI, fips=="24510")
emission_by_year<-aggregate(Emissions~year, sub1,sum)
barplot(height=emission_by_year$Emissions, names.arg = emission_by_year$year, xlab="years", ylab=expression("total PM"[2.5]*" emission"),main=expression("Total PM"[2.5]*" emissions (tons) in Baltimore City, Maryland at various years"))

## create Plot 1 and save in PNG file
dev.copy(png, file="plot2.png",width=480, height=480)
dev.off()