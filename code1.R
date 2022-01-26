library(caret)
library(glmnet)

mytab = read.table("leu", sep = " ", stringsAsFactors = FALSE)

mytab = as.data.frame(mytab[,-2])


l = dim(mytab)[1]; w = dim(mytab)[2]
for(i in 1:l) {
  for(j in 2:w) {
    strng = unlist(strsplit(mytab[i,j], split = ":"))[2]
    mytab[i,j] = strng
  }
}

write.csv(mytab, file = "leu.csv")

strng = "V3"
mytab2 = read.csv(file = "leu.csv")
w = dim(mytab2)[2]
for(i in 3:w) {
  strng = paste0(strng, "+", colnames(mytab2)[i])
}
