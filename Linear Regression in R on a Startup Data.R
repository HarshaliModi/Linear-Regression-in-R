getwd()
setwd('C:\\Users\\Harshali\\Documents\\Datasets')
profit <- read.csv('C:/Users/Harshali/Documents/Datasets/Startups.csv', header=TRUE, stringsAsFactors = T)
profit
summary(profit)
head(profit)
plot(profit)

# Splitting the data into Training and Test Data

set.seed(2)
library(caTools)
split<- sample.split(profit, SplitRatio = 0.7)
split
train<- subset(profit, split="True")
test<- subset(profit, split="False")
train
test
test

# Create the model

Model<- lm(Profit~.,data = train)
summary(Model)

# Prediction

pred<- predict(Model, test)
pred

# Comparing Predicted V/S Actual Values

plot(pred, type = "l", lty=1.8, col="blue")
plot(test$Profit, type = "l", lty=1.8, col="red")
lines(pred, type="l", col="blue")

# Finding Accuracy

rmse<- sqrt(mean(pred-profit$Profit)^2)
rmse
