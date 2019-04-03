library(tidyverse)
library(here)
library(scico)
beaches <- read_csv(here("data","sydneybeaches3.csv"))

a <- ggplot(
  data = beaches,
  mapping = aes(
    x = reorder(month_name, month),
    y = enterococci,
    fill = month
    )
) +
  geom_violin() +
  scale_y_continuous(
    name = "Enterococci (cfu/100ml)",
    trans = "log10",
    breaks = c(1, 10, 100),
    limits = c(.1, 1000)
  )

a +
  scale_fill_continuous(
    name = "Month",
    type = "scico"
  )


