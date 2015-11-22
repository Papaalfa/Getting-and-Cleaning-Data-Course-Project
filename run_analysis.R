# The script below aims to fulfill the task for 
# the course project for the "Getting and Cleaning Data"
# course on Coursera.

# In the first part the script unzips Samsung Dataset from the working directory
# and loads subsets (test, train and support sets) into R objects.

# In the second part it does the next five things:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each 
#    measurement. 
# 3. Adds descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

# The resulting sets are:
#   1. For tasks 1 to 4 - resultSet
#   2. For task 5       - averageSet

# At the very end the script writea the averageSet to a .txt file.

# ----------------------------Part 1--------------------------------------------

# Load "dplyr" package. The package is used to create a data set 
# with the average of each variable for the point 5:
library(dplyr)

# Download and unzip the Data Set:
if(!file.exists("data")){dir.create("data")}

# The commented code below is to download the Samsung dataset, which is not
# in the scope of the Assignment task.
## fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## download.file(fileUrl, "./data/Dataset.zip")
## dateDownloaded <- date()
## unzip("./data/Dataset.zip", exdir = "./data")

unzip("getdata_projectfiles_UCI HAR Dataset.zip", exdir = "./data")

# Get Features (will be used to name variables) 
# and Activity Labels (will be used to label Activities) into R objects:
features <- read.table("./data/UCI HAR Dataset/features.txt")
act_lbls <- read.table("./data/UCI HAR Dataset/activity_labels.txt"
                       , col.names = c("Activity.Id", "Activity.Label"))

# Prepare Test Set:
# Get the test set into R:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
activities_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
# Combine test Set:
testSet <- cbind(subject_test, activities_test, x_test)

# Prepare Training Set:
# Get the Training set into R:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
activities_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
# Combine train Set:
trainSet <- cbind(subject_train, activities_train, x_train)

# ----------------------------Part 2--------------------------------------------

# Task 1. Combine Test and Train sets:
fullSet <- rbind(trainSet, testSet)

# Task 4. Assign descriptive names to the variables:
names(fullSet) <- c("Subject", "Activity.Id", as.character(features[,2]))

# Task 2. Extract only means and standard deviations:
resultSet <- cbind(fullSet[,1:2], fullSet[,grepl("mean\\(\\)", names(fullSet)) |
                                           grepl("std\\(\\)", names(fullSet))])

# Task 3. Add descriptive activity names to name the activities in the data set:
resultSet <- merge(act_lbls, resultSet)

# Task 5. Make a new data set with the average of each variable  
# for each activity and each subject:
resultSet$Subject <- factor(resultSet$Subject)
averageSet <- resultSet[,-1] %>% group_by(Activity.Label, Subject) %>% 
                                 summarise_each(funs(mean))
newNames <- paste0("Average.", names(averageSet)[-(1:2)])
names(averageSet)[-(1:2)] <- newNames

# Write the averageSet to a .txt file:
write.table(averageSet, file="averageSet.txt", row.name=FALSE)
