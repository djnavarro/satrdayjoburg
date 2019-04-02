library(tidyverse)
library(here)
beaches <- read_csv(here::here("data","sydneybeaches3.csv"))

# Exercise 1: I have set up the mappings and labels
# for a plot similar to the ones from before
# WWhat does this plot (a) look like on its own?
a <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature)
  )

#  Exercise 2: What does this code do?
a1 <- a + geom_point()

# Exercise 3: Create new plots (a2 and a3)
# using geom_line and geom_step.

# Solution 3:
a2 <- a + geom_line()
a3 <- a + geom_step()

# Exercise 4: what does this code do? See what
# other parameters can you vary for point and
# line geoms.
a4 <- a +
  geom_point(colour = "red", size = 5) +
  geom_line(linetype = "dashed", size = 1)

# Exercise 5: what happens when you reverse
# the order in which the two geoms are added?

# Solution 5:
a5 <- a +
  geom_line(linetype = "dashed", size = 1) +
  geom_point(colour = "red", size = 5)


# Here is another one:
b <- ggplot(
  data = beaches,
  mapping = aes(
    x = day_num,
    y = temperature,
    group = year,
    colour = year
  )
)

# have a look at this
b1 <- b +
  geom_point(size = 2) +
  geom_smooth()

# it's hard to read
#  - remove the ribbons?
#  - reorder the two geoms

b2 <- b +
  geom_smooth(se = FALSE) +
  geom_point(size = 2)

# override the grouping for
# geom_smooth but not geom_point

b3 <- b +
  geom_smooth(
    mapping = aes(group = 1),
    se = FALSE) +
  geom_point(size = 2)




# Here is another one:
c <- ggplot(
  data = beaches,
  mapping = aes(
    x = day_num,
    y = temperature
  )
)

c1 <- c + geom_bin2d()
# ompare to hexbin - but we need the package!!


# Here is another one:
d <- ggplot(
  data = beaches,
  mapping = aes(
    x = reorder(month_name, month),
    y = temperature
  )
) +
  xlab("Month")

d1 <- d + geom_boxplot()
d2 <- d + geom_violin()

# fill the violins by season?
d3 <- d + geom_violin(aes(fill = season_name))

# add the raw data...
d4 <- d +
  geom_violin() +
  geom_point()

# ... exercise: use geom_jitter here.

# add the means to the plot: [they're not ready for this???]
d5 <- d +
  geom_violin() +
  geom_point(stat = "summary")





