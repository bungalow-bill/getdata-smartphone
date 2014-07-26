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

The script is fairly straight-forward and uses the data.table package to do all the summarization.  The code performs the 5 steps listed above, but some steps accomplished simultaneously.  

1.  Merge the training and test sets   
```R
# read the labels for the (561) features
infile<-file.path(data.folder,'features.txt')
feature.labels<-fread(infile)
# also the labels for the activities
infile<-file.path(data.folder,'activity_labels.txt')
activity.labels<-fread(infile)

# now read the feature data, first training
infile<-file.path(data.folder,'train/x_train.txt')
train.x<-read.table(infile,col.names=feature.labels$V2)
train.x<-data.table(train.x)
# and the activity codes
infile<-file.path(data.folder,'train/y_train.txt')
train.y<-read.table(infile,col.names=c('Activity'),colClasses=c('numeric'))
train.y<-data.table(train.y)
# convert the activity to a factor column in the x dataframe
train.x$Activity<-factor(train.y$Activity,levels=activity.labels$V1,labels=activity.labels$V2)
# now get the subject codes
infile<-file.path(data.folder,'train/subject_train.txt')
train.subject<-read.table(infile,col.names=c('Subject'),colClasses=c('numeric'))
# move it to a numeric column in the x dataframe
train.x$Subject<-train.subject$Subject

# now do the same thing for the test data
infile<-file.path(data.folder,'test/x_test.txt')
test.x<-read.table(infile,col.names=feature.labels$V2)
test.x<-data.table(test.x)
# and the activity codes
infile<-file.path(data.folder,'test/y_test.txt')
test.y<-read.table(infile,col.names=c('Activity'),colClasses=c('numeric'))
# convert the activity to a factor column in the x dataframe
test.x$Activity<-factor(test.y$Activity,levels=activity.labels$V1,labels=activity.labels$V2)
# now get the subject codes
infile<-file.path(data.folder,'test/subject_test.txt')
test.subject<-read.table(infile,col.names=c('Subject'),colClasses=c('numeric'))
# move it to a numeric column in the x dataframe
test.x$Subject<-test.subject$Subject

# finally, merge the two datasets into one
full.x<-rbind(train.x,test.x)
# save the full dataset for possible future analysis
save(full.x,file=file.path(data.folder,"SmartphoneActivity_fulldataset.RData"))
```

2. Extract only the measurements on the mean and standard deviation for each measurement.   
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
```R
#  select the mean and std dev columns only
selected.cols<-names(full.x)[full.x[,grep("\\.mean\\.\\.|\\.std\\.\\.",names(full.x))]]

setkey(full.x,Activity)

# calculate averages by activity and subject for each of the selected feature columns
tidy.summary<-full.x[,lapply(.SD,mean),.SDcols=selected.cols,by=list(Activity,Subject)]

# clean up the names
newnames<-gsub("\\.+","-",names(tidy.summary))
newnames<-gsub("-$","",newnames)
newnames<-gsub("^t","avgTime",newnames)
newnames<-gsub("^f","avgFreq",newnames)
newnames<-gsub("BodyBody","Body",newnames)

# assign the new names to the dataset
setnames(tidy.summary,newnames)

# export a tidy dataset in CSV format
write.table(tidy.summary,file=file.path(data.folder,"SmartphoneActivity_Averages.txt"),sep=",",row.names=FALSE)
```

