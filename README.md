# Getting_and_cleaning_data_course_project
This repo contains the files submitted for the Coursera data science getting and cleaning data course project.
It contains instructions on how to run analysis on Human Activity recognition dataset.

## Dataset
[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files
`CodeBook.md` is the code book that describes the variables, the data, and the transformations performed to clean up the data

`run_analysis.R` provides the coding used to prepare the data as follows:
    - Merges the training and the test sets to create one data set.
    - Extracts only the measurements on the mean and standard deviation for each measurement.
    - Uses descriptive activity names to name the activities in the data set
    - Appropriately labels the data set with descriptive variable names.
    - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
      FinalData.txt is the exported final data after going through all the sequences described above.
