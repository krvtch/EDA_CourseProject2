# PLOT 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

source("readDataSources.R")

# Get SCC codes of all coal combustion-related sources by EI.Sector
coal_matches <- grepl("coal", SCC$EI.Sector, ignore.case=TRUE)
SCC_coal <- SCC[coal_matches,]

# Generate new subset based on SCC_coal$SCC matches and plot the sum per annum
NEI_coal <- NEI[(NEI$SCC %in% SCC_coal$SCC),]
coal_emission <- sapply(split(NEI_coal$Emissions,NEI_coal$year),sum)
png("plot4.png")
barplot(coal_emission,main = expression('total PM'[2.5]*' emitted from coal-combustion'), xlab = "year", ylab = expression('total PM'[2.5]*' emission, in tons'))
dev.off()
# It appears from the barplots that a sudden decrease in coal combustion-related emissions only appeared at year 2008.
