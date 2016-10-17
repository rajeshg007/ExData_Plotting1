# Required Packages
library(sqldf)

# Assuming that the data is present in "data" folder inside your Working directory
dataFile <- "./data/household_power_consumption.txt"

# create an sql to extract only the required data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(dataFile,mySql,header = TRUE,sep = ";")

# Extract data for Global Active Power 
globalActivePower <- as.numeric(myData$Global_active_power)

# Extract datetime values
datetime <- strptime(paste(myData$Date, myData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#set the parameters for the image
png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()