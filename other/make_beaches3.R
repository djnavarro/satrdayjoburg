library(tidyverse)
library(lubridate)
long_beaches <- read_csv(here::here("data","sydneybeaches2.csv"))

beaches <- long_beaches %>%
  group_by(date, year, month, day, season) %>%
  summarise(
    rainfall = mean(rain_mm),
    temperature = mean(temp_airport),
    enterococci = mean(beachbugs)
  ) %>% ungroup()

day_of_year <- function(date, year) {
  1+ as.numeric(date -lubridate::dmy(paste("1 1",year)))
}

beaches <- beaches %>%
  mutate(
    day_num = day_of_year(date, year),
    month_num = month + (year - 2013)*12,
    month_name = month.name[month],
    season_name = season,
    season = case_when(
      month %in% c(12,1,2) ~ 1,
      month %in% 3:5 ~ 2,
      month %in% 6:8 ~ 3,
      month %in% 9:11 ~ 4)
  )

beaches %>% write_csv(here::here("data","sydneybeaches3.csv"))

