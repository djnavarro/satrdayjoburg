library(tidyverse)
library(here)
beaches <- read_csv(here("data","sydneybeaches3.csv"))

# Exercise 1
f <- ggplot(
  data = beaches[beaches$season_name %in% c("Summer", "Winter"),],
  mapping = aes(
    x = temperature,
    fill = reorder(season_name, season))
  ) +
  labs(fill = "Season")

# Verify that these are the same. When two bars occupy
# the same x co-ordinate, position_stack places one on
# top of the other.
f1 <- f + geom_histogram()
f2 <- f + geom_histogram(position = "stack")

# position_identity means that they all stay in the same
# position and get drawn on top of one another. This is
# rarely useful for bar charts and histograms. It works
# okay in this case because there are only two histograms
# and I've used transparency
f3 <- f + geom_histogram(position = "identity", alpha = .5)

# position_dodge moves them a little bit to the left and
# right so that they slot next to each other. It works for
# bar charts better than for hisograms.
f4 <- f + geom_histogram(position = "dodge")

# other exercises.
g <- ggplot(
  data = beaches,
  mapping = aes(x = season_name, y = temperature)
)

# the point geom uses position_identity by default
# change this to use position_jitter; compare the
# result to what happens if you use geom_jitter
# instead of geom_point
g1 <- g + geom_point()

g2 <- g + geom_point(position = "jitter")
g3 <- g + geom_jitter()

# have a quick look at:
# - position_fill
# - position_nudge
#
# when might you use these?


