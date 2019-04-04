library(tidyverse)
library(here)
beaches <- read_csv(here("data","sydneybeaches3.csv"))
vectors <- read_csv(here("data","vector_field.csv"))

# ggplot2 is designed to be extensible, so that
# you can write your own geoms, etc. This section
# discusses it briefly and provides the code from
# the slides, but there aren't any specific exercises
# The main goal here is to understand the basics of
# how ggplot2 can be extended

################# part 1 ################

# A very simple example. First here's
# the basic set up for a plot showing
# temperature against enterococci on a
# logarithmic scale
a <- ggplot(
  data = beaches,
  mapping = aes(
    x = temperature,
    y = enterococci)
) +
  scale_y_continuous(
    name = "Enterococci (cfu/100ml)",
    trans = "log10",
    breaks = c(1, 10, 100),
    limits = c(.1, 1000)
  ) +
  facet_wrap(vars(season_name))


# plot each data point
b <- a +
  geom_point(alpha = .2, colour = "purple") +
  geom_density2d(bins = 4, colour = "purple")


# define a function that creates both layers
geom_pointdensity2d <- function(pointalpha = .2, contourbins = 4, ...){
  layer1 <- geom_point(alpha = pointalpha, ...)
  layer2 <- geom_density2d(bins = contourbins, ...)
  return(list(layer1, layer2))
}

# and here we go...
c <- a + geom_pointdensity2d(colour = "purple")

# now, this isn't really a "true" geom because
# it's adding two layers - it's just a convenient
# shorthand.
print(c$layers)

# nevertheless, it's still super handy



################# part 2 ################

# so how would we do the real thing? suppose we wanted a geom that draws
# arrows:

my_arrow <- function(data, panel_params, coord) {
  coords <- coord$transform(data, panel_params)
  trans <- function(coords, fun) {
    coords$length * coords$size * fun(2 * pi * coords$direction / 360)
  }

  grid::polylineGrob(
    x = c(coords$x, coords$x + trans(coords, cos)),
    y = c(coords$y, coords$y + trans(coords, sin)),
    id = c(1:length(coords$x), 1:length(coords$x)),
    arrow = arrow(
      angle = 30,
      length = unit(coords$size * coords$length/2, "native")),
    default.units = "native",
    gp = grid::gpar(col = coords$colour, lwd = coords$linewidth)
  )
}

GeomVector <- ggproto(
  "GeomVector", Geom,
  required_aes = c("x", "y", "direction", "length"),
  default_aes = aes(
    colour = "black", fill = NA, size = .025,
    linetype = 1, alpha = 1, linewidth = 1
  ),
  draw_key = draw_key_point,
  draw_panel = my_arrow
)


geom_vector <- function(
  mapping = NULL, data = NULL,
  stat = "identity",
  position = "identity",
  na.rm = FALSE,
  show.legend = NA,
  inherit.aes = TRUE,
  ...) {

  ggplot2::layer(
    geom = GeomVector,
    mapping = mapping,
    data = data,
    stat = stat,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(na.rm = na.rm, ...)
  )
}



# plot a random subset of the vector field
v <- ggplot(
  data = vectors,
  mapping = aes(
    x = xval,
    y = yval,
    direction = dir,
    length = len,
    colour = cosx)
  ) +
  geom_vector()

print(v)

# notice that it automatically supplies the legend
# for the colour aesthetic, but does not do anything
# for direction and length. This was partly laziness
# on my part. Arguably the angle aesthetic does not
# need its own scale, because it's defined with
# respect to the same coordinate system in the rest
# of the plot, but the length aesthetic is more
# symbolic. But that's a bit beyond the scope (plus
# it's not my strength)


