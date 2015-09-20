# CoodBook
Halley Wang  
September 20, 2015  

### Data Desctiprion:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

We only extract the mean and standard deviations, along each subjects and activities.

        subject:  subject catogories.                                                                                                           
          
          
        activity: activity categories.                                                                                                          
---          

#### Each variables has been taken mean along the subject and activities:


                                                               
        time ellapse for body's movement from accelerometer's mean in X direction"
        time ellapse for body's movement from accelerometer's mean in Y direction"                                       
        time ellapse for body's movement from accelerometer's mean in Z direction"                                         
        time ellapse for body's movement from accelerometer's standard deviation in X direction"                           
        time ellapse for body's movement from accelerometer's standard deviation in Y direction"                           
        time ellapse for body's movement from accelerometer's standard deviation in Z direction"                           
        time ellapse forGravity from accelerometer's mean in X direction"  
        time ellapse forGravity from accelerometer's mean in Y direction"  
        time ellapse forGravity from accelerometer's mean in Z direction"  
        time ellapse forGravity from accelerometer's standard deviation in X direction"                                    
        time ellapse forGravity from accelerometer's standard deviation in Y direction"                                    
        time ellapse forGravity from accelerometer's standard deviation in Z direction"                                    
        time ellapse for body's movement from accelerometer in Jerk signal's mean in X direction"                          
        time ellapse for body's movement from accelerometer in Jerk signal's mean in Y direction"                          
        time ellapse for body's movement from accelerometer in Jerk signal's mean in Z direction"                          
        time ellapse for body's movement from accelerometer in Jerk signal's standard deviation in X direction"            
        time ellapse for body's movement from accelerometer in Jerk signal's standard deviation in Y direction"            
        time ellapse for body's movement from accelerometer in Jerk signal's standard deviation in Z direction"            
        time ellapse for body's movement from gyroscope's mean in X direction"                                             
        time ellapse for body's movement from gyroscope's mean in Y direction"                                             
        time ellapse for body's movement from gyroscope's mean in Z direction"                                             
        time ellapse for body's movement from gyroscope's standard deviation in X direction"                               
        time ellapse for body's movement from gyroscope's standard deviation in Y direction"                               
        time ellapse for body's movement from gyroscope's standard deviation in Z direction"                               
        time ellapse for body's movement from gyroscope in Jerk signal's mean in X direction"                              
        time ellapse for body's movement from gyroscope in Jerk signal's mean in Y direction"                              
        time ellapse for body's movement from gyroscope in Jerk signal's mean in Z direction"                              
        time ellapse for body's movement from gyroscope in Jerk signal's standard deviation in X direction"                
        time ellapse for body's movement from gyroscope in Jerk signal's standard deviation in Y direction"                
        time ellapse for body's movement from gyroscope in Jerk signal's standard deviation in Z direction"                
        time ellapse for body's movement from accelerometer in magnitudeEuclidean norm's mean"                             
        time ellapse for body's movement from accelerometer in magnitudeEuclidean norm's standard deviation"               
        time ellapse forGravity from accelerometer in magnitudeEuclidean norm's mean"                                            time ellapse forGravity from accelerometer in magnitudeEuclidean norm's standard deviation"                              time ellapse for body's movement from accelerometer in Jerk signal in magnitudeEuclidean norm's mean"              
        time ellapse for body's movement from accelerometer in Jerk signal in magnitudeEuclidean norm's standard deviation"
        time ellapse for body's movement from gyroscope in magnitudeEuclidean norm's mean"                                 
        time ellapse for body's movement from gyroscope in magnitudeEuclidean norm's standard deviation"                   
        time ellapse for body's movement from gyroscope in Jerk signal in magnitudeEuclidean norm's mean"                  
        time ellapse for body's movement from gyroscope in Jerk signal in magnitudeEuclidean norm's standard deviation"    
        frequency of body's movement from accelerometer's mean in X direction"
        frequency of body's movement from accelerometer's mean in Y direction"                                             
        frequency of body's movement from accelerometer's mean in Z direction"                                             
        frequency of body's movement from accelerometer's standard deviation in X direction"                               
        frequency of body's movement from accelerometer's standard deviation in Y direction"                               
        frequency of body's movement from accelerometer's standard deviation in Z direction"                               
        frequency of body's movement from accelerometer in Jerk signal's mean in X direction"                              
        frequency of body's movement from accelerometer in Jerk signal's mean in Y direction"                              
        frequency of body's movement from accelerometer in Jerk signal's mean in Z direction"                              
        frequency of body's movement from accelerometer in Jerk signal's standard deviation in X direction"                
        frequency of body's movement from accelerometer in Jerk signal's standard deviation in Y direction"                
        frequency of body's movement from accelerometer in Jerk signal's standard deviation in Z direction"                
        frequency of body's movement from gyroscope's mean in X direction" 
        frequency of body's movement from gyroscope's mean in Y direction" 
        frequency of body's movement from gyroscope's mean in Z direction" 
        frequency of body's movement from gyroscope's standard deviation in X direction"                                   
        frequency of body's movement from gyroscope's standard deviation in Y direction"                                   
        frequency of body's movement from gyroscope's standard deviation in Z direction"                                   
        frequency of body's movement from accelerometer in magnitudeEuclidean norm's mean"                                 
        frequency of body's movement from accelerometer in magnitudeEuclidean norm's standard deviation"                   
        frequency of body's movement from accelerometer in Jerk signal in magnitudeEuclidean norm's mean"                  
        frequency of body's movement from accelerometer in Jerk signal in magnitudeEuclidean norm's standard deviation"    
        frequency of body's movement from gyroscope in magnitudeEuclidean norm's mean"                                            frequency of body's movement from gyroscope in magnitudeEuclidean norm's standard deviation"
        frequency of body's movement from gyroscope in Jerk signal in magnitudeEuclidean norm's mean"
        frequency of body's movement from gyroscope in Jerk signal in magnitudeEuclidean norm's standard deviation"
