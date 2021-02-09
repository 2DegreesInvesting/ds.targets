library(tidyverse)

path_in <- here::here("objects", "dataset.csv")
dataset <- read_csv(path_in, col_types = cols())

hist <- ggplot(dataset) +
  geom_histogram(aes(x = Ozone)) +
  theme_gray(24)

path_out <- here::here("objects", "hist.png")
ggsave(path_out, hist)
