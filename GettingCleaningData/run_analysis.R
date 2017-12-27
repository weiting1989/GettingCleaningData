#load plyr package
library(plyr)

#Set Working Directory
setwd("~/GettingCleaningData")

#1.Merges the training and the test sets to create one data set.

#load feature and activity
feature <- read.table("./features.txt",header = FALSE)
activity <-read.table("./activity_labels.txt",header = FALSE)

#load training and test data
subject_train <- read.table("./train/subject_train.txt",header = FALSE)
xtrain <- read.table("./train/X_train.txt",header = FALSE)
ytrain <- read.table("./train/Y_train.txt",header = FALSE)

subject_test <- read.table("./test/subject_test.txt",header = FALSE)
xtest <- read.table("./test/X_test.txt",header = FALSE)
ytest <- read.table("./test/y_test.txt",header = FALSE)

#Assign the column names for the above data
colnames(activity)<- c("activityId","activityType")
colnames(subject_train)<- "subId"
colnames(ytrain) <- "activityId"
colnames(xtrain) <- feature[,2]

colnames(subject_test)<- "subId"
colnames(ytest) <- "activityId"
colnames(xtest) <- feature[,2]

#merge test and train data
trainData <- cbind(subject_train,ytrain,xtrain)
testData <- cbind(subject_test,ytest,xtest)

#rowcomibnd the data
data <- rbind(trainData,testData)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
data_mean_std <-data[,grepl("mean|std|subId|activityId",colnames(data))]

#3.Uses descriptive activity names to name the activities in the data set
data_mean_std <- join(data_mean_std,activity,by = "activityId")


#4.Appropriately labels the data set with descriptive variable names.
#remove parentheses and correct syntax
names(data_mean_std) <- gsub("\\(|\\)", "", names(data_mean_std))
names(data_mean_std) <- make.names(names(data_mean_std))
#rename the labels
names(data_mean_std) <- gsub("^t", "Time", names(data_mean_std))
names(data_mean_std) <- gsub("^f", "Frequency", names(data_mean_std))
names(data_mean_std) <- gsub("Acc", "Accerlation", names(data_mean_std))
names(data_mean_std) <- gsub("std", "StandardDeviation", names(data_mean_std))
names(data_mean_std) <- gsub("BodyBody", "Body", names(data_mean_std))
names(data_mean_std) <- gsub("Freq", "Frequency", names(data_mean_std))
names(data_mean_std) <- gsub("Mag", "Magnitude", names(data_mean_std))

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data_average <- ddply(data_mean_std, c("subId","activityId","activityType"), numcolwise(mean))
#write data to a file
write.csv(data_average, "tidy.csv", row.names=FALSE)