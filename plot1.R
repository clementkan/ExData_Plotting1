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

# Open png graphics device
png(filename = "plot1.png", width = 480, 
    height = 480, units = "px")

# Plot graph
hist(data2$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

# close device
dev.off()