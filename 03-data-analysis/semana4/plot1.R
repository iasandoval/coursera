plot1 = function() {
  
  # plot1.png 480x480 px
  png("plot1.png", width = 480, height = 480, units = "px")
  
  # Aggregate total PM2.5 by year
  aggTotal = aggregate(Emissions ~ year,NEI, sum)
  
  # Create plot1
  barplot(
    (aggTotal$Emissions)/10^6,
    names.arg=aggTotal$year,
    col = heat.colors(4),
    xlab="",
    ylab="PM2.5 Emissions (10^6 Tons)",
    main="Total PM2.5 Emissions From All US Sources"
  )
  
  # PNG Device Off
  dev.off()
  
}