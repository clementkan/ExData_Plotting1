# Download and unzip file
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
unlink("household_power_consumption.zip") #Delete redundant zip file

# Read data into R
data1 <- read.table("household_power_consumption.txt", header = TRUE, 
                    sep = ";", na.strings = "?")

# Extract required dataset, dates == c("2007-02-01", "2007-02-02")
# Date variable is factor class 
data2 <- data1[data1$Date %in% c("1/2/2007", "2/2/2007"),]

# Convert variable "Time" to time class 
data2$Time <- strptime(paste(data2$Date, data2$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

# Open png graphics device
png(filename = "plot3.png", width = 480, 
    height = 480, units = "px")

# Plot graph
plot(data2$Time, data2$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data2$Time, data2$Sub_metering_2, type = "l", col = "red")
lines(data2$Time, data2$Sub_metering_3, type = "l", col = "blue")

# Plot legend
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colour <- c("black", "red", "blue")
legend("topright", legend = labels, col = colour, lty = 1)

# close device
dev.off()