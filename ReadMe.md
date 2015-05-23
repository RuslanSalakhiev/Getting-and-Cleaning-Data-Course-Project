Using run_analysis.R script for Coursera Getting and Cleaning Data Course project.

###Requirements:
Samsung data folder "UCI HAR Dataset" should be unzipped and placed in your working directory

Required libraries: dplyr, tidyr

###Result:
The resut of this scrypt will be the txt file called "Summarized_Data.txt", which contains tidy dataset

###Running the script
To start script run:
`source("run_analysis.R")`



###Step-by-Step:

1. Load required packages ("dplyr","tidyr")
2. Save current working directory
3. Read test data. 3 files from "test" folder
4. Read train data. 3 files from "train" folder
5. Merge test and train datasets into "DataMerged" dataframe
6. Read labels from "features.txt" into "Names" vector
7. Label "DataMerged" dataframe
8. Change format of labels for "select" function
9. Select columns with only "mean" and "std" values and save them in "Mean_Std_Data"
10. Read activity labels and change join them to "DataMerged"
11. Group "DataMerged" by subject and activity and calculate averages for mean and std
12. Save result into "Summarized_Data.txt"
