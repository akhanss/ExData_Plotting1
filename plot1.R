## Download the dataset
fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destFile <- "./household_power_consumption.zip"
download.file(fileUrl, destFile, method = "curl")

## Unzip the dataset
unzip("./household_power_consumption.zip")

## Read the data from just those dates of "1/2/2007" and "2/2/2007"
dt.sub <- subset(read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE), Date == "1/2/2007" | Date == "2/2/2007")

## Define PNG file with a width of 480 pixels and a height of 480 pixels
png("plot1.png", width=480, height=480)

## Plotting graph
hist(dt.sub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()