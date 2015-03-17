## create Plot 2

## Open RDS

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subdates

SamplesNEI <- NEI[sample(nrow(NEI), size = 5000, replace = F), ]

## Subsets data

MD <- subset(NEI, fips == '24510')

## Plotting 

png(filename = 'plot2.png')
barplot(tapply(X = MD$Emissions, INDEX = MD$year, FUN = sum), main = 'Plot 2 - Total Emission - Baltimore City (Maryland), MD', xlab = 'Year', ylab = expression('PM'[2.5]))
dev.off()