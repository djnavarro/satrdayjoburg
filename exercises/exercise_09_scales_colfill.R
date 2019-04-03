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

# the default "scale_fill_continuous" has a
# variety of palettes that you can specify with
# "type"
a + scale_fill_continuous(
  name = "Month",
  type = "viridis"
)

# but there are other ways to do the same thing:
a + scale_fill_viridis_c(
  name = "Month"
)

# lots of packages out there. scico is one of my
# favourites so I'll use that
a + scale_fill_scico(palette = "tokyo")


# previous version was set up to treat month as
# a continuous variable (which, yeah okay). I did
# this by linking the fill aesthetic to the numeric
# month variable. Now let's do the same thing with
# the month_name:


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

b + scale_fill_discrete(name = "Month")
b + scale_fill_scico_d(name = "tokyo")




