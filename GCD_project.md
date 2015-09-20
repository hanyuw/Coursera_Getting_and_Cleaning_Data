# Getting and Cleaning Data Project
Halley Wang  
September 4, 2015  

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

[Description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

You should create one R script called run_analysis.R that does the following.

[Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)






```r
library(ggplot2)
library(dplyr)
library(reshape2)
```


### Read the Data from UCI HAR Dataset

```r
## training data set (561 features of 7352 observations):
train_data = read.table("UCI HAR Dataset/train/X_train.txt")

## test data set (561 features of 2947 observations):
test_data = read.table("UCI HAR Dataset/test/X_test.txt")


## training adn test data labels: 
## 1 WALKING
## 2 WALKING_UPSTAIRS
## 3 WALKING_DOWNSTAIRS
## 4 SITTING
## 5 STANDING
## 6 LAYING

## Read labels for both datasets:
train_label = read.table("UCI HAR Dataset/train/y_train.txt")
test_label = read.table("UCI HAR Dataset/test/y_test.txt")

## Read subject for both datasets:
train_subject = read.table("UCI HAR Dataset/train/subject_train.txt")
test_subject = read.table("UCI HAR Dataset/test/subject_test.txt")

## Read activity labels
## It works here just input the correspond labels' meaning,
## But it will not work for larger scale of categories.
ActLabel = read.table("UCI HAR Dataset/activity_labels.txt")

## features: List of all features (561 features):
features = read.table("UCI HAR Dataset/features.txt")
```



### 1. Merges the training and the test sets to create one data set.


```r
## Combine the labels and dataset:
train = cbind(train_label, train_subject, train_data)
test = cbind(test_label, test_subject, test_data)

## Merging the table:
## Did not know if there is any way to reduce the complexity.
## Bdata and Mdata operate twice on the dataframe.
Bdata = rbind(train, test)
Mdata = cbind(1:nrow(Bdata), Bdata)
names(Mdata) = c("ID", "Labels", "subject", as.character(features[,2]))
```


### 2. Extracts only the measurements on the mean and standard deviation for each measurement.


```r
## Scratch all mean and std column names:
measurements = grep("([Mm][Ee][Aa][Nn])|([Ss][Tt][Dd])", names(Mdata), value = TRUE)

## Throw the meanFreq and angle columns away:
measurements = measurements[!grepl("(mean[Ff]req)|(angle)", measurements)]

## Locates these columns in the dataframe:
msT = Mdata[ ,c("ID", "Labels", "subject", measurements)]
#head(msT)
```

### 3. Uses descriptive activity names to name the activities in the data set


```r
## Making the activity names according to labels:
#msT$Labels = factor(msT$Labels, labels = c("Walking", "Walking upstairs", "Walking downstairs", "Sitting", "Standing", "Laying"))

## Using Merging strategy to increase reproducibility
### Initiate the column names and characterize the values:
names(ActLabel) = c("lb", "activity")
ActLabel$activity = tolower(ActLabel$activity)
ActLabel$activity = gsub("_", " ", ActLabel$activity)
ActLabel$activity = factor(ActLabel$activity)

### Merge the labels:
msT = merge(x = msT, y = ActLabel, by.x = "Labels", by.y = "lb", all = TRUE)

## Rearrange the columns order:
msT = select(msT, c(2,ncol(msT),3,4:(ncol(msT)-1)))

## Factorize activity and subject:
msT$activity = factor(msT$activity)
msT$subject = factor(msT$subject)
#head(msT)
```

### 4. Appropriately labels the data set with descriptive variable names.


```r
## Storing the name of the column:
desName = names(msT)

## Using regular expressions to change the column names
desName = sub("^t", "time ellapse for", desName)
desName = sub("^f", "frequency of", desName)
desName = gsub("Bodybody", "body", ignore.case = TRUE, desName)
desName = gsub("Body", " body's movement", ignore.case = TRUE, desName)
desName = gsub("ACC", " from accelerometer", ignore.case = TRUE, desName)
desName = gsub("gyro", " from gyroscope", ignore.case = TRUE, desName)
desName = gsub("Jerk", " in Jerk signal", ignore.case = TRUE, desName)
desName = gsub("Mag", " in magnitude(Euclidean norm)", ignore.case = TRUE, desName)
desName = gsub("-mean", "'s mean", ignore.case = TRUE, desName)
desName = gsub("-std", "'s standard deviation", ignore.case = TRUE, desName)
desName = gsub("[()]", "", ignore.case = TRUE, desName)
desName = gsub("-X", " in X direction", ignore.case = TRUE, desName)
desName = gsub("-Y", " in Y direction", ignore.case = TRUE, desName)
desName = gsub("-Z", " in Z direction", ignore.case = TRUE, desName)

names(msT) = desName
#head(msT)
```

### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


```r
## Melting table by activity and subject
keyFeature = c("activity", "subject")
msFeature = names(msT)[-match(c("ID", keyFeature), names(msT))]
meltT = melt(msT, id = keyFeature, measure.vars = msFeature)
#head(meltT)

## dcast table:
dcTable = dcast(meltT, subject + activity ~ variable, mean)
#str(dcTable)
```



```r
## Write dcast table:
write.table(dcTable, "tidydata.txt", row.name = FALSE)
```
