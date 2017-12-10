#read data from file
dataFile <- "./consumtion/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#prepare data for plotting
gActivePower <- as.numeric(subSetData$Global_active_power)

#plot
png("plot1.png", width=480, height=480)
hist(gActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()