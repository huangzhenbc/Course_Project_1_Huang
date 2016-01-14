plot4 <- function() {
  png("plot4.png")
  data <- read.table("household_power_consumption.txt",
                     header = TRUE, sep = ";") ## read data
  selectedData <- data[which(data$Date=="1/2/2007" | data$Date == "2/2/2007"),]
  
  gap <- as.numeric(as.character(selectedData$Global_active_power)) ## screen 1
  vol <- as.numeric(as.character(selectedData$Voltage)) ## screen 2
  sm1 <- as.numeric(as.character(selectedData$Sub_metering_1)) ## screen 3
  sm2 <- as.numeric(as.character(selectedData$Sub_metering_2)) ## screen 3
  sm3 <- as.numeric(as.character(selectedData$Sub_metering_3)) ## screen 3
  min <- min(sm1, sm2, sm3) ## screen 3
  max <- max(sm1, sm2, sm3) ## screen 3
  grp <- as.numeric(as.character(selectedData$Global_reactive_power)) ## screen 4
  
  split.screen(c(2,2)) ## split screen
  screen(1)
  plot(ts(gap), xlab = "", ylab = "Global Active Power(kilowatts)", xaxt = "n")
  screen(2)
  plot(ts(vol), xlab = "", ylab = "Voltage", xaxt = "n")
  screen(3)
  plot(ts(sm2), ylab = "Energy sub metering", ylim = c(min, max),
       xaxt = "n", yaxt = "n", col = "red")
  par(new = T)
  plot(ts(sm3), ylab = "Energy sub metering", ylim = c(min, max),
       xaxt = "n", yaxt = "n", col = "blue")
  par(new = T)
  plot(ts(sm1), ylab = "Energy sub metering", ylim = c(min, max),
       xaxt = "n", yaxt = "n")
  par(new = T)
  screen(4)
  plot(ts(grp), xlab = "", ylab = "Global_reactive_power", xaxt = "n")
  
  dev.off()
}