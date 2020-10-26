# Loading libraries
library(tidyverse)
library(ggpubr)

# navigate to the folder r_assignment2 and set as working directory

# loading the data

corona_data <- read.csv("corona_data.csv")

# Assignment 2:
# Students are expected to answer all questions with a plot and appropriate interpretation. 
# Plots should be made in Rstudio using ggplot framework and exported (or copy pasted) into 
# word document. Each figure (or group of figures) requires interpretation
# 
# General Hints (Not mandatory to do but it will help with interpretation):
# - Feel free to use scale_y_log10 or scale_x_log10 whenever you think it helped with interpretation 
# - Make sure you understand what scaling on log10 does and why do we apply it
# - Play with "fill" and "color" parameters inside aes() function when making plots in order to 
#   make your plots more colorful and easier to understand
# - Apply theme_minimal or theme_pubclean whenever you think it makes your plots nicer
# - Data contains NAs (or unknown values) which will be ignored when you make plots 
#   (nothing to worry about, just be aware what is happening)




# 1.a) Which country has the most corona cases (use plots 1.a, 1.b, 1.c and 1.d to answer the question)?
# Hint: Make boxplot where x-axis is location and y-axis is total_cases
# Hint: add + scale_y_log10() since the numbers are quite differnt




# 1.b) Using total_cases might not be the most useful metric to represent corona outbrake, 
#      therefore make the same plot as in question 1.a but with new_cases column
# Hint: apply the same procedure as in question 1




# 1.c) Plot population of each country
# Hint: Use the same code structure as in previous questions but replace geom_boxplot() with
#       geom_col(). Boxplots are useful visalization technique when data varies within certain 
#       categorical variable (in our case location). Since population does not we can use columns.




# If you did not use scale_y_log10 you noticed that population varies quite a lot
# Since this is the case it is "not fair" to compare new_cases between countries without
# considering population


# 1.d) Use new_cases_per_million column on plot
# Hint: apply the same procedure as in question 1.a and 1.b




# 2.a) Which country make the most corona tests?
# Hint: use total_tests column on y-axis, use scale_y_log10 if you think it is needed



# 2.b) For similar reasons explained in question 1, use total_tests_per_thousand 
#      instead of total_tests




# 3.a) Make scatter-plot having total_tests_per_thousand on y-axis and new_cases_per_million
#      on x-axis. Use stat_cor() and geom_smooth(method="lm") to calculate and visualize relationship
#      between those two variables. 
#      How would you describe relationship between those two variables? 
#      Did you expect such relationship? Why?




# 3.b) Make the same plot as in 3.a but per location. 
# Hint: add color=location inside aes() function
# Hint: You might have difficulties interpreting this plot if you include all locations therefore 
#       I wrote a code which will make a new table containing specific countries. 
# Hint: Use temporary_data in your plots in question 3.b and 4.a.
# Hint: Feel free to change the countries you want to comment on (compare)
# How would you interpret very steep line or flat line on this plot?

# this code takes corona_data table and applies filter which will check if location is in this 
# vector of locations. The results are stored in new table called temporary_data. 
# Feel free to add/remove countries but make sure you write it right or you will get an error.
# temporary_data will be used in questions 4 and 5! 
temporary_data = corona_data %>% filter(location %in% c("Italy","Croatia", "Japan","United States", "Germany"))




# 4.a) You might have heard about expression "flattening the curve" during the corona-pandemic. 
#      This expression refers to the scatter-plot where x-axis is date and y-axis is new_cases_per_million.
# Hint: Use temporary_data with geom_point() and mentioned x and y parameters
# What does narrow bell-shaped curve represent? How does that situation affect healthcare? 
# Why do we want to "flatten the curve"? (Compare few countries with Croatia and comment on curves)
# How many "waves" of corona-outbrake do you see? 
# Optional question without correct answer: If you included Japan in filtering step, why do you think Japan has really flat 
# curve? You can try to compare multiple few paramteres with new_cases_per_milion 




# 5.a) Let's investigate death rate of corona... We are still using temporary_data in this question, so it is
#      easier to compare countries. In this question make sure you included Italy as one of the countries 
#      but feel free to add other countries (I compared Italy, Japan, Croatia, Germany and US).
#      Make scatter plot having new_deaths_per_million on x-axis, new_cases_per_million on y-axis 
#      and color=location. Use geom_smooth(method="lm") and stat_cor() for efficient interpretation.
#      What does steep line with high R (correlation coefficient) represent? What about flat line with low
#      R(correlation coefficient)?



# 5.b) We are still using temporary_data in this question, so it is
#      easier to compare countries. What might be the cause of high death rate? 
#      Make boxplot having diabetes_prevalance for x-axis,
#      new_deaths_per_million for y-axis and color location
#      Which country's corona-deaths are affected the most by diabetes prevalance? Why ?




# 5.c) In connection to question 5.b make the same plot but having aged_65_older on x-axis instead of 
#      diabetes_prevalence. Which country shows a high new_deaths_per_million AND a high number of
#      aged_65_older?




# 5.d) In connection to question 5.b and 5.c make the same plot but having population_density on x-axis instead of 
#      diabetes_prevalence. Which country shows a high new_deaths_per_million AND high population_density?




# NOW WE ARE BACK USING ENTIRE DATA, SO USE corona_data INSTEAD OF temporary_data !!!!!!

# 6.a) Now we are going to make a linear regression model (lm) and try to predict new_cases. There is no 
#      need of spliting the data since the focus of the project is to understand the data.
#
#      I wrote an staring point for modeling which includes having location as parameter in a model. 
#      location is not a numeric paramter and yet it can be included in linear regression model. Understanding
#      of how is used is beyond the scope of this assignmeent, so do not worry about it, just keep location in 
#      the model and experiment with more numeric parameters.
#      Try to make model using following paramters only ( other paramters already contain information about cases
#       therefore they it does not make sense to include them in a model):  
#      median_age, population_density, population, extreme_poverty, diabetes_prevalence,gdp_per_capita, 
#      aged_65_older (or aged_70_older), human_development_index, hospital_beds_per_thousand, handwashing_facilities
#      male_smokers, female_smokers.
#      
#      If you remove location from a model, you will notice that R^2 will be 
#      quite low. That is because we are working on multi-country data and corona-outbreak did not 
#      affect the same all countries, especially not in the same time. 
#      
fit = lm(data = corona_data, formula =  new_cases ~ location)

