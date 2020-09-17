setwd("~/Desktop/RIT_Seminar_Data_Science")
data <- read.csv("winequalityN.csv", sep = ",", header = T)


# Day 2

# using tidyverse package

#install.packages("tidyverse")
#install.packages("ggpubr")
library(tidyverse)
library(ggpubr)

cor.test(data$pH, data$citric.acid)

ggplot(data = data, aes( x = sulphates, y = pH, color = type) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_minimal() 

ggplot(data = data, aes( x = alcohol, y = citric.acid, color = type) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_minimal()

p1 <- ggplot(data = data, aes( x = type, y = density, fill = type) ) + 
  geom_boxplot() + 
  stat_compare_means(method = "t.test") +
  theme_minimal()

p2 <- ggplot(data = data, aes( x = type, y = fixed.acidity, fill = type) ) + 
  geom_boxplot() + 
  stat_compare_means(method = "t.test") +
  theme_minimal()

p3 <- ggplot(data = data, aes( x = type, y = chlorides, fill = type) ) + 
  geom_boxplot() + 
  stat_compare_means(method = "t.test") +
  theme_minimal()

# we try with t.test and it isignificant but alcohol is not normally dist.
hist(data$alcohol)

# p4 <- ggplot(data = data, aes( x = type, y = alcohol, fill = type) ) + 
#   geom_boxplot() + 
#   stat_compare_means(method = "wilcox") +
#   theme_minimal()

p4 <- ggplot(data = data, aes( x = type, y = alcohol, fill = type) ) + 
  geom_boxplot() + 
  stat_compare_means(method = "wilcox") +
  theme_minimal()


ggarrange(p1,p2,p3,p4)


# we want to make as much as we can plots to have insight 
#about our variables especially variable we  want to predict









