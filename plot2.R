## Code for plot2.R

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
png("plot2.png", width=480, height=480)


## Drawing the plot as a line-type plot. Please note that the weekdays
## are stated in the Dutch language due to my computer-settings.
plot(plotdata$DateTime, plotdata$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

## Closing the graphics device, so the png-file is made.
dev.off()


## End of code plot2.R