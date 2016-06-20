run_analysis <- function(){
  library(data.table)

  # load training dataset
  subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
  x_train = read.table("UCI HAR Dataset/train/x_train.txt")
  y_train = read.table("UCI HAR Dataset/train/y_train.txt")


  # load test dataset  
  subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
  x_test = read.table("UCI HAR Dataset/test/x_test.txt")
  y_test = read.table("UCI HAR Dataset/test/y_test.txt")


  # load features and activity labels information
  features <- read.table("UCI HAR Dataset/features.txt", col.names=c("featureId", "featureLabel"))
  activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("activityId", "activityLabel"))

  # identify mean and std data
  activities$activityLabel <- gsub("_", "", as.character(activities$activityLabel))
  selectedFeatures <- grep("-mean\\(\\)|-std\\(\\)", features$featureLabel)

  # merge datasets test and training
  subject <- rbind(subject_test, subject_train)
  names(subject) <- "subjectId"

  X <- rbind(x_test, x_train)
  X <- X[, selectedFeatures]

  names(X) <- gsub("\\(|\\)", "", features$featureLabel[selectedFeatures])
  Y <- rbind(y_test, y_train)
  names(Y) = "activityId"
  activity <- merge(Y, activities, by="activityId")$activityLabel

  # Create a tity data set by merging data frames
  data <- cbind(subject, X, activity)
   write.table(data, "merged_tidy_data.txt")

  # Apply SD and mean and create a dataset grouped by subject and activity 
  dataDT <- data.table(data)
  tidyData<- dataDT[, lapply(.SD, mean), by=c("subjectId", "activity")]
  write.table(tidyData, "tidy_data.txt")

}


