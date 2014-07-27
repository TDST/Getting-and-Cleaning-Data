##############################
#
# Getting and Cleaning Data, Final Project
#
#
#
# The data used in this exercise was initially collected as part of the "Human Activity Recognition Using Smartphones Data Set"
# research project. This project built-up a database of motion readings of 30 subjects performing activities of daily
# living (ADL) while carrying a waist-mounted smartphone equipped with inertial sensors. Each subject wore a waist-mounted
# Samsung Galaxy S II smartphone, that measured 3-axial linear acceleration and 3-axial angular velocity as the subject
# performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
#
# The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating
# the training data and 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). Full details are available at:
#        http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
# The original data set consisted of records combining the following information:
#        
#       - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
#       - Triaxial Angular velocity from the gyroscope.
#       - A 561-feature vector with time and frequency domain variables.
#       - Its activity label.
#       - An identifier of the subject who carried out the experiment.
#
# Script Processing Overview
#
# This script operates in two parts: the first part merges the training and test data sets
# into a single date set. It then extracts only the variables that contain values for the standard
# deviation and mean for each measurement. The activity names are relablled with descriptive
# titles, and the variables are renamed with a appriopriate descriptive name. This data set
# is then output to a file.
#
# In the second part, the data set from the first part is used to generate a new data set. This new
# data set consists of the averages of each variable for each activity and each subject.
# This data set is output to a file.
#
#
# File Structure for the Analysis
#
# The directory structure is referenced from the RStudio session working directory ("./")
#
#       ./UCI HAR Dataset/test/subject_test.txt
#       ./UCI HAR Dataset/test/X_test.txt
#       ./UCI HAR Dataset/test/y_test.txt
#
#       ./UCI HAR Dataset/train/subject_test.txt
#       ./UCI HAR Dataset/X_test.txt
#       ./UCI HAR Dataset/y_test.txt
#
# Output files
#
#       ./merged_test_train.txt
#       ./test_train_averages.txt
#
#
# Executing the Script
# 
# From inside RStudio, enter the following command at the prompt:
#        source('./run_analysis.R')
#


##############################  Part One: Merge Test and Train Data Sets


##
#
#   Read in data set values
#

test_subject_test <- read.table( "UCI HAR Dataset/test/subject_test.txt" )
test_X_test       <- read.table( "UCI HAR Dataset/test/X_test.txt" )
test_y_test       <- read.table( "UCI HAR Dataset/test/y_test.txt" )

train_subject_test <- read.table( "UCI HAR Dataset/train/subject_train.txt" )
train_X_test       <- read.table( "UCI HAR Dataset/train/X_train.txt" )
train_y_test       <- read.table( "UCI HAR Dataset/train/y_train.txt" )

activity_labels <- read.table( "UCI HAR Dataset/activity_labels.txt" )
features        <- read.table( "UCI HAR Dataset/features.txt" )

##
#
#   Label columns representing standard deviation and mean values, with the variable values used in the raw data
#

names( test_X_test )[ c( 1:6 ) ]  <- c( "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X",  "tBodyAcc-std()-Y",  "tBodyAcc-std()-Z" )
names( train_X_test )[ c( 1:6 ) ] <- c( "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z", "tBodyAcc-std()-X",  "tBodyAcc-std()-Y",  "tBodyAcc-std()-Z" )

#1 tBodyAcc-mean()-X
#2 tBodyAcc-mean()-Y
#3 tBodyAcc-mean()-Z
#4 tBodyAcc-std()-X
#5 tBodyAcc-std()-Y
#6 tBodyAcc-std()-Z

names( test_X_test )[ c( 41:46 ) ]  <- c( "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z" )
names( train_X_test )[ c( 41:46 ) ] <- c( "tGravityAcc-mean()-X", "tGravityAcc-mean()-Y", "tGravityAcc-mean()-Z", "tGravityAcc-std()-X", "tGravityAcc-std()-Y", "tGravityAcc-std()-Z" )

#41 tGravityAcc-mean()-X
#42 tGravityAcc-mean()-Y
#43 tGravityAcc-mean()-Z
#44 tGravityAcc-std()-X
#45 tGravityAcc-std()-Y
#46 tGravityAcc-std()-Z

names( test_X_test )[ c( 81:86 ) ]  <- c( "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z" )
names( train_X_test )[ c( 81:86 ) ] <- c( "tBodyAccJerk-mean()-X", "tBodyAccJerk-mean()-Y", "tBodyAccJerk-mean()-Z", "tBodyAccJerk-std()-X", "tBodyAccJerk-std()-Y", "tBodyAccJerk-std()-Z" )

#81 tBodyAccJerk-mean()-X
#82 tBodyAccJerk-mean()-Y
#83 tBodyAccJerk-mean()-Z
#84 tBodyAccJerk-std()-X
#85 tBodyAccJerk-std()-Y
#86 tBodyAccJerk-std()-Z

names( test_X_test )[ c( 121:126 ) ]  <- c( "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z" )
names( train_X_test )[ c( 121:126 ) ] <- c( "tBodyGyro-mean()-X", "tBodyGyro-mean()-Y", "tBodyGyro-mean()-Z", "tBodyGyro-std()-X", "tBodyGyro-std()-Y", "tBodyGyro-std()-Z" )

#121 tBodyGyro-mean()-X
#122 tBodyGyro-mean()-Y
#123 tBodyGyro-mean()-Z
#124 tBodyGyro-std()-X
#125 tBodyGyro-std()-Y
#126 tBodyGyro-std()-Z

names( test_X_test )[ c( 161:166 ) ]  <- c( "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z" )
names( train_X_test )[ c( 161:166 ) ] <- c( "tBodyGyroJerk-mean()-X", "tBodyGyroJerk-mean()-Y", "tBodyGyroJerk-mean()-Z", "tBodyGyroJerk-std()-X", "tBodyGyroJerk-std()-Y", "tBodyGyroJerk-std()-Z" )

#161 tBodyGyroJerk-mean()-X
#162 tBodyGyroJerk-mean()-Y
#163 tBodyGyroJerk-mean()-Z
#164 tBodyGyroJerk-std()-X
#165 tBodyGyroJerk-std()-Y
#166 tBodyGyroJerk-std()-Z

names( test_X_test )[ c( 201:202 ) ]  <- c( "tBodyAccMag-mean()", "tBodyAccMag-std()" )
names( train_X_test )[ c( 201:202 ) ] <- c( "tBodyAccMag-mean()", "tBodyAccMag-std()" )

#201 tBodyAccMag-mean()
#202 tBodyAccMag-std()

names( test_X_test )[ c( 214:215 ) ]  <- c( "tGravityAccMag-mean()", "tGravityAccMag-std()" )
names( train_X_test )[ c( 214:215 ) ] <- c( "tGravityAccMag-mean()", "tGravityAccMag-std()" )

#214 tGravityAccMag-mean()
#215 tGravityAccMag-std()

names( test_X_test )[ c( 227:228 ) ]  <- c( "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()" )
names( train_X_test )[ c( 227:228 ) ] <- c( "tBodyAccJerkMag-mean()", "tBodyAccJerkMag-std()" )

#227 tBodyAccJerkMag-mean()
#228 tBodyAccJerkMag-std()

names( test_X_test )[ c( 240:241 ) ]  <- c( "tBodyGyroMag-mean()", "tBodyGyroMag-std()" )
names( train_X_test )[ c( 240:241 ) ] <- c( "tBodyGyroMag-mean()", "tBodyGyroMag-std()" )

#240 tBodyGyroMag-mean()
#241 tBodyGyroMag-std()

names( test_X_test )[ c( 253:254 ) ]  <- c( "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()" )
names( train_X_test )[ c( 253:254 ) ] <- c( "tBodyGyroJerkMag-mean()", "tBodyGyroJerkMag-std()" )

#253 tBodyGyroJerkMag-mean()
#254 tBodyGyroJerkMag-std()

names( test_X_test )[ c( 266:271 ) ]  <- c( "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z" )
names( train_X_test )[ c( 266:271 ) ] <- c( "fBodyAcc-mean()-X", "fBodyAcc-mean()-Y", "fBodyAcc-mean()-Z", "fBodyAcc-std()-X", "fBodyAcc-std()-Y", "fBodyAcc-std()-Z" )

#266 fBodyAcc-mean()-X
#267 fBodyAcc-mean()-Y
#268 fBodyAcc-mean()-Z
#269 fBodyAcc-std()-X
#270 fBodyAcc-std()-Y
#271 fBodyAcc-std()-Z

names( test_X_test )[ c( 294:296 ) ]  <- c( "fBodyAcc-meanFreq()-X", "fBodyAcc-meanFreq()-Y", "fBodyAcc-meanFreq()-Z" )
names( train_X_test )[ c( 294:296 ) ] <- c( "fBodyAcc-meanFreq()-X", "fBodyAcc-meanFreq()-Y", "fBodyAcc-meanFreq()-Z" )

#294 fBodyAcc-meanFreq()-X
#295 fBodyAcc-meanFreq()-Y
#296 fBodyAcc-meanFreq()-Z

names( test_X_test )[ c( 345:350 ) ]  <- c( "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z" )
names( train_X_test )[ c( 345:350 ) ] <- c( "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y", "fBodyAccJerk-mean()-Z", "fBodyAccJerk-std()-X", "fBodyAccJerk-std()-Y", "fBodyAccJerk-std()-Z" )

#345 fBodyAccJerk-mean()-X
#346 fBodyAccJerk-mean()-Y
#347 fBodyAccJerk-mean()-Z
#348 fBodyAccJerk-std()-X
#349 fBodyAccJerk-std()-Y
#350 fBodyAccJerk-std()-Z

names( test_X_test )[ c( 373:375 ) ]  <- c( "fBodyAccJerk-meanFreq()-X", "fBodyAccJerk-meanFreq()-Y", "fBodyAccJerk-meanFreq()-Z" )
names( train_X_test )[ c( 373:375 ) ] <- c( "fBodyAccJerk-meanFreq()-X", "fBodyAccJerk-meanFreq()-Y", "fBodyAccJerk-meanFreq()-Z" )

#373 fBodyAccJerk-meanFreq()-X
#374 fBodyAccJerk-meanFreq()-Y
#375 fBodyAccJerk-meanFreq()-Z

names( test_X_test )[ c( 424:429 ) ]  <- c( "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z" )
names( train_X_test )[ c( 424:429 ) ] <- c( "fBodyGyro-mean()-X", "fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z", "fBodyGyro-std()-X", "fBodyGyro-std()-Y", "fBodyGyro-std()-Z" )

#424 fBodyGyro-mean()-X
#425 fBodyGyro-mean()-Y
#426 fBodyGyro-mean()-Z
#427 fBodyGyro-std()-X
#428 fBodyGyro-std()-Y
#429 fBodyGyro-std()-Z

names( test_X_test )[ c( 452:454 ) ]  <- c( "fBodyGyro-mean()-YfBodyGyro-meanFreq()-X", "fBodyGyro-meanFreq()-Y", "fBodyGyro-meanFreq()-Z" )
names( train_X_test )[ c( 452:454 ) ] <- c( "fBodyGyro-mean()-YfBodyGyro-meanFreq()-X", "fBodyGyro-meanFreq()-Y", "fBodyGyro-meanFreq()-Z" )

#452 fBodyGyro-meanFreq()-X
#453 fBodyGyro-meanFreq()-Y
#454 fBodyGyro-meanFreq()-Z

names( test_X_test )[ c( 503:504 ) ]  <- c( "fBodyAccMag-mean()", "fBodyAccMag-std()" )
names( train_X_test )[ c( 503:504 ) ] <- c( "fBodyAccMag-mean()", "fBodyAccMag-std()" )

#503 fBodyAccMag-mean()
#504 fBodyAccMag-std()

names( test_X_test )[ c( 513 ) ]  <- c( "fBodyAccMag-meanFreq()" )
names( train_X_test )[ c( 513 ) ] <- c( "fBodyAccMag-meanFreq()" )

#513 fBodyAccMag-meanFreq()

names( test_X_test )[ c( 516:517 ) ]  <- c( "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()" )
names( train_X_test )[ c( 516:517 ) ]  <- c( "fBodyBodyAccJerkMag-mean()", "fBodyBodyAccJerkMag-std()" )

#516 fBodyBodyAccJerkMag-mean()
#517 fBodyBodyAccJerkMag-std()

names( test_X_test )[ c( 526 ) ]  <- c( "fBodyBodyAccJerkMag-meanFreq()" )
names( train_X_test )[ c( 526 ) ] <- c( "fBodyBodyAccJerkMag-meanFreq()" )

#526 fBodyBodyAccJerkMag-meanFreq()

names( test_X_test )[ c( 529:530 ) ]  <- c( "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()" )
names( train_X_test )[ c( 529:530 ) ] <- c( "fBodyBodyGyroMag-mean()", "fBodyBodyGyroMag-std()" )

#529 fBodyBodyGyroMag-mean()
#530 fBodyBodyGyroMag-std()

names( test_X_test )[ c( 539 ) ]  <- c( "fBodyBodyGyroMag-meanFreq()" )
names( train_X_test )[ c( 539 ) ] <- c( "fBodyBodyGyroMag-meanFreq()" )

#539 fBodyBodyGyroMag-meanFreq()

names( test_X_test )[ c( 542 ) ]  <- c( "fBodyBodyGyroJerkMag-mean()" )
names( train_X_test )[ c( 542 ) ] <- c( "fBodyBodyGyroJerkMag-mean()" )

#542 fBodyBodyGyroJerkMag-mean()

names( test_X_test )[ c( 552 ) ]  <- c( "fBodyBodyGyroJerkMag-meanFreq()" )
names( train_X_test )[ c( 552 ) ] <- c( "fBodyBodyGyroJerkMag-meanFreq()" )

#552 fBodyBodyGyroJerkMag-meanFreq()

names( test_X_test )[ c( 543 ) ]  <- c( "fBodyBodyGyroJerkMag-std()" )
names( train_X_test )[ c( 543 ) ] <- c( "fBodyBodyGyroJerkMag-std()" )

#543 fBodyBodyGyroJerkMag-std()

##
#
#   Prepend the test and train data.frames with subject and activity columns
#

tmp1 <-cbind( test_subject_test, test_y_test  )
test_subject_activity_feature <- cbind( tmp1, test_X_test )
names( test_subject_activity_feature  )[ c( 1, 2 ) ] <- c( "Subject", "Activity" )

tmp1 <-cbind( train_subject_test, train_y_test  )
train_subject_activity_feature <- cbind( tmp1, train_X_test )
names( train_subject_activity_feature  )[ c( 1, 2 ) ] <- c( "Subject", "Activity" )

##
#   Remove the columns not necessary for the calculations, and order them based on subject and activity
#

test_subject_activity_feature <- subset( test_subject_activity_feature, select = !grepl( "^V", names( test_subject_activity_feature ) ) )
train_subject_activity_feature <- subset( train_subject_activity_feature, select = !grepl( "^V", names( train_subject_activity_feature ) ) )

merged_test_train <- rbind(  test_subject_activity_feature, train_subject_activity_feature )
output_merged_test_train <- as.data.frame( merged_test_train[ order( merged_test_train$Subject, merged_test_train$Activity ),  ] )

# Create temporary data from the merged data frame, and substitute the activity numbers for a descriptive label

output_merged_test_train$Activity[ output_merged_test_train$Activity==1 ] <- "WALKING"
output_merged_test_train$Activity[ output_merged_test_train$Activity==2 ] <- "WALKING_UPSTAIRS"
output_merged_test_train$Activity[ output_merged_test_train$Activity==3 ] <- "WALKING_DOWNSTAIRS"
output_merged_test_train$Activity[ output_merged_test_train$Activity==4 ] <- "SITTING"
output_merged_test_train$Activity[ output_merged_test_train$Activity==5 ] <- "STANDING"
output_merged_test_train$Activity[ output_merged_test_train$Activity==6 ] <- "LAYING"

##
#   Write the tidy, merged data set to a file
#

write.table( output_merged_test_train, "./merged_test_train.txt", quote=FALSE, row.names=FALSE )



##############################  Part Two: Calculate Mean of Standard Deviation and Mean Variables


##
#   Calculate the averages of the standard deviation and the mean for each feature measurement, broken down by subject and activity
#

test_train_averages <- data.frame( )
subject_activity <- data.frame( )
column_total <- length( merged_test_train )

r <- 0
for( subj in 1:30 ){
        for( acti in 1:6 ){
                r <- r + 1
                subject_activity[ r, 1 ] <- subj
                subject_activity[ r, 2 ] <- acti
                spec <- merged_test_train[ (merged_test_train$"Subject"==subj & merged_test_train$"Activity"==acti),  ]        
                test_train_averages <- rbind( test_train_averages, sapply( spec[ 3:column_total ], mean ) )
        }
}

##
#   Label columns representing the averages of the standard deviation and mean values
#

names( test_train_averages )[ c( 1:6 ) ]  <- c( "Average tBodyAcc-mean()-X", "Average tBodyAcc-mean()-Y", "Average tBodyAcc-mean()-Z", "Average tBodyAcc-std()-X",  "Average tBodyAcc-std()-Y",  "Average tBodyAcc-std()-Z" )

#1 tBodyAcc-mean()-X
#2 tBodyAcc-mean()-Y
#3 tBodyAcc-mean()-Z
#4 tBodyAcc-std()-X
#5 tBodyAcc-std()-Y
#6 tBodyAcc-std()-Z

names( test_train_averages )[ c( 7:12 ) ]  <- c( "Average tGravityAcc-mean()-X", "Average tGravityAcc-mean()-Y", "Average tGravityAcc-mean()-Z", "Average tGravityAcc-std()-X", "Average tGravityAcc-std()-Y", "Average tGravityAcc-std()-Z" )

#7  41 tGravityAcc-mean()-X
#8  42 tGravityAcc-mean()-Y
#9  43 tGravityAcc-mean()-Z
#10 44 tGravityAcc-std()-X
#11 45 tGravityAcc-std()-Y
#12 46 tGravityAcc-std()-Z

names( test_train_averages )[ c( 13:18 ) ]  <- c( "Average tBodyAccJerk-mean()-X", "Average tBodyAccJerk-mean()-Y", "Average tBodyAccJerk-mean()-Z", "Average tBodyAccJerk-std()-X", "Average tBodyAccJerk-std()-Y", "Average tBodyAccJerk-std()-Z" )

#13 81 tBodyAccJerk-mean()-X
#14 82 tBodyAccJerk-mean()-Y
#15 83 tBodyAccJerk-mean()-Z
#16 84 tBodyAccJerk-std()-X
#17 85 tBodyAccJerk-std()-Y
#18 86 tBodyAccJerk-std()-Z

names( test_train_averages )[ c( 19:24 ) ]  <- c( "Average tBodyGyro-mean()-X", "Average tBodyGyro-mean()-Y", "Average tBodyGyro-mean()-Z", "Average tBodyGyro-std()-X", "Average tBodyGyro-std()-Y", "Average tBodyGyro-std()-Z" )

#19 121 tBodyGyro-mean()-X
#20 122 tBodyGyro-mean()-Y
#21 123 tBodyGyro-mean()-Z
#22 124 tBodyGyro-std()-X
#23 125 tBodyGyro-std()-Y
#24 126 tBodyGyro-std()-Z

names( test_train_averages )[ c( 25:30 ) ]  <- c( "Average tBodyGyroJerk-mean()-X", "Average tBodyGyroJerk-mean()-Y", "Average tBodyGyroJerk-mean()-Z", "Average tBodyGyroJerk-std()-X", "Average tBodyGyroJerk-std()-Y", "Average tBodyGyroJerk-std()-Z" )

#25 161 tBodyGyroJerk-mean()-X
#26 162 tBodyGyroJerk-mean()-Y
#27 163 tBodyGyroJerk-mean()-Z
#28 164 tBodyGyroJerk-std()-X
#29 165 tBodyGyroJerk-std()-Y
#30 166 tBodyGyroJerk-std()-Z

names( test_train_averages )[ c( 31:32 ) ]  <- c( "Average tBodyAccMag-mean()", "Average tBodyAccMag-std()" )

#31 201 tBodyAccMag-mean()
#32 202 tBodyAccMag-std()

names( test_train_averages )[ c( 33:34 ) ]  <- c( "Average tGravityAccMag-mean()", "Average tGravityAccMag-std()" )

#33 214 tGravityAccMag-mean()
#34 215 tGravityAccMag-std()

names( test_train_averages )[ c( 35:36 ) ]  <- c( "Average tBodyAccJerkMag-mean()", "Average tBodyAccJerkMag-std()" )

#35 227 tBodyAccJerkMag-mean()
#36 228 tBodyAccJerkMag-std()

names( test_train_averages )[ c( 37:38 ) ]  <- c( "Average tBodyGyroMag-mean()", "Average tBodyGyroMag-std()" )

#37 240 tBodyGyroMag-mean()
#38 241 tBodyGyroMag-std()

names( test_train_averages )[ c( 39:40 ) ]  <- c( "Average tBodyGyroJerkMag-mean()", "Average tBodyGyroJerkMag-std()" )

#39 253 tBodyGyroJerkMag-mean()
#40 254 tBodyGyroJerkMag-std()

names( test_train_averages )[ c( 41:46 ) ]  <- c( "Average fBodyAcc-mean()-X", "Average fBodyAcc-mean()-Y", "Average fBodyAcc-mean()-Z", "Average fBodyAcc-std()-X", "Average fBodyAcc-std()-Y", "Average fBodyAcc-std()-Z" )

#41 266 fBodyAcc-mean()-X
#42 267 fBodyAcc-mean()-Y
#43 268 fBodyAcc-mean()-Z
#44 269 fBodyAcc-std()-X
#45 270 fBodyAcc-std()-Y
#46 271 fBodyAcc-std()-Z

names( test_train_averages )[ c( 47:49 ) ]  <- c( "Average fBodyAcc-meanFreq()-X", "Average fBodyAcc-meanFreq()-Y", "Average fBodyAcc-meanFreq()-Z" )

#47 294 fBodyAcc-meanFreq()-X
#48 295 fBodyAcc-meanFreq()-Y
#49 296 fBodyAcc-meanFreq()-Z

names( test_train_averages )[ c( 50:55 ) ]  <- c( "Average fBodyAccJerk-mean()-X", "Average fBodyAccJerk-mean()-Y", "Average fBodyAccJerk-mean()-Z", "Average fBodyAccJerk-std()-X", "Average fBodyAccJerk-std()-Y", "Average fBodyAccJerk-std()-Z" )

#50 345 fBodyAccJerk-mean()-X
#51 346 fBodyAccJerk-mean()-Y
#52 347 fBodyAccJerk-mean()-Z
#53 348 fBodyAccJerk-std()-X
#54 349 fBodyAccJerk-std()-Y
#55 350 fBodyAccJerk-std()-Z

names( test_train_averages )[ c( 56:58 ) ]  <- c( "Average fBodyAccJerk-meanFreq()-X", "Average fBodyAccJerk-meanFreq()-Y", "Average fBodyAccJerk-meanFreq()-Z" )

#56 373 fBodyAccJerk-meanFreq()-X
#57 374 fBodyAccJerk-meanFreq()-Y
#58 375 fBodyAccJerk-meanFreq()-Z

names( test_train_averages )[ c( 59:64 ) ]  <- c( "Average fBodyGyro-mean()-X", "Average fBodyGyro-mean()-Y", "Average fBodyGyro-mean()-Z", "Average fBodyGyro-std()-X", "Average fBodyGyro-std()-Y", "Average fBodyGyro-std()-Z" )

#59 424 fBodyGyro-mean()-X
#60 425 fBodyGyro-mean()-Y
#61 426 fBodyGyro-mean()-Z
#62 427 fBodyGyro-std()-X
#63 428 fBodyGyro-std()-Y
#64 429 fBodyGyro-std()-Z

names( test_train_averages )[ c( 65:67 ) ]  <- c( "Average fBodyGyro-mean()-YfBodyGyro-meanFreq()-X", "Average fBodyGyro-meanFreq()-Y", "Average fBodyGyro-meanFreq()-Z" )

#65 452 fBodyGyro-meanFreq()-X
#66 453 fBodyGyro-meanFreq()-Y
#67 454 fBodyGyro-meanFreq()-Z

names( test_train_averages )[ c( 68:69 ) ]  <- c( "Average fBodyAccMag-mean()", "Average fBodyAccMag-std()" )

#68 503 fBodyAccMag-mean()
#69 504 fBodyAccMag-std()

names( test_train_averages )[ c( 70 ) ]  <- c( "Average fBodyAccMag-meanFreq()" )

#70 513 fBodyAccMag-meanFreq()

names( test_train_averages )[ c( 71:72 ) ]  <- c( "Average fBodyBodyAccJerkMag-mean()", "Average fBodyBodyAccJerkMag-std()" )

#71 516 fBodyBodyAccJerkMag-mean()
#72 517 fBodyBodyAccJerkMag-std()

names( test_train_averages )[ c( 73 ) ]  <- c( "Average fBodyBodyAccJerkMag-meanFreq()" )

#73 526 fBodyBodyAccJerkMag-meanFreq()

names( test_train_averages )[ c( 74:75 ) ]  <- c( "Average fBodyBodyGyroMag-mean()", "Average fBodyBodyGyroMag-std()" )

#74 529 fBodyBodyGyroMag-mean()
#75 530 fBodyBodyGyroMag-std()

names( test_train_averages )[ c( 76 ) ]  <- c( "Average fBodyBodyGyroMag-meanFreq()" )

#76 539 fBodyBodyGyroMag-meanFreq()

names( test_train_averages )[ c( 77 ) ]  <- c( "Average fBodyBodyGyroJerkMag-mean()" )

#77 542 fBodyBodyGyroJerkMag-mean()

names( test_train_averages )[ c( 78 ) ]  <- c( "Average fBodyBodyGyroJerkMag-meanFreq()" )

#78 552 fBodyBodyGyroJerkMag-meanFreq()

names( test_train_averages )[ c( 79 ) ]  <- c( "Average fBodyBodyGyroJerkMag-std()" )

#79 543 fBodyBodyGyroJerkMag-std()

##
#
#   Prepend the averaged test and train data frames with subject and activity columns
#

names( subject_activity ) <- c( "Subject", "Activity" )
test_train_averages <- cbind( subject_activity, test_train_averages )

# Substitute the activity numbers for a descriptive label

test_train_averages$Activity[ test_train_averages$Activity==1 ] <- "WALKING"
test_train_averages$Activity[ test_train_averages$Activity==2 ] <- "WALKING_UPSTAIRS"
test_train_averages$Activity[ test_train_averages$Activity==3 ] <- "WALKING_DOWNSTAIRS"
test_train_averages$Activity[ test_train_averages$Activity==4 ] <- "SITTING"
test_train_averages$Activity[ test_train_averages$Activity==5 ] <- "STANDING"
test_train_averages$Activity[ test_train_averages$Activity==6 ] <- "LAYING"

##
#   Write the tidy, averaged data set to a file
#

write.table( test_train_averages, "./averaged_test_train_.txt", quote=FALSE, row.names=FALSE )



