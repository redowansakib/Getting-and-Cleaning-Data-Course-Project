# CodeBook 

The data used here are:
    1. <a href="UCI HAR Dataset\features.txt">"UCI HAR Dataset\features.txt"</a>
    2. <a href="UCI HAR Dataset\train\subject_train.txt">"UCI HAR Dataset\train\subject_train.txt"</a>
    3. <a href="UCI HAR Dataset\test\subject_test.txt">"UCI HAR Dataset\test\subject_test.txt"</a>
    3. <a href="UCI HAR Dataset\train\y_train.txt">"UCI HAR Dataset\train\y_train.txt"</a>
    5. <a href="UCI HAR Dataset\test\y_test.txt">"UCI HAR Dataset\test\y_test.txt"</a>
    6. <a href="UCI HAR Dataset\train\X_train.txt">"UCI HAR Dataset\train\X_train.txt"</a>
    7. <a href="UCI HAR Dataset\test\X_test.txt">"UCI HAR Dataset\train\y_train.txt"</a>
A proper description of these data can be found <a href="UCI HAR Dataset\README.txt"> here <a>
    


Libraries used:
    1. reshape2
    2. stringr

variable names:
    1.`features` -> Theses are the features of the data
    2. `subject_train` -> Labels of each subject observed used for training purpose
    3. `subject_test` -> Labels of each subject observed used for testing purpose
    4. `subject` -> merge of `subject_train` and `subject_test`
    5. `y_train` -> Activity labels for each observation used for training
    6. `y_test` -> Activity labels for each observation used for testing
    7. `y` -> merge of `y_train` and `y_test`
    8. `X_train` -> Measurements used for training
    9. `X_test` -> Measurements used for testing
    10. `X` -> merge of `X_train` and `X_test`
    11. `activity_label`s -> descriptive form of activiity labels obtained from `y`
    12. `X2` -> filtered `X` for only mean and standard deviation variable
    13. `df` -> combiniation of `y`, `X2`, and `activity_labels`
    14. `df_split_by_sub` -> df split by `subject`
    15.`final_output` -> average of each variable for each activity and each subject

Transformations:

First features.txt were loaded in `features` variable as character vector. Then subject_train.txt and subject_test.txt were loaded in `subject_train` and `subject_test` and merged into `subject`. Similarly y_train.txt and y_test.txt were loaded into `y_train` and `y_test` and merged into `y`. X_train.txt and X_test.txt contained somewhat messy data and so they were first trimed of whitespaces with `trimws()` and got their double space replaced by single space by `gsub()` and finally separated on the basis of single space by `separate`. Then activity_labels.txt were loaded and mapped to `y` into `activity_labels`. `X2` were created to contain a subset of `X` that contain only mean and standard deviation variables. then names of `X2` were fixed to reflect a more descriptive information. `df` was made to contain all the cleaned data together and splited into 30 parts according to the subject into  `df_split_by_sub`. Then a function `reshape` were made to transfrom each split to reshape into a form where it contained average of each variable for each activity.
<<<<<<< HEAD
finally the finction were mapped to every split and contained into final output.
=======
    finally the finction were mapped to every split and contained into final output.
>>>>>>> 316a7c162d3d7da259043490adc4ecd504c6e4a1
    

