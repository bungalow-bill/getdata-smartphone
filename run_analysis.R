# Coursera data science specialization 
# Data cleaning project 1
# DHC July 2014
library(data.table)

oldwd<-getwd()
setwd('c:/projects/datasciencecoursera')
data.folder<-'01_rawdata/UCiHARDataset/'

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

setwd(oldwd)
