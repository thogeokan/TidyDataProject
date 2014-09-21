
# @author: Thomas Kanold

## Load the needed libraries
library(dplyr)

# Path to my PERSONAL LOKAL working directory. Left it for convenience though.
#setwd("Documents/Programming/R/TidyDataProject")


###
#  Download ZIP
###

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "Dataset.zip"


# create data directory if does not exist already
if (!file.exists("data")) {
  dir.create("data")
}

# actually download ZIP if not already present
if (!file.exists(fileName)) {
  download.file(url = fileURL, destfile = fileName, method = "curl")
  downloadDate = date()
}

###
#  Load each table 
###

# UNZIP
unzip("./Dataset.zip")


# Load the datatables:

# datadir  <- "UCI HAR Dataset/"

# tbl_df is actually not needed, but the tables look nicer when you have a look at them
subject_train  <- tbl_df(read.table("UCI HAR Dataset/train/subject_train.txt"))
subject_test  <- tbl_df(read.table("UCI HAR Dataset/test/subject_test.txt"))

x_train  <- tbl_df(read.table("UCI HAR Dataset/train/X_train.txt"))
x_test <- tbl_df(read.table("UCI HAR Dataset/test/X_test.txt"))

y_train  <- tbl_df(read.table("UCI HAR Dataset/train/y_train.txt"))
y_test <- tbl_df(read.table("UCI HAR Dataset/test/y_test.txt"))

act_label  <- tbl_df(read.table("UCI HAR Dataset/activity_labels.txt"))
features  <- tbl_df(read.table("UCI HAR Dataset/features.txt"))


###
#  Give every column a proper name.
###

names(subject_train)  <- "SUBJECT_ID"
names(subject_test)  <- "SUBJECT_ID"

# we don't need to do this, but I think it is nicer this way
names(act_label)  <- c("ACTIVITY_ID","ACTIVITY")
names(features)  <- c("ID","NAME")

# Give every feature column its proper name
names(x_train)  <- features[,2]
names(x_test)  <- features[,2]

names(y_train)  <- "ACTIVITY_ID"
names(y_test)  <- "ACTIVITY_ID"

###
#  Merge the training and the test sets to create one dataset.
#
## STEP 1
# 
###

# check.names musst be false, otherwise the column names will be changed/abreviated
train  <- data.frame(y_train,subject_train,x_train, check.names= FALSE)
test  <- data.frame(y_test,subject_test,x_test, check.names= FALSE)

big_table  <- rbind(train,test)


###
#  Extract only the mean and std variables. I kept the Activity and the Subject_id in there for now.
#  
## STEP 2
# 
###

# only take the feature columns which have "mean" or "std" in their name
sm_features_n  <- grep("mean|std", features$NAME)
sm_feat  <- list(features[sm_features_n,2])

# 1 and 2 represent "ACTIVITY_ID", "SUBJECT_ID"
col  <- c(1,2, sm_features_n + 2)
tidy_table  <- big_table[,col]

###
#  Uses descriptive activity names to name the activities in the data set
#
## STEP 3 & STEP 4
#
# We took the variable except for "ACTIVITY" from features.txt
# We could come up with newer names but this way people already familiar 
# with the original dataset have it easier.
#
###


###

tidy_table_lab  <- inner_join(act_label, tidy_table, by = "ACTIVITY_ID",copy=FALSE)


# let us get rid uf ACTIVITY_ID, it is just a number
tidy_table_lab2  <- tidy_table_lab[,-1]
# let us get rid of SUBJECT_ID, it is just a number and according to the assignment 
# it is not asked for in the final dataset. 
tidy_table_lab3  <- tidy_table_lab2[,-2]


###
# STEP 5
# Summarize the ACTIVITies.
###

tt1 <- tbl_df(tidy_table_lab3)
tt2  <- tt1 %>% group_by(ACTIVITY) %>% summarise_each(funs(mean))


###
#  Save files
###
# The full dataset of MEANs, STDs and ACTIVITY
write.table(tidy_table_lab3, "data/tidyData1.txt", row.name=FALSE )

# The summarized dataset of MEAN's and STD's  of each ACTIVITY
write.table(tt2, "data/tidyData2.txt",row.name=FALSE )



###
### END
###


