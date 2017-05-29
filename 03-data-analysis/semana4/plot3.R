plot3 = function() {
  
  # plot3.png 800x480 px
  png("plot3.png", width = 800, height = 480, units = "px")
  
  # Subset of baltimore
  baltimore = subset(NEI, fips == "24510")
  
  # Create plot3
  p3 = ggplot(baltimore, aes(factor(year), Emissions, fill=type)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE) +
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="", y="Total PM2.5 Emission") + 
        labs(title="PM2.5 Emissions, Baltimore 1999-2008 by Source Type")
  
  print(p3)
  
  # PNG Device Off
  dev.off()
  
}