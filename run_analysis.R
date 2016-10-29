## Intially setting the working directory
setwd("~/R")
## Downloading data
if(!file.exists("./data")){dir.create("./data")}
fileUrl <‐ "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

##extract the data to data directory and then set the wroking directory to the extracted folder
unzip(zipfile="./data/Dataset.zip",exdir="./data")
setwd("~/R/data/UCI HAR Dataset")



library(dplyr)

## Loading data
x_test  <- read.table("test/X_test.txt",header = F)
y_test  <- read.table("test/y_test.txt",header = F)
subject_test <- read.table("test/subject_test.txt",header = F)
x_train  <- read.table("train/X_train.txt",header = F)
y_train  <- read.table("train/y_train.txt",header = F)
subject_train  <- read.table("train/subject_train.txt",header = F)
features <- read.table("features.txt",header=F)
Activity_labels <- read.table("activity_labels.txt",header = F)

## merging training and testing subject data
subject.data  <- rbind(subject_train,subject_test)

## merging x_train,x_test(feature measurements) data
feature_measurements.data <-rbind(x_train,x_test)

## merging y_train,y_test(activity IDs) data
activityIDs.data  <- rbind(y_train,y_test)

## point 4: naming columns and appropriately labelling the data set with descriptive variable names
colnames(subject.data) <- c("subject")
colnames(activityIDs.data) <- c("activity")
colnames(feature_measurements.data) <- features$V2
colnames(Activity_labels) <- c(v1='activity',v2='ActivityName') 

# point 1:merging training and testing data
## merging activityIDsdata with measurement data and then that data with subject data
actvityID_measutrementsData <- cbind(activityIDs.data,feature_measurements.data)
mergedData  <- cbind(subject.data,actvityID_measutrementsData)

## point 3:Use descriptive activity names to name the activities in the data set
mergedData2 <- merge(Activity_labels,mergedData,by.x ='activity',by.y = 'activity')

## point 2: Extracting only the measurements on the mean and standard deviation for each measurement.
mean_stdData<- select(mergedData2,contains("subject"), contains("activity"), contains("mean"), contains("std"))

## point 5: From the data set in point 4, creating a second, independent tidy data set with the average of 
##          each variable for each activity and each subject.
run_analysis<- (mean_stdData %>% group_by(subject,ActivityName) %>% summarise_each(funs( mean)))

## Writing data to a text file
write.table(run_analysis,"TidyData.txt",row.names = FALSE)

