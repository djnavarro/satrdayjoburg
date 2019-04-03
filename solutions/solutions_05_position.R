library(tidyverse)
library(here)
beaches <- read_csv(here("data","sydneybeaches3.csv"))

# This code sets up the mappings for a plot that only uses the
# data for the summer and winter months.
f <- ggplot(
  data = beaches[beaches$season_name %in% c("Summer", "Winter"),],
  mapping = aes(
    x = temperature,
    fill = reorder(season_name, season))
  ) +
  labs(fill = "Season")

# Exercise 1. Verify that these are the same. When two bars
# occupy the same x co-ordinate, position_stack places one on
# top of the other.
f1 <- f + geom_histogram()
f2 <- f + geom_histogram(position = "stack")

# Exercise 2: position_identity keeps all objects in their
# position, and they get drawn on top of one another. This is
# rarely useful for bar charts and histograms. It works
# okay in this case because there are only two histograms
# and I've used transparency. See what this does:
f3 <- f + geom_histogram(position = "identity", alpha = .5)

# Exercise 3: position_dodge moves them a little bit to the
# side so that they slot next to each other. It works for
# bar charts better than for histograms. Adapt the code above
# to dodge the bars.

#### YOUR-CODE-HERE ####

# Solution 3:
f4 <- f + geom_histogram(position = "dodge")


# Exercise 4: the point geom default is position_identity.
# change this to use position_jitter; compare the
# result to what happens if you use geom_jitter
# instead of geom_point.

g <- ggplot(
  data = beaches,
  mapping = aes(x = season_name, y = temperature)
)
g1 <- g + geom_point()

#### YOUR-CODE-HERE

# Solution 4
g2 <- g + geom_point(position = "jitter")
g3 <- g + geom_jitter()


# Exercise 5: have a quick look at:
# - position_fill
# - position_nudge
#
# When might you use these?


