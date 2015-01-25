
Getting and Cleaning Data Project

CodeBook.md file Purpose of the file is to provide a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data

Data source: Human Activity Recognition Using Smartphones Data Set
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Information about the experiment:
30 people within the age group of 19 to 48. With Samsung phone attached to the waist, they performed the following activieiws: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. Data from accelerometer & gyroscope is used for this project.

Attribute Information:
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Data source for program:
# Human Activity Recognition Using Smartphones Dataset Version 1.0
#- 'README.txt'
#- 'features.txt': List of all features.
#- 'features_info.txt': Shows information about the variables used on the feature vector.
#- 'activity_labels.txt': Links the class labels with their activity name.
#- 'train/X_train.txt': Training set.
#- 'train/y_train.txt': Training labels.
#- 'test/X_test.txt': Test set.
#- 'test/y_test.txt': Test labels.

##The following files are available for the train & test data. 
#Their descriptions are equivalent. 
#- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. 
#Its range is from 1 to 30. 
#- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'.
#Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' & 'total_acc_z_train.txt' files for the Y & Z axis. 
#- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
#- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.


Read the data from these files and merge them with row bind (training & test sets)
Reading features.txt and merge entire data using column bind

Subset the data for getting mean and standard deviation
Important methods used in this 
1.  rbind & cbind: Combine R Objects by Rows or Columns
Description: Take a sequence of vector, matrix or data frames arguments and combine by columns or rows, respectively. These are generic functions with methods for other R classes.

Create separate tidy data set from the entire data
Write output in text & CSV formats

Variables:
Y_Activity_Test_Data - contains test activity data from Y_test.txt
Y_Activity_Train_Data - contains training data from Y_train.txt
Subject_Train_Data - contains subject data from subject_train.txt
Subject_Test_Data - contains subject data from subject_test.txt
X_Features_Test_Data - contains features test data from X_test.txt
X_Features_Train_Data - contains features training data from X_train.txt

All_Data - contains the entire data set

Subset_Data - contains the necessary information (subsett'd) which will be used for mean & standard deviation calculation

# Reference: https://rstudio-pubs-static.s3.amazonaws.com/37290_8e5a126a3a044b95881ae8df530da583.html


