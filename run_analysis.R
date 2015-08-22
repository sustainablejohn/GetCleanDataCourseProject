run_analysis <- function() {
  ## read test file and combine with subject file which has subject numbers identified
  data_test <- read.table("test/X_test.txt")
  subjectdata_test <- read.table("test/subject_test.txt")
  data_test <- cbind(data_test, subjectdata_test)
  ## read activity file
  activitydata_test <- read.table("test/y_test.txt")
  ## combine these activity names with data file
  data_test <- cbind(data_test, activitydata_test)
  ## apply variable names to the data file based on variable names found in feature file
  ## add additional variable names for Subject Numbers and Activity Numbers
  features <- read.table("features.txt")
  addvar1 <- data.frame(V1=562, V2=c("SubjectNumber"))
  features <- rbind(features, addvar1)
  addvar2 <- data.frame(V1=563, V2=c("ActivityLabel"))
  features <- rbind(features, addvar2)
  colnames(data_test) <- features[,2]
  ## read train files and perform similar set of functions as with test files
  data_train <- read.table("train/X_train.txt")
  subjectdata_train <- read.table("train/subject_train.txt")
  data_train <- cbind(data_train, subjectdata_train)
  activitydata_train <- read.table("train/y_train.txt")
  data_train <- cbind(data_train, activitydata_train)
  colnames(data_train) <- features[,2]
  ## merge test and train files
  data_all <- rbind(data_test, data_train)
  ## subset file to only take mean and std measurements and leave the rest
  mean_std_index <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 529:530, 562:563)
  data_subset <- data_all[mean_std_index]
  ## fix mean and std variable/column names so they're cleaner and more descriptive
  c.names <- colnames(data_subset)
  c.names <- gsub("-","",c.names)
  c.names <- gsub("fB","frequencyB",c.names)
  c.names <- gsub("tB","timeB",c.names)
  c.names <- gsub("tG","timeG",c.names)
  c.names <- gsub("Acc","Accelerometer",c.names)
  c.names <- gsub("Gyro","Gyroscope",c.names)
  c.names <- gsub("std","Std",c.names)
  c.names <- gsub("mean","Mean",c.names)
  c.names <- gsub("BodyBody","Body",c.names)
  c.names <- gsub("\\(\\)","",as.character(c.names))
  colnames(data_subset) <- c.names
  library("dplyr")
  ## Create a second, independent tidy data set with the average of each variable for each activity and each subject.
  meansBySubjectByActivity <- data_subset %>% group_by(SubjectNumber, ActivityLabel) %>% summarise_each(funs(mean))
  ## replace activity numbers with activity names based on names found in the label file
  activitylabels <- read.table("activity_labels.txt")
  labelsOnly <- activitylabels[ ,2]
  relabel <- meansBySubjectByActivity[,2] 
  relabel <- as.numeric(unlist(relabel))
  relabel <- labelsOnly[relabel]
  meansBySubjectByActivity[,2] <- relabel
  ## View tidy data set and write data set to a text file
  View(meansBySubjectByActivity)
  write.table(meansBySubjectByActivity, file="tidyDataSetCourseProjectRomankiewicz.txt", row.names=FALSE)
}