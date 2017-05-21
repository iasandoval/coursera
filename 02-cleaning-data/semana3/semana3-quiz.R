semana3quiz <- function() {
  
  loadLibs()
  
  # 1
  # Download the 2006 microdata survey about housing for 
  # the state of Idaho using download.file() from here:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv
  # The code book, describing the variable names is here:
  # https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf
  
  ss06hidUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
  ss06hidDest = download(ss06hidUrl, "ss06hid.csv")
  
  acs = read.csv(ss06hidDest)
  assign("acs",acs,.GlobalEnv)
  
  # Create a logical vector that identifies the 
  # households on greater than 10 acres 
  # who sold more than $10,000 worth of agriculture products. 
  # Assign that logical vector to the variable 
  # agricultureLogical. Apply the which() function 
  # like this to identify the rows of the data frame 
  # where the logical vector is TRUE.
  agricultureLogical = acs$ACR == 3 & acs$AGS == 6
  
  print("What are the first 3 values that result?")
  resp = which(agricultureLogical)[1:3]
  print(resp)
  
  # 2
  # Using the jpeg package read in the following 
  # picture of your instructor into R
  # https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg
  
  imagenUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
  imagenDest = download(imagenUrl, "jeff.jpg")
  
  # Use the parameter native=TRUE. 
  img <- readJPEG(imagenDest, native = TRUE)
  print("What are the 30th and 80th quantiles of the resulting data?")
  resp = quantile(img, probs = c(0.3, 0.8))
  print(resp)
  
  # 3
  # Load the Gross Domestic Product data for the 190 ranked countries in this data set:
  grossUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
  grossDest = download(grossUrl, "GDP.csv")
  gross = read.csv(grossDest, skip = 4, nrows = 215) 
  gross = gross %>%
    select(X, X.1, X.3, X.4) %>%
    rename(c("X"="CountryCode", "X.1"="rankingGDP", "X.3"="LongName", "X.4"="gdp"))
  
  assign("gross",gross,.GlobalEnv)
  
  #Load the educational data from this data set:
  educUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
  educDest = download(educUrl, "EDSTATS_Country.csv")
  educ = read.csv(educDest)
  assign("educ",educ,.GlobalEnv)
  
  # Match the data based on the country shortcode. 
  print("How many of the IDs match?")
  
  dataMerged <- merge(gross, educ, all = TRUE, by = "CountryCode")
  assign("dataMerged",dataMerged,.GlobalEnv)
  
  resp = sum(!is.na(unique(dataMerged$rankingGDP)))
  print(resp)
  
  # Sort the data frame in descending order by GDP rank (so United States is last). 
  
  print("What is the 13th country in the resulting data frame?")
  dataMergedDesc = arrange(dataMerged, desc(rankingGDP))
  resp = select(dataMergedDesc[13,], LongName)
  print(resp)
  
  # 4
  print("What is the average GDP ranking for the \"High income: OECD\"")
  OECD = filter(dataMerged, Income.Group %in% c("High income: OECD"))
  resp = mean(OECD$rankingGDP, na.rm = TRUE)
  print(resp)
  
  print("and \"High income: nonOECD\" group?")
  nonOECD = filter(dataMerged, Income.Group %in% c("High income: nonOECD"))
  resp = mean(nonOECD$rankingGDP, na.rm = TRUE)
  print(resp)
  
  # 5
  # Cut the GDP ranking into 5 separate quantile groups. 
  cutData = mutate(dataMerged, rankGroups = cut2(rankingGDP, g=5))
  
  # Make a table versus Income.Group. 
  t = table(cutData$Income.Group, cutData$rankGroups)
  
  print("How many countries are Lower middle income but among the 38 nations with highest GDP?")
  t["Lower middle income",]
  
}

download = function(url, name) {
  dest = paste("semana3/", name, sep= "")
  
  if(!file.exists(dest)) {
    print(paste("Downloading", dest))
    download.file(url, destfile=dest, method="wininet", mode = "wb")
  }
  
  return(dest)
}

loadLibs <- function() {
  print("Loading libs...")
  
  if(!require(jpeg)){
    install.packages("jpeg")
  }
  
  if(!require(dplyr)){
    install.packages("dplyr")
  }
  
  if(!require(plyr)){
    install.packages("plyr")
  }
  
  if(!require(Hmisc)){
    install.packages("Hmisc")
  }
  
  library(jpeg)
  library(dplyr)
  library(plyr)
  library(Hmisc)
}