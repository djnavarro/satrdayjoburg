
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
