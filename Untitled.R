library(skimr)
library(tidyverse)

library(lubridate)

#Direccion, DNI (identificación del cliente)
 skim(adress)
 
# arcaterísticas de los clientes
 skim(main)
 
#Serie temporal de pagos
 skim(paid_record)
 
 sum(is.na(main$CODE_GENDER))

 #Objetivo coger el más cercano; El segundo por mes

 last_view <-  paid_record %>%
   group_by(paid_record$ID)%>%
   filter(paid_record$STATUS == "X")%>%
   summarise(last_view = max(MONTHS_BALANCE))
 
 min(paid_record$MONTHS_BALANCE)

  
 ########Modelo 
 
 
 main$main_f_income <- as.factor(main$NAME_INCOME_TYPE)
 print(main$main_f_income)
 

paid_record$status_1 <- as.factor(paid_record$STATUS)

 
paid_record$pagos <- ifelse(paid_record$STATUS == "0"|"C", 1, 0)



skim(main)
str(main)

 #income total logaritmo

#Variables para el modelo
main_rel <- select(main,Main_ID, CODE_GENDER, FLAG_OWN_CAR, CNT_CHILDREN, AMT_INCOME_TOTAL, NAME_INCOME_TYPE, 
                     NAME_EDUCATION_TYPE, NAME_FAMILY_STATUS, NAME_HOUSING_TYPE,DAYS_EMPLOYED, DAYS_BIRTH_CLEAN)


#factor de las profesiones
main_rel$Income_fact <- as.factor(main$NAME_INCOME_TYPE)

#ln(income)

main_rel$ln_income <- log(main_rel$AMT_INCOME_TOTAL)



#juntar los datos

predictivas <- full_join(idzipedad2, main_rel, by = "Main_ID")
write_csv(predictivas, "/Users/josepblascodominguez/Desktop/pred.csv")





predictivas$CODE_GENDER <- recode(predictivas$CODE_GENDER,"M" = 1, "F" = 0)

predictivas$FLAG_OWN_CAR



##

corrplot(M, p.mat = testRes$p, method = 'color', diag = FALSE, type = 'upper',
         sig.level = c(0.001, 0.01, 0.05), pch.cex = 0.9,
         insig = 'label_sig', pch.col = 'grey20', order = 'AOE')
 