semana4quiz <- function() {
  loadLibs()
  
  # 1
  # The American Community Survey distributes downloadable data 
  # about United States communities. Download the 2006 microdata 
  # survey about housing for the state of Idaho using download.file() from here:
  
  ss06hidUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  ss06hidDest = download(ss06hidUrl, "ss06hid.csv")
  
  # and load the data into R.
  acs = read.csv(ss06hidDest)
  assign("acs",acs,.GlobalEnv)
  
  
  # The code book, describing the variable names is here:
  pdfUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf"
  pdfDest = download(pdfUrl, "PUMSDataDict06.pdf")
  
  # Apply strsplit() to split all the names of the data frame on 
  # the characters "wgtp". 
  
  print("What is the value of the 123 element of the resulting list?")
  resp1 <- strsplit(names(acs), "wgtp")[123]
  print(resp1)
  
  # 2
  # Load the Gross Domestic Product data for the 190 ranked countries in this data set:
  
  grossUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  grossDest = download(grossUrl, "GDP.csv")
  gross = read.csv(grossDest, skip = 4, nrows = 215) 
  gross = gross %>%
    select(X, X.1, X.3, X.4) %>%
    rename(c("X"="CountryCode", "X.1"="rankingGDP", "X.3"="LongName", "X.4"="gdp"))
  
  assign("gross",gross,.GlobalEnv)
  
  # Remove the commas from the GDP numbers in millions of dollars and average them.
  gdp <- as.numeric(gsub(",", "", gross$gdp))
  
  print("What is the average?")
  resp2 = mean(gdp, na.rm = TRUE)
  print(resp2)
  
  # 3
  # In the data set from Question 2 what is a regular expression that would 
  # allow you to count the number of countries whose name begins with "United"? 
  # Assume that the variable with the country names in it is named countryNames. 
  
  print("How many countries begin with United?")
  resp3 = length(grep("^United",gross$LongName))
  print(resp3)
  
  # 4
  # Load the Gross Domestic Product data for the 190 ranked countries in this data set:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv
  
  # Load the educational data from this data set:
  eduUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  eduDest = download(eduUrl, "EDSTATS_Country.csv")
  edu = read.csv(eduDest)
  assign("edu",edu,.GlobalEnv)
  
  # Match the data based on the country shortcode. 
  mergedData <- merge(gross, edu, as.x = "CountryCode", as.y = "CountryCode")
  assign("mergedData",mergedData,.GlobalEnv)
  
  # Of the countries for which the end of the fiscal year is available,
  print("how many end in June?")
  resp4 = length(grep("[Ff]iscal year end(.*)+June", mergedData$Special.Notes))
  print(resp4)
  
  # 5
  # You can use the quantmod (http://www.quantmod.com/) package to get historical 
  # stock prices for publicly traded companies on the NASDAQ and NYSE. 
  # Use the following code to download data on Amazon's stock price and get the times the data was sampled.
  library(quantmod)
  amzn = getSymbols("AMZN",auto.assign=FALSE)
  sampleTimes = index(amzn)
  assign("sampleTimes",sampleTimes,.GlobalEnv)
  
  print("How many values were collected in 2012? How many values were collected on Mondays in 2012?")
  
  # Subset observations made in 2012
  Y2012 <- subset(sampleTimes, year(sampleTimes) == 2012)
  lenY2010 = length(Y2012)
  
  # Find out number of Mondays in this subset
  lenMon2012 = length(which(wday(Y2012, label = T) == "Mon"))
  resp5 = c(lenY2010, lenMon2012);
  print(resp5)
  
}

download = function(url, name) {
  dest = paste("semana4/", name, sep= "")
  
  if(!file.exists(dest)) {
    print(paste("Downloading", dest))
    download.file(url, destfile=dest, method="wininet", mode = "wb")
  }
  
  return(dest)
}

loadLibs <- function() {
  if(!require(dplyr)){
    install.packages("dplyr")
  }
  if(!require(quantmod)){
    install.packages("quantmod")
  }
  if(!require(lubridate)){
    install.packages("lubridate")
  }
  
  library(dplyr)
  library(quantmod)
  library(lubridate)
  
}