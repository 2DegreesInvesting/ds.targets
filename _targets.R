library(targets)

source(file.path("R", "functions.R"))

tar_option_set(packages = "tidyverse")

list(
  tar_target(path, "data/raw_data.csv", format = "file"),
  tar_target(raw, command = read(path)),
  tar_target(data, clean(raw))
)
