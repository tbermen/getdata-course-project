
## A tidy data set. You should create one R script called run_analysis.R that does the following.
##   1 Merges the training and the test sets to create one data set.
##   2 Extracts only the measurements on the mean and standard deviation for each measurement.
##   3 Uses descriptive activity names to name the activities in the data set
##   4 Appropriately labels the data set with descriptive variable names.
##   5 From the data set in step 4, creates a second, independent tidy data set 
##     with the average of each variable for each activity and each subject.

if (!file.exists("tidy_data")) {
        dir.create("tidy_data")
}

library(tidyr)
library(dplyr)

## Import feature.txt
feature_colnames <- read.table("UCI HAR Dataset/features.txt", header=FALSE, sep="")
names(feature_colnames) <- c("feature_id","feature")
feature_name <- unlist(feature_colnames$feature)

### Extract feature names with only mean() or std() for each measurement
feature_extract_mean <- filter(feature_colnames, grepl("-mean\\(\\)", feature, ignore.case=TRUE))
feature_extract_std <- filter(feature_colnames, grepl("-std\\(\\)", feature, ignore.case=TRUE))
feature_extract_mean <- mutate(feature_extract_mean, feature_base = gsub("-mean\\(\\)|\\-|\\ ","",feature))
feature_extract_std <- mutate(feature_extract_std, feature_base = gsub("-std\\(\\)|\\-|\\ ","",feature))

## Import X data
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
X_total <- rbind(X_test,X_train)
names(X_total) <- feature_name

### Subset X for mean & std data
X_total_mean <- X_total[,feature_extract_mean$feature_id]
X_total_std <- X_total[,feature_extract_std$feature_id]
names(X_total_mean) <- feature_extract_mean$feature_base
names(X_total_std) <- feature_extract_std$feature_base

## Import subject data
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header=FALSE, sep="")
sub_test <- cbind(sub_test,"test")
names(sub_test) <- c("subject","group")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header=FALSE, sep="")
sub_train <- cbind(sub_train,"train")
names(sub_train) <- c("subject","group")
sub_total <- rbind(sub_test,sub_train)
sub_total[,1] <- as.factor(sub_total[,1])

## Import y data
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE, sep="")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE, sep="")
y_total <- rbind(y_test, y_train)
names(y_total) <- "activity_id"

## Import activity labels for y data
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE, sep="")
names(activity_labels) <- c("activity_id", "activity")

## Combine tables together into mean & std tables (data still messy)
syx_total_mean <- cbind(sub_total,y_total,X_total_mean)
syx_total_std <- cbind(sub_total,y_total,X_total_std)

## Convert mean & std tables to tidy data
syx_total_mean_tyd <- gather(syx_total_mean, measure, mean, tBodyAccX:fBodyBodyGyroJerkMag, -c(subject, group, activity_id))
syx_total_std_tyd <- gather(syx_total_std, measure, std, tBodyAccX:fBodyBodyGyroJerkMag, -c(subject, group, activity_id))

## Merge to combine std data into mean table
syx_total_mean_std_tyd <- mutate(syx_total_mean_tyd, std = syx_total_std_tyd$std)

## Check for merging errors
if ((sum(syx_total_mean_std_tyd$mean - syx_total_mean_tyd$mean) > 0) |
        (sum(syx_total_mean_std_tyd$std - syx_total_std_tyd$std) > 0)) { 
                warning("Data set joining problem.")
}

## Replace activity_id with descriptive activity name
syxa_total_mean_std <- merge(syx_total_mean_std_tyd, 
                             activity_labels, 
                             by.x="activity_id",
                             by.y="activity_id", 
                             sort = FALSE)
syxa_total_mean_std_tdy <- select(syxa_total_mean_std, activity, subject:std)

## Creating second tidy data set, with the average of each variable
##  for each activity and each subject
syxa_total_mean_std_tdy <- tbl_df(syxa_total_mean_std_tdy)
syxa_summary <- syxa_total_mean_std_tdy %>%
        group_by(activity, subject, measure) %>%
        summarise(avg_mean = mean(mean), 
                  avg_std = mean(std)
                  )

## Save the tidy data sets to .txt files
write.table(syxa_summary, file = "tidy_data/step_5_tidy_data.txt", row.names = FALSE)
## write.table(syxa_total_mean_std_tdy, file = "tidy_data/step_4_tidy_data.txt", row.names = FALSE)


## Clean-up functions
# closeAllConnections()
# rm(list=ls())

