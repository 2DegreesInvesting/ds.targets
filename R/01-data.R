library(tidyverse)

input <- here::here("data", "raw_data.csv")
raw_data <- read_csv(input, col_types = cols())

dataset <- raw_data %>%
  mutate(Ozone = replace_na(Ozone, mean(Ozone, na.rm = TRUE)))

output <- here::here("objects", "dataset.csv")
write_csv(dataset, output)
