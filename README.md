This repository contains code to turn the "UCI Har Dataset" into a tidy dataset that contains the average and standard deviation values for each test subject, categorized according to their activity.

To run this code successfully, follow these steps:

1. Download the raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the data into your working directory.  Ensure that the directory is "UCI HAR Dataset" is the parent folder as this name is expected by the script run_analysis.R

3. Download "run_analysis.R" into a working directory containing "UCI HAR Dataset" as a folder

4. Set your working directory to the directory containing "run_analysis.R" with "UCI HAR Dataset" as a subfolder.

5. Make sure you have the "reshape2" package installed.  The R script will load the library for you.

6. Run the script and a tidy data set called "tidy_data_averaged.txt" will be saved to your working directory.
