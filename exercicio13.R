View(infert)

levels(infert$education)

sum(infert$education=="0-5yrs") # quantidade deste grupo

p1 <- sum(infert$education=="0-5yrs")/length(infert$education) # proporção deste grupo
p2 <- sum(infert$education=="6-11yrs")/length(infert$education) # proporção deste grupo
p3 <- sum(infert$education=="12+ yrs")/length(infert$education) # proporção deste grupo

install.packages("splitstackshape")
library(splitstackshape)
STRAT <- stratified(infert, group = "education", size = c(p1, p2, p3), replace = T)
View(infert)
View(STRAT)

# Definição de tamanho da amostra para populações infinitas
sd <- 4250 # desvio padrao
erro <- 300 # erro maximo
nc <- (1 - 0.9)/2 # nivel de confianca
n <- ((qnorm(nc, lower.tail = F)*sd)/erro)^2 # tamanho da amostra
n

# Definição de tamanho da amostra para populações finitas
sd <- 5 # desvio padrao
N <-1500 # Tamanho total da população finita
erro <- 1.5 # erro maximo
nc <- (1 - 0.955) / 2
n <- (qnorm(nc, lower.tail = F)^2*sd^2*N) /
  ((erro^2*(N-1)) + (qnorm(nc, lower.tail = F)^2*sd^2))
n


sd <- 20/4 # desvio padrao
erro <- 1 # erro maximo
nc <- (1 - 0.98)/2 # nivel de confianca
n <- ((qnorm(nc, lower.tail = F)*sd)/erro)^2 # tamanho da amostra
n

sd <- 20/4 # desvio padrao
N <-5000 # Tamanho total da população finita
erro <- 1 # erro maximo
nc <- (1 - 0.98) / 2
n <- (qnorm(nc, lower.tail = F)^2*sd^2*N) /
  ((erro^2*(N-1)) + (qnorm(nc, lower.tail = F)^2*sd^2))
n


# rnorm gera valores que seguem a distribuição normal. 
# Por padrão a distribuição normal padrão, com média = 0 e dp = 1.
x <- rnorm(100000)
hist(x)


# Em um hospital psiquiátrico, os pacientes permaneceram internados, 
# em média, cinquenta dias, com desvio padrão de dez dias. Se for razoável 
# pressupor que o tempo de permanência tem distribuição aproximadamente normal, 
#qual a probabilidade de um paciente permanecer no hospital por mais de trinta dias ?

# pnorm retorna a probabilidade de um valor aleatório seguindo a distribuição
# normal ser menor que o valor passado no primeiro argumento.
# Como a questão pede por maior que o argumento então basta calcular a complementar.
1 - pnorm(30, mean = 50, sd = 10)

# Qual a proporção de casos acima de z = 1 ?
1 - pnorm(1)

# Qual a proporção de casos abaixo de z = -2 ?
pnorm(-2)

# Qual a proporção de casos abaixo de z = 0 ?
pnorm(0)

# Qual a proporção de casos acima de z = 1,28 ?
1 - pnorm(1.28)

# Sabe-se que o tempo médio para completar a 1VA de Cálculo II da Rural é 90 minutos, 
# com desvio padrão igual a 21 minutos. Se o professor responsável pela 
# disciplina quiser que apenas 90% dos alunos terminem a 1 VA, 
# quanto tempo deve dar aos candidatos para que o entreguem ?
qnorm(0.9, mean = 90, sd = 21)


# Num estudo sobre a qualidades nutricionais de lanches rápidos, mediu-se a 
# quantidade de gordura em cem hambúrgueres  de determinada cadeira de restaurantes. 
# Foram obtidos a média de 30,2 gramas e o desvio padrão de 3,8 gramas. Construa um 
# intervalo de 95% de confiança para a quantidade média de gordura em hambúrgueres 
# servidos nesses restaurantes.

sd <- 3.8 # desvio padrao
x <- 30.2 # media
m <- 100 # tamanho da amostra
nc <- (1-0.95)/2 # nível de confiança
erro <- sd/sqrt(n) # error
left <- x - (qnorm(nc, lower.tail = F)*erro) # Limite inferior
right <- x + (qnorm(nc, lower.tail = F)*erro) # Limite superior

# Isso significa que a média da população está neste intervalo com 95% de confiança
cat("[", left, "-", right, "]")

# Para o mesmo estudo anterior, foi medida a quantidade de sal e se obtiveram a 
# média de 658 mg e o desvio padrão de 47 mg. Ache o intervalo de 90% de confiança.

sd <- 47 # desvio padrao
x <- 658 # media
m <- 100 # tamanho da amostra
nc <- (1-0.9)/2 # nível de confiança
erro <- sd/sqrt(n) # error
left <- x - (qnorm(nc, lower.tail = F)*erro) # Limite inferior
right <- x + (qnorm(nc, lower.tail = F)*erro) # Limite superior

# Isso significa que a média da população está neste intervalo com 90% de confiança
cat("[", left, "-", right, "]")

# Um engenheiro metalúrgico está interessado em analisar a porcentagem de carbono 
# em uma liga de ferro produzido por sua empresa.Dez unidades amostrais de ferro 
# apresentam as seguintes quantidades de carbono (em gramas) para cada cem gramas 
# da liga: 4.37, 3.63, 2.78, 5.46, 2.18, 6.07, 3.24, 5.89, 4.86 e 4.64. 
# Suponha que o objetivo é determinar, com base na amostra, um intervalo de 
# confiança de 90% para o verdadeiro conteúdo médio de carbono na liga de 
# ferro produzida pela empresa.

data = c(4.37, 3.63, 2.78, 5.46, 2.18, 6.07, 3.24, 5.89, 4.86, 4.64)
sd <- sd(data) # desvio padrao
x <- mean(data) # media
m <- length(data) # tamanho da amostra
nc <- (1-0.9)/2 # nível de confiança
erro <- sd/sqrt(n) # error
left <- x - (qnorm(nc, lower.tail = F)*erro) # Limite inferior
right <- x + (qnorm(nc, lower.tail = F)*erro) # Limite superior

# Isso significa que a média da população está neste intervalo com 90% de confiança
cat("[", left, "-", right, "]")
