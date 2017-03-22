complete <- function(directory, id = 1:332) {

  nobs = c();
  
  for(i in id) {
    
    if(i<10) {
      i = paste("00", i, sep="");
    } else if(i<100) {
      i = paste("0", i, sep="");
    }
    
    fileName = paste(directory,"/",i,".csv", sep="");
    file = read.csv(fileName);
    
    nobs = c(nobs, sum(complete.cases(file)))
  }
  
  dataFrame = data.frame(id, nobs);
  
  return(dataFrame);
  
}