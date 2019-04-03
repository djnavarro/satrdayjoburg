library(tidyverse)
library(here)
library(sf)

beaches_all <- read_csv(here("data","sydneybeaches2.csv"))
sydney_map <- read_sf(here("data","sydney.shp"))

map1 <- ggplot(data = sydney_map) +
  geom_sf(
    mapping = aes(
      geometry = geometry,
      fill = ar_2016
    ),
    colour = "white",
    show.legend = FALSE
  )

map2 <- ggplot(
  data = beaches_all,
  mapping = aes(
    x = lat,
    y = long,
    colour  = enterococci)
) + geom_jitter() +
  coord_equal(ratio = 1)

