## My Code Book for the Tidy Data Project




### Summary and Overview of feature description

 (Information is taken from features_info.txt)
 'These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
 Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.'


* Body: body signals
* Gravity: gravitational signals
* Gyro: gyroscopic signals
* Jerk: the body linear acceleration and angular velocity, derived in time 
* Mag: magnitude of the three-dimensional signals were calculated using the Euclidean norm
* Freq: frequency 
* 't' stands for time. 
* 'f' stands for Fourier Transform

* X Y Z: axis/direction of measurement

* mean: mean value
* std: standard deviation
* values are usually within the range [-1,1], except for the "ACTIVITY" column

### The Features in order from left to right also found in the generated datasets:


* "ACTIVITY" : Activity labels:
	* WALKING
	* WALKING_UPSTAIRS
	* WALKING_DOWNSTAIRS
	* SITTING
	* STANDING
	* LAYING

Features from the accelerometer:  
* "tBodyAcc-mean()-X" 

* "tBodyAcc-mean()-Y" 
* "tBodyAcc-mean()-Z" 
* "tBodyAcc-std()-X" 
* "tBodyAcc-std()-Y" 
* "tBodyAcc-std()-Z" 

Gravitational acceleration signals:
* "tGravityAcc-mean()-X" 
* "tGravityAcc-mean()-Y" 
* "tGravityAcc-mean()-Z" 
* "tGravityAcc-std()-X" 
* "tGravityAcc-std()-Y" 
* "tGravityAcc-std()-Z" 

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals:
* "tBodyAccJerk-mean()-X" 
* "tBodyAccJerk-mean()-Y" 
* "tBodyAccJerk-mean()-Z" 
* "tBodyAccJerk-std()-X" 
* "tBodyAccJerk-std()-Y" 
* "tBodyAccJerk-std()-Z" 

Features from gyroscope 3-axial:
* "tBodyGyro-mean()-X" 
* "tBodyGyro-mean()-Y" 
* "tBodyGyro-mean()-Z" 
* "tBodyGyro-std()-X" 
* "tBodyGyro-std()-Y" 
* "tBodyGyro-std()-Z" 

The body linear acceleration and angular velocity were derived in time to obtain Jerk signals:
* "tBodyGyroJerk-mean()-X" 
* "tBodyGyroJerk-mean()-Y" 
* "tBodyGyroJerk-mean()-Z" 
* "tBodyGyroJerk-std()-X" 
* "tBodyGyroJerk-std()-Y" 
* "tBodyGyroJerk-std()-Z" 

The magnitude(Mag) of the signals were calculated using the Euclidean:
* "tBodyAccMag-mean()" 
* "tBodyAccMag-std()" 
* "tGravityAccMag-mean()" 
* "tGravityAccMag-std()" 
* "tBodyAccJerkMag-mean()" 
* "tBodyAccJerkMag-std()" 
* "tBodyGyroMag-mean()" 
* "tBodyGyroMag-std()" 
* "tBodyGyroJerkMag-mean()" 
* "tBodyGyroJerkMag-std()" 

The body acceleration signals (using another low pass Butterworth filter with a corner frequency of 0.3 Hz)
A Fast Fourier Transform (FFT) was applied to generate ('f' to indicate frequency domain signals):
* "fBodyAcc-mean()-X" 
* "fBodyAcc-mean()-Y" 
* "fBodyAcc-mean()-Z" 
* "fBodyAcc-std()-X" 
* "fBodyAcc-std()-Y" 
* "fBodyAcc-std()-Z" 
* "fBodyAcc-meanFreq()-X" 
* "fBodyAcc-meanFreq()-Y" 
* "fBodyAcc-meanFreq()-Z" 
* "fBodyAccJerk-mean()-X" 
* "fBodyAccJerk-mean()-Y" 
* "fBodyAccJerk-mean()-Z" 
* "fBodyAccJerk-std()-X" 
* "fBodyAccJerk-std()-Y" 
* "fBodyAccJerk-std()-Z" 

A Fast Fourier Transform (FFT) was applied to generate:
* "fBodyAccJerk-meanFreq()-X" 
* "fBodyAccJerk-meanFreq()-Y" 
* "fBodyAccJerk-meanFreq()-Z" 

The body gyroscopic signals (using another low pass Butterworth filter with a corner frequency of 0.3 Hz):
* "fBodyGyro-mean()-X" 
* "fBodyGyro-mean()-Y"
* "fBodyGyro-mean()-Z"
* "fBodyGyro-std()-X" 
* "fBodyGyro-std()-Y" 
* "fBodyGyro-std()-Z" 
* "fBodyGyro-meanFreq()-X" 
* "fBodyGyro-meanFreq()-Y" 
* "fBodyGyro-meanFreq()-Z" 

Magnitude of signals were calculated using the Euclidean norm:
* "fBodyAccMag-mean()" 
* "fBodyAccMag-std()" 
* "fBodyAccMag-meanFreq()" 
* "fBodyBodyAccJerkMag-mean()" 
* "fBodyBodyAccJerkMag-std()" 
* "fBodyBodyAccJerkMag-meanFreq()" 
* "fBodyBodyGyroMag-mean()" 
* "fBodyBodyGyroMag-std()" 
* "fBodyBodyGyroMag-meanFreq()" 
* "fBodyBodyGyroJerkMag-mean()" 
* "fBodyBodyGyroJerkMag-std()" 
* "fBodyBodyGyroJerkMag-meanFreq()"










