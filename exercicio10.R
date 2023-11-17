install.packages("dplyr")
library(dplyr)

install.packages("tidyr")
library(tidyr)

df <- data.frame(Theoph)
View(df)
?Theoph

# Questão 1
df %>%select("Dose")
# Questão 2
df%>%filter(Dose>5)
# Questão 3
df%>%slice(10:20)
# Questão 4
df%>%filter(Dose>5&Time>mean(Time))
# Questão 5
df%>%arrange(desc(Wt))
# Questão 6
df%>%arrange(Wt,desc(Time))
# Questão 7
df%>%mutate(tendencia=mean(Time))
# Questão 8
df%>%summarise(max(conc))



fileURL <- "https://www.dropbox.com/s/gi59a1nq3ga9gb7/673598238_T_ONTIME_REPORTING.csv?dl=1"
download.file(fileURL, destfile="673598238_T_ONTIME_REPORTING.csv")

fileURL <- "https://www.dropbox.com/s/73bp8dl8nph6ufz/L_UNIQUE_CARRIERS.csv_?dl=1"
download.file(fileURL, "L_UNIQUE_CARRIERS.csv")

T_ONTIME_REPORTING <- read.csv("673598238_T_ONTIME_REPORTING.csv",
                               quote="\"", sep=",")
L_UNIQUE_CARRIER <- read.csv("L_UNIQUE_CARRIERS.csv",
                             quote="\"", sep=",")


str(T_ONTIME_REPORTING)
str(L_UNIQUE_CARRIER)

df <- merge(T_ONTIME_REPORTING, L_UNIQUE_CARRIER, by.x="OP_UNIQUE_CARRIER", by.y="Code")
str(df)

# Questão 9 Qual companhia teve o maior atraso?
df %>% filter(DEP_DELAY_NEW == max(DEP_DELAY_NEW, na.rm=TRUE))

# Questão 10 Qual companhia atrasa mais na média?
df %>% 
  group_by(Description) %>% 
  summarise(mean_delay=mean(DEP_DELAY_NEW, na.rm=TRUE)) %>%
  filter(mean_delay == max(mean_delay, na.rm=TRUE))

# Questão 11 Qual companhia atrasa menos na média?
df %>% 
  group_by(Description) %>% 
  summarise(mean_delay=mean(DEP_DELAY_NEW, na.rm=TRUE)) %>%
  filter(mean_delay == min(mean_delay, na.rm=TRUE))

# Questão 12 Qual companhia teve a maior proporção dos atrasos?
df <- df[!is.na(df$DEP_DELAY_NEW), ] # Removendo linhas que DEP_DELAY_NEW sejam NA.
TOTAL_DELAY <- sum(df$DEP_DELAY_NEW)
df %>%
  group_by(Description) %>%
  summarise(PROPORTION_DEP_DELAY_NEW=sum(DEP_DELAY_NEW)/TOTAL_DELAY) %>%
  filter(PROPORTION_DEP_DELAY_NEW == max(PROPORTION_DEP_DELAY_NEW))



fileURL = "http://stat405.had.co.nz/data/tb.csv"
download.file(fileURL, dest="tb.csv")

TB <- read.csv("tb.csv")
View(TB)
str(TB)

TB <- TB %>% 
  select(-new_sp) %>%
  gather(key="Código", value="N_casos", -c("iso2", "year")) %>%
  separate(col="Código", into=c("caso", "tipo", "sexofaixa"), sep = "_") %>%
  separate(col="sexofaixa", into=c("sexo", "faixa"), sep=1)
str(TB)

# Questão 13 Qual foi a quantidade de casos para a Tailândia (TH) de pessoas do sexo Masculino?
TB %>%
  filter(iso2 == "TH" & sexo == "m") %>%
  summarise(sum(N_casos, na.rm=TRUE))

# Questão 14 Qual a proporção de casos para os estados unidos (US) ? Não considerar valores NAs da coluna "N_casos".
TOTAL_CASES <- TB %>% filter(!is.na(N_casos)) %>% summarise(sum(N_casos))
TOTAL_CASES <- TOTAL_CASES[1,1]
TB %>%
  filter(iso2 == "US" & !is.na(N_casos)) %>%
  summarise(sum(N_casos)/TOTAL_CASES)
  
# Questão 15 Qual a quantidade de casos para a faixa etária 2534 do sexo feminino?
TB %>%
  filter(sexo == "f" & faixa == "2534") %>%
  summarise(sum(N_casos, na.rm = TRUE))

# Questão 16
# Qual foi a quantidade de casos para a década de 2000 ? 
# A década de 2000, também referida como anos 2000, compreende 
# o período de tempo entre 1 de janeiro de 2000 e 31 de dezembro de 2009.
TB %>%
  filter(year %in% 2000:2009) %>%
  summarise(sum(N_casos, na.rm = TRUE))
