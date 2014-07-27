## Code Book for Final Project

## 1. Source of the Experimental Data

This Code Book updates and extends the information in the code book provided through the original project database.
The data used in this exercise was initially collected as part of the "Human Activity Recognition Using Smartphones Data Set" research project. This project built-up a database of motion readings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone equipped with inertial sensors. Each subject wore a waist-mounted Samsung Galaxy S II smartphone, that measured 3-axial linear acceleration and 3-axial angular velocity as the subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). Full details are available at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data set consisted of:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment. 

The data set for this experiment was available at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## 2. Summary of the Data Set Transformation/Filtering/Aggregation/Sorting Operations

ASSUMPTION: the variable names from the origianl dataset were preserved as closely as possible: the reason being that, by making too many changes to the naming conventions, it would be diffcult to refer back to the original raw data and documentation, potentially introducing error.

The output data sets conform to the "tidy" criteria, in that they have the following characteristics:
1.  Each variable forms a column.
2.  Each observation forms a row.
3.  Each type of observational unit forms a table.

The (initial) assignment data set was transformed by merging test and train data sets; it was filtered by subsetting the merged data set to include only those variables measuring standard deviation and mean; this new data set was transformed by prepending the Subject and Activity vectors; transformed by relabeling the variables with descriptive names; and sorted names; and transformed one last time by replacing the numeric activity labels with descrive character strings.

Using this modified data set, a second data set was generated. This data set was an aggregation the data set output in the first phase, in that it consisted of the average of each variable for each activity and subject.

## 3. Input/Output files

#Test dataset
./UCI HAR Dataset/test/subject_test.txt
./UCI HAR Dataset/test/X_test.txt
./UCI HAR Dataset/test/y_test.txt

#Training dataset
./UCI HAR Dataset/train/subject_train.txt
./UCI HAR Dataset/train/X_train.txt
./UCI HAR Dataset/train/y_train.txt

./UCI HAR Dataset/activity_labels.txt
./UCI HAR Dataset/features.txt

# Output files

./merged_test_train.txt
./averages_test_train.txt


## 3. Script-Generated Data Set (First Part)

This data set consists of merged and subsetted data extracted from the test and training data sets, and consists of 10,229 observations and 81 variables.
The rows correspond to observations, the columns correspond subject (integer), activity (character string), and signal (double) variables.
The subject and activity identfiers are mapped from the subject and activity files (subject_test/train and y_test/train). 
The variables consist of Mean ["-mean()"] and Standard Deviation ["-std()"] values, extracted from the original raw mesurement files (X_test/train).

#Subject identifier: type integer, range 1:30

#Activity identifier: type integer, range 1:6

1: WALKING
2: WALKING_UPSTAIRS
3: WALKING_DOWNSTAIRS
4: SITTING
5: STANDING
6: LAYING

#Time Doman Signal Variables 

#Body acceleration signals: *type double, range [-1,1]

*tBodyAcc-mean()-X
*tBodyAcc-mean()-Y
*tBodyAcc-mean()-Z
*tBodyAcc-std()-X
*tBodyAcc-std()-Y
*tBodyAcc-std()-Z

#Gravity acceleration signals: type double, range [-1,1]

*tGravityAcc-mean()-X
*tGravityAcc-mean()-Y
*tGravityAcc-mean()-Z
8tGravityAcc-std()-X
*tGravityAcc-std()-Y
8tGravityAcc-std()-Z

#Jerk signals obtained from linear acceleration: type double, range [-1,1]

*tBodyAccJerk-mean()-X
*tBodyAccJerk-mean()-Y
*tBodyAccJerk-mean()-Z
*tBodyAccJerk-std()-X
*tBodyAccJerk-std()-Y
*tBodyAccJerk-std()-Z

#Jerk signals obtained from angular velocity: type double, range [-1,1]

*tBodyGyro-mean()-X
*tBodyGyro-mean()-Y
*tBodyGyro-mean()-Z
*tBodyGyro-std()-X
*tBodyGyro-std()-Y
*tBodyGyro-std()-Z

#Magnitude of three-dimensional signals calculated using the Euclidean norm: type double, range [-1,1]

*tBodyGyroJerk-mean()-X
*tBodyGyroJerk-mean()-Y
*tBodyGyroJerk-mean()-Z
*tBodyGyroJerk-std()-X
*tBodyGyroJerk-std()-Y
*tBodyGyroJerk-std()-Z

*tBodyAccMag-mean()
8tBodyAccMag-std()

*tGravityAccMag-mean()
*tGravityAccMag-std()

*tBodyAccJerkMag-mean()
*tBodyAccJerkMag-std()

*tBodyGyroMag-mean()
*tBodyGyroMag-std()

*tBodyGyroJerkMag-mean()
*tBodyGyroJerkMag-std()

#Frequency Domain Signal Variables (all variables are of type double, range [-1,1])

*fBodyAcc-mean()-X
*fBodyAcc-mean()-Y
*fBodyAcc-mean()-Z
*fBodyAcc-std()-X
*fBodyAcc-std()-Y
*fBodyAcc-std()-Z

*fBodyAcc-meanFreq()-X
*fBodyAcc-meanFreq()-Y
*fBodyAcc-meanFreq()-Z

*fBodyAccJerk-mean()-X
*fBodyAccJerk-mean()-Y
*fBodyAccJerk-mean()-Z
*fBodyAccJerk-std()-X
*fBodyAccJerk-std()-Y
*fBodyAccJerk-std()-Z

*fBodyAccJerk-meanFreq()-X
*fBodyAccJerk-meanFreq()-Y
*fBodyAccJerk-meanFreq()-Z

*fBodyGyro-mean()-X
*fBodyGyro-mean()-Y
*fBodyGyro-mean()-Z
*fBodyGyro-std()-X
*fBodyGyro-std()-Y
*fBodyGyro-std()-Z

*fBodyGyro-meanFreq()-X
*fBodyGyro-meanFreq()-Y
*fBodyGyro-meanFreq()-Z

*fBodyAccMag-mean()
*fBodyAccMag-std()

*fBodyAccMag-meanFreq()

*fBodyBodyAccJerkMag-mean()
*fBodyBodyAccJerkMag-std()

*fBodyBodyAccJerkMag-meanFreq()

*fBodyBodyGyroMag-mean()
*fBodyBodyGyroMag-std()

*fBodyBodyGyroMag-meanFreq()

*fBodyBodyGyroJerkMag-mean()

*fBodyBodyGyroJerkMag-meanFreq()

*fBodyBodyGyroJerkMag-std()


## 4. Script-Generated Data Set (Second Part)

This data set is generated using the datat set output in the First Part, consists of 180 observations and 81 variables. The variables consist of the subject identfier (integer), activity name (character string), and the averages calculcated for each of the signal variables in the data set (double). See description of signal variables from previous section.

*Average tBodyAcc-mean()-X
*Average tBodyAcc-mean()-Y
*Average tBodyAcc-mean()-Z
*Average tBodyAcc-std()-X
*Average tBodyAcc-std()-Y
*Average tBodyAcc-std()-Z

*Average tGravityAcc-mean()-X
*Average tGravityAcc-mean()-Y
*Average tGravityAcc-mean()-Z
*Average tGravityAcc-std()-X
*Average tGravityAcc-std()-Y
*Average tGravityAcc-std()-Z

*Average tBodyAccJerk-mean()-X
*Average tBodyAccJerk-mean()-Y
*Average tBodyAccJerk-mean()-Z
*Average tBodyAccJerk-std()-X
*Average tBodyAccJerk-std()-Y
*Average tBodyAccJerk-std()-Z

*Average tBodyGyro-mean()-X
*Average tBodyGyro-mean()-Y
*Average tBodyGyro-mean()-Z
*Average tBodyGyro-std()-X
*Average tBodyGyro-std()-Y
*Average tBodyGyro-std()-Z

*Average tBodyGyroJerk-mean()-X
*Average tBodyGyroJerk-mean()-Y
*Average tBodyGyroJerk-mean()-Z
*Average tBodyGyroJerk-std()-X
*Average tBodyGyroJerk-std()-Y
*Average tBodyGyroJerk-std()-Z

*Average tBodyAccMag-mean()
*Average tBodyAccMag-std()

*Average tGravityAccMag-mean()
*Average tGravityAccMag-std()

*Average tBodyAccJerkMag-mean()
*Average tBodyAccJerkMag-std()

*Average tBodyGyroMag-mean()
*Average tBodyGyroMag-std()

*Average tBodyGyroJerkMag-mean()
*Average tBodyGyroJerkMag-std()

*Average fBodyAcc-mean()-X
*Average fBodyAcc-mean()-Y
*Average fBodyAcc-mean()-Z
*Average fBodyAcc-std()-X
*Average fBodyAcc-std()-Y
*Average fBodyAcc-std()-Z

*Average fBodyAcc-meanFreq()-X
*Average fBodyAcc-meanFreq()-Y
*Average fBodyAcc-meanFreq()-Z

*Average fBodyAccJerk-mean()-X
*Average fBodyAccJerk-mean()-Y
*Average fBodyAccJerk-mean()-Z
*Average fBodyAccJerk-std()-X
*Average fBodyAccJerk-std()-Y
*Average fBodyAccJerk-std()-Z

*Average fBodyAccJerk-meanFreq()-X
*Average fBodyAccJerk-meanFreq()-Y
*Average fBodyAccJerk-meanFreq()-Z

*Average fBodyGyro-mean()-X
*Average fBodyGyro-mean()-Y
*Average fBodyGyro-mean()-Z
*Average fBodyGyro-std()-X
*Average fBodyGyro-std()-Y
*Average fBodyGyro-std()-Z

*Average fBodyGyro-meanFreq()-Y
*Average fBodyGyro-meanFreq()-Z

*Average fBodyAccMag-mean()
*Average fBodyAccMag-std()

*Average fBodyAccMag-meanFreq()

*Average fBodyBodyAccJerkMag-mean()
*Average fBodyBodyAccJerkMag-std()

*Average fBodyBodyAccJerkMag-meanFreq()

*Average fBodyBodyGyroMag-mean()
*Average fBodyBodyGyroMag-std()

*Average fBodyBodyGyroMag-meanFreq()

*Average fBodyBodyGyroJerkMag-mean()

*Average fBodyBodyGyroJerkMag-meanFreq()

*Average fBodyBodyGyroJerkMag-std()
