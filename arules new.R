setwd("C:/Users/saksh/Desktop/MSU/1. Anjana/")
data = read.csv("tfidf.csv")
matrix_format = data.matrix(data[,2:11739]) 
transaction = as(matrix_format, "transactions")
head(data)

words = c("covid","corona","virus","pandemic","immigrate","immigrant","admit","jobless","risk","risky",#"admission","job
          "defer","deferment","deferral","deferred","economy","economic","economical","roi")



rules <- arules::apriori(transaction, parameter=list(support =0.007, confidence =0.09, minlen=2), appearance = list(rhs=words)) #memory error, try 0.065 (but it does not give enough results)
#rules_subset <- subset(rules, (lhs %in% words))
#rules_subset <- subset(rules_subset1, (rhs %in% words)) #international students redirectig from US to other countries
rules_subset <- sort(rules,by="lift",decreasing=TRUE)
inspect(rules_subset)
DT <- data.frame(inspect(rules_subset))
write.csv(DT,"rules for support0.006% conf0.1.csv")
