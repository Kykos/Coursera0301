# Getting and Cleaning Data Assignment
## Get Data
### The Data should be download using the following commands:
  + fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  + download.file(fileUrl, destfile = "./dataset.zip")
### The zip file should be unzipped in the current working directory to create the following directory structure:
 * UCI HAR Dataset (directory)
	+ test (directory)
		+ Inertial Signals (dir with 9 txt files)
		+ subject_test.txt
		+ X_test.txt
		+ y_test.txt
	+ train (directory)
		+ Inertial Signals (dir with 9 txt files)
		+ subject_train.txt
		+ X_train.txt
		+ y_train.txt	
	+ activity_labels.txt
	+ features.txt
	+ features_info.txt
	+ README.txt
	
 ### Load and install the data.table package
 
 There was only one script file created run_analysis.R.  This script performs the following tasks:
   + loads training dataset
   + loads test dataset
   + loads features and activity labels
   + identifies mean and sd data
   + merges datasets test and training
   + names datasets
   + creates a tidy dataset
   + saves tidy dataset to the working directory
  
