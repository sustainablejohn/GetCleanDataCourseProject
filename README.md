# Getting and Cleaning Data Course Project for Coursera
August 21, 2015
This is the course project for Coursera: Getting and Cleaning Data.
I am not a data scientist, but I am doing my best to learn. Here we go.

The objective of this course project is to demonstrate ability to collect, work with, and clean a data set.

The dataset I worked with is data collected from the accelerometers from the Samsung Galaxy S smartphone, and a full description of the dataset can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data should be downloaded from this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Citation: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Measurements were taken on 30 different subjects, while they were doing different activities such as walking, sitting, standing, or going up stairs.

The R script located here first organizes and cleans the data. Then, it produces a tidy dataset with the means of the means (yes I mean that haha) and standard deviations of various measurements taken by the accelerometer and gyroscope, sorted by the type of activity (walking, sitting, etc) and the subject number. Additional information about the measurements can be found in CodeBook.md

Before you run the R script, be sure to first download and unzip the data file located at the link above. Set your working directory to file "UCI HAR Dataset".

Have fun!
