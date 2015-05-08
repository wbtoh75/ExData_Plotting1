##Set your working directory to the folder where the data file is located
## using the "setwd" function 

##load the data
##Formatting the NA from "?" and delimiter as ";"
dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
subDT <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

##Plotting the chart and exporting file to PNG
datetime <- strptime(paste(subDT$Date, subDT$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subDT$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()