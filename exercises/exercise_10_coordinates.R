library(tidyverse)
library(here)

two_beaches <- read_csv(here("data","sydneybeaches2.csv")) %>%
  filter(site %in% c("Bondi Beach", "Malabar Beach")) %>%
  select(site, date, enterococci) %>%
  spread(key = site, value = enterococci) %>%
  janitor::clean_names()

# base plot
b <- ggplot(
  data = two_beaches,
  mapping = aes(bondi_beach, malabar_beach)
) +
  scale_x_continuous(trans = "log10") +
  scale_y_continuous(trans = "log10") +
  geom_point() +
  geom_abline(slope=1, intercept=0)

# same as the base plot
b + coord_cartesian()

# coordinates on the same scale
b + coord_equal()

# coordinates with the same limits
# but not the same scale
b + coord_cartesian(xlim = c(1,1000), ylim=c(1,1000))

# both
b + coord_equal(xlim = c(1,1000), ylim=c(1,1000))
