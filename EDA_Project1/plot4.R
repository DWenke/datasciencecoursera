# Read Electric Power Consumption file
EPC_DataFile <- "./household_power_consumption.txt"
data <- read.table(EPC_DataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Filter the data for only the dates to be used
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Creating Plot4 for Electric Power Consumption
# This plot consists of 4 separate charts
#  
# Setting up the variables for plotting
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# Plotting the 4 charts
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
# Plot1 - Global Active Power Y-Axis, DateTime X-Axis
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#Plot2 - Voltage Y-Axis, DateTime X-Axis
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Plot3 - Energy sub metering Y-Axis, DateTime X-Axis
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#Plot4 - Global Reactive Power Y-Axis, DateTime X-Axis
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()