setwd("./UCI HAR Dataset")
##Merge the training an test data##
x_train <- read.table('train/X_train.txt')

subject_train <- read.table('train/subject_train.txt')
names(subject_train)[1] <- 'subject'

label_train <- read.table('train/y_train.txt')
names(label_train)[1] <- 'activity'
head(label_train)
x_test <- read.table('test/X_test.txt')

subject_test <- read.table('test/subject_test.txt')
names(subject_test)[1] <- 'subject'

label_test <- read.table('test/y_test.txt')
names(label_test)[1] <- 'activity'
head(label_test)
ttrain <- cbind(subject_train, label_train, x_train)
ttest <- cbind(subject_test, label_test, x_test)
dat <- rbind(ttrain, ttest)

##label##
dat$activity[which(dat$activity == 1)] <- 'Walking'
dat$activity[which(dat$activity == 2)] <- 'Walking upstairs'
dat$activity[which(dat$activity == 3)] <- 'Walking downstairs'
dat$activity[which(dat$activity == 4)] <- 'Sitting'
dat$activity[which(dat$activity == 5)] <- 'Standing'
dat$activity[which(dat$activity == 6)] <- 'Laying'

##extract##
mean_value <- apply(dat[3:563], 2, mean) 
std_value <- apply(dat[3:563], 2, sd)
stats<-cbind(mean_value,std_value)
##feature label##
features<-read.table('features.txt')
features$V1<-NULL
m <- 1
n <- m + 2

while (m < 564) {
        ren <- features[m,]
        colnames(dat)[n] <- paste(ren)
        m = m + 1
        n = n + 1
}
sumdata <- aggregate(dat[,3] ~ subject + activity, data = dat, FUN = 'mean')


for (i in 4:ncol(dat)) {
        sumdata[,i] <- aggregate(dat[,i] ~ subject + activity, data = dat, FUN = 'mean')[,3]
}


colnames(sumdata) <- colnames(dat)


head(sumdata)
write.table(sumdata, 'tidydata.txt', row.names = FALSE)