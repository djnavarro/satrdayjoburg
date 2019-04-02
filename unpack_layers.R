library(tidyverse)
library(here)

beaches <- read_csv(here("data","sydneybeaches2.csv"))

a <- ggplot(beaches, aes(temp_airport)) +
  geom_histogram()

b <- ggplot() +
  layer(
    data = beaches,
    mapping = aes(x = temp_airport),
    geom = "bar",
    stat = "bin",
    position = "stack"
  ) +
  scale_x_continuous() +
  scale_y_continuous() +
  theme_grey()
