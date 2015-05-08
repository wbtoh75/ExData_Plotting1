##Set your working directory to the folder where the data file is located
## using the "setwd" function 

##load the data
##Formatting the NA from "?" and delimiter as ";"
dt <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
subDT <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

##Plotting the chart and exporting file to PNG
datetime <- strptime(paste(subDT$Date, subDT$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subDT$Global_active_power)
subM1 <- as.numeric(subDT$Sub_metering_1)
subM2 <- as.numeric(subDT$Sub_metering_2)
subM3 <- as.numeric(subDT$Sub_metering_3)
png("plot3.png", width=480, height=480)
##plotting black line
plot(datetime, subM1, type="l", ylab="Energy Submetering", xlab="")
##plotting red line
lines(datetime, subM2, type="l", col="red")
##plotting blue line
lines(datetime, subM3, type="l", col="blue")
##creating the legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()