library(tidyverse)

path_in <- here::here("data", "raw_data.csv")
raw_data <- read_csv(path_in, col_types = cols())

dataset <- raw_data %>%
  mutate(Ozone = replace_na(Ozone, mean(Ozone, na.rm = TRUE)))

path_out <- here::here("objects", "dataset.csv")
write_csv(dataset, path_out)
