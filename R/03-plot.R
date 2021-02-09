library(tidyverse)

dataset <- read_csv("output/dataset.csv", col_types = cols())

hist <- ggplot(dataset) +
  geom_histogram(aes(x = Ozone)) +
  theme_gray(24)

output <- here::here("output/hist.png")
ggsave(output, hist)
