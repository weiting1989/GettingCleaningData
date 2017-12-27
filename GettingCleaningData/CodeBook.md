##CodeBook

This code book describes the variables and data used in this project, and the processing required to create tidy data.

###OverView
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.The experiments have been video-recorded to label the data manually.The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

###Explanation of each file

-features.txt : Names of the 561 features
-activity_labels.txt : Names and activity Id of all 6 activities 
-X_train.txt: From 21 of the 30 volunteer, the data with 561 features and 6 activities
-Y_train.txt: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
-subject_train.txt :  A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
-X_test.txt: From 9 of the 30 volunteer, the data with 561 features and 6 activities
-Y_train.txt: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_train.txt.
-subject_train.txt :  A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.

The more information is available in features_info.txt file.

##Processing Steps
1. Load all of the above files and combine into a single data with appropriate column header.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Join the data with the activity descriptive names and ID.
4. Remove all column names with parentheses and add descriptive names.
5. Create a tidy data set with the average of each variables for each activity and subject.The tidy data was created contatin the mean of each feature for each activity and subject.Each subject has 6 row in the tidy data and each row contains the mean value for 66 features for the subject and activity combination. Since there are 30 objects,there are 180 rows in tidy data.
6. Write the output(tidy data) into CSV file.