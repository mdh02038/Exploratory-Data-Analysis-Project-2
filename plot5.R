## Exploratory Data Analysis
## Project 2
## Plot 5

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
selectCity <- NEI$fips=="24510"
NEI_filtered <- NEI[selectSCC & selectCity,]

## create data frame with summary of Emissions by year
data <- ddply( NEI_filtered, .(year), numcolwise(sum) )

## plot data
plot( data$year, data$Emissions, type="l", ylab="Emissions", xlab="Year", main="Emissions per Year" )

## create png file
dev.copy(png,"plot5.png")
dev.off()