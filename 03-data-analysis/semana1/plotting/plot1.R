plot1 = function() {
  
  # plot1.png 480x480 px
  png("plot1.png", width = 480, height = 480, units = "px")
  
  # Create plot1
  hist(sqlData$Global_active_power, 
       col="red", ylim=c(0,1200), 
       main="Global Active Power", 
       ylab="Frequency", 
       xlab="Global Active Power (kilowatts)")
  
  # PNG Device Off
  dev.off()
  
}