##load the datafiles

NEI <- readRDS("C:/Users/nilrey/Desktop/datasciencecoursera/Exploratory Data Analysis/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/nilrey/Desktop/datasciencecoursera/Exploratory Data Analysis/Source_Classification_Code.rds")

## make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008
emission_by_year<-aggregate(Emissions~year, NEI,sum)
barplot(height=emission_by_year$Emissions, names.arg = emission_by_year$year, xlab="years", ylab=expression("total PM"[2.5]*" emission"),main=expression("Total PM"[2.5]*" emissions (in tons) at various years"))

## create Plot 1 and save in PNG file
dev.copy(png, file="plot1.png",width=480, height=480)
dev.off()