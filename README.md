# HumanActivityAnalysis
Getting and Cleaning Data Course Project

## What is in the code
### Data for analysis
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Script does the following 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Prerequisites
Script that was placed in file "run_analysis.R" uses the following libraries:
    -- stringr
    -- plyr
    -- dplyr

You need to extract data files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
to the subdirectory "UCI HAR Dataset" that should be created from the current working directory.
Place the source file in that directory.

## Running the script
If subdirectory does not exists script reports message text "You need to place files on to directory "UCI HAR Dataset" and stops the execution.

Execute commands from RStudio or RGui
```{r}
source("run_analysis.R")
run_analysis()
```

If files exists, after successful  execution script places file "tidy_data_set.txt" in subdirectory 
"UCI HAR Dataset".
Script repot messages text after that: 
Data was written to the file

>"./UCI HAR Dataset/tidy_data_set.txt"

##Opening cleared data file
You can use the following line to open file in RStudio to your local table (example)
```{r}
subDir <- "./UCI HAR Dataset"
targetFileName <- "tidy_data_set.txt"
d5<-read.table( str_c(subDir, targetFileName, sep = "/"), header = TRUE, sep = " ")
```

