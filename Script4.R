missions from coal combustion-related sources changed from 1999–2008?

#Download, unzip and read required subset of the file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile="polutant.zip")
unzip(zipfile="polutant.zip")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset and create the graph


combustion <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE)
combustion_coal <- (combustion & coal)
combustion_SCC <- SCC[combustion_coal, ]$SCC
combustion_NEI <- NEI[NEI$SCC %in% combustion_SCC,]


png("plot4.png",width=480,height=480,units="px")
library(ggplot2)
plot4 <- ggplot(combustion_NEI,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  theme_grey() +
  facet_grid(.~type,scales = "free",space="fixed") + 
  labs(x="year", y=expression("PM2.5 Emission (Tons)")) + 
  labs(title=expression("US Coal Combustiion Emissions, 1999-2008"))

print(plot4)
dev.off()

# Yes. According to the data, coal combustion related emmisions have decreased in the US during the period 1999-2008
