library(targets)

source(file.path("R", "read.R"))
source(file.path("R", "clean.R"))

tar_option_set(
  # packages = "tidyverse"
  envir = getNamespace("ds.targets")
)

list(
  tar_target(path, raw_path(), format = "file"),
  tar_target(raw, command = read(path)),
  tar_target(data, clean(raw))
)
