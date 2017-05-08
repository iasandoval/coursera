plot4 = function() {
  
  # plot4.png 480x480 px
  png("plot4.png", width = 480, height = 480, units = "px")
  
  # Create plot3
  
  # Matrix 2x2
  par(mfrow = c(2,2))
  
  # Plot 3.1
  plot(x = sqlData$DateTime, y = sqlData$Global_active_power,
       xlab="", ylab="Global Active Power", type = "l")
  
  # Plot 3.2
  plot(x = sqlData$DateTime, y = sqlData$Voltage,
       xlab="datetime", ylab="Voltage", type = "l")
  
  # Plot 3.3
  plot(x = sqlData$DateTime, y= sqlData$Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  points(sqlData$DateTime, sqlData$Sub_metering_2, col = "red", type = "l")
  points(sqlData$DateTime, sqlData$Sub_metering_3, col = "blue", type = "l")
  legend("topright", bty = "n", lwd = 2,
         col = c("black", "blue", "red"), 
         legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  
  # Plot 3.4
  plot(x = sqlData$DateTime, y = sqlData$Global_reactive_power,
       xlab="datetime", ylab="Global_reactive_power", type = "l")
  
  
  # PNG Device Off
  dev.off()
  
}