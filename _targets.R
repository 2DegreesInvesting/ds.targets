library(targets)

source(file.path("R", "functions.R"))
source_all("R")
options(tidyverse.quiet = TRUE)

tar_option_set(packages = c(
  "tidyverse",
  "biglm",
  "here"
))

list(
  tar_target(raw_data_file, "data/raw_data.csv", format = "file"),
  tar_target(target_data, read_and_clean(raw_data_file)),
  tar_target(target_fit, fit_model(target_data)),
  tar_target(target_hist, create_plot(target_data))
)
