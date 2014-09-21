
###
#  
# setwd("Documents/Programming/R/project")


###
#  Download ZIP if not available
###

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileName <- "data/Dataset.zip"


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

datadir  <- "/Users/overmind/Documents/Programming/R/project/data/UCI HAR Dataset/"

subject_train  <- read.table(paste(datadir, "train/subject_train.txt", sep="") )
subject_test  <- read.table(paste(datadir, "test/subject_test.txt", sep="") )

x_train  <- read.table(paste(datadir, "train/X_train.txt", sep="") )
x_test <- read.table(paste(datadir, "test/X_test.txt", sep="") )

y_train  <- read.table(paste(datadir, "train/y_train.txt", sep="") )
y_test <- read.table(paste(datadir, "test/y_test.txt", sep="") )

act_label  <- read.table(paste(datadir, "activity_labels.txt", sep=""))
features  <- read.table(paste(datadir, "features.txt", sep=""))


###
#  give every column a proper name.
#  
###
names(subject_train)  <- "SUBJECT_ID"
names(subject_test)  <- "SUBJECT_ID"

# we don't need to do this, but I think it is nicer this way
names(act_label)  <- c("ACTIVITY_ID","ACTIVITY")
names(features)  <- c("ID","NAME")



# now we give every feature its proper name
names(x_train)  <- features[,2]
names(x_test)  <- features[,2]

names(y_train)  <- "ACTIVITY_ID"
names(y_test)  <- "ACTIVITY_ID"
#


###
#  Merges the training and the test sets to create one data set.
#
## STEP 1
# 
###
train  <- data.frame(y_train,subject_train,x_train)
test  <- data.frame(y_test,subject_test,x_test)

big_table  <- rbind(train,test)


###
#  extract only the mean and std variables. I kept the Activity and the Subject_id in there
#  I left subject ID because it is not a measurement. 
#  
## STEP 2
# 
###

# 1 and 2 represent "ACTIVITY_ID", "SUBJECT_ID"
# we don't want to miss them

sm_features_n  <- grep("mean|std", features$NAME)
sm_feat  <- list(features[sm_features_n,2])



col  <- c(1,2, sm_features_n + 2)
tidy_table  <- big_table[,col]

###
#  Uses descriptive activity names to name the activities in the data set
#
## STEP 3
# 
###
library(dplyr)
tidy_table_lab  <- inner_join(act_label, tidy_table, by = "ACTIVITY_ID",copy=FALSE)

# let us get rid uf ACTIVITY_ID
tidy_table_lab2  <- tidy_table_lab[,-1]

# let us get rid of SUBJECT_ID
tidy_table_lab3  <- tidy_table_lab2[,-2]

###
# STEP 4
# we took the variable except for "ACTIVITY" from features.txt
# we could come up with newer names but this way people already familiar 
# with the original dataset won't have problems
###

###
# STEP 5
###

library(dplyr)

tt1 <- tbl_df(tidy_table_lab3)
ttt  <- tt1 %>% group_by(ACTIVITY) %>% summarise_each(funs(mean))



