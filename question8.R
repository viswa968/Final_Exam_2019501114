setwd("C:\\Users\\Hi\\Desktop\\instagram_readgoof\\Final_exam\\Final exam")

input = read.csv("BSE_Sensex_Index.csv", header = TRUE)

View(input)
summary(input)
input$Date = as.Date(input$Date, format='%m/%d/%Y')

function_1 <- function(x) {
  n = length(x)
  for (i in 1:(length(x))) {
    x[i] <- (x[i] - x[i + 1]) / x[i + 1]
  }
  x[length(x)] = (x[length(x) - 1] + x[length(x) - 2] + x[length(x) - 3]) / 3
  return(x)
}

input$successive_growth <- function_1(input$Close)

sgrmean <- mean(input$successive_growth, na.rm=TRUE)
sgrsd <- sd(input$successive_growth,na.rm=TRUE)
z<-(input$successive_growth - sgrmean) / sgrsd
sort(z)
input$zscores <- z
dates<-subset(input[,1],input[,"zscores"] >= 3.0 | input[,"zscores"] <= -3.0)
View(dates)

write.csv(dates,"Dates-Outliers.csv",quote = FALSE,row.names = TRUE)