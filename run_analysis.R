# You should create one R script called run_analysis.R that does the following.

# 1 Merges the training and the test sets to create one data set.

# 2 Extracts only the measurements on the mean and standard deviation for each
# measurement.

# 3 Uses descriptive activity names to name the activities in the data set

# 4 Appropriately labels the data set with descriptive variable names. 

# 5 From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.

setwd("~/Desktop/Coursera/Getting and Cleaning Data/CourseAssignment/GC_CourseAssignment/")

featureList = read.csv("./data/UCI HAR Dataset 2//features.txt", 
               sep=" ",
               header=FALSE, 
               stringsAsFactors=FALSE,
               col.names = c("feature.code", "feature"))

activityCode = read.csv("./data/UCI HAR Dataset 2//activity_labels.txt",
                        sep=" ",
                        header=FALSE, 
                        stringsAsFactors=FALSE,
                        col.names = c("activity.code", "activity"))

featureLength <- length(featureList$feature)

## Train
train_x = read.csv.sql("./data/UCI HAR Dataset 2/train/X_train.txt", 
                       sql = "select 'tBodyAcc-mean()-X' from file",
                       header=FALSE)

train_x = read.fwf("./data/UCI HAR Dataset 2/train/X_train.txt", 
                   widths=rep(16, times=10), 
                   col.names=ftrs$features[1:10],
                   header=FALSE)

train_y = read.csv("./data/UCI HAR Dataset 2/train/y_train.txt", 
                   header=FALSE, 
                   stringsAsFactors=FALSE,
                   col.names="activity")

train_subj = read.csv("./data/UCI HAR Dataset 2/train/subject_train.txt", 
                      header=FALSE, 
                      stringsAsFactors=FALSE,
                      col.names="subject")

train = cbind(train_subj, train_y, train_x)

## Test

test_subj = read.csv("./data/UCI HAR Dataset 2/test/subject_test.txt", 
                      header=FALSE, 
                      stringsAsFactors=FALSE,
                      col.names="subject")

test_y = read.csv("./data/UCI HAR Dataset 2/test/y_test.txt", 
                   header=FALSE, 
                   stringsAsFactors=FALSE,
                   col.names="activity"
)

test_x = read.fwf("./data/UCI HAR Dataset 2/test/X_test.txt", 
                   widths=rep(16, times=featureLength), 
                   header=FALSE)

test = cbind(test_subj, test_y, test_x)

# Merges the training and the test sets to create one data set.
all_data <- rbind(train, test)

#write
