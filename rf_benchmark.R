# Load dependency library
library(randomForest)

train <- read.csv("Data/train.csv", header=TRUE)
test <- read.csv("Data/test.csv", header=TRUE)

labels <- as.factor(train[,1])
train <- train[,-1]

rf <- randomForest(train, labels, xtest=test, ntree=1000)
predictions <- levels(labels)[rf$test$predicted]

write(predictions, file="Output/rf_benchmark.csv", ncolumns=1) 
