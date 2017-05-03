# Peer-graded Assignment: Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. 

You will be required to submit: 

1. a tidy data set as described below, 
2. a link to a Github repository with your script for performing the analysis, and 
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description is available at the site where the data was obtained:

- [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:

- [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Content

1. [run_analysis.R](run_analysis.R): R-code to run on the data set.
2. [Tidy.txt](Tidy.txt): The clean data extracted from the original data using above R code.
3. [CodeBook](CodeBook.md): Code Book with the reference to variables in Tidy.txt

## Getting Started

The [run_analysis.R](run_analysis.R) code contains several functions that will help to perform all the steps provided.

## Main function

Main function to execute all the steps needed to complete this assignment.
````Rscript
run_analysis = function(extractZip = TRUE)
````

## loadLibs function
This functions is used to load the libraries required on this project.
````Rscript
# Load libs
loadLibs <- function() {
  
  if(!require(dplyr)){
    install.packages("dtplyr")
  }
  
  library(dtplyr)
}
````

## Download function
Function used to download the files.
````Rscript
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
````

## Extract zip function
Function used to extract the zip content.
````Rscript
# Extract zip function
extract = function(zipfile) {
  print(paste("Unziping", zipfile))
  unzip(zipfile, files = NULL, list = FALSE, 
        overwrite = TRUE, junkpaths = FALSE, exdir = ".", 
        unzip = "internal", setTimes = FALSE)
}

## Assign to global environment
````Rscript
# Assign to global environment
toGlobal = function(name, var) {
  assign(name, var, .GlobalEnv)
}
````




#### Download and extact zip file
2. Download and extract zip file.
The default location of the extracted zip is "UCI HAR Dataset".
````Rscript
# Download dataset
  datasetUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  datasetDest = download(datasetUrl, "dataset.zip")
  
  # Extract Dataset
  if (extractZip) {
    extract(datasetDest)  
  }
````
#### Read supporting metadata, train data and test data
3. Read supporting metadata, train data and test data
````Rscript
# Read Supporting Metadata
print("Reading Supporting Metadata...")
featureNames = read.table("UCI HAR Dataset/features.txt")
activityLabels = read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)

toGlobal("featureNames", featureNames)
toGlobal("activityLabels", activityLabels)

# Read train data
print("Reading train data...")
subjectTrain = read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activityTrain = read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
featuresTrain = read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)

toGlobal("subjectTrain", subjectTrain)
toGlobal("activityTrain", activityTrain)
toGlobal("featuresTrain", featuresTrain)

# Read test data
print("Reading test data...")
subjectTest = read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
activityTest = read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
featuresTest = read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)

toGlobal("subjectTest", subjectTest)
toGlobal("activityTest", activityTest)
toGlobal("featuresTest", featuresTest)
````
#### Merges the training and the test sets to create one data set.
4. Merges the training and the test sets to create one data set.




