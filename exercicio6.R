View(iris)

# Questão 1
# Quais comandos no R retornam um vetor das médias das variáveis 'Sepal.Length', 'Sepal.Width', 'Petal.Length' e 'Petal.Width' 
# do dataset iris (já incluído no R) ? Note que algumas funções usam diferentes formas de arredondamento.
apply(iris[, 1:4], 1, FUN = mean) # FALSO. Está processando no contexto de linhas e não de colunas.
apply(iris, 2, FUN = mean) # FALSO. Seleção errada de colunas.
colMeans(iris) # FALSO. Seleção errada de colunas.
apply(iris[, 1:4], 2, FUN = mean) # VERDADEIRO.
sapply(iris[, 1:4], FUN = mean) # VERDADEIRO.
mapply(iris[, 1:4], mean) # FALSO. A forma correta é: mapply(mean, iris[, 1:4])
apply(iris[1:4, ], 2, FUN = mean) # FALSO. A indexação está sendo feita por linha e não por coluna.



# Questão 2
# Quias comandos calcula a média  do tamanho das pétalas (Petal.Length) de acordo com as especies de iris (Species)?
tapply(iris$Petal.Length, iris$Species, mean) # VERDADEIRO.
tapply(iris[,3], iris$Species, mean) # VERDADEIRO.
with(iris, tapply(Petal.Length, Species, mean)) # VERDADEIRO.
sapply(iris, 2, mean) # FALSO. 2 não é uma função.
mapply(iris$Petal.Length, iris$Species, mean) # FALSO. iris$Petal.Length não é uma função
mean(iris$Petal.Length, iris$Species) # FALSO.

# Questão 8
#Use o 'mapply' para obter uma lista de 10 elementos. 
#A lista é uma alternação entre 'Rural' e 'Amo'. O comprimento desses 10 elementos diminuem de 10 para 1
mapply(FUN = function(x, d) {rep(x, d)}, c("Rural", "Amo"), 10:1)


# Questão 9
# Qual deve ser o código em print para que as seguintes sequências sejam impressas: 1:10, 2:11 e 3:12
for (i in 1:length(1:3)) {
  for (j in 1:10) {
    print(j+i-1)
  }
}


# Questão 10
# Crie o data frame 'student.df' com os dados fornecidos a seguir: 
# student.df = data.frame (nome= c ("Sue", "Eva", "Henry", "Jan"), sexo= c ("f", "f", "m", "m"), anos= c (21,15,17,19)). 
# Use a função "ifelse" para adicionar os elementos de  uma nova coluna chamada de  "menor". 
# Essa coluna, que deve ser adicionada ao data frame, é uma coluna lógica, indicando "V" se a observação for um homem ("m") com menos de 18 anos. 
# Caos contrário, atribua "F" (veja o resultado esperado abaixo). Digite apenas uma linha de código correspondente a toda essa ação. 
# Note que você deve tirar todos os espaços em branco e a coluna "menor" deve ser atribuída ao data frame através do operador "$". 
# Além disso, as colunas do data frame devem ser acessadas pelo nome e usem aspas duplas.
student.df <- data.frame(nome= c("Sue", "Eva", "Henry", "Jan"), sexo= c("f", "f", "m", "m"), anos= c(21,15,17,19))
student.df$menor <- ifelse(student.df$sexo == "m" & student.df$anos < 18, "V", "F")

# Questão 11
lapply(USArrests, sum)


x = 0
while(x < 100) {
  x = x + 2
}

print(x)