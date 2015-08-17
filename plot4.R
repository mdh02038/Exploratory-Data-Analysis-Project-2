## Exploratory Data Analysis
## Project 2
## Plot 4

library(plyr)
library(ggplot2)

## read data file into data frames
path <- "exdata-data-NEI_data"
NEI <- readRDS(paste(path,"summarySCC_PM25.rds",sep="/"))
SCC <- readRDS(paste(path,"Source_Classification_Code.rds",sep="/"))

## extract rows related to caol
scc <- SCC$SCC[grepl("[Cc]oal", SCC$Short.Name )]
select <- NEI$SCC %in% scc
NEI_filtered <- NEI[select,]

## create data frame with summary of Emissions by year
data <- ddply( NEI_filtered, .(year), numcolwise(sum) )

## plot data
plot( data$year, data$Emissions, type="l", ylab="Emissions", xlab="Year", main="Emissions per Year" )

## create png file
dev.copy(png,"plot4.png")
dev.off()