week2 = function() {
  
  # Load requiered libs
  loadLibs()
  
  
  
}

# Load libs
loadLibs = function() {
  
  if(!require(lattice)){
    install.packages("lattice")
  }
  
  if(!require(ggplot2)){
    install.packages("ggplot2")
  }
  
  library(lattice)
  library(ggplot2)
}