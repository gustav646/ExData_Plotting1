plot1 <- function() {

  #Assign the file variable name
  file <- "./data/household_power_consumption.txt"
  
  #Read data from file and modify date and time classes
  data <- read.table(file, header = TRUE, stringsAsFactors = FALSE, sep = ";")
  
  #Filter the adequate dates
  filterData <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
  
  #Select graph data
  graphData <- as.numeric(filterData$Global_active_power)
  
  png(filename = "plot1.png", height=480, width=480)
  
  hist(graphData, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
  
  dev.off()

}