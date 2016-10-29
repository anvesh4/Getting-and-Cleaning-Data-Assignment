##Code Book
This is a code book that describes the data,indicates all the variables and other data transformations done in order to get the tidy data.

##How the run_analysis code works
- Requires dplyr package.
- Loads data
- Merges training and testing subject,feature measurements,activity IDs data.
- Names columns and appropriately labels the data set with descriptive variable names.
- Merges training and testing data.
- Uses descriptive activity names to name the activities in the data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
- This data is then written into a text file using write.table function.

## How the data was cleaned?
I first loaded the data and gave it variable names,merged the subject data(subject_train and subject_test),feature measurement data(x_train and x_test) and activities data(y_train and y_test).I gave column names to the loaded data.I then merged the merged activity data with the merged measurement data.To this data I merged the merged subject data.

Then I merged this data to the activity_labels data so as to use descriptive activity names to name the activities in the data set.This merged data was named as mergedData2 by me.

Then I extracted the mean and std columns along with the subject and activity from the mergedData2.This extracted/subsetted data was named as mean_stdData by me.

Then I created a tidy data set by writing a run_analysis code that would calculate the mean of the all the columns in mean_stdData by using the summary_each(mean) function of the dplyr package.Thus you will get the average of each variable for each activity and each subject.

Then I wrote this data to the TidyData.txt file.

Discarded data:
The data in the Inertial Signals folder for both the test and the training dataset has been discarded as they have no variable names.

## Variables used/created:
X_test,y_test,subject_test,x_train,y_train,subject_train,features,activity_labels.These variables were created by loading the repsective training and testing data.

subject.data(obtained my merging training and testing subject data),features_measurements.data(obtained my merging x_train and x_test data) and activityIDs.data(obtained my merging y_train and y_test data)

actvityID_measutrementsData(obtained my merging activityIDs.data,feature_measurements.data),mergedData(obtained by merging subject.data and actvityID_measutrementsData)

mergedData2(obatined by merging Activity_labels and mergedData by merging the common "activity" column)

mean_stdData(obtained by using the select statement and choosing all those columns having the word "subject","activity","mean","std"
>str(mean_stdData)
'data.frame':	10299 obs. of  89 variables:...

run_analysis(obtained by grouping the subject and activity name by using the group_by function and calculating the average of average of each variable for each activity and each subject by using the summarise_each(mean) function.
> str(run_analysis)
Classes ‘grouped_df’, ‘tbl_df’, ‘tbl’ and 'data.frame':	180 obs. of  89 variables:...





