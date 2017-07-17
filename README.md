---
title: "Air Pollution EDA Project"
author: "proj20"
date: "July 17, 2017"
output: html_document
---

## Introduction

Fine particulate matter (PM2.5) is an ambient air pollutant for which there is strong evidence that it is harmful to human health. In the United States, the Environmental Protection Agency (EPA) is tasked with setting national ambient air quality standards for fine PM and for tracking the emissions of this pollutant into the atmosphere. Approximatly every 3 years, the EPA releases its database on emissions of PM2.5. This database is known as the National Emissions Inventory (NEI). You can read more information about the NEI at the EPA National Emissions Inventory web site.
<https://www3.epa.gov/ttn/chief/eiinformation.html>

For each year and for each type of PM source, the NEI records how many tons of PM2.5 were emitted from that source over the course of the entire year.
The data that will be used for this assignment are for 1999, 2002, 2005, and 2008.

## Data Source
The data for this assignment are available from the Coursera course web site as a single zip file:
<https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip>

The zip file contains two files:

**PM2.5 Emissions Data** (`summarySCC_PM25.rds`): This file contains a data frame with all of the PM2.5 emissions data for 1999, 2002, 2005, and 2008. For each year, the table contains number of tons of PM2.5 emitted from a specific type of source for the entire year.

- **fips**: A five-digit number (represented as a string) indicating the U.S. county
- **SCC**: The name of the source as indicated by a digit string (see source code classification table)
- **Pollutant**: A string indicating the pollutant
- **Emissions**: Amount of PM2.5 emitted, in tons
- **type**: The type of source (point, non-point, on-road, or non-road)
- **year**: The year of emissions recorded

**Source Classification Code Table** (`Source_Classification_Code.rds`): This table provides a mapping from the SCC digit strings in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from more general to more specific a. For example, source "10100101" is known as "Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal".

## Objectives
To explore the National Emissions Inventory database and see what it says about fine particulate matter pollution in the United states over the 10-year period 1999-2008.

To be able to answer the following items objectively:

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## Methodology
- Construct the plot and save it to a PNG file.
- Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Each code file includes code for reading the data so that the plot can be fully reproduced.
- Upload the PNG file on the Assignment submission page
- Copy and paste the R code from the corresponding R file into the text box at the appropriate point in the peer assessment.

### Plots and Answers to Each Objective

#### plot1.R
It appears from the barplot below that the total emissions from PM2.5 **decreased** in the United States from 1999 to 2008.

#### plot2.R
It appears from the barplot below that the total emissions from PM2.5 **decreased** in Baltimore City, Maryland from 1999 to 2008.

#### plot3.R
It appears from the line charts that the following sources have the following trends:

1. NON-ROAD > **decrease**
2. NONPOINT > **decrease**
3. ON-ROAD  > **decrease**
4. POINT    > **increase**

#### plot4.R
It appears from the barplots below that a **sudden decrease** in coal combustion-related emissions only appeared at year **2008**.

#### plot5.R
It appears from the barplots below that a **steady decrease** in vehicle-related emissions.

#### plot6.R
It appears from the line charts that there is a huge gap between motor vehicle emissions between Baltimore and LA.
Therefore, a slight variation in vehicle emissions in LA would still yield greater change over time and is calculated for both counties below:

```
a <- NEI_sub_aggr[1,3]
b <- NEI_sub_aggr[4,3]
delta_Balt <- abs(a-b)/a
```

`delta_Balt` = 0.0432958

```
c <- NEI_sub_aggr[5,3]
d <- NEI_sub_aggr[8,3]
delta_LA <- abs(c-d)/c
```
`delta_LA` = 0.7454718
