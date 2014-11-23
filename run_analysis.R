# You should create one R script called run_analysis.R that does the following.

# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each
# measurement.
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names. 
# 5 From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.

features = read.csv("./data/UCI HAR Dataset 2//features.txt", 
                       sep=" ",
                       header=FALSE, 
                       stringsAsFactors=FALSE,
                       col.names = c("feature.row", "feature.name"))



activities = read.csv("./data/UCI HAR Dataset 2//activity_labels.txt",
                        sep=" ",
                        header=FALSE, 
                        stringsAsFactors=FALSE,
                        col.names = c("activity.code", "activity"))

# Merges the training and the test sets to create one data set.

## X
train_x = read.table("./data/UCI HAR Dataset 2/train/X_train.txt",
                     col.names=features$feature.name)

test_x = read.table("./data/UCI HAR Dataset 2/test/X_test.txt",
                    col.names=features$feature.name)

all_x = rbind(train_x, test_x)

## Y
train_y = read.csv("./data/UCI HAR Dataset 2/train/y_train.txt", 
                   header=FALSE, 
                   stringsAsFactors=FALSE,
                   col.names="activity")

test_y = read.csv("./data/UCI HAR Dataset 2/test/y_test.txt", 
                  header=FALSE, 
                  stringsAsFactors=FALSE,
                  col.names="activity")

all_y = rbind(train_y, test_y)

## Subjects
train_subj = read.csv("./data/UCI HAR Dataset 2/train/subject_train.txt", 
                      header=FALSE, 
                      stringsAsFactors=FALSE,
                      col.names="subject")

test_subj = read.csv("./data/UCI HAR Dataset 2/test/subject_test.txt", 
                      header=FALSE, 
                      stringsAsFactors=FALSE,
                      col.names="subject")

all_subj = rbind(train_subj, test_subj)
  
all_data = cbind(all_subj, all_y, all_x)

# 2 Extracts only the measurements on the mean and standard deviation for each
# measurement.

# 3 Uses descriptive activity names to name the activities in the data set
all_data$activity = factor(all_data$activity, labels=activities$activity)

# 4 Appropriately labels the data set with descriptive variable names. 

# 5 From the data set in step 4, creates a second, independent tidy data set with
# the average of each variable for each activity and each subject.

