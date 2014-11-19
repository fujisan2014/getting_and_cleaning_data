Introduction :-

This repository stores programming code in the R language.

The goal of the code is to prepare tidy data that can be used for later analysis.

The data set relates to wearable computing. The data is collected from accelerometers from the Samsung Galaxy S Smartphone.

   Data Set :-

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
-Its activity label.
- An identifier of the subject who carried out the experiment.

   Files :-

The Data Set has been unzipped from the zip file provided.
The codebook.md file describes the variables and how the script works.
The run_analysis.r script is executed without supplying any parameters.
The output of the script execution is a tidy_data.txt file that is created in the folder that you are executing the script.
The tidy.data.txt file stores the data (mean and standard deviation of each measurement per activity and subject.)

This will be used for later analysis.
