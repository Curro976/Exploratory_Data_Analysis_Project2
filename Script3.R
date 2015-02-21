# 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

#Download, unzip and read required subset of the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="polutant.zip")
unzip(zipfile="polutant.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset and create the graph
library(ggplot2)

BaltimoreNEI <- NEI[NEI$fips=="24510",]
png("plot3.png",width=700,height=480,units="px")
plot3 <- ggplot(BaltimoreNEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_grey() +
  facet_grid(.~type,scales = "free",space="fixed") + 
  labs(x="year", y=expression("Total PM2.5 Emission (Tons)")) + 
  labs(title=expression("Baltimore PM2.5 Emissions, 1999-2008"))

print(plot3)

dev.off()

#Three of the four sources have decreased their emissions during the period 1999-2008: Non-road, Non-point and On-Road.
