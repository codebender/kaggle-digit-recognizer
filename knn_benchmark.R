# Load dependency library
library(FNN)

train <- read.csv("Data/train.csv", header=TRUE)
test <- read.csv("Data/test.csv", header=TRUE)

labels <- train[,1]
train <- train[,-1]

results <- (0:9)[knn(train, test, labels, k = 10, algorithm="cover_tree")]

write(results, file="Output/knn_benchmark.csv", ncolumns=1) 
