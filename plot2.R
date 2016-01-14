plot2 <- function() {
  png("plot2.png")
  data <- read.table("household_power_consumption.txt",
                     header = TRUE, sep = ";") ## read data
  selectedData <- data[which(data$Date=="1/2/2007" | data$Date == "2/2/2007"),]
  gap <- as.numeric(as.character(selectedData$Global_active_power)) ## as numeric
  plot(ts(gap), xlab = "", ylab = "Global Active Power(kilowatts)", xaxt = "n")
  
  dev.off()
}