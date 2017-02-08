## Code for plot1.R

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


## Open graphics-device png and setting dimensions of png-file
png("plot1.png", width=480, height=480)


## Drawing the histogram with red color, and main and labels for x-ax.
hist(plotdata$Global_active_power, col = "red", main = "Global Active Power", 
     ylim = c(0, 1300), xlab = "Global Active Power (kilowatts)")

## Closing the graphics device, so the png-file is made.
dev.off()

## End of code plot1.R