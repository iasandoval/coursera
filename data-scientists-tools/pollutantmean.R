pollutantmean <- function(directory, pollutant, id = 1:332) {
  # directory: Location of the CSV file
  #print(directory);
  # pollutant: sulfate or nitrate
  #print(pollutant);
  # id: vector of monitors to be used
  #print(id);
  
  resultVector = c();
  
  for(i in id) {
    
    if(i<10) {
      i = paste("00", i, sep="");
    } else if(i<100) {
      i = paste("0", i, sep="");
    }
    
    fileName = paste(directory,"/",i,".csv", sep="");
    file = read.csv(fileName);
    
    f = file[, pollutant];
    resultVector <- c(resultVector, f)
    
  }
  
  mean = mean(resultVector, na.rm = TRUE);
  #print(mean); 
  
  # Return the mean of the pollutant across all monitors
  # ignoring the NA values (Do not round)
  return(mean);
  
}