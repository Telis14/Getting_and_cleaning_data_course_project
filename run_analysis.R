#downloading the dataset
filename <- "Coursera_course3_project.zip"

# Checking if data files exist -> download.
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename)
}  

# Checking if folder exists -> unzip
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

#load required packages
library(dplyr)


#assigning data frames
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


#merging the training and test sets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
merged_data <- cbind(subject, y, x)


#extracting mean and std for each measurement
subdata <- merged_data %>% select(subject, code, contains("mean"), contains("std"))


#adding descriptive activity names to name the activities
subdata$code <- activities[subdata$code, 2]


#renaming the variables appropriately
names(subdata)[2] = "activity"
names(subdata)<-gsub("Acc", "Accelerometer", names(subdata))
names(subdata)<-gsub("Gyro", "Gyroscope", names(subdata))
names(subdata)<-gsub("BodyBody", "Body", names(subdata))
names(subdata)<-gsub("Mag", "Magnitude", names(subdata))
names(subdata)<-gsub("^t", "Time", names(subdata))
names(subdata)<-gsub("^f", "Frequency", names(subdata))
names(subdata)<-gsub("tBody", "TimeBody", names(subdata))
names(subdata)<-gsub("-mean()", "Mean", names(subdata), ignore.case = TRUE)
names(subdata)<-gsub("-std()", "STD", names(subdata), ignore.case = TRUE)
names(subdata)<-gsub("-freq()", "Frequency", names(subdata), ignore.case = TRUE)
names(subdata)<-gsub("angle", "Angle", names(subdata))
names(subdata)<-gsub("gravity", "Gravity", names(subdata))


#creating a second, indep tidy data set with avg for each variable for each 
#activity and subject
final_tidy_data <- subdata %>%
        group_by(subject, activity) %>%
        summarise_all(funs(mean))
write.table(final_tidy_data, "Final_tidy_data.txt", row.name=FALSE)