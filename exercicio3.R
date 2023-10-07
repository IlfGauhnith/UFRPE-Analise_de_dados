xx <- c(TRUE, 2)
xx

x <- 1:4
y <- 2:3
x*y

load("vetor.RData")
mean(vetor01, na.rm=TRUE)
median(vetor01, na.rm=TRUE)
sd(vetor01, na.rm=TRUE)
sum(is.na(vetor01))
sum(is.na(vetor01))/length(vetor01)
sum(vetor01 > 7 & vetor01 < 8, na.rm=TRUE) 
sum(vetor01 > 9 | vetor01 < 1, na.rm=TRUE)
vetor01[-which(is.na(vetor01))] # Remove os valores NA.

help(which)

summary(vetor01, na.rm=TRUE)

v <- c(1, 1, 1, 10, 10)
v[which(v > 3)]
v[-which(v > 3)]
