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

data <- read.csv("potential_datasets/ClimateChange/climate_change_with_tempC.csv", sep = ",", header = T)

# remove all NAs from data
data = na.omit(data)

df = split_data(data) # we split data before and after 2004
train = df[[1]] # we will use data from 1983 - 2004 to make(train) a model
test = df[[2]] # we will use data from 2004 - 2008 to validate (test) our model

# Make plots:
## N20 - Temp

ggplot(data, aes(x = N2O, y = TempC))+
  geom_point() +
  stat_cor() + 
  geom_smooth(method = "lm") +
  theme_minimal()

## CH4 - Temp
## CO2 - Temp
## CFC.11 - Temp
## MEI - Temp
## CFC.12-Temp
## TSI - Temp

# make LM fit for individual parameter and then adding one by one

# describe RMSE and R^2 for every

# When you think you have the best model, make model with those parameters

# predict on test data and see how much are we off, should be around 2




