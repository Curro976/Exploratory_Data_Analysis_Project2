#6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

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
LA_cars_NEI <- cars_NEI[cars_NEI$fips=="06037",]
Cars_Baltimore_LA <- rbind(Baltimore_cars_NEI,LA_cars_NEI)

png("plot6.png",width=650,height=480,units="px")
library(ggplot2)
plot6 <- ggplot(Cars_Baltimore_LA,aes(factor(year),Emissions,fill=fips)) +
  geom_bar(stat="identity") +
  theme_grey() + 
  facet_grid(.~fips,scales = "free",space="fixed") + 
  labs(x="year", y=expression("PM2.5 Emission (Tons)")) + 
  labs(title=expression("Total emissions per city (1999-2008"))

print(plot6)
dev.off()

# The data analyzed states that the total emissions of vehicles in LA county are dramatically higher than in Baltimore city.
