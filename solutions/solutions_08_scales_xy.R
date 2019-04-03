library(tidyverse)
library(here)
beaches <- read_csv(here("data","sydneybeaches3.csv"))

# Start with this plot
a <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = enterococci,
    colour = season_name,
    group = 1
    )
  ) +
  geom_line()


# Let's modify the y-axis scale. One way we could
# to it is like this:
a1 <- a +
  ylab("Enterococci (cfu/100ml)") +
  ylim(.1, 1000)

# Notice though that this is identical. The ylab
# and ylim functions are just convenient wrappers
# that modify a scale. When you have to do lots of
# things to a scale it's often easier to use the
# scale_y_continuous function.

# Exercise 1:
#
# Reproduce the plot (a1) using scale_y_continuous
# rather than ylab and ylim

#### YOUR-CODE-HERE ####

# Solution 1

a2 <- a +
  scale_y_continuous(
    name = "Enterococci (cfu/100ml)",
    limits = c(.1, 1000)
  )


# That looks a bit hard to read. There are several
# built-in options that you can specify with a
# character vector (see function docs for a listing)

# Exercise 2: use a "log10" transformation on the
# y-axis scale.

#### YOUR-CODE-HERE ####

# Solution 2:

a3 <- a +
  scale_y_continuous(
    name = "Enterococci (cfu/100ml)",
    limits = c(.1, 1000),
    trans = "log10"
  )

# The scales package includes a variety of functions that
# you can use to specify a transformation. I won't cover
# those here.

# We can also change where the tick marks appear. Take a
# look at what this code does:
a4 <- a +
  scale_y_continuous(
    name = "Enterococci (cfu/100ml)",
    trans = "log10",
    breaks = c(1, 10, 100),
    limits = c(.1, 1000)
  )

# Again, the scales package can be your friend here.
# It has tools for formatting the labels (e.g.,
# using commas, dollar signs, avoiding scientific
# notation etc). I won't cover that here though.


# For the next exercise, we start with this plot
b <- ggplot(
  data = beaches,
  mapping = aes(
    x = season_name,
    y = enterococci)
  ) +
  geom_violin()

# Next we transform the y-axis scale:
c <- b +
  scale_y_continuous(
    name = "Enterococci (cfu/100ml)",
    trans = "log10",
    breaks = c(1, 10, 100),
    limits = c(.1, 1000)
  )


# Exercise 3: Compare the violin plots in b and c



# Bonus:
#
# The x-axis in plot c is a discrete scale. We
# can modify the labels it uses manually, though
# that's not amazingly helpful here
c1 <- c +
  scale_x_discrete(
    name = "Season",
    labels = c(
      "Summer" = "Su",
      "Autumn" = "Au",
      "Winter" = "Wi",
      "Spring" = "Sp"
    )
  )

# A better example is this. First here's
# the base plot
d <- ggplot(
  data = beaches,
  mapping = aes(
    x = reorder(month_name, month),
    y = enterococci)
  ) +
  geom_violin() +
  scale_y_continuous(
    name = "Enterococci (cfu/100ml)",
    trans = "log10",
    breaks = c(1, 10, 100),
    limits = c(.1, 1000)
  )

# Depending on how much room you have, you
# might want to shorten the month names. To do that
# we specify a labeller function that takes the original
# label as input and returns the new label:
d1 <- d +
  scale_x_discrete(
    name = "Month",
    labels = abbreviate)

# If you don't like base::abbreviate, you can always
# write your own :-)
threeletter <- function(string) {
  stringr::str_trunc(string, width = 3, ellipsis = "")
}

d2 <- d +
  scale_x_discrete(
    name = "Month",
    labels = threeletter)
