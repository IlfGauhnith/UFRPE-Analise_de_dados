# Questão 1
v <- c(20,30,4,934,1077,22)
cat(paste(v,collapse='m,'),'m',sep='')
v <- paste(v,rep('m'),sep='')


# Questão 2 
text <- paste(readLines("meio-do-caminho.txt"), collapse="\n")
nchar(text)


# Questão 3
txt <- c("eeer","3ca1n","fg","can","man","sigmean","fa3nta","fan")
grep(pattern="^[c|m|f]*an", txt, value=TRUE)
help(grep)


# Questão 4
install.packages('stringr')
library('stringr')
txt <- "eeer3GHJca1nfgSigmanfaUIOntafan"
str_extract_all(txt, pattern="[A-Z0-9]{1}")


# Questão 5
str_extract_all(txt, pattern="[[:upper:][:digit:]]")


# Questão 6
txt <- "tttyUFRPE19PPGIAkjgkjghk2j34j321UFRPEcapdPPGIA"
str_extract_all(txt, pattern="")


