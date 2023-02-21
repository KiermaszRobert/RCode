setwd("C://Users//rkiermasz//Documents//zadania//17_szydlowiec//r")
dane<-read.csv2("szydlowiec_dane_aktualne.csv")


rownames(dane)<-dane[,1]
dane<-dane[,-1]

#colnames(dane)
#dane<-dane[,c(-2,-6)]
#dane<-dane[,-c(13,14)]

srednie<-apply(dane,2,mean)
odchylenia<-apply(dane,2,sd)
for(i in 1:dim(dane)[1]){
dane[i,]<- (dane[i,]-srednie)/odchylenia
}

library(psych)

fit2 <- fa(dane,2, rotate = "varimax")
fit2$loadings
load <- fit2$loadings[,1:2]
plot(load,type="n") # set up plot
text(load,labels=names(dane),cex=.7) # add variable names



#write.csv2(round(cor(dane),2),"korelacje.csv")

d <- dist(dane,method = "euclidean")^2
fit <- hclust(d,method = "ward")
analizaSkupien<-fit
plot(fit, labels = rownames(dane), hang = -1, main = "Metoda Warda, analiza skupieñ")




hc = hclust(dist(dane))
hcd = as.dendrogram(hc)
op = par(mfrow = c(1, 1))
plot(cut(hcd, h = 75)$upper, main = "Upper tree of cut at h=75")
plot(cut(hcd, h = 75)$lower[[2]], main = "Second branch of lower tree with cut at h=75")

library(ape)
plot(as.phylo(hc), type = "unrooted")
