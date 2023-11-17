# Put the data from the file in a dataframe
table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Filter the data to only include the two days and in date format
specificDateTable <- subset(table,Date == "1/2/2007" | Date == "2/2/2007")
specificDateTable[["Date"]] <- as.Date(specificDateTable[["Date"]], format = "%d/%m/%Y")

# Create a png file and add a line graph to the file
png("plot2.png", width = 480, height = 480)
plot(specificDateTable[["Global_active_power"]], type = "l",
     xlab = "Thurs through Sat",
     xaxt = "n",
     ylab = "Global Active Power (kilowatts)")
#axis(1, at = specificDateTable[["Date"]], labels = format(weekdays(specificDateTable[["Date"]])),"%a")
dev.off()