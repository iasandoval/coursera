
week1 = function(extractZip = TRUE) {
  
  # Load requiered libs
  loadLibs()
  
  # Download dataset
  datasetDest = downloadDataset()
  
  # Extract Dataset
  if (extractZip) {
    extract(datasetDest)
  }
  
  fileName = "dataset/household_power_consumption.txt"
  assign("fileName",fileName,.GlobalEnv)
  
  print(paste("Reading file", fileName))
  
  # Read all the dataset
  # data = read.csv(fileName, sep = ";")
  
  # Read only a range of dates
  queryString = "select * from file where Date in ('1/2/2007', '2/2/2007')"
  assign("queryString",queryString,.GlobalEnv)
  
  sqlData = read.csv.sql(file = fileName, sql = queryString, sep = ";")
  
  # Create new variable dateTime
  sqlData = mutate(sqlData, DateTime = as.POSIXct(strptime(paste(Date, Time),"%d/%m/%Y %H:%M:%OS")))
  
  assign("sqlData",sqlData,.GlobalEnv)
}

downloadDataset = function() {
  datasetUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  datasetDest = download(datasetUrl, "dataset.zip")
  
  return(datasetDest)
}

# Assign to global environment
toGlobal = function(name, var) {
  assign(name, var, .GlobalEnv)
}

# Extract zip function
extract = function(zipfile) {
  print(paste("Unziping", zipfile))
  unzip(zipfile, files = NULL, list = FALSE, 
        overwrite = TRUE, junkpaths = FALSE, exdir = "./dataset", 
        unzip = "internal", setTimes = FALSE)
}


# Download function
download = function(url, name) {
  
  dirDownload = "dataset/"
  
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
  
  if(!require(sqldf)){
    install.packages("sqldf")
  }
  
  if(!require(dplyr)){
    install.packages("dplyr")
  }
  
  if(!require(lubridate)){
    install.packages("lubridate")
  }
  
  library(sqldf)
  library(dplyr)
  library(lubridate)
}