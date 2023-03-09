ggplot(predictivas, aes(x= Edad)) +
  geom_histogram()+
  labs(title = "Distribución de la Edad", 
       x = "Edad", y = "Recuento",)+
  scale_color_identity()




predictivas %>% 
  filter(AMT_INCOME_TOTAL < 500000) %>%
ggplot(aes(x = AMT_INCOME_TOTAL))+
  geom_histogram()+
  labs(title = "Distribución salario", 
       x = "Salario", y = "Recuento",)+
  scale_color_identity()
