# PLOT 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

source("readDataSources.R")

NEI_baltimore <- NEI[NEI$fips=="24510",]
emission_annual_balt <- sapply(split(NEI_baltimore$Emissions,NEI_baltimore$year),sum)
png("plot2.png")
barplot(emission_annual_balt,main = expression('total PM'[2.5]*' emitted by year in Baltimore, Maryland'), xlab = "year", ylab = expression('total PM'[2.5]*' emission, in tons'))
dev.off()
# It appears from the barplot that the total emissions from PM2.5 decreased in Baltimore City, Maryland from 1999 to 2008.