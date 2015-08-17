## Exploratory Data Analysis
## Project 2
## Plot 3

library(plyr)
library(ggplot2)

## read data file into data frames
path <- "exdata-data-NEI_data"
NEI <- readRDS(paste(path,"summarySCC_PM25.rds",sep="/"))
SCC <- readRDS(paste(path,"Source_Classification_Code.rds",sep="/"))

## select rows for Baltimore City, Maryland (fips=="24510")
select = NEI$fips=="24510"
NEI_filtered <- NEI[select,]

## create data frame with summary of Emissions by year
data <- ddply( NEI_filtered, .(year,type), numcolwise(sum) )

## plot data
ggplot(data, aes(year,Emissions))+geom_line()+facet_wrap(~mdh)

## create png file
dev.copy(png,"plot3.png")
dev.off()