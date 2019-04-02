library(tidyverse)
library(here)
beaches <- read_csv(here("data","sydneybeaches3.csv"))

# Exercise 1: I have set up the mappings and labels
# for a plot similar to the ones from before
# WWhat does this plot (a) look like on its own?
a <- ggplot(
  data = beaches,
  mapping = aes(
    x = date,
    y = temperature)
  )

#  Exercise 2: What does this code do?
a1 <- a + geom_point()

# Exercise 3: Create new plots (a2 and a3)
# using geom_line and geom_step.

# Solution 3:
a2 <- a + geom_line()
a3 <- a + geom_step()

# Exercise 4: what does this code do? See what
# other parameters can you vary for point and
# line geoms.
a4 <- a +
  geom_point(colour = "red", size = 5) +
  geom_line(linetype = "dashed", size = 1)

# Exercise 5: what happens when you reverse
# the order in which the two geoms are added?

# Solution 5:
a5 <- a +
  geom_line(linetype = "dashed", size = 1) +
  geom_point(colour = "red", size = 5)








