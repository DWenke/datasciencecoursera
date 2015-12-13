# Read Electric Power Consumption file
EPC_DataFile <- "./household_power_consumption.txt"
data <- read.table(EPC_DataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Filter the data for only the dates to be used
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Creating Plot3 for Energy Power Consumption
#  Y-Axis Energy Sub Metering, X-Axis DateTime
#  Setting up the variables for plotting
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Plotting the chart
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# Creating legend placement and content
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()