library(tidyverse)
library(here)
library(scico)
beaches <- read_csv(here("data","sydneybeaches3.csv"))

a <- ggplot(
  data = beaches,
  mapping = aes(
    x = reorder(month_name, month),
    y = enterococci,
    fill = month
  )
) +
  geom_violin() +
  scale_y_continuous(
    name = "Enterococci (cfu/100ml)",
    trans = "log10",
    breaks = c(1, 10, 100),
    limits = c(.1, 1000)
  )



# Exercise 1: The default "scale_fill_continuous"
# has a variety of palettes that you can specify.
# Set "type = viridis" and see what happens!

#### YOUR-CODE-HERE ####

# Solution 1:
a + scale_fill_continuous(
  name = "Month",
  type = "viridis"
)

# Notice that there are other ways to do the same thing:
a + scale_fill_viridis_c(
  name = "Month"
)

# There are lots of packages out there that produce palettes.
# scico is one of my favourites so I'll use that
a + scale_fill_scico(palette = "tokyo")



# Exercise 2: Have a look at the various scico palettes using
scico_palette_names()

# Adapt the code above to use one of the other paletts

#### YOUR-CODE-HERE

# Solution 2:
a + scale_fill_scico(palette = "lajolla")




# The previous example was set up to treat month as
# a continuous variable. I did this by linking the
# fill aesthetic to the numeric month variable. Now
# let's do the same thing with the month_name:


b <- ggplot(
  data = beaches,
  mapping = aes(
    x = reorder(month_name, month),
    y = enterococci,
    fill = reorder(month_name, month)
  )
) +
  geom_violin() +
  scale_x_discrete(name = "Month") +
  scale_y_continuous(
    name = "Enterococci (cfu/100ml)",
    trans = "log10",
    breaks = c(1, 10, 100),
    limits = c(.1, 1000)
  )



# Exercise 3: compare these two to each other
b + scale_fill_discrete(name = "Month")
b + scale_fill_scico_d(name = "tokyo")




