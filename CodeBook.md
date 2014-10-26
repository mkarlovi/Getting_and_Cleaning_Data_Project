Observations:
The data created by this R file contains two sets of observations.  The fist set is the partipants, of which there were 30, ages 19-48.
The second set of observations are the activities that the participants were performing when the observations were recorded.  The activities are:
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

Variables:
The observations were recorded from Galaxy S II, using the Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration and Triaxial Angular velocity from the gyroscope.  The resulting data set is the average of each variable for 1) each participant and 2) each activity.
There are 65 variables in the data set.
Time domain signals were captured at a constant rate of 50 Hz, then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Frequency domain signals were captured when a Fast Fourier Transform (FFT) was applied to these signals.
Body Acceleration signals were produced using a low pass Butterworth filter with a corner frequency of 0.3 Hz.
Gravity Acceleration signals were produced using a low pass Butterworth filter with a corner frequency of 0.3 Hz.
Jerk signals were calculated using the body linear acceleration and angular velocity were derived in time
Magnitude signals were calculated using the Euclidean norm
