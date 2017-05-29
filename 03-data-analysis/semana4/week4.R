
week4 = function() {
  
  # Load requiered libs
  loadLibs()
  
  # Download dataset
  datasetDest = downloadDataset()
  
  # Extract Dataset
  extract(datasetDest)
  
  NEIName = "NEI_data/summarySCC_PM25.rds"
  SCCName = "NEI_data/Source_Classification_Code.rds"
  toGlobal(NEIName)
  toGlobal(SCCName)
  
  # Read all the dataset
  print(paste("Reading file", NEIName))
  NEI = readRDS(NEIName)
  toGlobal(NEI)
  
  print(paste("Reading file", SCCName))
  SCC = readRDS(SCCName)
  toGlobal(SCC)
  
  
}

downloadDataset = function() {
  datasetUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  datasetDest = download(datasetUrl, "NEI_data.zip")
  
  return(datasetDest)
}

# Assign to global environment
toGlobal = function(var) {
  name = deparse(substitute(var))
  assign(name, var, .GlobalEnv)
}

# Extract zip function
extract = function(zipfile) {
  print(paste("Unziping", zipfile))
  unzip(zipfile, files = NULL, list = FALSE, 
        overwrite = TRUE, junkpaths = FALSE, exdir = "./NEI_data", 
        unzip = "internal", setTimes = FALSE)
}


# Download function
download = function(url, name) {
  
  dirDownload = "NEI_data/"
  
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