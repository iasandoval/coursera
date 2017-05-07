plot2 = function() {
  
  # Create directory "myPlots" if doesn't exist
  if(!dir.exists("myPlots")) {
    dir.create("myPlots")
  }
  
  # plot2.png 480x480 px
  png("myPlots/plot2.png", width = 480, height = 480, units = "px")
  
  # Create plot2
  plot(x = sqlData$DateTime, y= sqlData$Global_active_power, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")

  # PNG Device Off
  dev.off()
  
}