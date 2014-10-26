Getting_and_Cleaning_Data_Projcet
=================================
This is the course project for the class "Getting and Cleaning Data" on Coursera 'getdata-008', John Hopkins Bloomberg School of Public Health.

This script creates one tidy data set using the two data sets taken from UC Irvine Machine Learning Repository.

1.The first section reads two data files that were created as part of one set of observations and were subsequently randomly split into two groups based on the participants.
2.The variables in each data set are then identified by naming the columns.  This is done by reading a local text file into memory and using the setNames function.  
3.The observations are labeled by using another 2 sets of text files.  The observations labels correspond to activities and subjects.  Text files are read into memory, given appropriate columns names, and then attached to the data sets using the column bind function.
4.The two data sets are joined using the row bind function.
5. The joined data set is subsetted to include only variable with mean and standard deviation measurements.
6. The variable column names are relabeled to be better descriptive.
7. Columns for the variable Frequency Mean are identified and removed.
8. The new data set is reshaped to extract the average value for each variable for both observation sets, subject and activity.
This is done using the melt function to summarize the using the mean function for each variable and observation combination.  The result is the reassembled using the cast function to show the average results for each subject and activity for all variables.
Finally, the results are sorted to there are two sets of observations are grouped together.

