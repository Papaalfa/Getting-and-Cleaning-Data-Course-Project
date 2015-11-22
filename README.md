# Getting-and-Cleaning-Data-Course-Project

This is a repository for the Course Project of "Getting and Cleaning Data" Coursera course. The course is accessible here https://class.coursera.org/getdata-034

## The script's destination

There is a script "run_analysis.R" in the repo which aims to fulfill the task for the course project for the "Getting and Cleaning Data" course on Coursera.

# The script's structure

In the first part the script unzips Samsung Dataset from the working directory and loads subsets (test, train and support sets) into R objects. There is also a commented code in the script to download the Samsung data set from the link mentioned in the assignment instructions.

In the second part it does the next five things:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Adds descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# The script's results

The resulting sets are:
   1. For tasks 1 to 4 - resultSet
   2. For task 5       - averageSet

At the very end the script writea the averageSet to a .txt file.
