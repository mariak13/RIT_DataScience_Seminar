# load libraries

data = read.csv("potential_datasets/ClimateChange/climate_change.csv")

# load data

# click on data

# make summary
summary(data)

# try methods such as mean(), median()
mean(data$CO2, na.rm = T)
mean(data$CH4)
# remove NAs in those while computing those values

# make few basic plots

hist(data$CH4)
hist(data$Temp, breaks = 50)

plot(data$Year,data$CO2)
plot(y = data$Temp, x = data$Year)

plot(data$Temp, data$CO2)
############ GGPLOT ##############

install.packages("tidyverse")
install.packages("ggpubr")

library(tidyverse)
library(ggpubr)


# blank ggplot
ggplot()

# ggplot with points
# ggplot with points and lines
ggplot(data, aes( x = data$Year, y = data$CO2) ) + 
  geom_point() + 
  geom_line() 

ggplot(data, aes(x = data$CO2)) + 
  geom_histogram(bins = 50)


# ggplot with points and color=type

ggplot(data, aes( x = Year, y = Temp, color = Month ))  + 
  geom_point()

# since month is more as group 
data$Month = as.character(data$Month)

summary(data)

ggplot(data, aes( x = Year, y = Temp, color = Month ))  + 
  geom_point()

# Making a line with points

ggplot(data, aes( x = Year, y = CO2, color = Month)) + 
  geom_point()


# Making a line with points and color=type

cor.test(data$Year, data$CO2)

# Computing correlation 

ggplot(data, aes(x = Year, y = CO2)) +
  geom_point() +
  stat_cor()

ggplot(data, aes(x = Year, y = CO2, color = Month)) +
  geom_point() +
  stat_cor()

ggplot(data, aes(x = Year, y = CO2)) +
  geom_point() + 
  geom_smooth(method = "lm") + 
  stat_cor()

ggplot(data, aes(x = CH4, y = CO2)) +
  geom_point() + 
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_minimal()

ggplot(data, aes(x = Temp, y = CO2)) +
  geom_point() + 
  geom_smooth(method = "lm") + 
  stat_cor() + 
  theme_bw()

ggplot(data, aes(x = Month, y = Temp) ) + 
  geom_boxplot() + 
  theme_minimal()

summary(data$Temp)

ggplot(data, aes(x = Month, y = CH4 ) ) + 
  geom_boxplot() + 
  theme_minimal()

ggplot(data, aes(x = Month, y = CO2 ) ) + 
  geom_boxplot() + 
  theme_minimal()
