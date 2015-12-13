# Read Electric Power Consumption file
EPC_DataFile <- "./household_power_consumption.txt"
data <- read.table(EPC_DataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Filter the data for only the dates to be used
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Creating Plot2 for Energy Powr Consumption
#  Y-Axis Kilowatts, X-Axis DateTime
#  Setting up the variables for plotting
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
# Plotting the chart
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
