library(tidyverse)
library(here)
beaches <- read_csv(here("data","sydneybeaches3.csv"))


# As usual, let's set up a plot:
a <- ggplot(
  data = beaches,
  mapping = aes(
    x = reorder(month_name, month),
    y = enterococci)
) +
  geom_violin() +
  scale_y_continuous(
    name = "Enterococci (cfu/100ml)",
    trans = "log10",
    breaks = c(1, 10, 100),
    limits = c(.1, 1000)
  ) +
  scale_x_discrete(name = "Month") +
  ggtitle("Enterococci by Month")

# Exercise 1: take a look at the original plot, and
# then try each of the following themes:
a + theme_bw()
a + theme_minimal()
a + theme_void()
a + theme_dark()



# To tinker, recall we have four basic element types:
#  - element_line (e.g. axis lines, tick marks, grid lines, etc)
#  - element_text (e.g. axis text, titles, legend text etc)
#  - element_rect (e.g. background, legend boxes, facet strips etc)
#  - element_blank (anything we want to remove)

# Let's make the a variation of theme dark by sequentially modifying
# different elements from theme_grey(). First, make the panel
# background darker.
a + theme(
  panel.background = element_rect(fill = "grey40")
)

# Exercise 2: the plot.background is also a rectangle element and
# we need to make that darker. Set it to have a fill of "grey40".

#### YOUR-CODE-HERE ####

# Solution 2:
a + theme(
  panel.background = element_rect(fill = "grey40"),
  plot.background = element_rect(fill = "grey65")
)


# For the rest of this exercise, read along with the
# code and try to modify it (e.g., with different colours)
# just to see what happens...



# Those grid lines (within the panel) are too white now,
# so lets have them blend into the plot background:
b <- a + theme(
  panel.background = element_rect(fill = "grey40"),
  plot.background = element_rect(fill = "grey65"),
  panel.grid = element_line(colour = "grey65")
)

# The text is a little small. We can tinker with individual
# text elements (title labels etc, but we can set them all
# at once like this)
b + theme(
  text = element_text(size = 14, colour = "white")
)

# Notice which ones change and which don't. To modify the
# axis.text separately...
c <- b + theme(
  text = element_text(size = 14, colour = "white"),
  axis.text = element_text(size = 14, colour = "white")
)

# Now we have a problem: the x-axis text overlaps. Again
# these are text elemenets so...
c + theme(
  axis.text.x = element_text(angle = 30)
)

# Okay that's a start but now look at the text justification
# By default they're center justified, and we need to make it
# right justified:
d <- c + theme(
  axis.text.x = element_text(angle = 30, hjust = 1)
)

# Oh, and let's save this last plot!
ggsave(here::here("output","darkbugs.png"))
