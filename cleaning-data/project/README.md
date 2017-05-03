# Peer-graded Assignment: Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project.

You will be required to submit:

1. A tidy data set as described below,
2. A link to a Github repository with your script for performing the analysis, and
3. A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

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

# Content

1. [run_analysis.R](run_analysis.R): R-code to run on the data set.
2. [Tidy.txt](Tidy.txt): The clean data extracted from the original data using above R code.
3. [CodeBook](CodeBook.md): Code Book with the reference to variables in Tidy.txt

# Getting Started

The [run_analysis.R](run_analysis.R) code contains several functions that will help to perform all the steps needed in order to achieve the tidy data.
You can just execute ````run_analysis()```` to perform all the steps requiered or, if you prefer, run each function in order to do a step by step execution.

# Main function

Main function to execute all the steps needed to complete this assignment.
````Rscript
run_analysis = function(extractZip = TRUE)
````
By default, the function will download and extract the zip file
````Rscript
run_analysis()
````
If the parameter extractZip is FALSE, the function will skip the extact of the zip file.
````Rscript
run_analysis(FALSE)
````
## Main function - Details
````Rscript
run_analysis = function(extractZip = TRUE) {

  # Load requiered libs
  loadLibs()

  # Download dataset
  datasetDest = downloadDataset()

  # Extract Dataset
  if (extractZip) {
    extract(datasetDest)  
  }

  # Read Supporting Metadata, train data and test data
  preProcess()

  # 1. Merges the training and the test sets to create one data set.
  executePart1()

  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  executePart2()

  # 3. Uses descriptive activity names to name the activities in the data set
  executePart3()

  # 4. Appropriately labels the data set with descriptive variable names.
  executePart4()

  # 5 From the data set in step 4, creates a second, independent tidy data set
  # with the average of each variable for each activity and each subject.
  executePart5()
}
````

## Pre-Processing of the data
### Download data set
This step is encapsuled under the function ````downloadDataset()````.
This functions returns the location where the file was downloaded.
````Rscript
# Download dataset
downloadDataset = function() {
  datasetUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  datasetDest = download(datasetUrl, "dataset.zip")

  return(datasetDest)
}
````

### Extract zip file
This step is encapsuled under the function ````extract()````.
The default location of the extracted zip is "UCI HAR Dataset".
````Rscript
# Extract zip function
extract = function(zipfile) {
    print(paste("Unziping", zipfile))
    unzip(zipfile, files = NULL, list = FALSE,
          overwrite = TRUE, junkpaths = FALSE, exdir = ".",
          unzip = "internal", setTimes = FALSE)
}
````

### Read Supporting Metadata, train data and test data
This step is encapsuled under the function ````preProcess()````.
````Rscript
# Pre-Processing of the data
preProcess = function() {
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
}
````

## Step 1
Merges the training and the test sets to create one data set.
This step is encapsuled under the function ````executePart1()````.
````Rscript
# 1. Merges the training and the test sets to create one data set.
executePart1 = function() {
  print("Merging the training and the test sets to create one data set...")

  subjectMerge = rbind(subjectTrain, subjectTest)
  activityMerge = rbind(activityTrain, activityTest)
  featuresMerge = rbind(featuresTrain, featuresTest)

  toGlobal("subjectMerge", subjectMerge)
  toGlobal("activityMerge", activityMerge)
  toGlobal("featuresMerge", featuresMerge)

  # Name the column names from the features file in variable featureNames
  colnames(featuresMerge) = t(featureNames[2])

  # Add activity and subject as a column to features
  colnames(activityMerge) = "Activity"
  colnames(subjectMerge) = "Subject"
  completeData = cbind(featuresMerge, activityMerge, subjectMerge)
  toGlobal("completeData", completeData)
}
````

## Step 2
Extracts only the measurements on the mean and standard deviation for each measurement.
This step is encapsuled under the function ````executePart2()````.
````Rscript
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
executePart2 = function() {
  print("Extracting only the measurements on the mean and standard deviation for each measurement...")

  columnsWithMeanSTD = grep(".*Mean.*|.*Std.*", names(completeData), ignore.case=TRUE)
  toGlobal("columnsWithMeanSTD", columnsWithMeanSTD)

  # Adding activity and subject columns
  requiredColumns = c(columnsWithMeanSTD, 562, 563)
  toGlobal("requiredColumns", requiredColumns)

  # Look at the number of variables in completeData
  # dim(completeData)
  extractedData = completeData[,requiredColumns]
  toGlobal("extractedData", extractedData)
}
````

## Step 3
Uses descriptive activity names to name the activities in the data set.
This step is encapsuled under the function ````executePart3()````.
````Rscript
print("Setting descriptive activity names to name the activities in the data set...")

extractedData$Activity = as.character(extractedData$Activity)

for (i in 1:6){
  extractedData$Activity[extractedData$Activity == i] = as.character(activityLabels[i,2])
}

# Set the activity variable in the data as a factor
extractedData$Activity = as.factor(extractedData$Activity)
toGlobal("extractedData", extractedData)
````

## Step 4
Appropriately labels the data set with descriptive variable names.
This step is encapsuled under the function ````executePart4()````.
````Rscript
# 4. Appropriately labels the data set with descriptive variable names.
executePart4 = function() {
  print("Renaming labels of the data set with descriptive variable names...")

  # Renaming Acc as Accelerometer
  names(extractedData) = gsub("Acc", "Accelerometer", names(extractedData))
  # Renaming Gyro as Gyroscope
  names(extractedData) = gsub("Gyro", "Gyroscope", names(extractedData))
  # Renaming BodyBody as Body
  names(extractedData) = gsub("BodyBody", "Body", names(extractedData))
  # Renaming Mag as Magnitude
  names(extractedData) = gsub("Mag", "Magnitude", names(extractedData))
  # Character 't' can be replaced with Time
  names(extractedData) = gsub("^t", "Time", names(extractedData))
  # Character 'f' can be replaced with Frequency
  names(extractedData) = gsub("^f", "Frequency", names(extractedData))
  # Renaming tBody as TimeBody
  names(extractedData) = gsub("tBody", "TimeBody", names(extractedData))
  # Renaming -mean() as Mean
  names(extractedData) = gsub("-mean()", "Mean", names(extractedData), ignore.case = TRUE)
  # Renaming -std() as STD
  names(extractedData) = gsub("-std()", "STD", names(extractedData), ignore.case = TRUE)
  # Renaming -freq() as Frequency
  names(extractedData) = gsub("-freq()", "Frequency", names(extractedData), ignore.case = TRUE)
  # Renaming angle as Angle
  names(extractedData) = gsub("angle", "Angle", names(extractedData))
  # Renaming gravity as Gravity
  names(extractedData) = gsub("gravity", "Gravity", names(extractedData))
  toGlobal("extractedData", extractedData)
}
````

## Step 5
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This step is encapsuled under the function ````executePart5()````.
````Rscript
# Set the subject variable in the data as a factor
  extractedData$Subject = as.factor(extractedData$Subject)
  extractedData = data.table(extractedData)
  toGlobal("extractedData", extractedData)

  # View extracted data
  View(extractedData)

  # Create tidyData as a set with average for each activity and subject
  tidyData = aggregate(. ~Subject + Activity, extractedData, mean)

  # Order tidayData according to subject and activity
  tidyData = tidyData[order(tidyData$Subject,tidyData$Activity),]

  # Write tidyData into a text file
  print("Writing Tidy.txt")
  write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
````

## Support Funcions
These are support function of ````run_analysis()````, which are used to achieve the goal of this project.

1. [loadLibs function](README.md#loadLibs-function)
2. [Download function](README.md#Download-function)
3. [Extract zip function](README.md#Extract-zip-function)
4. [Assign to global environment](README.md#Assign-to-global-environment)

### loadLibs function
Function to load the libraries required on this project.
````Rscript
# Load libs
loadLibs = function() {

  if(!require(dplyr)){
    install.packages("dtplyr")
  }

  if(!require(data.table)){
    install.packages("data.table")
  }

  library(dtplyr)
  library(data.table)
}
````

### Download function
Function used to download the files. It will create the *dataset* directory to store the downloaded file.
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

### Extract zip function
Function used to extract the zip content.
````Rscript
# Extract zip function
extract = function(zipfile) {
  print(paste("Unziping", zipfile))
  unzip(zipfile, files = NULL, list = FALSE,
        overwrite = TRUE, junkpaths = FALSE, exdir = ".",
        unzip = "internal", setTimes = FALSE)
}
````

### Assign to global environment
Function to assign the variable to the global environment of RStudio.
````Rscript
# Assign to global environment
toGlobal = function(name, var) {
  assign(name, var, .GlobalEnv)
}
````
