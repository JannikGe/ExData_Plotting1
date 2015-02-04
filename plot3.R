getwd()
setwd("~/Studium/datasciencecoursera")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
data <- as.data.frame(data)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$date.time <- paste(data$Date, data$Time, sep = " ")
data$date.time <- as.POSIXct(data$date.time)

png(filename = "plot3.png",
    width = 480, height = 480, units = "px")
  plot(data$date.time, data$Sub_metering_1, type ="n",
       ylab = "Energy sub meetering", xlab = "")
  lines(data$date.time, data$Sub_metering_1, col = "black")
  lines(data$date.time, data$Sub_metering_2, col = "red")
  lines(data$date.time, data$Sub_metering_3, col = "blue")
  legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"),
         c("Sub_meetering_1", "Sub_meetering_2", "Sub_meetering_3"))
  dev.off()

