semana1quiz <- function() {
  
  loadLibs()
  
  # 1
  # The American Community Survey distributes downloadable data about United States communities. 
  # Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
  # and load the data into R. 
  # The code book, describing the variable names is here:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
  
  ss06hidDest = download("CSV", "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", "semana1", "ss06hid")
  PUMSDataDict = download("PDF", "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf", "semana1", "PUMSDataDict06")
  
  print(paste("Reading file", ss06hidDest))
  ss06hidData = read.csv(ss06hidDest)
  assign("ss06hidData",ss06hidData,.GlobalEnv)
  
  # How many properties are worth $1,000,000 or more?
  val = sum(ss06hidData$VAL == 24, na.rm = TRUE)
  print("How many properties are worth $1,000,000 or more?")
  print(val)
  
  # 2
  # Use the data you loaded from Question 1. 
  # Consider the variable FES in the code book. 
  # Which of the "tidy data" principles does this variable violate?
  
  print("Which of the 'tidy data' principles does this variable violate?")
  # Hacer count de cada variable
  c = as.data.frame(table(ss06hidData$FES))
  print(c)
  
  # Why?
  print("Tidy data has one variable per column.")
  
  # 3
  # Download the Excel spreadsheet on Natural Gas Aquisition Program here:
  DATANGADest = download("XLS", "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx", "semana1", "DATA_gov_NGA")
  print(paste("Reading file", DATANGADest))
  # Read rows 18-23 and columns 7-15 into R and assign the result to a variable called: dat
  dat = read.xlsx(DATANGADest, sheet=1, rows = 18:23, cols = 7:15)
  assign("dat",dat,.GlobalEnv)
  
  # What is the value of:
  # sum(dat$Zip*dat$Ext,na.rm=T)
  print("What is the value of: sum(dat$Zip*dat$Ext,na.rm=T)")
  ques3 = sum(dat$Zip*dat$Ext,na.rm=T)
  assign("ques3",ques3,.GlobalEnv)
  print(ques3)
  
  # 4
  # Read the XML data on Baltimore restaurants from here:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
  restaurantsDest = download("XML", "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", "semana1", "restaurants")
  print(paste("Reading file", restaurantsDest))
  restaurantsDoc = xmlTreeParse(restaurantsDest, useInternal=TRUE)
  assign("restaurantsDoc",restaurantsDoc,.GlobalEnv)
  
  # How many restaurants have zipcode 21231?
  print("How many restaurants have zipcode 21231?")
  rootNode <- xmlRoot(restaurantsDoc)
  zc = xpathSApply(rootNode, "//zipcode", xmlValue)
  zc21231 = sum(zc == 21231)
  print(zc21231)
  
  # 5
  # The American Community Survey distributes downloadable data about United States communities. 
  # Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv
  ss06pidDest = download("CSV", "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", "semana1", "ss06pid")
  
  # using the fread() command load the data into an R object: DT
  print(paste("Reading file", ss06pidDest))
  DT = fread(ss06pidDest)
  assign("DT",DT,.GlobalEnv)
  
  # The following are ways to calculate the average value of the variable
  # pwgtp15
  # broken down by sex. 
  # Using the data.table package, which will deliver the fastest user time?
  
  # mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
  print("mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)")
  t1 = system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2,]$pwgtp15))
  message(sprintf("Elapsed time: %.10f", t1[3]))
  
  # DT[,mean(pwgtp15),by=SEX]
  print("DT[,mean(pwgtp15),by=SEX]")
  t2 = system.time(DT[,mean(pwgtp15),by=SEX])
  message(sprintf("Elapsed time: %.10f", t2[3]))
  
  # mean(DT$pwgtp15,by=DT$SEX)
  print("mean(DT$pwgtp15,by=DT$SEX)")
  t3 = system.time(mean(DT$pwgtp15,by=DT$SEX))
  message(sprintf("Elapsed time: %.10f", t3[3]))
  
  # sapply(split(DT$pwgtp15,DT$SEX),mean)
  print("sapply(split(DT$pwgtp15,DT$SEX),mean)")
  t5 = system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
  message(sprintf("Elapsed time: %.10f", t5[3]))
  
  # tapply(DT$pwgtp15,DT$SEX,mean)
  print("tapply(DT$pwgtp15,DT$SEX,mean)")
  t6 = system.time(tapply(DT$pwgtp15,DT$SEX,mean))
  message(sprintf("Elapsed time: %.10f", t6[3]))
  
  # rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
  print("rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]")
  t4 = system.time(rowMeans(DT)[DT$SEX==1]) + system.time(rowMeans(DT)[DT$SEX==2])
  message(sprintf("Elapsed time: %.10f", t4[3]))
  
}

loadLibs <- function() {
  print("Loading libs...")
  if(!require(openxlsx)){
    install.packages("openxlsx")
  }
  
  if(!require(XML)){
    install.packages("XML")
  }
  
  if(!require(data.table)){
    install.packages("data.table")
  }
  
  library(openxlsx)
  library(XML)
  library(data.table)
}


download <- function(type, url, location, name) {
  
  if(!dir.exists(location)) {
    dir.create(location)
  }
  
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
    stop("INVALID FILE TYPE!")
  }
  
  if(!file.exists(dest)) {
    # file.remove(dest)
    print(paste("Downloading file", dest))
    download.file(url, destfile=dest, method="wininet", mode = "wb")
  }
  
  return(dest)
  
}

