## plot2.R
## Note: dplyr package must be installed and loaded first!!!

## Read in dataset
NEI <- readRDS("summarySCC_PM25.rds")

## Filter data to isolate Baltimore City, MD
NEI <- filter(NEI, fips == "24510")

## group data by year
byYear <- group_by(NEI, year)

## summarize total emissions by year
summaryDF <- summarise(byYear, Sum = sum(Emissions))

## change device to png file
png(filename = "plot2.png", width = 480, height = 480)

## plot 'em!
barplot(summaryDF$Sum, col="red", axes = FALSE)
axis(1, at=1:4, lab=summaryDF$year)
title(main = "Total PM2.5 emission Baltimore City, MD")

## Close the PNG device
dev.off()