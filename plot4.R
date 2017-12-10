#read data from file
dataFile <- "./Consumtion/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#prepare data for plotting
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gActivePower <- as.numeric(subSetData$Global_active_power)
gReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
sMetering1 <- as.numeric(subSetData$Sub_metering_1)
sMetering2 <- as.numeric(subSetData$Sub_metering_2)
sMetering3 <- as.numeric(subSetData$Sub_metering_3)

#plot
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, gActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sMetering1, type="l", ylab="Energy sMetering", xlab="")
lines(datetime, sMetering2, type="l", col="red")
lines(datetime, sMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, gReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()