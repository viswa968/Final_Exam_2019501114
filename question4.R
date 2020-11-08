setwd("C:\\Users\\Hi\\Desktop\\instagram_readgoof\\Final_exam\\Final exam")

data = read.csv("Liver_Data.csv", header = FALSE, col.names = c("mcv", "alkphos", "sgpt", "sgot", "gammagt", "drinks", "selector"))

#below is the converting the decision attribute into classes
data$drinks = cut(data$drinks, breaks = c(0,5,10,15,20,25), labels = c('C1', 'C2', 'C3', 'C4', 'C4'), right = FALSE)
data = na.omit(data)

#training and of  test sets
traindata = subset(data, data$selector == 1)
testdata = subset(data, data$selector == 2)

x_train <- subset(traindata, select = -c(selector, drinks))
x_test <- subset(testdata, select = -c(selector, drinks))

y_train = traindata[,6, drop = TRUE]
y_test = testdata[,6, drop = TRUE]


#For Training Data
#knn if k=1
library(class)
model1 = knn(x_train, x_test, y_train, k = 1)
1-sum(y_train==model1)/length(y_train)

#knn if k=2
model2 = knn(x_train, x_train, y_train, k = 2)
1-sum(y_train==model2)/length(y_train) 

#knn if k=3
model3 = knn(x_train, x_train, y_train, k = 3)
1-sum(y_train==model3)/length(y_train) 


#For Test Data
#knn if k=1
model4 = knn(x_train, x_test, y_train, k = 1)
1-sum(y_test==model4)/length(y_test) 

#knn if k=2
model5 = knn(x_train, x_test, y_train, k = 2)
1-sum(y_test==model5)/length(y_test) 

#knn if k=3
model6 = knn(x_train, x_test, y_train, k = 3)
1-sum(y_test==model6)/length(y_test) 
