### 1. Source of the Experimental Data

The data used in this exercise was initially collected as part of the "Human Activity Recognition Using Smartphones Data Set" research project. This project built-up a database of motion readings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone equipped with inertial sensors. Each subject wore a waist-mounted Samsung Galaxy S II smartphone, that measured 3-axial linear acceleration and 3-axial angular velocity as the subject performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).

Full details are available at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data set consisted of records combining the following information:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment. 

### 2. Experimental Environment

The script was run on a 64-bit Ubuntu 14.04 Linux system, with kernel version 3.13.0-32-generic. The script was developed and run using RStudio version 0.98.977, and R version 3.0.2 (2013-09-25). The directory structure is referenced from the RStudio session working directory ("./")

##### Input files

Test data set:

./UCI HAR Dataset/test/subject_test.txt
./UCI HAR Dataset/test/X_test.txt
./UCI HAR Dataset/test/y_test.txt

Training data set:

./UCI HAR Dataset/train/subject_train.txt
./UCI HAR Dataset/train/X_train.txt
./UCI HAR Dataset/train/y_train.txt

./UCI HAR Dataset/activity_labels.txt
./UCI HAR Dataset/features.txt

##### Output files

./merged_test_train.txt
./test_train_averages.txt

### 3. Running the Code and Processing Overview

#### Executing the script

From inside RStudio, enter the following command at the prompt:
source('./run_analysis.R')

#### Key script variables

* test_subject_test: subject identifiers (data.frame) [integer: 1..30]
* test_X_test:	   map of subject to feature measurements data (data.frame) [double: [-1,1]]
* test_y_test:	   map of subject identifier to activity (data.frame) [integer: 1..6]

* train_subject_test: subject identifiers (data.frame) [integer: 1..30]
* train_X_test:	    map of subject to feature measurements data (data.frame) [double: [-1,1]]
* train_y_test:	    map of subject identifier to activity (data.frame) [integer: 1..6]

* test_train_averages: tidy data set, containing the averages of the stadard devication and mean measurements, from the merged
		    test and train data sets

#### Processing Steps

##### Pre-processing

0. Use the unix grep command to determine variables in the test and train data sets that denote standard deviation and mean measurements.
   Variables denoting that the standard deviation and mean were passed as parameters are omitted. For example:
   feat <- grep("*-mean|-std*", features[,2])

##### Part One

1. Read in the data files (using read.table)

2. Label the variables representing stand deviation and mean measurements, using descriptive variable names 

3. Add the subject and activity data frames to each of the test and train dataframes (using cbind)

4. For both the test data frame and the training data frame, remove the columns not necessary for the calculations,
   and order them based on subject and activity (by selecting non-labeled columns, and subsetting)

5. Create a temporary data frame with the merged data sets, and change the activity data values from numeric to
   their associated descriptive (character) label

6. Output the temporary data frame to the file "./merged_test_train.txt" (first tidy data set)

##### Part Two

7. Calculate the averages of the standard deviation and the mean for each feature measurement, categorized by subject and activity
   (using subsetting by "Subject" and "Activity", and calls to rbind and sapply)

8. Label the variables representing averages of the standard deviation and mean measurements, using descriptive variable names plus the
   word "Average"

9. Add the subject and activity data frames to the averaged dataframe (using cbind)

10. Output the data frame to the file "./averaged_test_train.txt" (second tidy data set)
