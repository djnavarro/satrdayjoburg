library(tidyverse)
library(e1071)

ntimes <- 20  # how many time points to run the bridge?
nseries <- 8 # how many time series to generate?

# function to generate the brownian bridges
make_bridges <- function(ntimes, nseries) {
  replicate(nseries, c(0,rbridge(frequency = ntimes-1))) %>% as.vector()
}

# construct tibble
tbl <- tibble(
  Time = rep(1:ntimes, nseries),
  Horizontal = make_bridges(ntimes, nseries),
  Vertical = make_bridges(ntimes, nseries),
  Series = gl(nseries, ntimes)
)

# write it
tbl %>% write_csv(here::here("data","brownian_bridges.csv"))
