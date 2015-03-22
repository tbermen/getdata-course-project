# =================================
# Getting and Cleaning Data Course Project
# Final submission for peer review
# =================================

## File list:
* README.md - this file
* run_analysis.R - R script for cleaning "UCI HAR Dataset"
* codebook.md - codebook that describes dataset that is created for step 5

## Testing 'run_analysis.R' script:
* Place 'run_analysis.R' script at same level as "UCI HAR Dataset"
* Use setwd() command to set your working directory to script location. (example: setwd("~/R/getdata-012/course_project"))
* source("run_analysis.R")
* "tidy_data" folder will be created, which will contain "step_5_tidy_data.txt"
* "step_5_tidy_data.txt" was the dataset submitted on Coursera for part 1

## Psuedo-code of "run_analysis.R".  
    How the Samsung dataset "UCI HAR Dataset" gets converted to a tidy dataset 
	as specified in Step 5 of the course project instructions. 
* 1) Import feature.txt. Extract feature names with only mean() or std() for each measurement
* 2) Import X data. Subset X for mean & std data
* 3) Import subject data
* 4) Import y data
* 5) Import activity labels for y data
* 6) Combine tables together into mean & std tables (data still messy)
* 7) Convert mean & std tables to tidy data
* 8) Merge to combine std data into mean table
* 9) Check for merging errors
* 10) Replace activity_id with descriptive activity name
* 11) Creating second tidy data set, with the average of each variable for each activity and each subject
* 12) Save the tidy data sets to .txt files

## License
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 
* [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012