plot2 = function() {
  
  # plot2.png 480x480 px
  png("plot2.png", width = 480, height = 480, units = "px")
  
  # Subset of baltimore
  baltimore = subset(NEI, fips == "24510")
  
  # Aggregate total PM2.5 by year
  aggBaltByYear = aggregate(Emissions~year, baltimore, sum)
  
  # Create plot2
  barplot(
    aggBaltByYear$Emissions,
    names.arg = aggBaltByYear$year,
    col = heat.colors(4),
    ylim = c(0, 3500),
    xlab="Year",
    ylab="PM2.5 Emissions",
    main="Total PM2.5 Emissions From All Baltimore Sources"
  )
  
  # PNG Device Off
  dev.off()
  
}