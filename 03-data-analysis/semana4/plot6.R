plot6 = function() {
  
  # plot6.png 800x480 px
  png("plot6.png", width = 800, height = 480, units = "px")
  
  # Subset motor vehicles related NEI data
  subsetBaLA = subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")
  subsetBaLA$City = ifelse(subsetBaLA$fips == "24510", "Baltimore", "Los Angeles")
  
  # Create plot6
  p6 = ggplot(subsetBaLA, aes(x=factor(year), y=Emissions, fill=City)) +
    geom_bar(stat="identity") + 
    facet_grid(City  ~ ., scales="free") +
    labs(x="", y="Total PM2.5 Emission") + 
    labs(title="PM2.5 Motor Vehicle Emissions, Baltimore and LA from 1999-2008")
  
  print(p6)
  
  # PNG Device Off
  dev.off()
  
}