# Put the data from the file in a dataframe
table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Filter the data to only include the two days
specificDateTable <- subset(table,Date == "1/2/2007" | Date == "2/2/2007")

specificDateTable[["Date"]] <- as.Date(specificDateTable[["Date"]], format = "%d/%m/%Y")

# Create a png file and add 4 graphs to the file
png("plot4.png", width = 480, height = 480)

plot(specificDateTable[["Global_active_power"]], type = "l",
     xlab = "Thurs through Sat",
     xaxt = "n",
     ylab = "Global Active Power (kilowatts)")
#axis(1, at = specificDateTable[["Date"]], labels = format(weekdays(specificDateTable[["Date"]])),"%a")

dev.copy(png,"plot4.png")
dev.off()

plot(specificDateTable[["Voltage"]], type = "l",
     xlab = "datetime - Thurs through Sat",
     xaxt = "n",
     ylab = "Voltage")

dev.copy(png,"plot4.png")
dev.off()

plot(specificDateTable[["Sub_metering_1"]], type = "l",
     xlab = "Thurs through Sat",
     xaxt = "n",
     ylab = "Energy sub metering")
lines(specificDateTable[["Sub_metering_2"]], col = "red")
lines(specificDateTable[["Sub_metering_3"]], col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "green"), lty = 1)

#axis(1, at = specificDateTable[["Date"]], labels = format(weekdays(specificDateTable[["Date"]])),"%a")

dev.copy(png,"plot4.png")
dev.off()

plot(specificDateTable[["Global_reactive_power"]], type = "l",
     xlab = "datetime - Thurs through Sat",
     xaxt = "n",
     ylab = "Global_reactive_power")

#axis(1, at = specificDateTable[["Date"]], labels = format(weekdays(specificDateTable[["Date"]])),"%a")

dev.copy(png,"plot4.png")
dev.off()