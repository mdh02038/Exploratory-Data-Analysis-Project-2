## Exploratory Data Analysis
## Project 2
## Plot 2

library(plyr)

## read data file into data frames
path <- "exdata-data-NEI_data"
NEI <- readRDS(paste(path,"summarySCC_PM25.rds",sep="/"))
SCC <- readRDS(paste(path,"Source_Classification_Code.rds",sep="/"))

## select rows for Baltimore City, Maryland (fips=="24510")
select <- NEI$fips=="24510"
NEI_filtered <- NEI[select,]

## create data frame with summary of Emissions by year
data <- ddply( NEI_filtered, .(year), numcolwise(sum) )

## plot data
plot( data$year, data$Emissions, type="l", ylab="Emissions", xlab="Year", main="Emissions per Year" )

## create png file
dev.copy(png,"plot2.png")
dev.off()