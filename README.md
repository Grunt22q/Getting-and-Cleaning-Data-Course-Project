## Getting and Cleaning Data Course Project 
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

You should create one R script called run_analysis.R that does the following.

1)Merges the training and the test sets to create one data set.
2)Extracts only the measurements on the mean and standard deviation for each measurement.
3)Uses descriptive activity names to name the activities in the data set
4)Appropriately labels the data set with descriptive variable names.
5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Source of the original data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Full Description at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Performed transformations

The script run_analysis.R performs the following process to clean up the data and create tiny data sets:

Merge the training and test sets to create one data set.

Reads features.txt and uses only the measurements on the mean and standard deviation for each measurement.

Reads activity_labels.txt and applies human readable activity names to name the activities in the data set.

Labels the data set with descriptive names. (Names are converted to lower case; underscores and brackets are removed.)

Merges the features with activity labels and subject IDs. The result is saved as TidyData.txt.

The average of each measurement for each activity and each subject is merged to a second data set. The result is saved as AverTidyData.txt