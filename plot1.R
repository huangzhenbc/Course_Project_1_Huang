plot1 <- function() {
  png("plot1.png")
  data <- read.table("household_power_consumption.txt",
                     header = TRUE, sep = ";") ## read data
  selectedData <- data[which(data$Date=="1/2/2007" | data$Date == "2/2/2007"),]
  gap <- as.numeric(as.character(selectedData$Global_active_power)) ## as numeric
  hist(
    gap, breaks = 12, freq = TRUE, col = "red", main = "Global Active Power",
    xlab = "Global Active Power (kilowatts)"
  ) ## the graph
  
  dev.off()
}