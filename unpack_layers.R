library(tidyverse)
library(here)

beaches <- read_csv(here("data","sydneybeaches2.csv"))

a <- ggplot(beaches, aes(temp_airport)) +
  geom_histogram(fill = "red") +
  labs(x = "Temperature")

b <- ggplot() +
  layer(
    data = beaches,
    mapping = aes(x = temp_airport),
    geom = "bar",
    stat = "bin",
    position = "stack",
    params = list(fill = "red")
  ) +
  scale_x_continuous(name = "Temperature") +
  scale_y_continuous(name = "Count") +
  theme_grey() +
  facet_null() +
  coord_cartesian()

