plot4 <- function() {
  
  #Assign the file variable name
  file <- "./data/household_power_consumption.txt"
  
  #Read data from file and modify date and time classes
  data <- read.table(file, header = TRUE, stringsAsFactors = FALSE, sep = ";")
  
  #Filter the adequate dates
  filterData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  
  #Select graph data
  timeANDdate <- strptime(paste(filterData$Date, filterData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  
  globalActive <- as.numeric(filterData$Global_active_power)
  globalReactive <- as.numeric(filterData$Global_reactive_power)
  voltage <- as.numeric(filterData$Voltage)
  
  subMeter1 <- as.numeric(filterData$Sub_metering_1)
  subMeter2 <- as.numeric(filterData$Sub_metering_2)
  subMeter3 <- as.numeric(filterData$Sub_metering_3)
  
  png(filename = "plot4.png", height=480, width=480)
  par(mfrow=c(2,2))
  
  #Plot graphics
  plot(timeANDdate, globalActive, ylab = "Global Active Power", xlab = "", type = "l")
  
  plot(timeANDdate, voltage, type = "l", xlab = "datetime", ylab="Voltage")
  
  plot(timeANDdate, subMeter1, type = "l", ylab = "Energy sub metering", xlab = "")
  points(timeANDdate, subMeter2, type = "l", col = "red")
  points(timeANDdate, subMeter3, type = "l", col = "blue")
  legend("topright", c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"), lty = 1, lwd = 2, col=c("black", "red", "blue"))
  
  plot(timeANDdate, globalReactive, xlab = "datetime", ylab = "Global Reactive Power", type = "l")
  
  dev.off()
  
}