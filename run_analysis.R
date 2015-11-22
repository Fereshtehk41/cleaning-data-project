# run_analysis.R script for Coursera Getting and Cleaning Data course project

##Basic info from README and data files
#features.txt list of 561 features
#subject_train 7352 rows of subject numbers 
#x_train   561 data points in each row
#y_train.txt   7352 rows activity IDs (1-6)

#Read the data files and check the dimensions to understand the data
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", header=FALSE)
test_s <- read.csv("UCI HAR Dataset/test/subject_test.txt", header=FALSE)
test_x <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="",header=FALSE)
test_y <- read.csv("UCI HAR Dataset/test/y_test.txt", header=FALSE)
dim(test_s)
dim(test_x)
dim(test_y)
train_s <- read.csv("UCI HAR Dataset/train/subject_train.txt", header=FALSE)
train_x <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="",header=FALSE)
train_y <- read.csv("UCI HAR Dataset/train/y_train.txt", header=FALSE)
dim(train_s)
dim(train_x)
dim(train_y)
features <- read.csv("UCI HAR Dataset/features.txt", sep=" ", header=FALSE)
dim(features)

#Combine test and train data sets
s <- rbind(test_s, train_s)
x <- rbind(test_x, train_x)
y <- rbind(test_y, train_y)

#Set the features as column names
names(x) <- features$V2

#Subset the desired features for Q2 as vector of character
desiredFeatures <- features[grep("mean|std", features$V2),]
i <- sapply(desiredFeatures, is.factor)
desiredFeatures[i] <- lapply(desiredFeatures[i], as.character)

#Select only the desired features into meansAndDevs data frame
meansAndDevs <- subset(x, select=desiredFeatures$V2)

#Add column name to the subject and activity data
names(s) <- "Subject"
names(y) <- "ActivityCode"

#Combine all data by column
all <- cbind(s,y,meansAndDevs)

#For Q5, find mean per subject and per activity code
meansSubjectActivity <- aggregate(all[, 3:81], list(all$Subject,all$ActivityCode), mean)

#Set descriptive column names
names(meansSubjectActivity) <- c("SubjectGroup","ActivityGroup",desiredFeatures$V2)

#Write into a text file
write.table(meansSubjectActivity,"means_subject_activity.csv", row.name=FALSE)




