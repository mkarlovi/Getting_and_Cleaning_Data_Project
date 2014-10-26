##This scirpt was writtn as the course project for 
##Johns Hopkins "Getting and Cleaning Date" on Coursera, getdata-008

        ##This section reads the data sets into memory,labels the variables, 
        ##labels the observations, and combines the two data sets.
##Reads the two data sets.
xtrain <- read.table("C:/R/Project/train/X_train.txt")
xtest <- read.table("C:/R/Project/test/X_test.txt")

## Label the variables
ColNames <- read.table("C:/R/Project/features.txt")[,2]
xtrain <- setNames(xtrain,ColNames)
xtest  <- setNames(xtest,ColNames) 

##Read the data label files, subject, and name column
ytrain <- read.table("C:/R/Project/train/y_train.txt")
ytest <- read.table("C:/R/Project/test/y_test.txt")
subtrain <- read.table("C:/R/Project/train/subject_train.txt")
subtest <- read.table("C:/R/Project/test/subject_test.txt")
colnames(ytrain) <- "activity"
colnames(ytest) <- "activity"
colnames(subtrain) <- "subject"
colnames(subtest) <- "subject"


##Attach obseravations and subjects to data sets
xtrain <- cbind(ytrain,subtrain,xtrain)
xtest <- cbind(ytest, subtest, xtest)

##Combine both data sets
JoinedData <- rbind(xtrain,xtest)

        ##This section subsets the comined data set into a new data set
        ##which contains the mean and standard deviation variables.

##Use the grep funtion to select subset mean and standard deviation variables.

subdata <- JoinedData[,grep("activity|subject|mean()|std()",colnames(JoinedData))]

        ##This section labels the attactes descriptive names to activies.



##Convert activity column to factors, Read activity labels into memeory, 
##assign factor values and levels.
subdata$activity <- as.factor(subdata[,1])
activity <- read.table("C:/R/project/activity_labels.txt")
subdata[,1]<- factor(subdata[,1])
levels(subdata[,1]) <- activity[,2]

colNames <- colnames(subdata)
newcol <-gsub("^t","time__signal.",colNames)
newcol <-gsub("^f","frequency.", newcol)
newcol <- gsub("Acc","acceleration.", newcol)
newcol <- gsub("Body","body.", newcol)
newcol <- gsub("Gravity","gravity.", newcol)
newcol <- gsub("Gyro","gyroscope.", newcol)
newcol <- gsub("Jerk","jerk_signal.", newcol)
newcol <- gsub("Mag","magnitude.", newcol)
newcol <- gsub("-X"," X_Axis", newcol)
newcol <- gsub("-Y"," Y_Axis", newcol)
newcol <- gsub("-Z"," Z_Axis", newcol)
newcol <- gsub("-std()","  standard.deviation", newcol)
newcol <- gsub("-mean()"," mean", newcol)
#newcol <- gsub(","", newcol)
newcol <- gsub("meanFreq()","REMOVE", newcol)

##Attach descriptive column names and remove frequency mean columns
colnames(subdata) <- newcol
subdata <- subdata[,grep("activity|subject|mean|standard.deviation",colnames(subdata))]

  ##Create Tiday Data Subset
##Melt data set and reshape to summarize mean values for each activity and each subject.
library(reshape)
melt <- melt(subdata, id= c("activity","subject"))
activity <- cast(melt, activity ~ variable,mean)
subject <- cast(melt, subject~ variable,mean)

##Create tidy data set by binding activity and subject summary results
##then sorting by subject and activity
mergedData <- merge(activity,subject,all=TRUE)
actIndex <- grep("activity", names(mergedData))
subjIndex <- grep("subject", names(mergedData))
mergedData <- mergedData[,c(actIndex, (1:ncol(mergedData))[-actIndex])]
mergedData <- mergedData[,c(subjIndex, (1:ncol(mergedData))[-subjIndex])]
tidyData <- mergedData[order(mergedData$subject,mergedData$activity),]
write.table(tidyData,"C:/R/project/tidyData.txt",row.name=FALSE)