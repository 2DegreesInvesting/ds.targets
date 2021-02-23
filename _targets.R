library(targets)

source(file.path("R", "read.R"))
source(file.path("R", "clean.R"))

tar_option_set(
  # envir = getNamespace("ds.targets")
  packages = "tidyverse"
)

list(
  tar_target(path, "data/raw_data.csv", format = "file"),
  tar_target(raw, command = read(path)),
  tar_target(data, clean(raw))
)
