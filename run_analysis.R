
library(dplyr)
library(tidyr)

wd <- getwd()

##### empty dataframes to merge train and test data

DataTest <- data.frame() 
DataTrain <- data.frame()
DataMerged <- data.frame()

##### read test data

setwd("test")
DataTest <- cbind(read.table("X_test.txt"),
                  read.table("Y_test.txt"),
                  read.table("subject_test.txt"))

##### read train data

setwd(wd)
setwd("train")

DataTrain <- cbind(read.table("X_train.txt"),
                   read.table("Y_train.txt"),
                   read.table("subject_train.txt"))

##### merging data

DataMerged <- rbind(DataTest,DataTrain)

##### read file with labels
setwd(wd)
Names <- read.table("features.txt")

##### labelling dataframe
names(DataMerged) <- c(as.character(Names[,2]),"activity_num","subject_num")

##### changing variable names format for select function
valid_names <- make.names(names=names(DataMerged), unique=TRUE, allow_ = TRUE)
names(DataMerged) <- valid_names

##### filter columns with mean and std variables and add subject and activity columns

Mean_Std_Data <- cbind(select(DataMerged,contains(".mean.")),
                       select(DataMerged, contains(".std.")),
                       DataMerged[,562:563])

##### adding activity description

Activity <- read.table("activity_labels.txt")
names(Activity) <- c("activity_num","activity")
Mean_Std_Data <- left_join(Mean_Std_Data,Activity, by = "activity_num")                         
Mean_Std_Data <- select(Mean_Std_Data, -activity_num)

##### making Tidy data frame
 TidyData<- Mean_Std_Data %>% group_by(subject_num,activity) %>% summarise_each(funs(mean))

write.table(TidyData,"Summarized_Dataset.txt")
