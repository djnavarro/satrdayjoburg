library(tidyverse)
library(here)
library(hexbin)
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

#### YOUR-CODE-HERE ####

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

#### YOUR-CODE-HERE ####

# Solution 5:
a5 <- a +
  geom_line(linetype = "dashed", size = 1) +
  geom_point(colour = "red", size = 5)


# Exercise 6: This time I've set up the mappings
# for a slightly differnt plot
b <- ggplot(
  data = beaches,
  mapping = aes(
    x = day_num,
    y = temperature,
    group = year,
    colour = year
  )
)

# Now look at what this code produces. Is this plot a good
# easy to read? If not, what steps might you consider taking.
# Try some out!
b1 <- b +
  geom_point(size = 2) +
  geom_smooth()

#### YOUR-CODE-HERE ####

# Solution 6:
#
# For me at least, it's hard to read. There are a few
# possibilities we might consider:
#
# Get rid of the ribbons that show the error bars?
b2 <- b +
  geom_smooth(se = FALSE) +
  geom_point(size = 2)

# We could take this one step further and collapse all
# the separate regressions into a single one. We can
# do that by changing the "group" aesthetic, for the
# geom_smooth() layer:

b3 <- b +
  geom_smooth(
    mapping = aes(group = 1),
    se = FALSE) +
  geom_point(size = 2)


# Exercise 7: The ggplot2 package comes with a very wide
# variety of different geoms we can use. For instance, when
# the x and y aesthetics are both continuous, we have some
# options for how to count the density of points at each
# location. Here is the basic structure:

# Here is another one:
c <- ggplot(
  data = beaches,
  mapping = aes(
    x = day_num,
    y = temperature
  )
)

# Now try both of these out:
c1 <- c + geom_bin2d()
c2 <- c + geom_hex()

# Which do you prefer? Are there things we could do better
# with these plots?


# Exercise 8. Now let's consider the situation where the
# x-aesthetic is discrete:
d <- ggplot(
  data = beaches,
  mapping = aes(
    x = reorder(month_name, month),
    y = temperature)
  ) +
  xlab("Month")

# Compare these two plots to each other. Which do you
# like better?
d1 <- d + geom_boxplot()
d2 <- d + geom_violin()

# Exercise 9: Alter the code for the violin plot example, so
# that the violin plots also have a fill aesthetic that is
# mapped onto season_name

#### YOUR-CODE-HERE

# Solution 9:

d3 <- d + geom_violin(aes(fill = season_name))



# Exercise 10: Sometims it is useful add the raw data to a
# plot in addition to showing a distribution summary. The
# code below attempts to do this. Why doesn't it work very
# well?
d4 <- d +
  geom_violin() +
  geom_point()

# Exercise 11: Use geom_jitter() instead of geom_point()
# and see if that works better

#### YOUR-CODE-HERE ####

# Solution 11:

d5 <- d +
  geom_violin() +
  geom_jitter()



# Hopefully this illustrates some of the variety of
# geoms that are available in the ggplot2 package!



