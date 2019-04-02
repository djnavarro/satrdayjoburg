
geom_dothistogram <- function(
  mapping = NULL, data = NULL, position = "stack",
  ..., binwidth = NULL, bins = NULL, na.rm = FALSE,
  show.legend = NA, inherit.aes = TRUE
){

  layer <- stat_bin(
    mapping = mapping, data = data,
    geom = "point", position = position,
    ..., binwidth = binwidth, bins = bins,
    na.rm = na.rm, show.legend = show.legend,
    inherit.aes = inherit.aes
  )

  return(layer)
}
