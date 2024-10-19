setwd(r"(D:\Coursera Data Science Course\Getting and Cleaning Data\Assignment)")

library(dplyr)
library(tidyr)
library(stringr)
library(reshape2)

features <- read.delim(r"(UCI HAR Dataset\features.txt)",header=FALSE)[[1]] |>
  as.character()
  
subject_train <- read.delim(r"(UCI HAR Dataset\train\subject_train.txt)", col.names = "subject",header=FALSE)
subject_test <- read.delim(r"(UCI HAR Dataset\test\subject_test.txt)", col.names = "subject",header=FALSE)
subject <- rbind(subject_train, subject_test)

y_train <- read.delim(r"(UCI HAR Dataset\train\y_train.txt)", col.names = "y",header=FALSE)
y_test <- read.delim(r"(UCI HAR Dataset\test\y_test.txt)", col.names = "y",header=FALSE)
y <- rbind(y_train, y_test)

X_train <- read.delim(r"(UCI HAR Dataset\train\X_train.txt)", header=FALSE) |>
  apply(2, trimws) |> apply(2,function(x) gsub("  "," ",x))|> as.data.frame()|>
    separate("V1", into = features , sep = " ")

X_test <- read.delim(r"(UCI HAR Dataset\test\X_test.txt)", header=FALSE) |>
  apply(2, trimws) |> apply(2,function(x) gsub("  "," ",x))|> as.data.frame()|>
    separate("V1", into = features , sep = " ")

X <- rbind(X_train,X_test)

activity_labels <- read.delim(r"(UCI HAR Dataset\activity_labels.txt)",header=FALSE,sep=" ")[[2]] |>
  factor(y[[1]], labels = _) |> as.character()

X2 <- X[grepl("(mean|std)",features)]
 
names(X2) <-str_replace_all(names(X2), c("\\d+ "="",
                                         "^t"="Time ",
                                         "f|Freq"="Frequency ",
                                         "Acc" = " Acceleration",
                                         "Mag" = " Magnitude ",
                                         "mean"="Mean ",
                                         "std" = "Standard Deviation ",
                                         "BodyGyro"=" Gyroscopic ",
                                         "-"=" ",
                                         "\\(\\)" = ""
                                         )) |> gsub("  "," ",x=_)


df <- cbind(subject,apply(X2, 2, as.numeric),activity_labels)



sample <-split(df,subject)[[1]]
colMeans(sample[2])
dcast(sample,activity_labels~names(X2), print,value.var = names(X2))
aggregate(names(X2)~activity_labels,sample,mean)
a <- melt(sample,id = c("subject","activity_labels"), variable.name = "measures")
b<-dcast(a, measures~subject+activity_labels,mean,na.rm = TRUE)
str(b)

X_train2 <- read.delim(r"(UCI HAR Dataset\train\X_train.txt)", header=FALSE)
a <- apply(X_train2, 2, trimws) 
b <- apply(a, 2, function(x) gsub("  "," ",x))
str(a)
