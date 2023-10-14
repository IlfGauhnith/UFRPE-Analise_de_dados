mouse.color <- c("purple", "red", "yellow", "brown")
mouse.weight <- c (23, 21, 18, 26)
mouse.info <- data.frame(colour=mouse.color, 
                        weight=mouse.weight)

str(mouse.info)
mouse.info[3, ]
mouse.info[, 1]
mouse.info[4, 1]

View(airquality)
str(airquality)

aux <- airquality[airquality$Month == 5, ]
aux[aux$Ozone == min(aux$Ozone, na.rm = TRUE), ]

aux <- subset(x = airquality, 
              subset = airquality$Ozone > 25 & airquality$Temp < 90,
              select = c("Solar.R"))
aux <- aux[complete.cases(aux), ] # remove linhas com NA
mean(aux, na.rm = TRUE)

sum(complete.cases(airquality))


genomas <- as.data.frame(
  read.csv("https://www.dropbox.com/s/vgh6qk395ck86fp/genomes.csv?dl=1"))
str(genomas)
View(genomas)
aux <- genomas[genomas$Chromosomes > 40, ]

str(genomas)
aux <- genomas[(genomas$Plasmids >= 1 & genomas$Chromosomes > 1), ]
View(aux)

factor(genomas$Groups)


cancer_stats <- as.data.frame(
  read.csv("https://www.dropbox.com/s/g97bsxeuu0tajkj/cancer_stats.csv?dl=1"))

str(cancer_stats)
aux <- cancer_stats[
  (cancer_stats$Class == "Digestive System") 
  &
  (cancer_stats$Female.Cases > cancer_stats$Male.Cases), "Site"]

cancer_stats$Survival.Ratio.Males = cancer_stats$Male.Deaths / cancer_stats$Male.Cases
cancer_stats[cancer_stats$Survival.Ratio.Males == max(cancer_stats$Survival.Ratio.Males, na.rm = TRUE), "Site"]

cancer_stats$Survival.Ratio.Females = cancer_stats$Female.Deaths / cancer_stats$Female.Cases
cancer_stats[cancer_stats$Survival.Ratio.Females == min(cancer_stats$Survival.Ratio.Females, na.rm = TRUE), "Site"]
