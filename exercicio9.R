# Questão 1
fileURL <- "https://www.dropbox.com/s/w4xv9urbowbig3s/catsM.csv?dl=1"
download.file(fileURL, destfile="catsM.csv")
cats <- read.csv("catsM.csv")
str(cats)

# first column is a id variable. Excluding it. 
cats <- cats[, 2:ncol(cats)]
# casting "Sex" to factor.
cats$Sex <- factor(cats$Sex)
paste("Todos as linhas estão completas?", all(complete.cases(cats)))
str(cats)
summary(cats)


# Questão 2
fileURL <- "https://www.dropbox.com/s/9wnr69i6bjhqyct/Snail_feeding.csv?dl=1"
download.file(fileURL, destfile="Snail_feeding.csv")
caracol <- read.csv(file="Snail_feeding.csv", header=T, strip.white=T, na.strings="")

str(caracol)

caracol <- caracol[, 1:(ncol(caracol) - 5)]

caracol$Sex <- factor(caracol$Sex)
levels(caracol$Sex)[levels(caracol$Sex)=="female s"] <- "female"
levels(caracol$Sex)[levels(caracol$Sex)=="Male"] <- "male"
levels(caracol$Sex)[levels(caracol$Sex)=="males"] <- "male"

caracol$Size <- factor(caracol$Size)

caracol$Distance <- as.numeric(caracol$Distance)
caracol$Distance[682] <- 0.58
caracol$Distance[755] <- 0.356452

duplicated_index <- which(duplicated(caracol))
caracol <- caracol[-duplicated_index, ]

caracol[which(caracol$Depth > 2), ]
caracol[8, 6] = 1.62

str(caracol)
summary(caracol)

write.csv(caracol, file="caracol_data_checked.csv", row.names = F)

mean(caracol$Depth)

max(caracol[caracol$Size == "small" & caracol$Sex == "female", ][, "Distance"], na.rm = T)


fileURL <- "https://www.dropbox.com/s/jci311cfsj6uva7/Sparrows.csv?dl=1"
download.file(fileURL, destfile="Sparrows.csv")
Sparrows <- read.table("Sparrows.csv", header=T, sep=",")
Sparrows$Sex <- factor(Sparrows$Sex)
levels(Sparrows$Sex)

levels(Sparrows$Sex)[levels(Sparrows$Sex) == "Femal"] <- "Female"
levels(Sparrows$Sex)[levels(Sparrows$Sex) == "Femal e"] <- "Female"
levels(Sparrows$Sex)[levels(Sparrows$Sex) == "Males"] <- "Male"
levels(Sparrows$Sex)

str(Sparrows)

mean(Sparrows[Sparrows$Sex == "Female", "Tarsus"]) 
mean(Sparrows[Sparrows$Sex == "Male", "Tarsus"]) 

Sparrows <- Sparrows[Sparrows$Species == "SSTS", ]

min(Sparrows$Head)
max(Sparrows$Head)

which(duplicated(Sparrows))

str(Sparrows)

Sparrows$Wing[which(is.na(Sparrows$Wing))] <- c(59, 56.5, 57)
mean(Sparrows$Wing)

Sparrows_Ordenado <- Sparrows[order(Sparrows$Wing, Sparrows$Head), ]
