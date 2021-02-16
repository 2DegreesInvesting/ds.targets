library(targets)

source(file.path("R", "functions.R"))

# Not clean to me
# * class
# * iteration
# * file

tar_option_set(
  packages = "tidyverse",

  # Declare the rules that mark a target as outdated.
  cue = tar_cue(
    # mode = "thorough",
    # command = TRUE,
    # depend = TRUE,
    # format = TRUE
  ),
  format = "rds"
)

list(
  tar_target(path, "data/raw_data.csv", format = "file"),
  tar_target(raw, read(path)),
  tar_target(data, clean(raw), cue = tar_cue(depend = TRUE))
)
