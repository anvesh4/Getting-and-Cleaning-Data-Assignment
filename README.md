# Getting-and-Cleaning-Data-Assignment

## Course Project

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Steps to work on this course project
1.First save the run_analysis code into an Rscript named "run_analysis".
2.Run ```source("run_analysis.R")```, then it will generate a new file ```TidyData.txt``` in your "UCI HAR Dataset" directory.

## Dependencies

```run_analysis.R```  depends on ```dplyr```package.So this package must be installed by using the install.packages() function in case its not already installed. 
