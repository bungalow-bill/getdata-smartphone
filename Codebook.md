Codebook For SmartphoneActivity_Averages.csv
============================================

# Source Data
This dataset is derived from the Human Activity Recognition Using Smartphones Dataset V1.  The original data is taken from [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).   
The reference for the data is:   
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012   

## Description of Original Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

# Dataset Description   
The mean and standard deviation observations from the original data have been selected and an average value has been calculated for each Subject and Activity.  The resulting table contains 180 rows for each combination of the 30 subjects performing the 6 activities.  The 68 columns of the table are described as follows:   

Activity:  One of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING   
Subject:  Integer representing the subject ID (1-30)   
avgTimeBodyAcc-mean-X:  Average of mean accelerations along X axis   
avgTimeBodyAcc-mean-Y:  Average of mean accelerations along Y axis   
avgTimeBodyAcc-mean-Z:  Average of mean accelerations along Z axis   
avgTimeBodyAcc-std-X: Average of standard deviation of accelerations along X axis   
avgTimeBodyAcc-std-Y:   
avgTimeBodyAcc-std-Z:   
avgTimeGravityAcc-mean-X: Average of mean gravity accelerations along X axis   
avgTimeGravityAcc-mean-Y:   
avgTimeGravityAcc-mean-Z:   
avgTimeGravityAcc-std-X: Average of standard deviation of gravity accelerations along X axis   
avgTimeGravityAcc-std-Y:   
avgTimeGravityAcc-std-Z:   
avgTimeBodyAccJerk-mean-X:  Average of mean jerk accelerations along X axis   
avgTimeBodyAccJerk-mean-Y:   
avgTimeBodyAccJerk-mean-Z:   
avgTimeBodyAccJerk-std-X: Average of standard deviation of accelerations along X axis   
avgTimeBodyAccJerk-std-Y:   
avgTimeBodyAccJerk-std-Z:   
avgTimeBodyGyro-mean-X: Average of mean angular velocitys around X axis   
avgTimeBodyGyro-mean-Y   
avgTimeBodyGyro-mean-Z   
avgTimeBodyGyro-std-X: Average of standard deviation of angular velocitys around X axis   
avgTimeBodyGyro-std-Y   
avgTimeBodyGyro-std-Z   
avgTimeBodyGyroJerk-mean-X: Average of mean jerk angular velocitys around X axis   
avgTimeBodyGyroJerk-mean-Y   
avgTimeBodyGyroJerk-mean-Z   
avgTimeBodyGyroJerk-std-X: Average of standard deviation of jerk angular velocitys around X axis       
avgTimeBodyGyroJerk-std-Y   
avgTimeBodyGyroJerk-std-Z   
avgTimeBodyAccMag-mean: Average of mean acceleration magnitudes   
avgTimeBodyAccMag-std: Average of standard deviation of acceleration magnitudes   
avgTimeGravityAccMag-mean: Average of mean gravity acceleration magnitudes   
avgTimeGravityAccMag-std: Average of standard deviation of gravity acceleration magnitudes   
avgTimeBodyAccJerkMag-mean: Average of mean jerk acceleration magnitudes   
avgTimeBodyAccJerkMag-std: Average of standard deviation of jerk acceleration magnitudes   
avgTimeBodyGyroMag-mean: Average of mean angular velocity magnitudes   
avgTimeBodyGyroMag-std: Average of standard deviation of  angular velocity magnitudes   
avgTimeBodyGyroJerkMag-mean: Average of mean jerk angular velocity magnitudes   
avgTimeBodyGyroJerkMag-std: Average of standard deviation of jerk angular velocity magnitudes   
avgFreqBodyAcc-mean-X: Average of mean Frequency of acceleration along X axis    
avgFreqBodyAcc-mean-Y   
avgFreqBodyAcc-mean-Z   
avgFreqBodyAcc-std-X: Average of standard deviation of Frequency of acceleration along X axis   
avgFreqBodyAcc-std-Y  
avgFreqBodyAcc-std-Z        
avgFreqBodyAccJerk-mean-X:  Average of mean Frequency of jerk acceleration along X axis     
avgFreqBodyAccJerk-mean-Y     
avgFreqBodyAccJerk-mean-Z     
avgFreqBodyAccJerk-std-X:  Average of standard deviation of Frequency of jerk acceleration along X axis      
avgFreqBodyAccJerk-std-Y     
avgFreqBodyAccJerk-std-Z     
avgFreqBodyGyro-mean-X: Average of mean Frequency of angular velocity around X axis    
avgFreqBodyGyro-mean-Y      
avgFreqBodyGyro-mean-Z     
avgFreqBodyGyro-std-X Average of standard deviation of Frequency of angular velocity around X axis   
avgFreqBodyGyro-std-Y     
avgFreqBodyGyro-std-Z       
avgFreqBodyAccMag-mean: Average of mean frequency of acceleration magnitude      
avgFreqBodyAccMag-std:  Average of standard deviation of frequency of acceleration magnitude     
avgFreqBodyAccJerkMag-mean: Average of mean frequency of jerk acceleration magnitude     
avgFreqBodyAccJerkMag-std:   Average of standard deviation of frequency of jerk acceleration magnitude     
avgFreqBodyGyroMag-mean: Average of mean frequency of angular velocity magnitude     
avgFreqBodyGyroMag-std:  Average of standard deviation of frequency of angular velocity magnitude       
avgFreqBodyGyroJerkMag-mean:  Average of mean frequency of jerk angular velocity magnitude      
avgFreqBodyGyroJerkMag-std:  Average of standard deviation frequency of jerk angular velocity magnitude     

**********

## Notes:   
1.While the original measurements were collected in standard gravity units (g) for linear accelerations and radians/second for angular velocitys, the data have been normalized and bounded to -1 - +1, so should be considered unitless for this dataset.   
2. For the time domain data (indicated by Time in the column name) Mean and standard deviations provided in the original dataset indicate the statistics calculated from 128 readings at 50 Hz.  The values provided in the summary dataset are the averages of multiple sets of readings.   
