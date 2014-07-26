Tidying UCI HAR Smartphone Data
==================

Getting and cleaning data project - Coursera assignment

This R code takes the Human Activity Recognition Using Smartphones Dataset V1, found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and performs the following transformations:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The original dataset contains 561 feature measurements taken from 30 different subjects while performing 6 different activities.  A subset of 66 columns are selected for the summary dataset, and the average values of these measurements is computed for each subject and activity.  The result is a table with 180 rows by 68 columns.  See the [Codebook](Codebook.md) for a description of the final table.