#run_analysis.R

# Start working on the data that's been unzipped to the current working directory under the folder 'UCI HAR Dataset'
# File path to working directory: "../GitHub/GettingandCleaningDataCourseProject/"

# The dataset includes the following files - based on the recommendation from the TA,
  # files inside "Intertial Signals" folder aren't used.

# Clean up workspace
rm(list=ls())

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


## From the reference link from TA, we can conclude the following
#Varible Activity <-> "Y_train.txt" & "Y_test.txt"
#Varible Subject <-> "subject_train.txt" & subject_test.txt"
#Varibles Features <-> "X_train.txt" & "X_test.txt"
#Names of Varibles Features <-> "features.txt"
#levels of Varible Activity <-> "activity_labels.txt"

# Use Activity, Subject & Features as variable names for data in data frame
# Read Activity, Subject & Features
Y_Activity_Test_Data   <- read.table("UCI HAR Dataset/test/Y_test.txt")
Y_Activity_Train_Data  <- read.table("UCI HAR Dataset/train/Y_train.txt")
Subject_Train_Data     <- read.table("UCI HAR Dataset/train/subject_train.txt")
Subject_Test_Data      <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_Features_Test_Data   <- read.table("UCI HAR Dataset/test/X_test.txt")
X_Features_Train_Data  <- read.table("UCI HAR Dataset/train/X_train.txt")


## Merge data - training & test sets - using rbind
Subject_Data    <- rbind(Subject_Train_Data, Subject_Test_Data)
Y_Activity_Data <- rbind(Y_Activity_Train_Data, Y_Activity_Test_Data)
X_Features_Data <- rbind(X_Features_Train_Data, X_Features_Test_Data)


# update values with correct activity names
FeaturesNames <- read.table("UCI HAR Dataset/features.txt")

names(Y_Activity_Data)<- c("activity")
names(Subject_Data)<-c("subject")
names(X_Features_Data)<- FeaturesNames$V2

#Merge all data
Combined_Data <- cbind(Subject_Data, Y_Activity_Data)
All_Data <- cbind(X_Features_Data, Combined_Data)

##Extracts only the measurements on the mean & standard deviation for each measurement
#Subset names of features
Subdata_Features_Names <- FeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", FeaturesNames$V2)]

#Subset the data
Subset_Names <- c(as.character(Subdata_Features_Names), "subject", "activity" )
Subset_Data <- subset(All_Data, select=Subset_Names)

##Uses descriptive activity names to name the activities in the data set

ActivityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")


##Appropriately labels the data set with descriptive variable names
names(Subset_Data) <- gsub("^t", "time", names(Subset_Data))
names(Subset_Data) <- gsub("^f", "frequency", names(Subset_Data))
names(Subset_Data) <- gsub("Acc", "Accelerometer", names(Subset_Data))
names(Subset_Data) <- gsub("Gyro", "Gyroscope", names(Subset_Data))
names(Subset_Data) <- gsub("Mag", "Magnitude", names(Subset_Data))
names(Subset_Data) <- gsub("BodyBody", "Body", names(Subset_Data))


# check
names(Subset_Data)

## Create seperate tidy data set
library(plyr);
Subset_Data2 <- aggregate(. ~subject + activity, Subset_Data, mean)
Subset_Data2 <- Subset_Data2[order(Subset_Data2$subject,Subset_Data2$activity),]
#Text format output
write.table(Subset_Data2, file = "tidydata.txt",row.name=FALSE)
#CSV format output
write.csv(file="tidydata.csv", Subset_Data2)

# Reference: https://rstudio-pubs-static.s3.amazonaws.com/37290_8e5a126a3a044b95881ae8df530da583.html

