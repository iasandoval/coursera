semana2quiz <- function() {
  loadLibs()
  
  # 1  
  # Login Github
  gtoken = loginGithub()
  # Obtener los repos
  req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
  stop_for_status(req)
  # Convertir a data frame
  json = jsonlite::fromJSON(toJSON(content(req)))
  assign("json",json,.GlobalEnv)
  
  # Obtener el subset datasharing
  ds = json[json$name == "datasharing",]
  # Obtener la fecha de creación
  dsCreated = ds$created_at
  assign("dsCreated",dsCreated,.GlobalEnv)
  print("Use this data to find the time that the datasharing repo was created. What time was it created?")
  print(dsCreated)
  
  # 2
  # Download the American Community Survey data and load it into an R object called: acs
  ss06pidUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
  ss06pidDest = "semana2/ss06pid.csv"
  
  if(!file.exists(ss06pidDest)) {
    print("Downloading ss06pid.csv")
    download.file(ss06pidUrl, destfile=ss06pidDest, method="wininet", mode = "wb")
  }
  
  acs = read.csv(ss06pidDest)
  assign("acs",acs,.GlobalEnv)
  
  print("Which of the following commands will select only the data for the probability weights pwgtp1 with ages less than 50?")
  print("sqldf(\"select pwgtp1 from acs where AGEP < 50\")")
  
  # 3
  print("Using the same data frame you created in the previous problem, what is the equivalent function to unique(acs$AGEP)")
  print("sqldf(\"select distinct AGEP from acs\")")
  
  # 4
  print("How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:")
  print("http://biostat.jhsph.edu/~jleek/contact.html")
  
  url = "http://biostat.jhsph.edu/~jleek/contact.html"
  htmlCode = readLines(url)
  assign("htmlCode",htmlCode,.GlobalEnv)
  
  v10 = nchar(htmlCode[10], type = "chars")
  v20 = nchar(htmlCode[20], type = "chars")
  v30 = nchar(htmlCode[30], type = "chars")
  v100 = nchar(htmlCode[100], type = "chars")
  resp = c(v10, v20, v30, v100)
  
  print(resp)
  
  # 5
  # Read this data set into R and report the sum of the numbers in the fourth of the nine columns.
  # https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for
  wkURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
  
  print("Read this data set into R and report the sum of the numbers in the fourth of the nine columns")
  print(wkURL)
  wkContent <- read.fwf(
    file=url(wkURL),
    skip=4,
    widths=c(12, 7, 4, 9, 4, 9, 4, 9, 4),
    col.names = c("Week", "col2", "col3", "col4", "col5", "col6", "col7", "col8", "col9")
    )
  
  assign("wkContent",wkContent,.GlobalEnv)
  s = sum(wkContent$col4)
  print(s)
}

loginGithub <- function() {
  
  # 1. Find OAuth settings for github: http://developer.github.com/v3/oauth/
  oauth_endpoints("github")
  
  # 2. To make your own application, register at at
  #    https://github.com/settings/applications. Use any URL for the homepage URL
  #    (http://github.com is fine) and  http://localhost:1410 as the callback url
  myapp <- oauth_app("github", 
                     key = "850d95c0f37c58a9aa79", 
                     secret = "cbc589463dbb7d26d1f6bafe2ab69ffc5303370b")
  
  # 3. Get OAuth credentials
  github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
  gtoken <- config(token = github_token)
  
  return(gtoken)
}

loadLibs <- function() {
  print("Loading libs...")
  
  if(!require(httr)){
    install.packages("httr")
  }
  
  if(!require(httpuv)){
    install.packages("httpuv")
  }
  
  if(!require(jsonlite)){
    install.packages("jsonlite")
  }
  
  if(!require(sqldf)){
    install.packages("sqldf")
  }
  
  if(!require(XML)){
    install.packages("XML")
  }
  
  library(httr)
  library(httpuv)
  library(jsonlite)
  library(sqldf)
  library(XML)
}
