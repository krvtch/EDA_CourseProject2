# PLOT 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

source("readDataSources.R")

# Get SCC codes of all motor vehicle-related sources by EI.Sector
vehicle_matches <- grepl("vehicle", SCC$EI.Sector, ignore.case=TRUE)
SCC_vehicle <- SCC[vehicle_matches,]

# Generate new subset based on SCC_vehicle$SCC matches and plot the sum per annum
NEI_vehicle <- NEI[(NEI$SCC %in% SCC_vehicle$SCC),]
vehicle_emission <- sapply(split(NEI_vehicle$Emissions,NEI_vehicle$year),sum)
png("plot5.png")
barplot(vehicle_emission,main = expression('total PM'[2.5]*' emitted from motor vehicles'), xlab = "year", ylab = expression('total PM'[2.5]*' emission, in tons'))
dev.off()
# It appears from the barplots that a steady decrease in vehicle-related emissions.