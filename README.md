# Getting-and-Cleaning-Data-Course-Project
This repo is for the course project of Getting and Cleaning Data.

Steps to getting and cleaning the accelerometer data

Read train data file:             X_train.txt
Read activity data file:          y_train.txt
Read training subject data file:  subject_train.txt
cbind the above 3 dataframe into the training dataframe

Read test data file:              X_test.txt
Read activity data file:          y_test.txt
Read testing subject data file:   subject_test.txt
cbind the above 3 dataframe into the testing dataframe

rbind the training dataframe and the testing dataframe into the complete original dataframe<br/>
------Task 1 completed

Select only the mean and standard deviation from the complete original dataframe to the required measurement only dataset<br/>
------Task 2 completed

Update the activity value in the required measurement only dataset with descriptive activity names using information from file activity_labels.txt<br/>
------Task 3 completed

Rename the column names in the required measurement only dataset with descriptive variable names using information from file features.txt<br/>
------Task 4 completed

Group the required measurement only dataset by subject and activity, then using apply to caculate mean value of each variable. <br/>
------Task 5 completed
