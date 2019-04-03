# Make sure we have the relevant packages loaded
# and the beaches data imported
library(tidyverse)
library(here)
beaches <- read_csv(here::here("data","sydneybeaches3.csv"))

# Exercise 1: This is a stripped down version of the plot
# we've used in the slides (p). It is a scatterplot showning
# temperature on the x-axis and rainfall on the y-axis. First,
# run this section of code and see what happens:

p <- ggplot(beaches, aes(temperature, rainfall)) + geom_point()
print(p)

# Now construct a new plot (q) that draws a line ploting the
# temperature as a function of date

#### YOUR-CODE-HERE ####

# Solution 1:
q <- ggplot(beaches, aes(date, temperature)) + geom_line()
print(q)


# Exercise 2: Next we need to add a title. Create a new plot
# (r) that uses the labs() function to add an informative
# title to the plot

#### YOUR-CODE-HERE ####

# Solution 2:
r <- ggplot(beaches, aes(date, temperature)) +
  geom_line() +
  labs(title = "Sydney Temperature by Date, 2013-2018")
print(r)


# That's it! This one is short!
