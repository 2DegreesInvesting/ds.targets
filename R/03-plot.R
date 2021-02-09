library(tidyverse)

input <- here::here("objects", "dataset.csv")
dataset <- read_csv(input, col_types = cols())

hist <- ggplot(dataset) +
  geom_histogram(aes(x = Ozone)) +
  theme_gray(24)

output <- here::here("objects", "hist.png")
ggsave(output, hist)
