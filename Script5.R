emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

#Download, unzip and read required subset of the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="polutant.zip")
unzip(zipfile="polutant.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset and create the graph

cars <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
cars_SCC <- SCC[cars,]$SCC
cars_NEI <- NEI[NEI$SCC %in% cars_SCC,]
Baltimore_cars_NEI <- cars_NEI[cars_NEI$fips=="24510",]

png("plot5.png",width=480,height=480,units="px")
library(ggplot2)
plot5 <- ggplot(Baltimore_cars_NEI,aes(factor(year),Emissions)) +
  geom_bar(stat="identity") +
  theme_grey() + 
  labs(x="year", y=expression("PM2.5 Emission (Tons)")) + 
  labs(title=expression("Baltimore car emissions, 1999-2008"))

print(plot5)
dev.off()

# Motor vehicle emissions have notably decreased in Baltimore during the period 1999-2008
