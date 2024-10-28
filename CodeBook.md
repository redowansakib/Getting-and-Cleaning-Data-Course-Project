# CodeBook 

The data used here are:
<ol>
    <li> <a href="UCI HAR Dataset\features.txt">"UCI HAR Dataset\features.txt"</a></li>
    <li> <a href="UCI HAR Dataset\train\subject_train.txt">"UCI HAR Dataset\train\subject_train.txt"</a></li>
    <li> <a href="UCI HAR Dataset\test\subject_test.txt">"UCI HAR Dataset\test\subject_test.txt"</a></li>
    <li><a href="UCI HAR Dataset\train\y_train.txt">"UCI HAR Dataset\train\y_train.txt"</a></li>
    <li> <a href="UCI HAR Dataset\test\y_test.txt">"UCI HAR Dataset\test\y_test.txt"</a></li>
    <li> <a href="UCI HAR Dataset\train\X_train.txt">"UCI HAR Dataset\train\X_train.txt"</a></li>
    <li> <a href="UCI HAR Dataset\test\X_test.txt">"UCI HAR Dataset\train\y_train.txt"</a></li>
</ol>
A proper description of these data can be found <a href="UCI HAR Dataset\README.txt"> here </a>
    
<br>

Libraries used:
<ol>
    <li>reshape2</li>
    <li>stringr </li>
</ol>
<br>
variable names:
<ol>
    <li><code>features</code> -> Theses are the features of the data</li>
    <li><code>subject_train</code> -> Labels of each subject observed used for training purpose</li>
    <li><code>subject_test</code> -> Labels of each subject observed used for testing purpose</li>
    <li><code>subject</code> -> merge of <code>subject_train</code> and <code>subject_test</code></li>
    <li><code>y_train</code> -> Activity labels for each observation used for training</li>
    <li><code>y_test</code> -> Activity labels for each observation used for testing</li>
    <li><code>y</code> -> merge of <code>y_train</code> and <code>y_test</code></li>
    <li><code>X_train</code> -> Measurements used for training</li>
    <li><code>X_test</code> -> Measurements used for testing</li>
    <li><code>X</code> -> merge of <code>X_train</code> and <code>X_test</code></li>
    <li><code>activity</code> -> descriptive form of activiity labels obtained from <code>y</code></li>
    <li><code>X2</code> -> filtered <code>X</code> for only mean and standard deviation variable</li>
    <li><code>df</code> -> combiniation of <code>y</code>, <code>X2</code>, and <code>activity</code></li>
    <li><code>df_split_by_sub</code> -> df split by <code>subject</code></li>
    <li><code>final_output</code> -> average of each variable for each activity and each subject</li>
</ol>
<br>
Transformations:

First features.txt were loaded in `features` variable as character vector. Then subject_train.txt and subject_test.txt were loaded in `subject_train` and `subject_test` and merged into `subject`. Similarly y_train.txt and y_test.txt were loaded into `y_train` and `y_test` and merged into `y`. Then activity_labels.txt were loaded and mapped to `y` into `activity`. `cleandata` were created to contain a subset of `X` that contain only mean and standard deviation variables. Then names of `cleandata` were fixed to reflect a more descriptive information. Then `cleandata` were melted on every variable except `cleandata$activity` and `cleandata$subject` and reshaped with `dcast()` to make the `tidydf` where values of the dataset are mean of each varible for corresponding observaton.
