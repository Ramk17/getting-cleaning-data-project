Getting and Cleaning Data: Course Project
=========================================

Introduction
------------
This repository contains work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization.


About the raw data
------------------

The raw data is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The features (561 of them) are unlabeled and can be found in the UCI HAR Dataset/test/X_test.txt. 
The activity labels are in the UCI HAR Dataset/test/y_test.txt file.
The test subjects are in the UCI HAR Dataset/test/subject_test.txt file.

The training set is stored under UCI HAR Dataset/train 

About the script and the tidy dataset
-------------------------------------
Prerequisites for this script:

1. the UCI HAR Dataset must be extracted and..
2. the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"

Create one R script called run_analysis.R that does the following.

1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Lastly, the script will create a tidy data set containing the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tab-delimited file called tidy.txt, which can also be found in this repository.

About the Code Book
-------------------
The CodeBook.md file explains the transformations performed and the resulting data and variables.

