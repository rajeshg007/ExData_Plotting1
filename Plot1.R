# Required Packages
library(sqldf)

# Assuming that the data is present in "data" folder inside your Working directory
dataFile <- "./data/household_power_consumption.txt"

# create an sql to extract only the required data
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
myData <- read.csv.sql(dataFile,mySql,header = TRUE,sep = ";")

globalActivePower <- as.numeric(myData$Global_active_power)

png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()