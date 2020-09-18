
# Day 1

############  this can be done by going on Files tabs->More->setWorkingDir
setwd("~/Desktop/RIT_Seminar_Data_Science")

############# ############ ############  Intro to Rstudio ############ ############ ############ ############ 

# make folder or navigate where-ever you have your winqualityN.csv (https://www.kaggle.com/rajyellow46/wine-quality)

# make new file

# on the right you see variables in memory
# Also files, this is where you are, so your path starts from here
# you can set up your working dir with "settings" button

# console 

# Running the code
# running code CMD + Enter
# also can run a bit of code you selected with mouse
# or buttons above on the right

mean(1)

# Global environment
# click on everything, and experiment
# clean it with broom button 

# Plots tab, all of your plots will be here
# Help page !!!!
?mean() 

# every function has a help page which will describe how to use a function



mean(3) 

# Data types
# matrix, data.frame, data_frame, list of list
# numbers, characters, float (number), etc,...

############ ############ ############ Reading data ############ ############ ############ ############ 

?read.csv
# returns dataframe
data <- read.csv("winequalityN.csv", sep = "\t") # every time you run reading the data, check what you actually did
data <- read.csv("winequalityN.csv", sep = ":") 
data <- read.csv("winequalityN.csv", sep = " ")
data <- read.csv("winequalityN.csv", sep = ",")
data <- read.csv("winequalityN.csv", sep = ",", header = FALSE) 
data <- read.csv("winequalityN.csv", sep = ",", header = T)

############ ############ ############  Basic Functions ############ ############ ############ ############ 

# always first to do check basic measures of your data
?base::summary()
summary(data)

# NAs in your data
# what do with them? 

# No NAs
mean(data$alcohol)
# Column with NA
mean(data$pH)
# remove NAs in computation
mean(data$pH, na.rm= T)

median(data$volatile.acidity)
median(data$volatile.acidity, na.rm = T)

sd(data$fixed.acidity, na.rm = T)

# other functions for example
abs(-2.2)
sqrt(9)
# colSums()
dim(data) # check dimension of your matrix

# accessing rows and columns in dataframe
# data[row_number, column_number_or_name]


############# ############ ############  Accessing specific column ############ ############ ############ 
data[, "pH"] # comma means 'everything', so this is give me all rows for column 'pH'
data[, 1] # give me everything for first column
# accessing specific row
data[55, ] # give me all colums for row number 55

colnames(data) # what are names of my columns?
rownames(data) # what are names of my rows?

# accessing specific row and column (one value)
data[1, 1] # give me first row, first column value


# : represents from-to sequence of numbers
1:5
3:9

# accessing specific rowS and columnS
data[1:3, 3:4]
data[1:3, "pH"] # when we ask for single column such as pH we actaully get a vector (list) of values

# vectors
# I want multiple columns but they are not sequential
col_i_want <- c(1,2,5) # I make my vector variable
data[1, col_i_want] # ask for first row and columns 1,2,5

# I can do that by refering to columns by name(becareful about typos) it has to be exactly the same
col_i_want <- c("residual.sugar","pH")
data[1, col_i_want] # ask for first row and columns residual.sugar and pH



# data types in R
typeof(data$fixed.acidity) # double ,float are decimal numbers
typeof(data$quality) # integers are rounded numbers


############ ############ ############ ############ Plotting your data and interpreting plots ############ ############ ############ ############ 

# Let's make few basic R plots
# Plots go to Plot tab on the right
# they can be exported, zoomed and resized, deleted, etc
plot(data$pH, data$density) # x,y scatter plot
plot(x = data$pH, y = data$density) # x,y scatter plot
plot(y = data$pH, x = data$density) # x,y scatter plot

# Histograms are plots that you do first to check how is your data distributed
hist(data$fixed.acidity)

hist(data$residual.sugar, breaks = 200)
hist(data$alcohol, breaks = 200)


# check correlation between two variables
cor.test(data$pH, data$citric.acid)

# interpret results
# coefficient
# p-value: < 0.05 is statistically significant, > 0.05 is not
# 2.2e-16 is basically very small number, smallest you can store in single variable

# Installing new packages, it will take 10,15mins
install.packages("tidyverse")
install.packages("ggpubr")

# loading them so you can use functions
library(tidyverse)
library(ggpubr)


# making nice plots
ggplot(data = data, aes( x = sulphates, y = pH) ) + 
  geom_point() +
  theme_minimal() 

############# Done for today

############# For next time

# Try to load your data
## check if column values are read properly, numbers should be numbers not string "232.1"
## That often happens if your decimal numbers in file have comma instead of dot (22,3)
## read.csv() and read.csv2() accepts parameters which can correct for that
## does your data have header(column names)? you can say header = TRUE or header = FALSE while reading
## check ?read.csv()   :)
## check summary
## check how many NAs
## print columns 
## make few basic plots, especially histograms
## try to interpret data based on histograms
## make few scatter plots 
## if you want try ggplot but we are going to work on that on Day 2








