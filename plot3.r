## Coursera - Exploratory Data Analysis - Plotting Assignment 1
## 08/08/2015
## This code plot3.R is used to generate chart for Energy usage  (in watt-hour of active energy) recorded at 3 sub metering points 
## in a household across the two days 01/02/2007 to 02/02/2007
## The outcome is saved in plot3.png

## Retrieving source data if not already available
filename = "power_consumption.zip"
if (!file.exists(filename)) {
  retval = download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                         destfile = filename)
}

## Reading the data from the contents of the zipped file
data_power = read.csv(unz(filename, "household_power_consumption.txt"), header=T,
                    sep=";", stringsAsFactors=F, na.strings="?",
                    colClasses=c("character", "character", "numeric",
                                 "numeric", "numeric", "numeric",
                                 "numeric", "numeric", "numeric"))

## Formatting the date and time and subseting the data only on 2007-02-01 and 2007-02-02
data_power$timestamp = strptime(paste(data_power$Date, data_power$Time),
                              format="%d/%m/%Y %H:%M:%S", tz="UTC")
startDate = strptime("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="UTC")
endDate = strptime("02/02/2007 23:59:59", format="%d/%m/%Y %H:%M:%S", tz="UTC")
data_power = data_power[data_power$timestamp >= startDate & data_power$timestamp <= endDate, ]

## Creating the plot
png(filename="plot3.png", width=480, height=480 , bg="transparent")
plot(data_power$timestamp, data_power$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(data_power$timestamp, data_power$Sub_metering_2, col="red")
lines(data_power$timestamp, data_power$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lwd=par("lwd"))
dev.off()

