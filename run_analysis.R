## run_analysis.R

## read data
##Down load Samsung data in current working directory
## My current working directory was set as C:\Users\ramk_bharathula\Data Science\Getting and Cleaning Data\week 3\course project

features<-read.table("./UCI HAR Dataset/features.txt")["V2"]
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt")["V2"]

indices_of_means_and_stds<-grep("mean|std",features$V2) # find indces of columns corresponding to mean/std data 

X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
names(X_train)<-features$V2

Y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
names(Y_train)<-"labels"

subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
names(subject_train)<-"subjects"

x_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
names(x_test)<-features$V2

y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
names(y_test)<-"labels"

subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
names(subject_test)<-"subjects"

## Extract only the measurements on the mean and standard deviation for each measurement
means_and_std_colnames<-colnames(x_test)[indices_of_means_and_stds]
x_test_subset<-cbind(subject_test,y_test,subset(x_test,select=means_and_std_colnames))
x_train_subset<-cbind(subject_train,Y_train,subset(X_train,select=means_and_std_colnames))

## Merge the training and the test sets to create one data set.
xy<-rbind(x_test_subset, x_train_subset)


## Create a second, independent tidy data set with the average of each variable for each activity and each subject
tidy<-aggregate(xy[,3:ncol(xy)],list(Subject=xy$subjects, Activity=xy$labels), mean)
tidy<-tidy[order(tidy$Subject),]

## Use descriptive activity names to name the activities in the data set
tidy$Activity<-activity_labels[tidy$Activity,]

write.table(tidy, file="./tidydata.txt", sep="\t", row.names=FALSE)