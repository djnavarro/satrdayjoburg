# Make sure we have the relevant packages loaded
# and the beaches data imported
library(tidyverse)
library(here)
beaches <- read_csv(here("data","sydneybeaches3.csv"))


# This second exercise is a little more elaborate. Let's start
# by taking the plot I built in the slides. Unlike the last set
# of exercises, the code for our plot is now a little longer and
# takes more work to follow.

p <- ggplot(
  data = beaches,
  mapping = aes(
    x = temperature,
    y = rainfall)) +
  geom_point(
    mapping = aes(colour = season_name),
    size = 2,
    show.legend = FALSE) +
  geom_rug() +
  facet_wrap(vars(season_name)) +
  theme_bw() +
  labs(
    title = "Sydney weather by season",
    subtitle = "Data from 2013 to 2018",
    x = "Temperature (Celsius)",
    y = "Rainfall (mm)"
  )

# Exercise 1. Notice that in these scripts I've been assigning
# the results to a variable (e.g., p). What happens when you
# print(p) or plot(p)? How is that different to summary(p)

# Exercise 2. Earlier on you created this a line plot that depicts
# temperature over time:

q <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature)
  ) +
  geom_line()

# Change this plot so that the colour aesthetic is *also* mapped
# onto the temperature variable (i.e., add another line to the
# mapping). What happens?

#### YOUR CODE HERE ####







# Exercise 3. Now try changing which variable is mapped onto
# the colour aesthetic. Try mapping it to "season_name" and
# then to "season". Do they give the same results?

#### YOUR-CODE-HERE ####





# Exercise 4: Now suppose I want to use season_name for
# the colour aesthetic, but want every distinct month
# (e.g. Jan 2013, Feb 2013, etc) to be a "group" that
# is drawn as its own line. How do I do this?


#### YOUR-CODE-HERE ####



# Exercise 5: Suppose I decide that
# I only want one line with discrete
# colours based on "season_name". What
# should I map to the "group" aesthetic
# to fix this? Hint: mapped aesthetics
# can be constants.

#### YOUR-CODE-HERE ####



# Exercise 6: Look at the legend for
# the colour aesthetic. It organises the
# seasons alphabetically. It would make
# more sense to order them chronologically,
# starting with the first season of the year
# (i.e., summer). Use the "reorder"
# function to order the "season_name"
# categories using the "season_num" variable.
# You do not need to alter the data set, you
# can do this when mapping the "colour"
# aesthetic

#### YOUR-CODE-HERE ####



# Exercise 7: Note that the legend label is
# now very ugly. This can be fixed using the
# labs() function. Look at the original plot
# (p) at the top of the script. Notice that
# the "x" and "y" axis labels correspond to
# two of the aesthetics in our plot. The
# legend also corresponds to an aesthetic,
# "colour". What do you need to do to fix
# the legend?

#### YOUR-CODE-HERE ####

