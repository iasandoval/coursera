
run_analysis = function(extractZip = TRUE) {
  
  # Load requiered libs
  loadLibs()
  
  # Download dataset
  datasetUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  datasetDest = download(datasetUrl, "dataset.zip")
  
  # Extract Dataset
  if (extractZip) {
    extract(datasetDest)  
  }
  
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
  
  # Set the subject variable in the data as a factor
  extractedData$Subject = as.factor(extractedData$Subject)
  extractedData = data.table(extractedData)
  toGlobal("extractedData", extractedData)
  
  # View extracted data
  view(extractedData)
  
  # Create tidyData as a set with average for each activity and subject
  tidyData = aggregate(. ~Subject + Activity, extractedData, mean)
  
  # Order tidayData according to subject and activity
  tidyData = tidyData[order(tidyData$Subject,tidyData$Activity),]
  
  # Write tidyData into a text file
  print("Writing Tidy.txt")
  write.table(tidyData, file = "Tidy.txt", row.names = FALSE)
}

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
  completeData <- cbind(featuresMerge, activityMerge, subjectMerge)
  toGlobal("completeData", completeData)
}

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
  
  # Look at the number of variables in extractedData
  # dim(extractedData)
}

# 3. Uses descriptive activity names to name the activities in the data set
executePart3 = function() {
  print("Setting descriptive activity names to name the activities in the data set...")
  
  extractedData$Activity = as.character(extractedData$Activity)
  
  for (i in 1:6){
    extractedData$Activity[extractedData$Activity == i] = as.character(activityLabels[i,2])
  }
  
  # Set the activity variable in the data as a factor
  extractedData$Activity = as.factor(extractedData$Activity)
  toGlobal("extractedData", extractedData)
}

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

# Assign to global environment
toGlobal = function(name, var) {
  assign(name, var, .GlobalEnv)
}

# Extract zip function
extract = function(zipfile) {
  print(paste("Unziping", zipfile))
  unzip(zipfile, files = NULL, list = FALSE, 
        overwrite = TRUE, junkpaths = FALSE, exdir = ".", 
        unzip = "internal", setTimes = FALSE)
}


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

# Load libs
loadLibs <- function() {
  
  if(!require(dplyr)){
    install.packages("dtplyr")
  }
  
  library(dtplyr)
}