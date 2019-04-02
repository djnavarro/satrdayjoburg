library(tidyverse)
library(here)
beaches <- read_csv(here("data","sydneybeaches3.csv"))

# Exercise 1: I have set up the mappings and labels
# for a plot similar to the ones from before
#
a <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = enterococci,
    colour = season_name,
    group = 1)
  ) +
  scale_y_continuous(
    limits = c(0,1000),
    trans = "sqrt")


a1 <- a + geom_point()
a2 <- a + geom_line()
a3 <- a + geom_step()

