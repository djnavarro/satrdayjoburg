library(tidyverse)
library(here)
beaches <- read_csv(here("data","sydneybeaches3.csv"))


# Here is the plot from the slides. Notice that
# I have assigned the output to a variable p

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

# Exercise 1. What happens when you print(p) or
# plot(p)? How is that different to summary(p)

# Exercise 2. Create a line plot that depicts
# temperature over time

# Solution 2.

q <- ggplot(beaches, aes(date, temperature)) +
  geom_line()


# Exercise 3. Here is a plot that draws the
# temperature over time, changing colour over time.
# What happens if you try to change the colour
# aesthetic to "season_name"? Is this different to
# what happens when you use "season"?

r <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature,
    colour = temperature)
  ) +
  geom_line()

# Solution 3: when a geom uses multiple data points
# to construct the visual object, it tries to guess
# which data points belong to the same "group" by
# assuming that every combination of discrete variables
# is a a different group.

r1 <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature,
    colour = season_name)
) +
geom_line()

r2 <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature,
    colour = season)
) +
geom_line()


# Exercise 4: Now suppose I want to use season_name for
# the colour aesthetic, but want every discinct month
# (e.g. Jan 2013, Feb 2013, etc) to be a "group" that
# is drawn as its own line. How do I do this?

# Solution 4:

r <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature,
    colour = season_name,
    group = month_num)
  ) +
  geom_line()

# Exercise 5: Suppose I decide that
# I only want one line with discrete
# colours based on "season_name". What
# should I map to the "group" aesthetic
# to fix this? Hint: mapped aesthetics
# can be constants.

s <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature,
    colour = season_name,
    group = 1)
) +
  geom_line()


# Exercise 6: Look at the legend for
# the colour aesthetic. It organises the
# seasons alphabetically. It would make
# more sense to order them chronologically,
# starting with the first season of the year
# (i.e., summer). Use the "reorder"
# function to order the "season_name"
# categories using the "season_num" variable.
# You do not need to alter the data set, you
# can do thi when mapping the "colour"
# aesthetic

# Solution 6:

t <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature,
    colour = reorder(season_name, season),
    group = 1)
  ) +
  geom_line()

# Exercise 7: Note that the legend label is
# now very ugly. This can be fixed using the
# labs() function. Look at the original plot
# (p) at the top of the script. Notice that
# the "x" and "y" axis labels correspond to
# two of the aesthetics in our plot. The
# legend also corresponds to an aesthetic,
# "colour". What do you need to do to fix
# the legend?

# Solution 7:

u <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature,
    colour = reorder(season_name, season),
    group = 1)
  ) +
  geom_line() +
  labs(
    x = "Date",
    y = "Temperature",
    colour = "Season"
  )

