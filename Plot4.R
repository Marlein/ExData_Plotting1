## Code for plot4.R

##Setting the working directory
setwd("C:/for_reasons_of_privacy_the_pathname_has_been_deleted")

## Downloading and unzipping the datafile, so in the working directory
## the file  "household_power_consumption.txt" will be created
url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(url,destfile = "data.zip")
unzip("data.zip")

## Reading in the data and selecting the 1st and 2nd february of 2007
fulldata <- read.delim("household_power_consumption.txt", header = TRUE, 
                       sep = ";", na.strings = "?")
plotdata <- fulldata[fulldata$Date %in% c("1/2/2007", "2/2/2007"),]  

## Adding a new column to plotdata with Date and Time combined
plotdata$DateTime <- strptime(paste(plotdata$Date, plotdata$Time, sep=" "), 
                              format="%d/%m/%Y %H:%M:%S")



## Open graphics-device png and setting dimensions of png-file
png("plot4.png", width=480, height=480)

## Setting the parameters so there will be a 2 by 2 matrix to display
## the four graphics
par(mfrow = c(2,2))

## Drawing the 1st plot as a line-type plot. Please note that the weekdays
## are stated in the Dutch language due to my computer-settings.
plot(plotdata$DateTime, plotdata$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power")

## Drawing the 2nd plot as a line-type plot.
plot(plotdata$DateTime, plotdata$Voltage , type="l", xlab="datetime", 
     ylab="Voltage")

## Drawing the 3nd plot as a line-type plot. Please note that the weekdays
## are stated in the Dutch language due to my computer-settings.
## Note that the line around the border is removed with 'bty = "n".
plot(plotdata$DateTime, plotdata$Sub_metering_1 , type="l", xlab="", 
     ylab="Energy sub metering")
lines(plotdata$DateTime, plotdata$Sub_metering_2, type = "l", col = ("red"))
lines(plotdata$DateTime, plotdata$Sub_metering_3, type = "l", col = ("blue"))

legend("topright", lty = c(1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

## Drawing the 4th plot.
plot(plotdata$DateTime, plotdata$Global_reactive_power , type="l", xlab="datetime", 
     ylab="Global_reactive_power")

## Closing the graphics device, so the png-file is made.
dev.off()


## End of code plot4.R
