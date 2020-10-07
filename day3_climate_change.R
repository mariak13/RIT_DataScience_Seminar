library(tidyverse)
library(ggpubr)

# this function takes in your data and splits it before 2004 (training) and after 2004(test data)
# list of two dataframes is returned, first one is train, second one is test
split_data <- function(df){
  train = df %>% filter(Year <= 2004)
  test = df %>% filter(Year > 2004)
  return(list(train,test))
}
describe_fit <- function(fit){
  cat("Your Model: ", as.character(fit$call), "\n")
  RSS = crossprod(fit$residuals)
  MSE = RSS/length(fit$residuals)
  RMSE <- sqrt(MSE)
  
  cat("Model error measures: RSS=",RSS, ", MSE=",MSE,", RMSE=",RMSE, "\n" )
}


############################### We start here, do not change things above ############################

# Change your working directory to RIT_Seminar_Data_Science folder

data <- read.csv("potential_datasets/ClimateChange/climate_change_with_tempC.csv", sep = ",", header = T)

cor.test(train$CO2, train$TempC)

# remove all NAs from data
data = na.omit(data)

df = split_data(data) # we split data before and after 2004
train = df[[1]] # we will use data from 1983 - 2004 to make(train) a model
test = df[[2]] # we will use data from 2004 - 2008 to validate (test) our model

# Make plots:
## N20 - Temp

ggplot(train, aes(x = N2O, y = TempC))+
  geom_point() +
  stat_cor() + 
  geom_smooth(method = "lm") +
  theme_minimal()

## CH4 - Temp

ggplot(train, aes(x = CH4, y = TempC)) +
  geom_point() + 
  stat_cor() +
  geom_smooth(method="lm") +
  theme_minimal()

## CO2 - Temp

ggplot(train, aes(x = CO2, y = TempC)) +
  geom_point() + 
  stat_cor() +
  geom_smooth(method="lm") +
  theme_minimal()

## CFC.11 - Temp

ggplot(train, aes(x = CFC.11, y = TempC)) +
  geom_point() + 
  stat_cor() +
  geom_smooth(method="lm") +
  theme_minimal()


## MEI - Temp

ggplot(train, aes(x = MEI, y = TempC)) +
  geom_point() + 
  stat_cor() +
  geom_smooth(method="lm") +
  theme_minimal()



## CFC.12-Temp

ggplot(train, aes(x = CFC.12, y = TempC)) +
  geom_point() + 
  stat_cor() +
  geom_smooth(method="lm") +
  theme_minimal()


## TSI - Temp

ggplot(train, aes(x = TSI, y = TempC)) +
  geom_point() + 
  stat_cor() +
  geom_smooth(method="lm") +
  theme_minimal()


# make LM fit for individual parameter and then adding one by one

fit = lm(TempC ~ CO2, train)
summary(fit)
describe_fit(fit)


fit = lm(TempC ~ CO2 + CH4 , train)
summary(fit)
describe_fit(fit)

fit = lm(TempC ~ CO2 + N2O , train)
summary(fit)
describe_fit(fit)

fit = lm(TempC ~ CO2 + CFC.11 , train)
summary(fit)
describe_fit(fit)

fit = lm(TempC ~ CO2 + CFC.12 , train)
summary(fit)
describe_fit(fit)

fit = lm(TempC ~ CO2 + CFC.12 + CH4 , train)
summary(fit)
describe_fit(fit)

fit = lm(TempC ~ CO2 + CFC.12 + CFC.11 + TSI , train)
summary(fit)
describe_fit(fit)

# describe RMSE and R^2 for few models

y_hat = predict(fit, test)
1/length(y_hat) * (test$TempC - y_hat)^2

# When you think you have the best model, make model with those parameters

# predict on test data and see how much are we off




