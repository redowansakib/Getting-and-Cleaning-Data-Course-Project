# setwd(r"(D:\Coursera Data Science Course\Getting and Cleaning Data\Assignment)")

# loading necessary libraries
library(reshape2)
library(stringr)

# loading features data set 
features <- read.table(r"(UCI HAR Dataset\features.txt)",header=FALSE)[[2]]

# loading and merging subject data set
subject_train <- read.table(r"(UCI HAR Dataset\train\subject_train.txt)", col.names = "subject")
subject_test <- read.table(r"(UCI HAR Dataset\test\subject_test.txt)", col.names = "subject")
subject <- rbind(subject_train, subject_test)

# loading and merging label data set
y_train <- read.table(r"(UCI HAR Dataset\train\y_train.txt)", col.names = "y")
y_test <- read.table(r"(UCI HAR Dataset\test\y_test.txt)", col.names = "y")
y <- rbind(y_train, y_test)

# loading and merging observation data set
X_train <- read.table(r"(UCI HAR Dataset\train\X_train.txt)",col.names = features)
X_test <- read.table(r"(UCI HAR Dataset\test\X_test.txt)",col.names = features)
X <- rbind(X_train,X_test)

# setting descriptive activiy name
activity <- read.table(r"(UCI HAR Dataset\activity_labels.txt)")
activity[,2] <- tolower(gsub("_","",activity[,2]))
activity <- activity[y[,1],2]

# choosing necessary data (only mean and standard deviation)
data <- X[grepl("(mean|std)",features)]

# setting descriptive variable name
names(data) <-str_replace_all(names(data), c("\\d+ "="",
                                         "^t"="Time ",
                                         "f|Freq"="Frequency ",
                                         "Acc" = " Acceleration ",
                                         "Mag" = " Magnitude ",
                                         "mean"="Mean ",
                                         "std" = "Standard Deviation ",
                                         "BodyGyro"=" Gyroscopic ",
                                         "-"=" ",
                                         "\\(\\)" = ""
                                         )) |> gsub("  "," ",x=_)

# combining all data set
clean_data <- cbind(subject,activity,data)


# melting the data set into long form 
meltdf <- melt(clean_data,id = c("subject","activity"))

# reshaping the data set for mean of all variables against subject and activity
tidydf <- dcast(meltdf, activity+subject~variable,mean,na.rm = TRUE)

# exporting the table
write.table(tidydf,"tidy_dataset.txt", row.names = FALSE)


