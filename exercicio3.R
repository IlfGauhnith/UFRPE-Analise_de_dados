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

media.abd <- 30
media.salto <- 155
media.suspensao <- 50
media.correr <- 1829
media.conhecimento <- 75

desvio.abd <- 6
desvio.salto <- 23
desvio.suspensao <- 8
desvio.correr <- 274
desvio.conhecimento <- 12

maria.abd <- 42
maria.salto <- 102
maria.suspensao <- 38
maria.correr <- 2149
maria.conhecimento <- 97

joana.abd <- 38
joana.salto <- 173
joana.suspensao <- 71
joana.correr <- 1554
joana.conhecimento <- 70


maria.abd.n <- ((maria.abd - media.abd) / desvio.abd)
maria.salto.n <- ((maria.salto - media.salto) / desvio.salto)
maria.suspensao.n <- ((maria.suspensao - media.suspensao) / desvio.suspensao)
maria.correr.n <- ((maria.correr - media.correr) / desvio.correr)
maria.conhecimento.n <- ((maria.conhecimento - media.conhecimento) / desvio.conhecimento)

joana.abd.n <- ((joana.abd - media.abd) / desvio.abd)
joana.salto.n <- ((joana.salto - media.salto) / desvio.salto)
joana.suspensao.n <- ((joana.suspensao - media.suspensao) / desvio.suspensao)
joana.correr.n <- ((joana.correr - media.correr) / desvio.correr)
joana.conhecimento.n <- ((joana.conhecimento - media.conhecimento) / desvio.conhecimento)

mean(c(maria.abd.n, maria.salto.n, maria.suspensao.n, maria.correr.n, maria.conhecimento.n))
mean(c(joana.abd.n, joana.salto.n, joana.suspensao.n, joana.correr.n, joana.conhecimento.n))
