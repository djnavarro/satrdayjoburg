
library(tidyverse)
library(here)
beaches <- read_csv(here::here("data","sydneybeaches3.csv"))


# STILL NEED TO WRITE THIS

d <- ggplot(
  data = beaches,
  mapping = aes(
    x = reorder(month_name, month),
    y = temperature)
) +
  xlab("Month")


# add the means to the plot: [they're not ready for this???]
d5 <- d +
  geom_violin() +
  geom_point(stat = "summary")
