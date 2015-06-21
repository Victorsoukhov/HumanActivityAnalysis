run_analysis <- function() {
# for test
#setwd ("C:/DataScience/03-Getting and Cleaning Data")    

# the code
# Constats
    subDir <- "./UCI HAR Dataset"
    subDirTrain <- "train"
    subDirTest <- "test"
    aLabSourceFile <- "activity_labels.txt"
    featSourceFile <- "features.txt"
    subjSourceFileTest <- "subject_test.txt"
    subjSourceFileTrain <- "subject_train.txt"
    xSourceFileTest <- "X_test.txt"
    xSourceFileTrain <- "X_train.txt"
    ySourceFileTest <- "y_test.txt"
    ySourceFileTrain <- "y_train.txt"
    targetFileName <- "tidy_data_set.txt"
    
#some library to load
    library(stringr)
    library(plyr)
    library(dplyr)
    if(!file.exists(subDir)){
        dir.create(subDir)
        stop ("You need to place files on to directory 'UCI HAR Dataset'")
    }

#reading Data files    
    labT <- read.table(str_c(subDir, aLabSourceFile, sep = "/"))
    featT <- read.table(str_c(subDir, featSourceFile, sep = "/"))

    SubjTrainT <- read.table(str_c(subDir, subDirTrain, subjSourceFileTrain, sep = "/"))
    SubjTestT <- read.table(str_c(subDir, subDirTest, subjSourceFileTest, sep = "/"))
    xTrainT <- read.table(str_c(subDir, subDirTrain, xSourceFileTrain, sep = "/"), colClasses = "numeric")
    xTestT <- read.table(str_c(subDir, subDirTest, xSourceFileTest, sep = "/"), colClasses = "numeric")
    yTrainT <- read.table(str_c(subDir, subDirTrain, ySourceFileTrain, sep = "/"), colClasses = "numeric")
    yTestT <- read.table(str_c(subDir, subDirTest, ySourceFileTest, sep = "/"), colClasses = "numeric")
    
    #make good names
    featT$V3 <- make.names(featT$V2)
    #1.	Merges the training and the test sets to create one data set
    library(data.table)
    OneData <- data.frame(Subject = SubjTrainT$V1, Act_code = yTrainT$V1)
    OneData <- rbind(OneData, data.frame(Subject = SubjTestT$V1, Act_code = yTestT$V1))
#    names(OneData) <- c("Subject", "Activity")
    
    OneData$Activity <- factor(OneData$Act_code, labels = c(as.character(labT$V2[1]),
                                                            as.character(labT$V2[2]),
                                                            as.character(labT$V2[3]),
                                                            as.character(labT$V2[4]),
                                                            as.character(labT$V2[5]),
                                                            as.character(labT$V2[6]))
                               )
    OneData <- cbind(OneData, data.frame( rbind(xTrainT, xTestT)))
    #naming the columns
    names(OneData) <- c(names(OneData)[1:3], featT$V3)
    
    #result columnt set
    FixedColumn <- c("Subject", "Activity")
    COlumnVariables <- grep("mean|std", featT$V3, value = TRUE)
    COlumnToSelect <- c(FixedColumn, COlumnVariables)
    OneData2 <- OneData[, COlumnToSelect]
    
    #calculating mean values grouping by Subject, Activity
    d3 <- group_by(OneData2, Subject, Activity)
    d4 <- ddply (d3,  c("Subject", "Activity"), numcolwise(mean))
    
    #Writing data file
    write.table(d4, str_c(subDir, targetFileName, sep = "/"), row.name=FALSE)
    message("Data was written to the file")
    message(str_c(subDir, targetFileName, sep = "/"))
    # you can read the file with
    #d5<-read.table( str_c(subDir, targetFileName, sep = "/"), header = TRUE, sep = " ")
    
}