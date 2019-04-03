library(tidyverse)
library(here)
library(gganimate)

beaches <- read_csv(here("data","sydneybeaches3.csv"))


# Here is a plot that we're quite familiar with by now!
a <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature,
    colour = season_name,
    group = 1
  )
) +
geom_path() +
geom_point()


# As we saw before, we can animate this with the
# transition_time() function. Try running the
# following code (and remember to print it).
b <- a +
  transition_time(date) +
  shadow_mark()

# What happens if you remove the shadow_mark?


# The gganimate package allows you to design other
# kinds of transitions. We won't talk about all of
# them in detail, but... transition_reveal() introduces
# the values of one variable. For example:
c <- a + transition_reveal(date)


# Suppose we wanted to reveal the data one season
# at a time. we can do this, but we're going to
# need to be careful about what happens with the
# lines. Try to use "season" rather than "date"
# and see what happens

#### YOUR-CODE-HERE ####

# Solution:
d <- a + transition_reveal(season)


# An alternative one possibility is to group the
# data using the month_num variable:

e <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature,
    colour = season_name,
    group = month_num
  )
) + geom_path()

# As usual, take a quick look at the plot e, before
# trying to create the animation. First let's reveal
# the data one "season" at a time.
f <- e + transition_reveal(
  along = season,
  range = c(0,5)
)

# In this code, I've expanded the range from 0 to 5
# rather than 1 to 4 so that there's pause before the
# data start appearing, and it lingers on the final
# season before moving back to the beginning.

# Exercise: create an animation that reveals along
# the "month_num" variable (hint, the range you need
# is 0 to 71).

#### YOUR-CODE-HERE ####

# Solution:
g <- e + transition_reveal(
  along = month_num,
  range = c(0, 71)
)


# Just for fun let's one more with enterococci levels!

h <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = enterococci,
    colour = reorder(season_name, season),
    group = month_num
  )
) +
  geom_path() +
  scale_y_continuous(
    name = "Enterococci (cfu/100ml)",
    trans = "log10",
    breaks = c(1, 10, 100),
    limits = c(.1, 1000)
  ) +
  scale_color_discrete(name = "Season") +
  labs(
    x = "Date",
    title = "Enterococci levels over time at Sydney beaches",
    subtitle = "Data 2013-2018"
  )

# Again, take a look at the plot h, and then try out
# the animation h below:

i <- h + transition_reveal(
  along = month_num,
  range = c(0, 71)
)

# print(i, type = "cairo")
# anim_save(here("output", "beachbugs.gif"))


