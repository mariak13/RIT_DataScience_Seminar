library(tidyverse)
library(ggpubr)
library(Metrics)


setwd("~/Desktop/RIT_Seminar_Data_Science")
data <- read.csv("winequalityN.csv", sep = ",", header = T)
hist(data$alcohol, breaks = 100)

# remove NAs
data = na.omit(data)
# Let's we want to predict alchohol

# we have to investigate all parameters to choose which are 
# affecting alchocol

p1 <- ggplot(data = data, aes( x = alcohol, y = citric.acid) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_minimal()

p2 <- ggplot(data = data, aes( x = alcohol, y = pH) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_minimal()

p3 <- ggplot(data = data, aes( x = alcohol, y = fixed.acidity) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_minimal()

p4 <- ggplot(data = data, aes( x = alcohol, y = residual.sugar) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_minimal()

p5 <- ggplot(data = data, aes( x = alcohol, y = density) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_minimal()

p6 <- ggplot(data = data, aes( x = alcohol, y = chlorides) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_minimal()


ggarrange(p1,p2,p3,p4,p5,p6, ncol = 2, nrow = 3)

# PH, residual sugar, density, chlorides

# outliers

# Y = ax1 + c

fit = lm(formula = alcohol ~ pH + density, data = data)

# a is coef for x1 param ( ph) b is coef for x2 param (density)
# y = c + ax1 + bx2

summary(fit)


fit = lm(formula = alcohol ~ pH + density, data = data)
summary(fit)

# 
fit = lm(formula = alcohol ~ pH + chlorides, data = data)
summary(fit)


fit = lm(formula = alcohol ~ pH + desnity + residual.sugar, data = data)
summary(fit)


fit = lm(formula = alcohol ~ density + residual.sugar, data = data)
summary(fit)


fit = lm(formula = alcohol ~ density + residual.sugar + fixed.acidity, data = data)
summary(fit)

# alk = inter + density * -3.94 + residual.sugar*5.8 + fix.acidity *3.54

index_df = sample(1:nrow(data), size = 0.8*nrow(data), replace = F)
train = data[index_df, ]
test = data[-index_df, ]

fit = lm(formula = alcohol ~ density + residual.sugar + fixed.acidity, data = train)
summary(fit)

y_hat_alk = predict(fit, test)

# root mean squered error
rmse(actual = test$alcohol, predicted = y_hat_alk)
summary(data$alcohol)
hist(data$alcohol, breaks = 100)
