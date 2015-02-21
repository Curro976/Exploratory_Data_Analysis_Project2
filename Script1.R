# 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

#Download, unzip and read required subset of the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="polutant.zip")
unzip(zipfile="polutant.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset and create the graph
library(graphics)
library(grDevices)
data <- aggregate(Emissions ~ year,NEI, sum)
png("plot1.png",width=480,height=480,units="px")
barplot(
  (data$Emissions),
  names.arg=data$year,
  main="US PM2.5 Emissions",
  xlab="Year",
  ylab="PM 2.5 Emissions",
)
dev.off()

#It the graph can be seen that the total PM2.5 emissions in the US has decrase significantly during the period 1999-2008
