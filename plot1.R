# Put the data from the file in a dataframe
table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

# Filter the data to only include the two days
specificDateTable <- subset(table,Date == "1/2/2007" | Date == "2/2/2007")

# Create a png file and add a histogram to the file
png("plot1.png", width = 480, height = 480)
hist(as.numeric(specificDateTable[["Global_active_power"]]),
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()