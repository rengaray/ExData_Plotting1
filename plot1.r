## Coursera - Exploratory Data Analysis - Plotting Assignment 1
## 08/08/2015
## This code plot1.R is used to generate chart for household global minute-averaged active power (in kilowatt) against Frequency across the two days 01/02/2007 to 02/02/2007
## The outcome is saved in plot1.png

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

## Formatting the date and subsetting the data only on 2007-02-01 and 2007-02-02
data_power$Date = as.Date(data_power$Date, format="%d/%m/%Y")
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
data_power = data_power[data_power$Date >= startDate & data_power$Date <= endDate, ]

## Generating the plot
png(filename="plot1.png", width=480, height=480 , bg="transparent")
hist(data_power$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red")
dev.off()