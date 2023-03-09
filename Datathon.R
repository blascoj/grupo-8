exo<-read.csv2(file = "D:\\Datathon\\pred.csv", sep = ",")
main<-read.csv2(file = "D:\\Datathon\\main.csv", sep = ",")
pagos<-read.csv2(file = "D:\\Datathon\\paid_record.csv", sep = ",")

#install.packages("fastDummies")
library(fastDummies)


# si M = 0 e F = 1
exo$CODE_GENDER <- ifelse(exo$CODE_GENDER == "M", 0, 1)
# Si tiene coche 1 y sino 0
exo$FLAG_OWN_CAR <- ifelse(exo$FLAG_OWN_CAR == "Y", 1, 0)
# Si tiene realty 1 y sino 0
exo$FLAG_OWN_REALTY <- ifelse(exo$FLAG_OWN_REALTY == "Y", 1, 0)

exo_1<-dummy_cols(exo,  select_columns = c("NAME_INCOME_TYPE","NAME_EDUCATION_TYPE","NAME_FAMILY_STATUS", "NAME_HOUSING_TYPE")) %>% select(-c("NAME_INCOME_TYPE","NAME_EDUCATION_TYPE","NAME_FAMILY_STATUS", "NAME_HOUSING_TYPE"))

x <- subset(exo_1, select = c(Edad, Income_fact, DAYS_EMPLOYED, CNT_CHILDREN))


modelo.logit <- glm(formula = pagos ~ x, data = 
                    data = datos.modelo, family = "binomial")
summary(modelo.logit)