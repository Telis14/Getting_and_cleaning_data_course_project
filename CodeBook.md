The `run_analysis.R` script performs the data preparation as follows:

1. **Download the dataset**
- The dataset was downloaded and extracted under the folder `UCI HAR Dataset`.

**The Dataset**
`==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age 
bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, 
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) 
on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments 
have been video-recorded to label the data manually. The obtained dataset has been 
randomly partitioned into two sets, where 70% of the volunteers was selected for generating
the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters 
and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was 
separated using a Butterworth low-pass filter into body acceleration and gravity. The 
gravitational force is assumed to have only low frequency components, therefore a filter with 
0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by 
calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.`


2. **Assign each data file to a variable**
- `features` <- `features.txt`
- `activities` <- `activity_labels.txt`
- `subject_test` <- `test/subject_test.txt`
- `x_test` <- `test/X_test.txt`
- `y_test` <- `test/y_test.txt`
- `subject_train` <- `train/subject_train.txt`
- `x_train` <- `train/X_train.txt`
- `y_train` <- `train/y_train.txt`


3. **Merge the training and the test sets to create one data set**
- `x` merges `x_train` and `x_test` using `rbind()` function
- `y` merges `y_train` and `y_test` using `rbind()` function
- `subject` merges `subject_train` and `subject_test` using `rbind()` function
- `merged_data` merges `subject`, `y` and `x` using `cbind()` function


4. **Extract only measurements on the mean and standard deviation for each measurement**
- `subdata` is a subset of `merged_data`, selecting only columns: `subject`, `code` and the measurements on the `mean` and standard deviation (`std`) for each measurement

5. **Use descriptive activity names to name the activities in the data set**
- Data values in `code` column of `subdata` replaced with corresponding activity taken from second column of the `activities` variable

6. **Appropriately label the data set with descriptive variable names**
- variable `code` in `subdata` renamed as `activities`
- `Acc` appearing in all variable names replaced by `Accelerometer`
- `Gyro` appearing in all variable names replaced by `Gyroscope`
- `BodyBody` appearing in all varible names replaced by `Body`
- `Mag` appearing in all variable names replaced by `Magnitude`
- for variables starting with `f`, the `f` is replaced by `Frequency`
- for vairiables starting with `t`, the `t` is replaced by `Time`

7. **From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject**
- `final_tidy_data` summarizes `subdata` by taking the means of each variable for each activity and each subject, after grouping by subject and activity.
- `final_tidy_data` is exported into `final_tidy_data.txt` file.