
## Getting and Cleaning Data Course Project - Codebook
    This codebook describes the tidy data set created for step 5 of the course project.

### activity
     Activity type the person/subject performed
* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

### subject
     Number assigned to each of the 30 volunteers within an age bracket of 19-48 years.
* 1..30

### measure
     Measurement features from Samsung Galaxy S II. Features are normalized and bounded within [-1,1].
     
time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz.  Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.
Fast Fourier Transform (FFT) was applied to some of these signals producing (Note the 'f' to indicate frequency domain signals)

* tBodyAccX - is a time-domain,  body acceleration signal from the accelerometer, directionality: X
* tBodyAccY - is a time-domain,  body acceleration signal from the accelerometer, directionality: Y
* tBodyAccZ - is a time-domain,  body acceleration signal from the accelerometer, directionality: Z
* tGravityAccX - is a time-domain,  gravity acceleration signal from the accelerometer, directionality: X
* tGravityAccY - is a time-domain,  gravity acceleration signal from the accelerometer, directionality: Y
* tGravityAccZ - is a time-domain,  gravity acceleration signal from the accelerometer, directionality: Z
* tBodyAccJerkX - is a time-domain,  body acceleration signal from the accelerometer, directionality: X
* tBodyAccJerkY - is a time-domain,  body acceleration signal from the accelerometer, directionality: Y
* tBodyAccJerkZ - is a time-domain,  body acceleration signal from the accelerometer, directionality: Z
* tBodyGyroX - is a time-domain,  body acceleration signal from the gyroscope, directionality: X
* tBodyGyroY - is a time-domain,  body acceleration signal from the gyroscope, directionality: Y
* tBodyGyroZ - is a time-domain,  body acceleration signal from the gyroscope, directionality: Z
* tBodyGyroJerkX - is a time-domain,  body acceleration signal from the gyroscope, directionality: X
* tBodyGyroJerkY - is a time-domain,  body acceleration signal from the gyroscope, directionality: Y
* tBodyGyroJerkZ - is a time-domain,  body acceleration signal from the gyroscope, directionality: Z
* tBodyAccMag - is a time-domain,  body acceleration signal from the accelerometer, directionality: magnitude of three-dimensional signal using the Euclidean norm
* tGravityAccMag - is a time-domain,  gravity acceleration signal from the accelerometer, directionality: magnitude of three-dimensional signal using the Euclidean norm
* tBodyAccJerkMag - is a time-domain,  body acceleration signal from the accelerometer, directionality: magnitude of three-dimensional signal using the Euclidean norm
* tBodyGyroMag - is a time-domain,  body acceleration signal from the gyroscope, directionality: magnitude of three-dimensional signal using the Euclidean norm
* tBodyGyroJerkMag - is a time-domain,  body acceleration signal from the gyroscope, directionality: magnitude of three-dimensional signal using the Euclidean norm
* fBodyAccX - is a freq-domain,  body acceleration signal from the accelerometer, directionality: X
* fBodyAccY - is a freq-domain,  body acceleration signal from the accelerometer, directionality: Y
* fBodyAccZ - is a freq-domain,  body acceleration signal from the accelerometer, directionality: Z
* fBodyAccJerkX - is a freq-domain,  body acceleration signal from the accelerometer, directionality: X
* fBodyAccJerkY - is a freq-domain,  body acceleration signal from the accelerometer, directionality: Y
* fBodyAccJerkZ - is a freq-domain,  body acceleration signal from the accelerometer, directionality: Z
* fBodyGyroX - is a freq-domain,  body acceleration signal from the gyroscope, directionality: X
* fBodyGyroY - is a freq-domain,  body acceleration signal from the gyroscope, directionality: Y
* fBodyGyroZ - is a freq-domain,  body acceleration signal from the gyroscope, directionality: Z
* fBodyAccMag - is a freq-domain,  body acceleration signal from the accelerometer, directionality: magnitude of three-dimensional signal using the Euclidean norm
* fBodyBodyAccJerkMag - is a freq-domain,  body acceleration signal from the accelerometer, directionality: magnitude of three-dimensional signal using the Euclidean norm
* fBodyBodyGyroMag - is a freq-domain,  body acceleration signal from the gyroscope, directionality: magnitude of three-dimensional signal using the Euclidean norm
* fBodyBodyGyroJerkMag - is a freq-domain,  body acceleration signal from the gyroscope, directionality: magnitude of three-dimensional signal using the Euclidean norm


### avg_mean
     Average of all the mean calculations. 
* -0.99762..0.97451

### avg_std
     Average of all the standard deviation calculations
* -0.9977..0.6871
