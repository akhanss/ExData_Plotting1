## Read the data from just those dates of "1/2/2007" and "2/2/2007"
dt.sub <- subset(read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE), Date == "1/2/2007" | Date == "2/2/2007")

date_time <- strptime(paste(dt.sub$Date, dt.sub$Time), "%d/%m/%Y %H:%M:%S")

## Define PNG file with a width of 480 pixels and a height of 480 pixels
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

## Plotting graph
## Global Active Power
plot(date_time, dt.sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Voltage
plot(date_time, dt.sub$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## Energy sub metering
plot(date_time, dt.sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(date_time, dt.sub$Sub_metering_2, type = "l", col = "red")
lines(date_time, dt.sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

## Global_reactive_power
plot(date_time, dt.sub$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()