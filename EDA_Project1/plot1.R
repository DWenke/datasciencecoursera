# Read Electric Power Consumption file
EPC_DataFile <- "./household_power_consumption.txt"
data <- read.table(EPC_DataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# Filter the data for only the dates to be used
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Creating Plot1 for Electric Power Consuption
#  Histogram, Y-Axis Frequency, X-Axis Kilowatts
#  Setting up the variable for plotting
globalActivePower <- as.numeric(subSetData$Global_active_power)
# Plotting the chart
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()