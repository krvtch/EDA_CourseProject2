# PLOT 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

source("readDataSources.R")

# Create a subset of NEI with Baltimore City and LA County:
NEI_sub <- NEI[NEI$fips %in% c("24510","06037"),]
library(ggplot2)

# Get SCC codes of all motor vehicle-related sources by EI.Sector
vehicle_matches <- grepl("vehicle", SCC$EI.Sector, ignore.case=TRUE)
SCC_vehicle <- SCC[vehicle_matches,]

# Generate new subset based on SCC_vehicle$SCC matches and plot the sum per annum
NEI_sub_veh <- NEI_sub[(NEI_sub$SCC %in% SCC_vehicle$SCC),]
NEI_sub_aggr <- aggregate(Emissions ~ year + fips, NEI_sub_veh, sum)

# Renaming fips into recognizable names
NEI_sub_aggr[NEI_sub_aggr$fips=="06037",2] <- "Los Angeles"
NEI_sub_aggr[NEI_sub_aggr$fips=="24510",2] <- "Baltimore City"
names(NEI_sub_aggr)[2] <- c("CountyName")

p2 <- ggplot(data = NEI_sub_aggr, aes(year, Emissions, color = CountyName)) +
        geom_line() +
        labs(y=expression('total PM'[2.5]*' emission, in tons'), title=expression('total PM'[2.5]*' motor vehicle emissions')) +
        theme(legend.position = "bottom")
ggsave("plot6.png")

# It appears from the line charts that there is a huge gap between motor vehicle emissions between Baltimore and LA.
# Therefore, a slight variation in vehicle emissions in LA would still yield greater change over time and is calculated for both counties below:
a <- NEI_sub_aggr[1,3]
b <- NEI_sub_aggr[4,3]
delta_Balt <- abs(a-b)/a
delta_Balt
c <- NEI_sub_aggr[5,3]
d <- NEI_sub_aggr[8,3]
delta_LA <- abs(c-d)/c
delta_LA