plot5 = function() {
  
  # plot5.png 480x480 px
  png("plot5.png", width = 480, height = 480, units = "px")
  
  # Subset motor vehicles related NEI data
  subsetVehBalt = subset(NEI, (fips == "24510") & type == "ON-ROAD")

  # Create plot5
  p5 = ggplot(subsetVehBalt, aes(x=factor(year), y=Emissions)) +
    geom_bar(stat="identity", fill=heat.colors(length(subsetVehBalt$Emissions))) +
    labs(x="", y="Total PM2.5 Emission") + 
    labs(title="PM2.5 Motor Vehicle Emissions in Baltimore from 1999-2008")
  
  print(p5)
  
  # PNG Device Off
  dev.off()
  
}