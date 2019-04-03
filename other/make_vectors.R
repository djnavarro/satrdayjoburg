library(tidyverse)

# create a silly vector field
field <- tibble(
  xval = seq(-pi, pi-pi/16, pi/16),
  yval = seq(0, pi-pi/32, pi/32)
) %>%
  expand(xval, yval) %>%
  mutate(
    dir = sin(xval)*180/pi,
    len = abs(sin(yval)),
    cosx = cos(xval)
  )

field %>% write_csv(here::here("data","vector_field.csv"))
