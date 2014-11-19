library(data.table)

if (!require("data.table")) {
  install.packages("data.table")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("data.table")
require("reshape2")

#load testData from X_test.txt. No column Header is present in the text file.
testData <- read.table("./test/X_test.txt", header=FALSE)

#load testData_activity from y_test.txt. No column Header is present in the text file.
testData_activity <- read.table("./test/y_test.txt", header=FALSE)

#load testData_subject from subject_test.txt. No column Header is present in the text file.
testData_subject <- read.table("./test/subject_test.txt", header=FALSE)

#load trainData from x_train.txt. No column Header is present in the text file.
trainData <- read.table("./train/X_train.txt", header=FALSE)

#load trainData_activity from y_train.txt. No column Header is present in the text file.
trainData_activity <- read.table("./train/y_train.txt", header=FALSE)

#load trainData_subject from subject_train.txt. No column Header is present in the text file.
trainData_subject <- read.table("./train/subject_train.txt", header=FALSE)

#load activities from activity_labels.txt. No column Header is present in the text file.
activities <- read.table("./activity_labels.txt", header=FALSE,colClasses="character")

#Number representations for activities are replaced by the actual activity names in the testData_activity dataframe
testData_activity$V1 <- factor(testData_activity$V1, levels=activities$V1, labels=activities$V2)

#Number representations for activities are replaced by the actual activity names in the trainData_activity dataframe
trainData_activity$V1 <- factor(trainData_activity$V1, levels=activities$V1, labels=activities$V2)

#features vector is populated from the features.txt file
features <- read.table("./features.txt",header=FALSE,colClasses="character")

#the column names of testData are populated from the V2 column of features
colnames(testData) <- features$V2

#the column names of trainData are populated from the V2 column of features
colnames(trainData) <- features$V2

#set the column name in trainData_activity to "Activity"
colnames(trainData_activity) <-c("Activity")

#set the column name in testData_activity to "Activity"
colnames(testData_activity) <-c("Activity")

#set the column name in testData_subject to "Subject"
colnames(testData_subject) <-c("Subject")

#set the column name in trainData_subject to "Subject"
colnames(trainData_subject) <-c("Subject")

#combine trainData and trainData_activity datasets by columns
trainData<-cbind(trainData,trainData_activity)

#combine trainData and trainData_subject datasets by columns
trainData<-cbind(trainData,trainData_subject)

#combine testData and testData_activity datasets by columns
testData<-cbind(testData,testData_activity)

#combine testData and testData_subject datasets by columns
testData<-cbind(testData,testData_subject)

#combine testData and trainData by rows
combinedData <- rbind(testData, trainData)

#calculate standard deviation for each measurement in the combined dataset
combinedData_sd <-sapply(combinedData,sd,na.rm=TRUE)

#calculate mean for each measurement in the combined dataset
combinedData_mean<-sapply(combinedData,mean,na.rm=TRUE)

#creates a data table for combined dataset
DataTable <- data.table(combinedData)

#calculates the standard deviation and mean by Activity and by Subject
tidy<-DataTable[,lapply(.SD,mean),by="Activity,Subject"]

#creates output for the tidy dataset to file tidy_data.txt
write.table(tidy,file="tidy_data.txt",sep=",",row.names=FALSE)





