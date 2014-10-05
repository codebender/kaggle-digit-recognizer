# Load dependency library
library(randomForest)

train <- read.csv("Data/train.csv", header=TRUE)
test <- read.csv("Data/test.csv", header=TRUE)

labels <- as.factor(train[,1])
train <- train[,-1]

rf <- randomForest(train, labels, xtest=test, ntree=1000)

predictions <- data.frame(levels(labels)[rf$test$predicted])

names(predictions) <- c("Label")
predictions$ImageId <- 1:nrow(predictions)
predictions <- predictions[c(2,1)]

write.csv(predictions, file = "Output/rf_benchmark.csv", quote = FALSE, row.names = FALSE)
