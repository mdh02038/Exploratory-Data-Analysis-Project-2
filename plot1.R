## Exploratory Data Analysis
## Project 2
## Plot1

library(dplyr)

## read data file into data frames
path <- "exdata-data-NEI_data"
NEI <- readRDS(paste(path,"summarySCC_PM25.rds",sep="/"))
SCC <- readRDS(paste(path,"Source_Classification_Code.rds",sep="/"))