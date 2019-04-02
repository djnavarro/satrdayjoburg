library(tidyverse)
library(here)
beaches <- read_csv(here("data","sydneybeaches3.csv"))


# This is the example from the slides. The first version (a)
# is condensed, and uses convenient functions. The second is
# an "expanded" version (b) that shows what ggplot2 is doing

a <- ggplot(beaches, aes(temperature)) +
  geom_histogram(binwidth = 1, fill = "purple") +
  labs(x = "Temperature", y = "Days")

b <- ggplot() +
  layer(
    data = beaches,
    mapping = aes(x = temperature),
    geom = "bar",
    stat = "bin",
    position = "stack",
    params = list(
      fill = "purple",
      binwidth = 1
    )
  ) +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Days") +
  theme_grey() +
  facet_null() +
  coord_cartesian()

# Exercise 1a: Here is another condensed plot (c). Construct
# the "expanded" version (d) for this plot. Hint: it may be
# usefil to type "c$layers".

# Exercise 1b: Why is it useful to specify data and mappings
# globally in the the ggplot() function?

c <- ggplot(beaches, aes(temperature, rainfall)) +
  geom_point(size = 3) +
  geom_rug(aes(colour = season_name)) +
  labs(x = "Temperature", y = "Rainfall")


# Solution 1a:

d <- ggplot() +
  layer(
    data = beaches,
    mapping = aes(
      x = temperature,
      y = rainfall),
    geom = "point",
    stat = "identity",
    position = "identity",
    params = list(size = 3)
  ) +
  layer(
    data = beaches,
    mapping = aes(
      x = temperature,
      y = rainfall,
      colour = season_name),
    geom = "rug",
    stat = "identity",
    position = "identity"
  ) +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Rainfall") +
  theme_grey() +
  facet_null() +
  coord_cartesian()

# Solution 1b: The beaches data are used in both layers,
# as are the x and y aesthetics. The expanded version is
# very long.



