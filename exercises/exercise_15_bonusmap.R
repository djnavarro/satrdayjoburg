library(tidyverse)
library(here)
library(sf)
library(gganimate)

# ggplot2 and gganimate can both handle geospaial data. I haven't
# talked much about this kind of data because it's not something
# I know very well, but we do have some data sets bundled with the
# workshop that are fit for this purpose, so have a quick look

# first, use the "sf" package ("simple features") to load in data
# pertaining to different regions within Sydney:
sydney_map <- read_sf(here("data","sydney.shp"))
sydney_map$id <- 1:dim(sydney_map)[1]

# Let's create a map. The geom_sf function makes
# this relatively painless as long as our data are
# in the right format. It relies on a custom
# aesthetic called "geometry", which specifies all
# the information relevant to the spatial layour
map <- ggplot(data = sydney_map) +
  geom_sf(
    mapping = aes(
      geometry = geometry, # use Sydney boundaries
      fill = ar_2016       # fill colour proportional to area
    ),
    colour = "white",      # white borders between regions
    show.legend = FALSE    # no legend
  )

# try printing this map

# next, gganimate knows how to do (some) transitions for
# data plotted with geom_sf. So let's do a simple one that
# adds the regions one at a time, and leaves behind a faded
# trail of regions that have already been shown:
anim <- map +
  transition_states(id) +
  shadow_mark(alpha = .5)

# try printing this animation

# print(anim, type = "cairo")
# anim_save(here::here("output","sydney_reveal.gif"))

