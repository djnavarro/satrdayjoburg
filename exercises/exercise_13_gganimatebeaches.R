library(tidyverse)
library(here)
library(gganimate)

beaches <- read_csv(here("data","sydneybeaches3.csv"))

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


b <- a +
  transition_time(date) +
  shadow_mark()
print(b)


c <- a + transition_reveal(date)
print(c)

# suppose we wanted to reveal the data one season
# at a time. we can do this, but we're going to
# need to be careful about what happens with the
# lines: this is a bit unhelpful!

d <- a + transition_reveal(season)
print(d)

# one possibility is to group it by month num:

e <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature,
    colour = season_name,
    group = month_num
  )
) + geom_path()

# that gives us this possibility
f <- e + transition_reveal(season, range = c(0,5))
print(f)

g <- e + transition_reveal(
  along = month_num,
  range = c(0, 71)
)
print(g)


# let's do the same thing with enterococci levels!

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

i <- h + transition_reveal(
  along = month_num,
  range = c(0, 71)
)

print(i, type = "cairo")
anim_save(here("output", "beachbugs.gif"))


