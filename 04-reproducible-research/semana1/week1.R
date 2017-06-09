
week1 = function() {
  
  # Load requiered libs
  loadLibs()
  
  # Download dataset
  datasetDest = downloadDataset()
  
  dataName = "data/payments.csv"
  toGlobal(dataName)
  
  # Read all the dataset
  print(paste("Reading file", dataName))
  payments = read.csv(dataName)
  toGlobal(payments)
  
  plot1()
  
  plot2()
  
  
}


plot1 = function() {
  # plot1.png 480x480 px
  png("plot1.png", width = 480, height = 480, units = "px")
  
  # Subset NY
  subsetNY = subset(payments, Provider.State == "NY")
  toGlobal(subsetNY)
  
  # Create plot1
  p1 = ggplot(subsetNY, aes(x=Average.Total.Payments/10, y=Average.Covered.Charges/10)) +
       geom_point() +
       stat_smooth(method = "lm") +
       labs(x="Mean Total Payments/10", y="Mean Covered Charges/10") + 
       labs(title="Relationship between mean covered charges and mean total payments in New York")
  
  print(p1)
  
  # PNG Device Off
  dev.off()
}

plot2 = function() {
  # plot2.png 480x480 px
  png("plot2.png", width = 480, height = 900, units = "px")
  
  # Create plot1
  p2 = ggplot(payments, aes(x=Average.Total.Payments/10, y=Average.Covered.Charges/10, color=DRG.Definition)) +
    geom_point() +
    stat_smooth(method = "lm") +
    facet_grid(Provider.State~.) +
    theme(legend.position="top") +
    labs(x="Mean Total Payments/10", y="Mean Covered Charges/10") + 
    labs(title="Relationship between mean covered charges and mean total payments in New York")
  
  print(p2)
  
  # PNG Device Off
  dev.off()
}

downloadDataset = function() {
  datasetUrl = "https://d18ky98rnyall9.cloudfront.net/_e143dff6e844c7af8da2a4e71d7c054d_payments.csv?Expires=1496707200&Signature=YKrgQ8fxrxedFOZXDgz32BoPhPq6waR1M~yYCP6sGNTvxGB019DJVaBiq7LGBFGPmlzXecYbypgoafRsNIQ0Wqol80MsNZmg2TCVj1vxLHbvNyh5~zJV0DkgM7rH3zhE8ml~m4YWSON2wBF9ee9eKDgXjtqLL2oizg59GM8vzXA_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A"
  datasetDest = download(datasetUrl, "payments.csv")
  
  return(datasetDest)
}

# Assign to global environment
toGlobal = function(var) {
  name = deparse(substitute(var))
  assign(name, var, .GlobalEnv)
}

# Download function
download = function(url, name) {
  
  dirDownload = "data/"
  
  if(!dir.exists(dirDownload)) {
    dir.create(dirDownload)
  }
  
  dest = paste(dirDownload, name, sep= "")
  
  if(!file.exists(dest)) {
    print(paste("Downloading", dest))
    download.file(url, destfile=dest, method="wininet", mode = "wb")
  }
  
  return(dest)
}

# Load libs
loadLibs = function() {
  
  if(!require(ggplot2)){
    install.packages("ggplot2")
  }
  
  library(ggplot2)
}