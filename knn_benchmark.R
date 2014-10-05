# Load dependency library
library(FNN)

train <- read.csv("Data/train.csv", header=TRUE)
test <- read.csv("Data/test.csv", header=TRUE)

labels <- train[,1]
train <- train[,-1]

results <- data.frame((0:9)[knn(train, test, labels, k = 10, algorithm="cover_tree")])

names(results) <- c("Label")
results$ImageId <- 1:nrow(results)
results <- results[c(2,1)]

write.csv(results, file = "Output/knn_benchmark.csv", quote = FALSE, row.names = FALSE)
