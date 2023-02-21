setwd("C://Users//rkiermasz//Documents//zadania//29_ofertyPracy")
ofertyPracy<-read.table("oferty7.dsv",sep=";",header=T,dec=",",encoding = "UTF-8")
ofertyPracy_ory<-ofertyPracy[1:2,]

# 
# 
# stringToColumn <- function(dataset, col_name){
#   x <- as.vector(dataset[col_name])
#   return(x)
# }
# 
# 
# stale<-0
# for(i in 1:dim(ofertyPracyCharacter)[2]){
#   col_name<- colnames(ofertyPracyCharacter)[i]
#   if(dim(unique(stringToColumn(ofertyPracyCharacter,col_name)))[1]==1){
#     stale<-c(stale,i)
#   }
# }
# stale<-stale[-1]
# ofertyPracyCharacter<-ofertyPracyCharacter[,-stale]
library(dplyr)
ofertyPracy <- ofertyPracy %>% 
  select (DATA_WAZN_OD_ID,DATA_WAZN_DO_ID,UPRAW_LISTA,UMIEJ_LISTA,OPIS_ZAWODU,DATA_KON_ZATR_ID,DATA_POCZ_ZATR_ID,TYP_WYSZKT_OPIS,POZ_WYSZKT_OPIS, ILE_UMIEJ, ILE_UPRW,NAZWA_PLACOWKI)
ofertyPracy$UPRAW_LISTA[which(ofertyPracy$UPRAW_LISTA=="PRAWO JAZDY - KAT. B")]<- "PRAWO JAZDY KAT. B"
ofertyPracy$UPRAW_LISTA[which(ofertyPracy$UPRAW_LISTA=="PRAWO JAZDY B")]<- "PRAWO JAZDY KAT. B"
ofertyPracy$UPRAW_LISTA[which(ofertyPracy$UPRAW_LISTA=="PRAWO JAZDY KAT. B*")]<- "PRAWO JAZDY KAT. B"
ofertyPracy$UPRAW_LISTA[which(ofertyPracy$UPRAW_LISTA=="PRAWO JAZDY KAT.B")]<- "PRAWO JAZDY KAT. B"

ofertyPracy$UPRAW_LISTA[which(ofertyPracy$UPRAW_LISTA=="brak danych Ÿród³owych")]<- NA
ofertyPracy$UMIEJ_LISTA[which(ofertyPracy$UMIEJ_LISTA=="brak danych Ÿród³owych")]<- NA
ofertyPracy$TYP_WYSZKT_OPIS[which(ofertyPracy$TYP_WYSZKT_OPIS=="brak")]<- NA
ofertyPracy$TYP_WYSZKT_OPIS[which(ofertyPracy$TYP_WYSZKT_OPIS=="brak danych Ÿród³owych")]<- NA
ofertyPracy$POZ_WYSZKT_OPIS[which(ofertyPracy$POZ_WYSZKT_OPIS=="brak danych Ÿród³owych")]<- NA
ofertyPracy$POZ_WYSZKT_OPIS[which(ofertyPracy$POZ_WYSZKT_OPIS=="brak")]<- NA
ofertyPracy$OPIS_ZAWODU[which(ofertyPracy$OPIS_ZAWODU=="")]<- NA
ofertyPracy$OPIS_ZAWODU[which(ofertyPracy$OPIS_ZAWODU=="brak danych Ÿród³owych")]<- NA


Ind<-sapply(ofertyPracy, is.numeric)
ofertyPracyCharacter<-ofertyPracy[,-which(Ind)]



#install.packages("arules")
library(arules)
frequentItems <- eclat (ofertyPracyCharacter, parameter = list(supp = 0.05, minlen = 2,maxlen = 15)) # calculates support for frequent items
inspect(frequentItems)
