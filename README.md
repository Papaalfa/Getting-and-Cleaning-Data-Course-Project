# Getting and Cleaning Data Course Project Repository

This is a repository for the Course Project of "Getting and Cleaning Data" Coursera course. The course is accessible here https://class.coursera.org/getdata-034 and is a part of the [Data Science Specialization](https://www.coursera.org/specializations/jhudatascience).

## The script's destination

There is a script "run_analysis.R" in the repo which aims to fulfill the task for the course project for the "Getting and Cleaning Data" course on Coursera.

## The script's structure

### In the first part:
The script unzips Samsung Dataset from the working directory and loads subsets (test, train and support sets) into R objects. There is also a commented code in the script to download the Samsung data set from the link mentioned in the assignment instructions.

### In the second part it does the next five things:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Adds descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## The script's results

The resulting sets are:
   1. For tasks 1 to 4 - resultSet
   2. For task 5       - averageSet

At the very end the script writes the averageSet to an averageSet.txt file.

## Script details

### Packages used
It is a dplyr package (https://cran.r-project.org/web/packages/dplyr/index.html) used in to make a resulting data set.

### Part 1

1. Firstly after unzippint the set the script gets Features (will be used to name variables) and Activity Labels (will be used to label Activities) into R objects with read.table function.
2. Then it prepares Test and Training sets by getting measures, activities and subjects sets from different files into R with read.table function and then combining them with cbind().

### Part 2

1. The script combines Test and Training sets into one set named fullSet with rbind()
2. Assigns descriptive names to the variables of the fullSet
3. Extracts only means and standard deviations variables by leaving in the set only those variables which contain "mean()" or "std()" in their names.
4. Add descriptive activity names to name the activities in the data set by merging the set with the Activity Labels set by the activities ids.
5. Makes a new data set with the average of each variable for each activity and each subject by using a pipelined group_by() and summarise_each() functions from the dplyr package.
6. At the very end the script writes the averageSet to an averageSet.txt file.
