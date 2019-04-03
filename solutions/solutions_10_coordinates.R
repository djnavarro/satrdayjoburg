library(tidyverse)
library(here)

# organise the data differently
two_beaches <- read_csv(here("data","sydneybeaches2.csv")) %>%
  filter(site %in% c("Bondi Beach", "Malabar Beach")) %>%
  select(site, date, enterococci) %>%
  spread(key = site, value = enterococci) %>%
  janitor::clean_names()

# This plot compares enterococci levels at two Sydney beaches,
# Bondi and Malabar. Notice that the x- and y-axes really should
# be on the same scale, but they aren't
b <- ggplot(
  data = two_beaches,
  mapping = aes(bondi_beach, malabar_beach)
) +
  scale_x_continuous(trans = "log10") +
  scale_y_continuous(trans = "log10") +
  geom_point() +
  geom_abline(slope=1, intercept=0)

# Exercise 1: Verify that this is identical to the original
# plot
b + coord_cartesian()

# Exercise 2: Put the two sets of coordinates on the same scale

#### YOUR-CODE-HERE ####

# Solution 2:

b + coord_equal()

# Exercise 3: Put the two sets of coordinates on the same scale
# and also make sure they have the same axis limits (from 1 to
# 1000 on both the x and y axes)


#### YOUR-CODE-HERE ####

# Solution 3:

b + coord_equal(xlim = c(1,1000), ylim=c(1,1000))
