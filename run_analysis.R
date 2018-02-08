## Choosing directory which contains our initial data

## Reading and combining data sets 
testData <- read.table("test/X_test.txt")
trainData <- read.table("train/X_train.txt")
X <- rbind(testData, trainData)


## Reading and combining subjects 
testSub <- read.table("test/subject_test.txt")
trainSub <- read.table("train/subject_train.txt")
S <- rbind(testSub, trainSub)


## Reading and combining data labels 
testLabel <- read.table("test/y_test.txt")
trainLabel <- read.table("train/y_train.txt")
Y <- rbind(testLabel, trainLabel)


## Read Features List to use them as column names for data
featuresList <- read.table("features.txt", stringsAsFactors=FALSE)

## Using only names from features list
features <- featuresList$V2

## Logical Vector to keep only std and mean columns
keepColumns <- grepl("(std|mean[^F])", features, perl=TRUE)

## Keep only necessary data, and name it conveniently
X <- X[, keepColumns]
names(X) <- features[keepColumns]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

## Read ActivityList for adding descriptive names to data set
activities <- read.table("activity_labels.txt")
activities[,2] = gsub("_", "", tolower(as.character(activities[,2])))
Y[,1] = activities[Y[,1], 2]

## Adding activity label
names(Y) <- "activity" 

## Adding convenient labels to activity names
names(S) <- "subject"
tidyData <- cbind(S, Y, X)
write.table(tidyData, "TidyData.txt")

## Creating second tiny data set with average of each var for each act and each sub
uS = unique(S)[,1]
nS = length(uS)
nA = length(activities[,1])
nC = length(names(tidyData))
td = tidyData[ 1:(nS*nA), ]

row = 1
for (s in 1:nS) {
        for (a in 1:nA) {
                td[row,1] = uS[s]
                td[row,2] = activities[a, 2]
                tmp <- tidyData[tidyData$subject==s & tidyData$activity==activities[a,2],]
                td[row, 3:nC] <- colMeans(tmp[, 3:nC])
                row = row + 1
        }
}

write.table(td, "AverTidyData.txt")