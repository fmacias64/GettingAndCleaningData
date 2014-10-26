library("data.table")


###Uploading data
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

#pulling features related to std or mean

datosm <- read.table(pipe('grep "mean" "./UCI HAR Dataset/features.txt"'))
datost <- read.table(pipe('grep "std" "./UCI HAR Dataset/features.txt"'))

stdomean<-rbind(datosm,datost)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# merging data according to dimension
y<-rbind(y_test,y_train)
X<-rbind(X_test,X_train)
sujetos<-rbind(subject_test,subject_train)

#subsetting and introducing some names
etiquetas<-activity_labels[,2]
razgos<-features[,2]
stdomean<-stdomean[,2]
names(X) = razgos

#just features refering to std or mean
X<-X[,(razgos %in% stdomean)]
y[,2] = etiquetas[y[,1]]


names(y) = c("activityId", "activity")
names(sujetos) = "subject"

#merging in a single "table"
todo <- cbind(sujetos, y, X)

DaTab <- data.table(todo)

#Subsetting the data table and applying function mean
limpia<-DaTab[,lapply(.SD,mean),by="subject,activity"]

#Writing Output
write.table(limpia,file="tidy_dataset.txt",row.names = FALSE)