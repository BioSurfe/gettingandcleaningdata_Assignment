##Creating the required directories and getting the raw data
setwd("D:/MOOC")
if(!file.exists("MOOC")){
       dir.create("MOOC")
}
if(!file.exists("data")){
       dir.create("data")
}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "./data/dataset.gz")
dateDownloaded <- date()
unzip("D:/MOOC/data/dataset.gz", overwrite = TRUE, exdir = ".", unzip = "internal", setTimes = FALSE)
setwd("D:/MOOC/data/UCI HAR Dataset")

##============================
##Pre processomg

## Pre processing the raw data
testdata <- read.table("./test/X_test.txt", head = FALSE)
trainingdata <- read.table("./train/X_train.txt", head = FALSE)
mergedata <- rbind(testdata,trainingdata)

## Pre processing the subject lable
testsubject <- read.table("./test/subject_test.txt", head = FALSE)
trainsubject <- read.table("./train/subject_train.txt", head = FALSE)
mergedsubject <- rbind(testsubject, trainsubject)

## Pre processing the activity lable
testactivity <- read.table("./test/y_test.txt", head = FALSE)
trainactivity <- read.table("./train/y_train.txt", head = FALSE)
mergedactivity <- rbind(testactivity, trainactivity)

## creating a new factor variable to identify the data set
factorlable <- rep(c("test", "training"), c(2947, 7352))

##===========================
## Merging the data set and attaching column lables

finaldata <- cbind(factorlable, mergedsubject, mergedactivity, mergedata)
collnames <- read.table("./features.txt", head = F, sep = "")

names(finaldata) <- c("dataset", "subject", "activity", as.character(collnames[, 2]))

## convert numeric code of activity to a factor variable with descriptive activity names
finaldata[,3]<-as.factor(finaldata[,3])
levels(finaldata[,3])<-  c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
##===========================
#passing the final data as tidy data
tidyData <- finaldata
tidyData <- tidyData[,c(1:9, 44:49, 84:89, 124:129, 164:169, 204,205,217,218,230,231,243,244,256,257,269:274,348:353,427:432,506,507,519,520,532,533)]
##===========================
# Verrifying the tidy data
# dim(tidyData)
# names(tidyData)
# rownames(tidyData)
# tidyData[1:5,1:15]
# str(tidyData)
# summary(tidyData)

##======================
#Writing the table
#write.table(tidyData, file = "TidyData", row.names=FALSE)

##========================

library(plyr)
tidyData[,1]<- as.integer(tidyData[,1])
tidyData[,3]<- as.integer(tidyData[,3])
analyzedData <- ddply(tidyData, c("subject", "activity"), colMeans)

analyzedData[,1]<-as.factor(analyzedData[,1])
analyzedData[,3]<-as.factor(analyzedData[,3])
levels(analyzedData[,3])<-  c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
levels(analyzedData[,1])<-  c("test", "training")
analyzedData[1:10,1:5]

##=============
# Writing the table
write.table(analyzedData, file = "analyzedData.txt", row.names=FALSE)
