# PLOT 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

source("readDataSources.R")

# The  file, summarySCC_PM25.rds, contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year.
emission_annual <- sapply(split(NEI$Emissions,NEI$year),sum)
png("plot1.png")
barplot(emission_annual,main = expression('total PM'[2.5]*' emitted by year'), xlab = "year", ylab = expression('total PM'[2.5]*' emission, in tons'))
dev.off()
# It appears from the barplot that the total emissions from PM2.5 decreased in the United States from 1999 to 2008.