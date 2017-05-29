plot4 = function() {
  
  # plot4.png 480x480 px
  png("plot4.png", width = 480, height = 480, units = "px")
  
  # Subset coal combustion related NEI data
  coal = grepl("coal", SCC$EI.Sector, ignore.case=TRUE)
  coalSCC = SCC[coal,]$SCC
  subsetCoal = NEI[NEI$SCC %in% coalSCC,]
  
  # Create plot4
  p4 = ggplot(subsetCoal, aes(x=factor(year), y=Emissions/10^5)) +
        geom_bar(stat="identity", fill=heat.colors(length(subsetCoal$Emissions))) +
        labs(x="", y="Total PM2.5 Emission (10^5 Tons)") + 
        labs(title="PM2.5 Coal Combustion Emissions Across US from 1999-2008")
  
  print(p4)
  
  # PNG Device Off
  dev.off()
  
}