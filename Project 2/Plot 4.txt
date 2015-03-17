## create Plot 4

## Packages

require(ggplot2)

## Open RDS

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Coal-related SCC

SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]

## Merges data sets

merge <- merge(x = NEI, y = SCC.coal, by = 'SCC')
merge.sum <- aggregate(merge[, 'Emissions'], by = list(merge$year), sum)
colnames(merge.sum) <- c('Year', 'Emissions')

## Plotting

png(filename = 'plot4.png')

ggplot(data = merge.sum, aes(x = Year, y = Emissions / 1000)) + geom_line(aes(group = 1, col = Emissions)) + geom_point(aes(size = 2, col = Emissions)) + ggtitle(expression('Plot 4 - Total Emissions of PM'[2.5])) + ylab(expression(paste('PM', ''[2.5], ' in kilotons'))) + geom_text(aes(label = round(Emissions / 1000, digits = 2), size = 2, hjust = 1.5, vjust = 1.5)) + theme(legend.position = 'none') + scale_colour_gradient(low = 'blue', high = 'red')
dev.off()