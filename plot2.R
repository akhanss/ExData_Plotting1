## Read the data from just those dates of "1/2/2007" and "2/2/2007"
dt.sub <- subset(read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE), Date == "1/2/2007" | Date == "2/2/2007")

date_time <- strptime(paste(dt.sub$Date, dt.sub$Time), "%d/%m/%Y %H:%M:%S")
global_active_power <- dt.sub$Global_active_power

## Define PNG file with a width of 480 pixels and a height of 480 pixels
png("plot2.png", width = 480, height = 480)

## Plotting graph
plot(date_time, global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()