plot2 <- function() {
  
  #Assign the file variable name
  file <- "./data/household_power_consumption.txt"
  
  #Read data from file and modify date and time classes
  data <- read.table(file, header = TRUE, stringsAsFactors = FALSE, sep = ";")
      
  #Filter the adequate dates
  filterData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  
  #Select graph data
  timeANDdate <- strptime(paste(filterData$Date, filterData$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
  graphData <- as.numeric(filterData$Global_active_power)
  
  png(filename = "plot2.png", height=480, width=480)
  
  plot(timeANDdate, graphData, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  
  dev.off()
  
}