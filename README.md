# HumanActivityAnalysis
Getting and Cleaning Data Course Project

## Prerequisites
Script that was placed in file "run_analysis.R" uses the following libraries
    -- stringr
    -- plyr
    -- dplyr

You need to extract data files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
to the subdirectory "UCI HAR Dataset" that is from the current working directory.
Place the source file in that directory.

# Running the script
if subdirectory does not exists script report message text "You need to place files on to directory "UCI HAR Dataset" and stop execution.

Execute commands from RStudio or RGui
> source("run_analysis.R")
> run_analysis()

if files exists, after successful  execution script places file "tidy_data_set.txt" in subdirectory 
"UCI HAR Dataset".
Script repot messages text after that: 
Data was written to the file
./UCI HAR Dataset/tidy_data_set.txt

##Opening file
You can use the following line to open file to your local table

>subDir <- "./UCI HAR Dataset"
>targetFileName <- "tidy_data_set.txt"
>d5<-read.table( str_c(subDir, targetFileName, sep = "/"), header = TRUE, sep = " ")


