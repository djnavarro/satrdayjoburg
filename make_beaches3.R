library(tidyverse)
library(here)
long_beaches <- read_csv(here("data","sydneybeaches2.csv"))

beaches <- long_beaches %>%
  group_by(date, year, month, day, season) %>%
  summarise(
    rainfall = mean(rain_mm),
    temperature = mean(temp_airport),
    enterococci = mean(beachbugs)
  ) %>% ungroup()

beaches <- beaches %>%
  mutate(
    month_num = month + (year - 2013)*12,
    month_name = month.name[month],
    season_name = season,
    season = case_when(
      month %in% c(12,1,2) ~ 1,
      month %in% 3:5 ~ 2,
      month %in% 6:8 ~ 3,
      month %in% 9:11 ~ 4)
  )

beaches %>% write_csv(here("data","sydneybeaches3.csv"))

