## create Plot 1

## Open RDS

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subdates

SamplesNEI <- NEI[sample(nrow(NEI), size = 1000, replace = F), ]

## Calculate the emissions

Emissions <- aggregate(NEI[, 'Emissions'], by = list(NEI$year), FUN = sum)
Emissions$PM <- round(Emissions[, 2] / 1000, 2)

## Plotting

png(filename = 'plot1.png')

barplot(Emissions$PM, names.arg = Emissions$Group.1, main = expression('Plot 1 - Total Emission of PM in United State'[2.5], ), xlab = 'Year', ylab = expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()