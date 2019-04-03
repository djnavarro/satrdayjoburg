library(tidyverse)
library(here)
beaches <- read_csv(here::here("data","sydneybeaches3.csv"))

# Exercise 1: This is a stripped down version of the plot
# we've used in the slides (p). It is a scatterplot showning
# temperature on the x-axis and rainfall on the y-axis.
# Construct a new plot (q) that draws a line that plots
# temperature as a function of date
p <- ggplot(beaches, aes(temperature, rainfall)) + geom_point()
print(p)


# Solution 1
q <- ggplot(beaches, aes(date, temperature)) + geom_line()
print(q)


# Exercise 2: Add a title to the plot

# Solution 2:
r <- ggplot(beaches, aes(date, temperature)) +
  geom_line() +
  labs(title = "Sydney Temperature by Date, 2013-2018")
print(r)

