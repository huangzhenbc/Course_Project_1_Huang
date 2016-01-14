plot3 <- function() {
  png("plot3.png")
  data <- read.table("household_power_consumption.txt",
                     header = TRUE, sep = ";") ## read data
  selectedData <- data[which(data$Date=="1/2/2007" | data$Date == "2/2/2007"),]
  sm1 <- as.numeric(as.character(selectedData$Sub_metering_1)) ## as numeric
  sm2 <- as.numeric(as.character(selectedData$Sub_metering_2)) ## as numeric
  sm3 <- as.numeric(as.character(selectedData$Sub_metering_3)) ## as numeric
  min <- min(sm1, sm2, sm3)
  max <- max(sm1, sm2, sm3)
  
  plot(ts(sm2), ylab = "Energy sub metering", ylim = c(min, max),
       xaxt = "n", yaxt = "n", col = "red")
  par(new = T)
  plot(ts(sm3), ylab = "Energy sub metering", ylim = c(min, max),
       xaxt = "n", yaxt = "n", col = "blue")
  par(new = T)
  plot(ts(sm1), ylab = "Energy sub metering", ylim = c(min, max),
       xaxt = "n", yaxt = "n")
  par(new = T)
  
  dev.off()
}