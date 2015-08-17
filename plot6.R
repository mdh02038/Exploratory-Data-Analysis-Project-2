## Exploratory Data Analysis
## Project 2
## Plot 6

library(plyr)
library(ggplot2)

## read data file into data frames
path <- "exdata-data-NEI_data"
NEI <- readRDS(paste(path,"summarySCC_PM25.rds",sep="/"))
SCC <- readRDS(paste(path,"Source_Classification_Code.rds",sep="/"))

## extract rows related to vehicles
scc <- SCC$SCC[grepl("Highway Veh", SCC$Short.Name)]
selectSCC <- NEI$SCC %in% scc

## select rows for Baltimore City, Maryland (fips=="24510")
selectBaltimore <- NEI$fips=="24510"
## select rows for Los Angeles County, CA (fips=="06037")
selectLosAngeles <- NEI$fips=="06037"

## create png file
png("plot6.png")

## create data frame with summary of Emissions by year for Baltimore and plot it
NEI_filtered <- NEI[selectSCC & selectBaltimore,]
data <- ddply( NEI_filtered, .(year), numcolwise(sum) )
plot( data$year, data$Emissions, type="l", col="red", ylim=c(0,5000), ylab="Emissions", xlab="Year", main="Emissions per Year" )

## create data frame with summary of Emissions by year for Los Angeles and plot it
NEI_filtered <- NEI[selectSCC & selectLosAngeles,]
data <- ddply( NEI_filtered, .(year), numcolwise(sum) )
lines( data$year, data$Emissions, col="blue" )

legend( "topleft", col=c("blue","red"), lty=c(1,1,1),legend=c("Los Angeles County","Baltimore"))

dev.off()