getwd()
setwd("~/Studium/datasciencecoursera")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
data <- as.data.frame(data)
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$date.time <- paste(data$Date, data$Time, sep = " ")
data$date.time <- as.POSIXct(data$date.time)

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
  plot(data$date.time, data$Global_active_power, type ="l",
  lwd = 0.5,
  ylab = "Global Active Power (kilowatts)",
  xlab = " "
  )
  dev.off()

