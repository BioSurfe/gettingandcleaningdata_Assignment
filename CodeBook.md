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
the file ./train/X_train.txt and ./test/X_test.txt
