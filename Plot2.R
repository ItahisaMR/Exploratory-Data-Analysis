## Reading full dates

Datos_totales <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

Datos_totales$Date <- as.Date(Datos_totales$Date, format="%d/%m/%Y")

## Subdates with range of dates.

SubDatos <- subset(Datos_totales, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(Datos_totales)

## Converting dates

datetime <- paste(as.Date(SubDatos$Date), SubDatos$Time)
SubDatos$Datetime <- as.POSIXct(datetime)

## Plotting

plot(SubDatos$Global_active_power~SubDatos$Datetime, type="l",
ylab="Global Active Power (kilowatts)", xlab="")

## Saving to png

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
