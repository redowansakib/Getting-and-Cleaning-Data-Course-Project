# Getting-and-Cleaning-Data-Course-Project
This repository serves as the evaluation criteria for Coursera Data Science course project offered by John Hopkin's University.

This repository contains a run_analysis.R where the the cleaning process were performed, a CodeBook.md explaining  the variables, the data, and any transformations or work that performed to clean up the data and all the data are stored in the "UCI HAR Dataset" folder.

Description of <a href="run_analysis.R">run_analysis.R</a> :
First features.txt were loaded in `features` variable as character vector. Then subject_train.txt and subject_test.txt were loaded in `subject_train` and `subject_test` and merged into `subject`. Similarly y_train.txt and y_test.txt were loaded into `y_train` and `y_test` and merged into `y`. Then activity_labels.txt were loaded and mapped to `y` into `activity`. `cleandata` were created to contain a subset of `X` that contain only mean and standard deviation variables. Then names of `cleandata` were fixed to reflect a more descriptive information. Then `cleandata` were melted on every variable except `cleandata$activity` and `cleandata$subject` and reshaped with `dcast()` to make the `tidydf` where values of the dataset are mean of each varible for corresponding observaton.
