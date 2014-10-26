# The Code Book

- The Data
- run_analisis.R
- Disclaimer
- Notes

# The Data
The original dataset  "Human Activity Recognition Using Smartphones"  is located at
UCI Machine Learning Repository

For each record in the dataset the following is provided (1):
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Processed data gives the mean  for:  standard deviation and means fields given in the original dataset, for each subject and type of actvity.

# run_analysis.R

These are the task performed in run_analysis.R:

- Loads every data subset 
- It pulls data of the fields that referes to standard deviation or mean
- It merges the data on its dimentions (X,y and subject)
- Attach nams to fields and subsets the data according to fields refering to mean or std (point 2)
- It fully merges teh data in a single table
- Uses the mean function with lapply, grouping by (.SD): subject,activity
- writes the file





#Disclaimer

The data is used acording to he following:

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

#Notes
(1) From readme file of the dataset