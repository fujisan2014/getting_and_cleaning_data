Introduction :-

This repository stores programming code in the R language.

The goal of the code is to prepare tidy data that can be used for later analysis.

The data set relates to wearable computing. The data is collected from accelerometers from the Samsung Galaxy S Smartphone.

Data Set :-

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

Files :-

The Data Set has been unzipped from the zip file provided.
The run_analysis.r script is executed without supplying any parameters.
The output of the script execution is a tidy_data.txt file that is created in the folder that you are executing the script.
The tidy.data.txt file stores the data (mean and standard deviation of each measurement per activity and subject.)

This file will be used for later analysis.

Steps involved in the script run_analysis.r :-

1. Installing of the relevant R packages if required
The first lines in the code verified if the “data.tables” and reshape2 packages are installed in R after checking if they have already been installed.

2. The Loading of data tables from the relevant text files
    The read.table function is then used to load the data into the R environment from the data text files. No column header is present in the text files.

3. Activity Names replace numerical representations with activity names
    The activity names replace their numerical representations by using the factor function, in the testData_activity and trainData_activity dataframes
   
4. Populate the features dataframe and rename Columns of Certain Dataframes
    The features dataframe is populated using the features.txt file.
    The column names of the testData and trainData data frames are populated from the features dataset.
    Other column names of other datasets are set to more relevant names

5. Combine the training and test datasets into one dataset, and include   	Activity and Subject Columns. 
    The Activity and Subject Columns are added to the test and training data frames, and the training and test datasets are combined into the CombinedData 	data frame.

6. Calculate the mean and standard deviation for each measurement in the 	merged data set 
    The mean and sd functions are used against the CombinedData data frame by using the sapply function to calculate the mean and standard deviation.

7. The final step is to create another data frame called Tidy by calculating the standard deviation and mean by Activity and Subject then output to a text file.
    A tidy_table data table is created with the mean and the standard deviation of each measurement calculated by activity and subject. This is output to tidy_data.txt. This is the clean data output file.
 
