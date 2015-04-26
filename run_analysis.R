# Load packages
library(reshape2)

# Get and load the data

# Store main folder labels and features
# features lists all the features
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

# Load test data
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")


# Load train data
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Give X data proper names and labels
names(X_test) <- features[,2]
names(X_train) <- features[,2]

# Combine subjects and activities and give
# proper labels
subact_test <- cbind(subject_test, y_test)
subact_train <- cbind(subject_train, y_train)
names(subact_test) <- c("subject", "activity")
names(subact_train) <- c("subject", "activity")

# Column bind to add 2 rows to the observations
# Bind the activity/subjects together with their
# 561 different measured variables
labeledtest <- cbind(subact_test, X_test)
labeledtrain <- cbind(subact_train, X_train)

# Row bind to add 7352 training cases with
# the 2947 test cases.  They should all have the same
# labels by this point.
alldata <- rbind(labeledtrain,labeledtest)

# Make a column index that contains mean or std, activity, or subject
colIndex <- grep("mean\\(\\)|std\\(\\)|activity|subject", names(alldata))

# Subset all data using the index
somedata <- alldata[,colIndex]

# Make activity a factor, and give it levels
# using the activity_labels
somedata$activity <- factor(somedata$activity)
levels(somedata$activity) <- activity_labels[,2]

# Melt data frame into long form, keeping subject
# and activity
melted <- melt(somedata, id=c("subject","activity"))

# Cast the long data into wide format, and store the
# Mean of each of the measurements
tidy_data <- dcast(melted, subject+activity ~ variable, mean)

# Write the tidy data set
write.table(tidy_data, "tidy_data_averaged.txt", row.name=FALSE)
