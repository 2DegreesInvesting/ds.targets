library(targets)

source(file.path("R", "functions.R"))
options(col_types = readr::cols())

# TODO
# * class
# * command

tar_option_set(
  packages = "tidyverse",

  # Declare the rules that mark a target as outdated.
  cue = tar_cue(
    # mode = "thorough",
    # command = TRUE,
    # depend = TRUE,
    format = TRUE,
    # iteration = TRUE,
    # file = TRUE
  ),
  format = "rds"
)

list(
  tar_target(path, "data/raw_data.csv", format = "file"),
  tar_target(raw, read(path)),
  tar_target(data, clean(raw))
)
