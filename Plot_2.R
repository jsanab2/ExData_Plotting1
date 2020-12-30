## Code to read, select and transform the Household Power Consumption Data
## and create Plot 2

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

## Plot the histogram as a PNG file

hist(power2days$Global_active_power, col = "red", xlab = 
             "Global Active Power (Kilowatts)", ylab = "Frequency", main = 
             "Global Active Power")
png(filename = "Plot 1.png", width = 480, height = 480, units = "px")
plot(power2days$DateTime, power2days$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.off()

