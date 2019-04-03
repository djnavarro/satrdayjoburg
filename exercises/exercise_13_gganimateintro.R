library(tidyverse)
library(here)
library(gganimate)

bridges <- read_csv(here("data","brownian_bridges.csv"))

# show paths
a <- ggplot(
  data = bridges,
  mapping = aes(
    x = Horizontal,
    y = Vertical,
    colour = factor(Series))
) + geom_line(colour = "black") +
  geom_point(
    show.legend = FALSE,
    size = 2) +
  coord_equal() +
  facet_wrap(~Series) +
  xlim(-1.5, 1) +
  ylim(-1.25, 1.25)



# suppose we wanted instead to plot the global state, facetted
# a function of Time. We'd set up something like this...
b <- ggplot(
  data = bridges,
  mapping = aes(
    x = Horizontal,
    y = Vertical,
    colour = factor(Series))
) +
  geom_point(
    show.legend = FALSE,
    size = 4) +
  coord_equal() +
  xlim(-1.5, 1) +
  ylim(-1.25, 1.25)

# and then the add the facets like this...
b + facet_wrap(~Time)


# so how do we animate? gganimate allows you to do this
# surprisingly easily using transition_ functions. In
# our scenario above we want to treat the 20 facets
# in time as "frames" in an animation that smoothly
# interpolates between them:
c <- b + transition_time(time = Time)

# what class is this new object?
class(c)

# Printing c will render the animation. Try it and
# see what happens

# After you've printe it, you can saving to file in
# a fashion that is similar to ggsave:
#
#    anim_save(here("output", "brownian1.gif"))


# there are a lot of nice things you can add to an
# animation. for instance, my personal favourite for
# having fun is shadow wake, which plots the recent
# history of each point
d <- c + shadow_wake(wake_length = .2)

# alternatively you can leave behind a shadow trail
e <- c + shadow_trail(max_frames = 3)

# or a shadow mark
f <- c + shadow_mark()

# you can get some remarkable effects
g <- c + shadow_wake(
  wake_length = .3,
  size = 15,
  colour = "white",
  falloff = "quintic-in",
  wrap = FALSE
)

# When you print g, try it using this command
#
#   print(g, detail = 5, type = "cairo")
#
# (Mac users: delete the type = "cairo" part, you don't need
# it. It's there to support antialiasing on Windows)

