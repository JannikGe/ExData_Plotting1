getwd()
setwd("~/Studium/datasciencecoursera")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?")
data <- as.data.frame(data)
data$Date <- as.Date(data$Date, "%d/%m/%y")
data$Time <- strptime(data$Time, format = "%H:%M:%S")

sub.data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
    hist(sub.data$Global_active_power,
      xaxt = "n", yaxt = "n",
      ylab = "Frequency",
      xlab = "Global Active Power (kilowatts)",
      main = "Global Active Power",
      col = "red",
      xlim = c(0, 6))
      axis(side = 1, at = c(0,2,4,6))
      axis(side = 2, at = c(0,200,400,600,800,1000,1200))
    dev.off()