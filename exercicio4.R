v <- c("M", "F", "F", "F", "M", "M")
a <- factor(v)

levels(a)
table(a)

x = c(1, 2, 3, 3, 5, 3, 2, 4, NA)
levels(factor(x))

f <- factor(c("a", "a", "b", "c", "c", "d"))
table(f)
f[f == "a"]
f[f %in% c("b", "c")]
f[1:3]
f[-1]

help(gl)
example(gl)

f <- gl(2, 100, labels = c("M", "F"))
sum(f == "M")
sum(f == "F")


drinks <- factor(c("beer","beer","wine","water"))
table(drinks)
mean(drinks == "beer")

drinks <- factor(c("beer","beer","wine","water"))
levels(drinks)[1] <- "water"
drinks


nomes <- c("João", "Paula", "Maria", "Ingrid", "José", "Marcos")
pesos <- c(80, 65, 70, 58, 78, 70)
alturas <- c(1.70, 1.66, 1.65, 1.60, 1.76, 1.70)



lista_pessoas <- list(nome=nomes, peso=pesos, altura=alturas)
str(lista_pessoas)

IMC = lista_pessoas$peso/lista_pessoas$altura^2
lista_pessoas$IMC = IMC
str(lista_pessoas)

lista_pessoas$nome[1]
lista_pessoas[[4]][3]


data()
lista<-lapply(airquality, function(x){mean(x)})
str(lista)
str(airquality)
lista$Temp

load("chuvas.RData")
str(chuvas)
dim(chuvas)
View(chuvas)
mean(chuvas)
max(chuvas)

which(chuvas == max(chuvas), arr.ind = TRUE)

chuvas[59:63,]
which(chuvas[59:63,] == max(chuvas[59:63,]), arr.ind = TRUE)

which(chuvas == min(chuvas), arr.ind = TRUE)

colMeans(chuvas)
rowMeans(chuvas)

which(rowMeans(chuvas) == max(rowMeans(chuvas)),arr.ind=TRUE)
which(colMeans(chuvas) == min(colMeans(chuvas)),arr.ind=TRUE)


aux <- chuvas["mun_81" , ]
aux
sum(aux[1:10])
sum(aux[seq(1,10,1)])
sum(aux[c(1:10)])
