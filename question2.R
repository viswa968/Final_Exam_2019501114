setwd("C:\\Users\\Hi\\Desktop\\instagram_readgoof\\Final_exam\\Final exam")

input = read.csv("data.csv", header = TRUE);

View(input)
input$TID <- NULL
library(arules)

write.csv(input, "Frequent-Itemsets.csv", quote = FALSE, row.names = TRUE)
transactions = read.transactions("Frequent-Itemsets.csv", sep=',', rm.duplicates = TRUE)
inspect(transactions)

frequent_itemsets <- apriori(transactions, parameter = list(sup = 0.03, conf = 0.5,target="frequent itemsets"))

inspect(sort(frequent_itemsets)[1:15])

itemFrequencyPlot(transactions, topN = 5,col='brown')
