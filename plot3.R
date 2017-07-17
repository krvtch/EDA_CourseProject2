# PLOT 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

source("readDataSources.R")

# Create a subset where the fips pertains to Baltimore City
NEI_baltimore <- NEI[NEI$fips=="24510",]

library(ggplot2)

NEI_balt_aggr <- aggregate(Emissions ~ year + type, NEI_baltimore, sum)
p1 <- ggplot(data = NEI_balt_aggr, aes(year, Emissions, color = type)) +
        geom_line() +
        labs(y=expression('total PM'[2.5]*' emission, in tons'), title=expression('total PM'[2.5]*' emitted in Baltimore City, Maryland')) +
        theme(legend.position = "bottom")
ggsave("plot3.png")
# It appears from the line charts that the following sources have the following trends:
# 1. NON-ROAD > decrease 
# 2. NONPOINT > decrease
# 3. ON-ROAD  > decrease
# 4. POINT    > increase
