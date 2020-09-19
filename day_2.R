library(tidyverse)
library(ggpubr)	

setwd("~/Desktop/RIT_Seminar_Data_Science")
data = read.csv("winequalityN.csv", header = T, sep = ",")

cor.test(data$pH, data$citric.acid)	# remind ourselves about the data
summary(data)


# Let's shape our problem so we know how to approach our data
# we want to be able to predict alcohol percent from our data
# let's inspect our data by making plots
  


# ggplot structure
ggplot(data = data, aes(x = sulphates , y = pH)) # makes and empty plot with sulphates on x and pH on y

# we have to add a layer to ggplot which will plot the data in any format, we do that by using + 
# Let's say we want to add points (scatter plot) to the plot
# geom_point()
# if you write geom_ and the press tab you can see all other types of visualizations you can make 

ggplot(data = data, aes(x = sulphates , y = pH)) + 
  geom_point()

?geom_point

# we want to make it a bit nicer so we use theme_minimal

ggplot(data = data, aes(x = sulphates , y = pH)) + 
  geom_point() +
  theme_minimal() 

# we can have multiple layers on the same plot
ggplot(data = data, aes(x = sulphates , y = pH)) + 
  geom_point() + # made points
  geom_line() + # connected all points with a line
  theme_minimal()  

?geom_line

# we can remove aes() from ggplot and add it to geom_point()
# the result is the same
ggplot(data = data) + 
  geom_point( aes(x = sulphates , y = pH)) +
  theme_minimal() 

# but when I add geom_line now, code will get an error because geom_line does not know what to put on lines
ggplot(data = data) + 
  geom_point( aes(x = sulphates , y = pH)) +
  geom_line() + 
  theme_minimal() 

# so we have to explicitly write the same for lines
ggplot(data = data) + 
  geom_point( aes(x = sulphates , y = pH)) +
  geom_line(aes(x = sulphates , y = pH)) + 
  theme_minimal() 

# this is usefull if you want to plot multiple variables on the same plot
# rarely looks good but there is an option..
ggplot(data = data) + 
  geom_point( aes(x = sulphates , y = pH)) +
  geom_line(aes(x = sulphates , y = alcohol)) + 
  theme_minimal() 


# for example maybe a okay reason to plot them on the same plot
ggplot(data = data) + 
  geom_point(aes(x = sulphates , y = pH, color = "Sulphate ~ pH")) +
  geom_point(aes(x = sulphates , y = alcohol, color = "Sulphates ~ alcohol")) + 
  theme_minimal() 



# Lets focus on our task: Let's inspect variables in relation to alcohol


# it seems there is a clear relationship between those two variables
ggplot(data = data, aes( x = pH, y = alcohol) ) + 
  geom_point() +
  theme_minimal() 

ggplot(data = data, aes( x = pH, y = alcohol) ) + 
  geom_point() +
  theme_minimal() +
  geom_smooth(method = "lm") 

# we can also check correlation between those to variables
# we see that coeficient is 0.12 (represent steepness of the line) which is not too high
# but p value is significant which says that those two variables correlate linearly with statistical relevance
ggplot(data = data, aes( x = pH, y = alcohol) ) + 
  geom_point() +
  theme_minimal() +
  geom_smooth(method = "lm") +
  stat_cor()

# let's repeat this for other parameters

# it does not seem to be correlated to alcohol
ggplot(data = data, aes( y = alcohol, x = citric.acid) ) + 
  geom_point() +	  geom_point() +
  geom_smooth(method = "lm") + 	  geom_smooth(method = "lm") + 
  stat_cor() + 	  stat_cor() +
  theme_minimal()	  theme_minimal()


p1 <- ggplot(data = data, aes( x = type, y = density, fill = type) ) + 	
  geom_boxplot() + 	# we can also group plots together and visualize them at once
  stat_compare_means(method = "t.test") +	data$total.sulfur.dioxide

# build them one by one and store them in variable p1,p2,p3,....
p1 <- ggplot(data = data, aes( x = fixed.acidity, y = alcohol) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()	  theme_minimal()


p2 <- ggplot(data = data, aes( x = type, y = fixed.acidity, fill = type) ) + 	p2 <- ggplot(data = data, aes( x = residual.sugar, y = alcohol) ) + 
  geom_boxplot() + 	  geom_point() +
  stat_compare_means(method = "t.test") +	  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()	  theme_minimal()


p3 <- ggplot(data = data, aes( x = type, y = chlorides, fill = type) ) + 	p3 <- ggplot(data = data, aes( x = free.sulfur.dioxide, y = alcohol) ) + 
  geom_boxplot() + 	  geom_point() +
  stat_compare_means(method = "t.test") +	  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()

p4 <- ggplot(data = data, aes( x = total.sulfur.dioxide, y = alcohol) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()	  theme_minimal()

ggarrange(p1,p2,p3,p4)

# does color of the wine affect alcohol level?
#   theme_minimal()	# now we are comparing categorical variable to continous
# so scatterplot won't work so we need boxplots

ggplot(data = data, aes( x = type, y = alcohol, fill = type) ) + 
  geom_boxplot() +
  theme_minimal()

# how to check if there is statistical significant difference between groups?
# t.test or wilcoxon-mann-whitney test
# t test assumes normal distribution so lets check how is data distributed
hist(data$alcohol, breaks = 100)

# well not really normally distributed
ggplot(data = data, aes( x = type, y = alcohol, fill = type) ) + 
  geom_boxplot() +
  theme_minimal() +
  stat_compare_means(method ="wilcox")

# always check the normality of the data because you might draw wrong conclusions
# according to t-test it is significant
ggplot(data = data, aes( x = type, y = alcohol, fill = type) ) + 
  geom_boxplot() +
  theme_minimal() +
  stat_compare_means(method ="t.test")



summary(data$alcohol)
# how to interpret boxplots
# line represents median value, box is middle 50% of your data
# end of boxes are 25% quartile or 75% quartile
# lines are datapoints bellow 25% quartile or above 75% quartile
# points after lines are outliers
# Let's see if correlations are affected within the color-group
p1 <- ggplot(data = data, aes( x = fixed.acidity, y = alcohol, color = type) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()

p2 <- ggplot(data = data, aes( x = residual.sugar, y = alcohol, color = type) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()

p3 <- ggplot(data = data, aes( x = free.sulfur.dioxide, y = alcohol, color = type) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()

p4 <- ggplot(data = data, aes( x = total.sulfur.dioxide, y = alcohol, color = type) ) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  stat_cor() +
  theme_minimal()

ggarrange(p1,p2,p3,p4)

# R will compute statics for each of the colors because it considers it a group
# in background R will filter the data based on type and perform analysis independently

# It seems that fixed.acidity~ alcohol is slightly differently associated comapring types of wine
# Most of the red wines are in lower values of residual sugar so it is hard to fit a line 
# free.sulfur.dioxide is negativley correlated to alohol for red and white wines, slightly more for white
# Total sulfur.dioxide is very different for red and white wines, most of the data for white is on the right
# comapred to the red wines which are on the left
# relationship to alcohol is similar, slightly more negative for white wines
# Try to make as much as plots as you can 
# scatterplots, boxplots, etc
# focus on alcohol because this is what we want to predict
# in your dataset you will be focused on co2 or temperature and try to predict it based on other parameters you found
# keep it simple and understandable


# Next time we will make few more plots and focus on useing that knowledge to make mathematical (predictive) model