plot3 = function() {
  
  # plot3.png 480x480 px
  png("plot3.png", width = 480, height = 480, units = "px")
  
  # Create plot3
  plot(x = sqlData$DateTime, y= sqlData$Sub_metering_1, type = "l", 
       ylab = "Energy sub metering", xlab = "")
  points(sqlData$DateTime, sqlData$Sub_metering_2, col = "red", type = "l")
  points(sqlData$DateTime, sqlData$Sub_metering_3, col = "blue", type = "l")
  legend("topright", bty = "l", lwd=2,
         col = c("black", "blue", "red"), 
         legend= c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
  
  # PNG Device Off
  dev.off()
  
}