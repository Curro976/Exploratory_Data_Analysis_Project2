# 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

#Download, unzip and read required subset of the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="polutant.zip")
unzip(zipfile="polutant.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset and create the graph
library(graphics)
library(grDevices)
BaltimoreNEI <- NEI[NEI$fips=="24510",]
Baltimore_data <- aggregate(Emissions ~ year,BaltimoreNEI, sum)
png("plot2.png",width=480,height=480,units="px")
barplot(
  (Baltimore_data$Emissions),
  names.arg=data$year,
  main="Evolution PM2.5 in Baltimore",
  xlab="Year",
  ylab="PM 2.5 Emissions",
)
dev.off()

#It is not so clear that the global US, but there exist a decrease trend in the PM2.5 Baltimore emissions during the period analyzed (1999-2008)
