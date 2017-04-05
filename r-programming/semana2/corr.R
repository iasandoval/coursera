corr <- function(directory, threshold = 0) {
  
  result = numeric(0);
  
  allData = complete("specdata");
  allData = allData[allData$nobs > threshold, ]
  
  for(i in allData$id) {
    
    if(i<10) {
      i = paste("00", i, sep="");
    } else if(i<100) {
      i = paste("0", i, sep="");
    }
    
    path = paste(directory,"/",i,".csv", sep="");
    file = read.csv(path);
    
    result <- c(result, cor(file$sulfate, file$nitrate, use = "pairwise.complete.obs"))
    
  }
  
  return(result);
}