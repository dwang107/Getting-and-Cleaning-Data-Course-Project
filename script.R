
library(dplyr)

# read train data
xtrain <- read.fwf("./data/train/X_train.txt", widths = rep(16, 561))
ytrain <- read.csv("./data/train/y_train.txt", header = FALSE)
subjecttrain <- read.csv("./data/train/subject_train.txt", header = FALSE)
train_ready <- cbind(subjecttrain, ytrain, xtrain)

# read test data
xtest <- read.fwf("./data/test/x_test.txt", widths = rep(16,561))
ytest <- read.csv("./data/test/y_test.txt", header = FALSE)
subjecttest <- read.csv("./data/test/subject_test.txt", header = FALSE)
test_ready <- cbind(subjecttest, ytest, xtest)

# read feature data and activity data
feature <- read.csv("./data/features.txt", sep = " ", header = FALSE)
activity <- read.csv("./data/activity_labels.txt", sep = " ", header = FALSE)
colnames(activity) <- c("code", "description")

#combine train data and test data to dataframe x_total
x_total = rbind(train_ready, test_ready)

#rename the measurement columns to proper feature names 
colnames(x_total) <- c("subject", "activity", feature$V2)

#extract the columns of mean and std values only 
x_mean_std <- select(x_total,"subject", "activity", feature$V2[grep("mean\\(\\)|std\\(\\)", feature$V2)])

#update the activity codes with activity descriptions
for ( i in activity$code ){
  x_mean_std$activity[x_mean_std$activity == i] <- activity$description[activity$code == i]
}

#calculate the mean value for each subject, each activity. 
#the final dataset is final_avg
subject_list <- unlist(Map(c, unique(subjecttest), unique(subjecttrain)))

activity_list <- activity$description

final_avg <- data.frame()

for (i in subject_list) {
  for (j in activity_list){
#    print(i)
#    print(j)

    temp_1 <- filter(x_mean_std, subject ==i , activity == j)
    temp_1$subject <- paste("number", as.character( temp_1$subject), sep = "")
    
    temp_2 <- select_if(temp_1, is.numeric )
    temp_3 <- as.data.frame(t(apply(temp_2, MARGIN = 2, mean)))
    temp_4 <- cbind(data.frame( subject = i, activity = j), temp_3)
    final_avg <- rbind(final_avg, temp_4)
  }
}
