# Required Packages
library(sqldf)

# Assuming that the data is present in "data" folder inside your Working directory
dataFile <- "./data/household_power_consumption.txt"

# create an sql to extract only the required data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(dataFile,mySql,header = TRUE,sep = ";")

# Extract data for Global Active Power 
globalActivePower <- as.numeric(myData$Global_active_power)

# Extract data for global reactive power
globalReactivePower <- as.numeric(myData$Global_reactive_power)

# Extract datetime values
datetime <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Extract data for Sub Meter 1
subMetering1 <- as.numeric(myData$Sub_metering_1)
# Extract data for Sub Meter 2
subMetering2 <- as.numeric(myData$Sub_metering_2)
# Extract data for Sub Meter 3
subMetering3 <- as.numeric(myData$Sub_metering_3)

# Extract Voltage
voltage <- as.numeric(myData$Voltage)

#set the parameters for the image
png("plot4.png", width=480, height=480)

# set the image parameters
par(mfrow = c(2,2)) 

#first Plot same as Plot1.png
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#second Plot for voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# 3rd plot same as Plot3.png
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMetering2, type="l", col="red")

lines(datetime, subMetering3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# 4th plot for reactive power
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()