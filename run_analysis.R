setwd("~/Desktop/Coursera/Getting and Cleaning Data/CourseAssignment")

# You should create one R script called run_analysis.R that does the following. 
features = read.csv("./data//UCI HAR Dataset 2//features.txt", 
                    header=FALSE, 
                    stringsAsFactors=FALSE,
                    col.names = "features")


# Merges the training and the test sets to create one data set.
train_x = read.fwf("./data/UCI HAR Dataset 2/train/X_train.txt", 
                   widths=rep(16, times=5), 
                   header=FALSE)


# Extracts only the measurements on the mean and standard deviation for each measurement. 

# Uses descriptive activity names to name the activities in the data set

# Appropriately labels the data set with descriptive variable names. 

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.