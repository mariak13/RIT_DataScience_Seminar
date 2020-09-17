
# Day 1

setwd("~/Desktop/RIT_Seminar_Data_Science")

# intro to Rstudio

# make folder

# make new file
# go to kaggle and download Wine Quality (https://www.kaggle.com/rajyellow46/wine-quality)
# school examples in all courses

# on the right you see variables in memory
# also files, this is where you are, so your path starts from here
# you can set up your working dir with settings button
# console 

# global environment
# click on everything, it will visualize one the left
# clean it with broom button 

# Plots tab, all of your plots will be here
# Help page
?mean(3) 

# connections to DB, not going to use for now

# running code CMD + Enter
# also can run a bit of code you selected with mouse
# or buttons above on the right
mean(3) 

# matrix, data.frame, data_frame, list of list
?read.csv
# returns dataframe
data <- read.csv("winequalityN.csv", sep = "\t")
data <- read.csv("winequalityN.csv", sep = ":")
data <- read.csv("winequalityN.csv", sep = " ")
data <- read.csv("winequalityN.csv", sep = ",")
data <- read.csv("winequalityN.csv", sep = ",", header = FALSE) 
data <- read.csv("winequalityN.csv", sep = ",", header = T)

?base::summary()
summary(data)


# No NAs
mean(data$alcohol)
# Column with NA
mean(data$pH)
# remove NAs in computation
mean(data$pH, na.rm= T)

median(data$volatile.acidity)
median(data$volatile.acidity, na.rm = T)

sd(data$fixed.acidity, na.rm = T)
abs(-2.2)

# dimensions of your data
dim(data)


# accessing specific column
data[, "pH"]
data[, 1]
# accessing specific row
data[55, ]

data[, "residual.sugar"]
data[, colnames(data)[5]]
rownames(data)

# accessing specific row and column
data[1, 1]


# : represents from-to sequence of numbers
1:2
3:4
# accessing specific rowS and columnS
data[1:2, 3:4]

# vector 
col_i_want <- c(1,2,5)
col_i_want <- c("residual.sugar","pH")
colnames(data)

data[1, col_i_want]


# data types in R
typeof(data$fixed.acidity)


# for - loops
for (i in 1:10){
  print(i)
}

# ugly basic R plots
plot(data$pH, data$density)
hist(data$fixed.acidity)

hist(data$residual.sugar, breaks = 200)
hist(data$alcohol, breaks = 200)

cor.test(data$pH, data$citric.acid)

ggplot(data = data, aes( x = sulphates, y = pH, color = type) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_minimal() 

