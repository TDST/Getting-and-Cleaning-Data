### Code Book for Final Project

### 1. Source of the Experimental Data

This Code Book updates and extends the information in the code book provided through the original project database.
The data used in this exercise was initially collected as part of the "Human Activity Recognition Using Smartphones Data Set" research project. This project built-up a database of motion readings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone equipped with inertial sensors. Each subject wore a waist-mounted Samsung Galaxy S II smartphone, that measured 3-axial linear acceleration and 3-axial angular velocity as the subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).

Full details are available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data set consisted of:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment. 

The data set for this experiment was available at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### 2. Summary of the Data Set Transformation/Filtering/Aggregation/Sorting Operations

_ASSUMPTION_: the variable names from the origianl dataset were preserved as closely as possible: the reason being that, by making too many changes to the naming conventions, it would be diffcult to refer back to the original raw data and documentation, potentially introducing error.

The output data sets conform to the "tidy" criteria, in that they have the following characteristics:

1.  Each variable forms a column.
2.  Each observation forms a row.
3.  Each type of observational unit forms a table.

The (initial) assignment data set was transformed by merging test and train data sets; it was filtered by subsetting the merged data set to include only those variables measuring standard deviation and mean; this new data set was transformed by prepending the Subject and Activity vectors; transformed by relabeling the variables with descriptive names; and sorted names; and transformed one last time by replacing the numeric activity labels with descrive character strings.

Using this modified data set, a second data set was generated. This data set was an aggregation the data set output in the first phase, in that it consisted of the average of each variable for each activity and subject.

### 3. Input/Output files

#### Test dataset

./UCI HAR Dataset/test/subject_test.txt

./UCI HAR Dataset/test/X_test.txt

./UCI HAR Dataset/test/y_test.txt

#### Training dataset

./UCI HAR Dataset/train/subject_train.txt

./UCI HAR Dataset/train/X_train.txt

./UCI HAR Dataset/train/y_train.txt

./UCI HAR Dataset/activity_labels.txt

./UCI HAR Dataset/features.txt

#### Output files

./merged_test_train.txt
./averages_test_train.txt


### 3. Script-Generated Data Set (First Part)

This data set consists of merged and subsetted data extracted from the test and training data sets, and consists of 10,229 observations and 81 variables.
The rows correspond to observations, the columns correspond subject (integer), activity (character string), and signal (double) variables.
The subject and activity identfiers are mapped from the subject and activity files (subject_test/train and y_test/train). 
The variables consist of Mean ["-mean()"] and Standard Deviation ["-std()"] values, extracted from the original raw mesurement files (X_test/train).

_Subject_: type integer, range 1:30

_Activity_: type integer, range 1:6

1: WALKING

2: WALKING_UPSTAIRS

3: WALKING_DOWNSTAIRS

4: SITTING

5: STANDING

6: LAYING

#### Time Doman Signal Variables 

Body acceleration signals: type double, range [-1,1]

_tBodyAcc-mean()-X_

_tBodyAcc-mean()-Y_

_tBodyAcc-mean()-Z_

_tBodyAcc-std()-X_

_tBodyAcc-std()-Y_

_tBodyAcc-std()-Z_

Gravity acceleration signals: type double, range [-1,1]

_tGravityAcc-mean()-X_

_tGravityAcc-mean()-Y_

_tGravityAcc-mean()-Z_

_tGravityAcc-std()-X_

_tGravityAcc-std()-Y_

_tGravityAcc-std()-Z_

Jerk signals obtained from linear acceleration: type double, range [-1,1]

_tBodyAccJerk-mean()-X_

_tBodyAccJerk-mean()-Y_

_tBodyAccJerk-mean()-Z_

_tBodyAccJerk-std()-X_

_tBodyAccJerk-std()-Y_

_tBodyAccJerk-std()-Z_

Jerk signals obtained from angular velocity: type double, range [-1,1]

_tBodyGyro-mean()-X_

_tBodyGyro-mean()-Y_

_tBodyGyro-mean()-Z_

_tBodyGyro-std()-X_

_tBodyGyro-std()-Y_

_tBodyGyro-std()-Z_

Magnitude of three-dimensional signals calculated using the Euclidean norm: type double, range [-1,1]

_tBodyGyroJerk-mean()-X_

_tBodyGyroJerk-mean()-Y_

_tBodyGyroJerk-mean()-Z_

_tBodyGyroJerk-std()-X_

_tBodyGyroJerk-std()-Y_

_tBodyGyroJerk-std()-Z_

_tBodyAccMag-mean()_

_tBodyAccMag-std()_

_tGravityAccMag-mean()_

_tGravityAccMag-std()_

_tBodyAccJerkMag-mean()_

_tBodyAccJerkMag-std()_

_tBodyGyroMag-mean()_

_tBodyGyroMag-std()_

_tBodyGyroJerkMag-mean()_

_tBodyGyroJerkMag-std()_

Frequency Domain Signal Variables (all variables are of type double, range [-1,1])

_fBodyAcc-mean()-X_

_fBodyAcc-mean()-Y_

_fBodyAcc-mean()-Z_

_fBodyAcc-std()-X_

_fBodyAcc-std()-Y_

_fBodyAcc-std()-Z_

_fBodyAcc-meanFreq()-X_

_fBodyAcc-meanFreq()-Y_

_fBodyAcc-meanFreq()-Z_

_fBodyAccJerk-mean()-X_

_fBodyAccJerk-mean()-Y_

_fBodyAccJerk-mean()-Z_

_fBodyAccJerk-std()-X_

_fBodyAccJerk-std()-Y_

_fBodyAccJerk-std()-Z

_fBodyAccJerk-meanFreq()-X_

_fBodyAccJerk-meanFreq()-Y_

_fBodyAccJerk-meanFreq()-Z_

_fBodyGyro-mean()-X_

_fBodyGyro-mean()-Y_

_fBodyGyro-mean()-Z_

_fBodyGyro-std()-X_

_fBodyGyro-std()-Y_

_fBodyGyro-std()-Z_

_fBodyGyro-meanFreq()-X_

_fBodyGyro-meanFreq()-Y_

_fBodyGyro-meanFreq()-Z_

_fBodyAccMag-mean()_

_fBodyAccMag-std()_

_fBodyAccMag-meanFreq()_

_fBodyBodyAccJerkMag-mean()_

_fBodyBodyAccJerkMag-std()_

_fBodyBodyAccJerkMag-meanFreq()_

_fBodyBodyGyroMag-mean()_

_fBodyBodyGyroMag-std()_

_fBodyBodyGyroMag-meanFreq()_

_fBodyBodyGyroJerkMag-mean()_

_fBodyBodyGyroJerkMag-meanFreq()_

_fBodyBodyGyroJerkMag-std()_


## 4. Script-Generated Data Set (Second Part)

This data set is generated using the datat set output in the First Part, consists of 180 observations and 81 variables. The variables consist of the subject identfier (integer), activity name (character string), and the averages calculcated for each of the signal variables in the data set (double). See description of signal variables from previous section.

_Average tBodyAcc-mean()-X_

_Average tBodyAcc-mean()-Y_

_Average tBodyAcc-mean()-Z_

_Average tBodyAcc-std()-X_

_Average tBodyAcc-std()-Y_

_Average tBodyAcc-std()-Z_

_Average tGravityAcc-mean()-X_

_Average tGravityAcc-mean()-Y_

_Average tGravityAcc-mean()-Z_

_Average tGravityAcc-std()-X_

_Average tGravityAcc-std()-Y_

_Average tGravityAcc-std()-Z_

_Average tBodyAccJerk-mean()-X_

_Average tBodyAccJerk-mean()-Y_

_Average tBodyAccJerk-mean()-Z_

_Average tBodyAccJerk-std()-X_

_Average tBodyAccJerk-std()-Y_

_Average tBodyAccJerk-std()-Z_

_Average tBodyGyro-mean()-X_

_Average tBodyGyro-mean()-Y_

_Average tBodyGyro-mean()-Z_

_Average tBodyGyro-std()-X_

_Average tBodyGyro-std()-Y_

_Average tBodyGyro-std()-Z_

_Average tBodyGyroJerk-mean()-X_

_Average tBodyGyroJerk-mean()-Y_

_Average tBodyGyroJerk-mean()-Z_

_Average tBodyGyroJerk-std()-X_

_Average tBodyGyroJerk-std()-Y_

_Average tBodyGyroJerk-std()-Z_

_Average tBodyAccMag-mean()_

_Average tBodyAccMag-std()_

_Average tGravityAccMag-mean()_

_Average tGravityAccMag-std()_

_Average tBodyAccJerkMag-mean()_

_Average tBodyAccJerkMag-std()_

_Average tBodyGyroMag-mean()_

_Average tBodyGyroMag-std()_

Average tBodyGyroJerkMag-mean()

Average tBodyGyroJerkMag-std()

Average fBodyAcc-mean()-X

Average fBodyAcc-mean()-Y

Average fBodyAcc-mean()-Z

Average fBodyAcc-std()-X

Average fBodyAcc-std()-Y

Average fBodyAcc-std()-Z

Average fBodyAcc-meanFreq()-X

Average fBodyAcc-meanFreq()-Y

Average fBodyAcc-meanFreq()-Z

Average fBodyAccJerk-mean()-X

Average fBodyAccJerk-mean()-Y

Average fBodyAccJerk-mean()-Z

Average fBodyAccJerk-std()-X

Average fBodyAccJerk-std()-Y

Average fBodyAccJerk-std()-Z

Average fBodyAccJerk-meanFreq()-X

Average fBodyAccJerk-meanFreq()-Y

Average fBodyAccJerk-meanFreq()-Z

Average fBodyGyro-mean()-X

Average fBodyGyro-mean()-Y

Average fBodyGyro-mean()-Z

Average fBodyGyro-std()-X

Average fBodyGyro-std()-Y

Average fBodyGyro-std()-Z

Average fBodyGyro-meanFreq()-Y

Average fBodyGyro-meanFreq()-Z

Average fBodyAccMag-mean()

Average fBodyAccMag-std()

Average fBodyAccMag-meanFreq()

Average fBodyBodyAccJerkMag-mean()
Average fBodyBodyAccJerkMag-std()

Average fBodyBodyAccJerkMag-meanFreq()

Average fBodyBodyGyroMag-mean()

Average fBodyBodyGyroMag-std()

Average fBodyBodyGyroMag-meanFreq()

Average fBodyBodyGyroJerkMag-mean()

Average fBodyBodyGyroJerkMag-meanFreq()

Average fBodyBodyGyroJerkMag-std()
