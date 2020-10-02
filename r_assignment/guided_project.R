library(tidyverse)
library(ggpubr)

# set your working directory in r_assignment folder so you can read the data


# load the data 
data = read.csv("guided_project_data.csv", sep = ",", header = T)

# make summary of data to see what parameters you are dealing with



# Which country produces the most CO2 (make boxplot showing country on X-axis and co2 on y axis)
# hint: add  + scale_y_log10() on the end so all of y values are scaled



# Which country produces the most methane? 
# Hint: use the same structure of co2-plot 



# Which country produces the most total_ghg (Total Green house gasses)
# Hint: use the same structure of co2-plot 



# Which country produces the most nitrous_oxide
# Hint: use the same structure of co2-plot 

# Compare populations of each country
# Hint: Use the same structure as in previous plots



# Are Population and CO2 correlated?
# Hint: Make point-plot having population on x-axis and co2 on y-axis
# use stat_cor() and geom_smooth(method="lm") for interpretation




# Does population-CO2 association change in different countries?
# Hint: Use the same plot as in previous task but add color=country inside aes()
# What countries have negative coefficient? (Optional) Why do you think that is?




# Compare production of few atmospheric gasses (and total_ghg) with GDP
# Make multiple point-plots having gdp_scaled on y-axis and atmospheric parameters on x-axis
# Hint: use stat_core and geom_smooth(method="lm") for interpretation



# Compare production of few atmospheric gasses (and total_ghg) with GDP for every country 
# Use the same plot structure as in previous question
# Hint: add color=country in aes()
# Observe correlation coefficient for every country, positive coeficient indicate that 
# that country's GDP rely on specific industry



# Make a linear regression model which will predict CO2 levels
# Hint: make point-plots to choose parameters which are meaningful for co2 prediction
# DO NOT USE total_ghg because CO2 itself is green house gas
# Which paramter is the best for predicting CO2?


