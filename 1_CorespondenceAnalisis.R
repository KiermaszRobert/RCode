
library(ca)
ofertyPracy_ory$CZY_OTWARTA_ID
ofertyPracy_ory$SPOS_APLIK_OPIS
mytable <- with(ofertyPracy_ory, table(CZY_OTWARTA_ID,NAZWA_WLK_GR_ZAW))
fit <- ca(mytable)
prop.table(mytable,1)
plot(fit, mass = TRUE, contrib = "absolute", map =
       "rowgreen", arrows = c(FALSE, TRUE)) # asymmetric map 


library("FactoMineR")
library("factoextra")

ofertyPracy_ory$CZY_OTWARTA_ID
ofertyPracy_ory$SPOS_APLIK_OPIS
mytable<-table(ofertyPracy_ory$CZY_OTWARTA_ID,ofertyPracy_ory$SPOS_APLIK_OPIS)
res.ca <- CA(mytable, graph = FALSE)
fviz_ca_biplot(res.ca, repel = TRUE)