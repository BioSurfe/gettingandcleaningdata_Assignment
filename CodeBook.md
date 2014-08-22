Code Book
=============

The purpose of this code book is to describe the steps from the rawdata to the analyzed data set.

Data Source
=========
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Data was downloaded from as a zip file 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The zip file was unzipped in R with the original internal folder names  
the unzipped folder contained 2 sub folders "test" and "train" and 4 files "activity_labels.txt", "features.txt", "features_info.txt" and "README.txt"

for a detailed description and the contents of the dataset please read the README.txt

Preprocessing
===============
the file "./train/X_train.txt" and "./test/X_test.txt" contains the data in numerical format

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

The test and training data were merged by rbind

The file 'train/y_train.txt' and 'test/y_test.txt' contains the training details for the data these were row merged
The file 'train/subject_train.txt' and 'test/subject_test.txt' Each row identifies the subject who performed the activity for each window sample these were row merged

created a list of size equal to the size of data in each of the test and traing set, this is for identifying the source of the data in the merged set

the above dataframes were cbind to get the finaldata data frame

attaching the column lables
==========
the discriptive names for the columns were passing to the names of dataframe from "./features.txt" additional discriptive names were created as needed.

the activity labels are coded as numeric in the original datasets, the numeric data was first converted into factorvariable and then discriptive names was passed to the factorvariable to create the tidydata dataframe

Final Data
===
the final tidydata dataframe was created by subsetting the rows that had the mean and sd in their names


Analysis
=========
The analysis requires to sort the tidydata by subject and then by activity and then calculate the mean(average) for the factored data frame

package plyr was used for this task, since plyr can handle only numeric data all the factored variables were converted to numeric followed by ddply and the resulting datafarame was stored as "analyzedData"

The rows containg the factored variables were relabled with discriptive names

The final data was written to file "analyzedData.txt" without the rownames.




 
