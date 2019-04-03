library(tidyverse)
library(here)
library(sf)
library(gganimate)

sydney_map <- read_sf(here("data","sydney.shp"))
sydney_map$id <- 1:dim(sydney_map)[1]

map <- ggplot(data = sydney_map) +
  geom_sf(
    mapping = aes(
      geometry = geometry,
      fill = ar_2016
    ),
    colour = "white",
    show.legend = FALSE
  )

anim <- map +
  transition_states(id) +
  shadow_mark(alpha = .5)

print(anim, type = "cairo")
anim_save(here::here("output","sydney_reveal.gif"))

