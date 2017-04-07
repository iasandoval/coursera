semana1quiz <- function() {
  
  # 1
  # The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
  # and load the data into R. The code book, describing the variable names is here:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
  
  download("CSV", "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "semana1", "ss06hid")
  download("PDF", "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf", "semana1", "PUMSDataDict06")
  
  
  # How many properties are worth $1,000,000 or more?
  
  # 2
  # Use the data you loaded from Question 1. 
  # Consider the variable FES in the code book. 
  # Which of the "tidy data" principles does this variable violate?
  
  # 3
  # Download the Excel spreadsheet on Natural Gas Aquisition Program here:
  download("XLS", "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", "semana1", "DATA_gov_NGA")

  # Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
  # dat
  
  # What is the value of:
  # sum(dat$Zip*dat$Ext,na.rm=T)
  
  # 4
  # Read the XML data on Baltimore restaurants from here:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
  # How many restaurants have zipcode 21231?
  download("XML", "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", "semana1", "restaurants")
  
  # 5
  # The American Community Survey distributes downloadable data about United States communities. 
  # Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
  
  download("CSV", "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "semana1", "ss06pid")
  
  
  # using the fread() command load the data into an R object
  # DT
  # The following are ways to calculate the average value of the variable
  # pwgtp15
  # broken down by sex. Using the data.table package, which will deliver the fastest user time?
}

download <- function(type, url, location, name) {
  
  if(type == "CSV") {
    dest = paste(location, "/", name, ".csv", sep = "")
  } else if(type == "XLS") {
    dest = paste(location, "/", name, ".xlsx", sep = "")
  } else if(type == "XML") {
    dest = paste(location, "/", name, ".xml", sep = "")
  } else if(type == "PDF") {
    dest = paste(location, "/", name, ".pdf", sep = "")
  } else {
    # Error
    stop("Tipo de archivo invalido")
  }
  
  download.file(url, destfile=dest)
  
}

