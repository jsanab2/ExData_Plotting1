## Code to read, select and transform the Household Power Consumption Data
## and create Plot 3

##Set the working directory
setwd("~/Desktop/datasciencecoursera/Exploratory Data Analysis/week 1 assignment")


## Read the file, label NAs

power <- read.csv("household_power_consumption.txt", header = TRUE, 
                  na.strings = "?", sep = ";" , dec = ".")

## Remove NAs
power <- na.omit(power)

## Unite Data & Time vectors and transform in POXIXLt format creating a new vector
united_DateTime <- paste(power$Date, power$Time)
DateTime <- strptime(united_DateTime, "%d/%m/%Y %H:%M:%S")
power$DateTime <- DateTime

## Subset required data
power2days <- power[as.Date(power$DateTime) == "2007-02-01" | 
                            as.Date(power$DateTime) == "2007-02-02",   ]

## Plot the line graph as a PNG file

png(filename = "Plot 3.png", width = 480, height = 480, units = "px")
plot(power2days$DateTime, power2days$Sub_metering_1, type="l", xlab="", 
     ylab="Energy sub metering")
lines(power2days$DateTime, power2days$Sub_metering_2, type="l", xlab="", 
      ylab="Energy sub metering", col="red")
lines(power2days$DateTime, power2days$Sub_metering_3, type="l", xlab="", 
      ylab="Energy sub metering", col="blue")
legend("topright", pch="_", col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()

