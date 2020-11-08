setwd("C:\\Users\\Hi\\Desktop\\instagram_readgoof\\Final_exam\\Final exam")
result = read.csv("lenses.data.csv", header = FALSE, col.names = c("index", "age", "spectacle_prescription", "astigmatic", "tear_production_rate", "Class"))

result$index <- NULL

library(rpart)
y<-as.factor(result[,5])
x<-result[,1:4]

model1<-rpart(y~.,x, parms = list(split = 'information'),
              control=rpart.control(minsplit=0,minbucket=0,cp=-1, maxcompete=0, maxsurrogate=0, usesurrogate=0, xval=0,maxdepth=5))


library(rpart.plot)
rpart.plot(model1)