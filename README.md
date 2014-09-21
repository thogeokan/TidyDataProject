TidyDataProject
===============

Repository to the Tidy Data Course Project from Coursera


## File Description

### Normal Files

* README.md: The file you are reading right now.
* CodeBook.md: Description of the generated datasets in data.
* run_analysis.R: The script which created two datasets.

### Generated Files

* ./data/tidyData1.txt  : The merged Dataset(the one with all MEANs and STDs)
* ./data/tidyData2.txt  : The merged Dataset(like the other one but summarized) 
* UCI HAR Dataset  : This folder is created when the Dataset.zip is unzipped


## Running run_analysis.R

Following will take place in the current working directory (of R):

1) The script will generate the folder "data". Here you will later find the generated datasets.
2) If the "Dataset.zip" is not present, the script will download the file from the internet.
3) Dataset.zip is unzipped and the folder "UCI HAR Dataset" is generated. 

4) Reading of data tables into R:
	a) X_test.txt, y_test.txt, X_train.txt, y_train.txt: These files contain the feature column (X) and 
	the mapping (y).
	b) subject_test.txt and subject_train.txt are also included, though their data will not 
	be used in the final datasets.
	
	c) activity_labels.txt: This file contain the ACTIVITY labels we will use.
	d) features.txt: This file has the feature column names(for the X_*.txt files).
	
5) We give our data tables their header names. x_train and x_test get their names from "features".
6) Merging data tables together:
	a) First y_train, subject_train and x_train as one "train" table 
	and y_test, subject_test and x_test as one "test" table.
	b) Then we combine test and train tables(rbind) in a "big_table".
7) We only want mean and std columns so we search with grep() in the features table
   for only the names which have "mean" or "std" in them.
8) With the information from 7) we can select all columns we are interested in.
9) Merging ACTIVITY_ID from big_table with activity_labels. Now all activities have a string name.
10) Save first data table in "data/tidyData1.txt"
11) Group for ACTIVITY and summarize the STD and MEAN values.
10) Save summarized data table in "data/tidyData2.txt"


END.









