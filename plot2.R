plot2 <- function() {
  png("plot2.png")
  data <- read.table("household_power_consumption.txt",
                     header = TRUE, sep = ";") ## read data
  selectedData <- data[which(data$Date=="1/2/2007" | data$Date == "2/2/2007"),]
  ## date <- as.Date(selectedData$Date, "%d/%m/%y%y") ## change to date format
  ## day <- lapply(selectedData$Date, substr, start = 1, stop = 1)
    ## day: "1" -- 1/2/2007, "2" -- 2/2/2007; select substr 1-1
  ## day <- (as.numeric(day) - 1) * 1440 ## This transfer is for easier comb with time
  ## time <- as.ts(selectedData$Time)
  ## day_time <- day + time
  ## weekday <- weekdays(date)
  gap <- as.numeric(as.character(selectedData$Global_active_power)) ## as numeric
  plot(ts(gap), xlab = "", ylab = "Global Active Power(kilowatts)", xaxt = "n")
  
  dev.off()
}