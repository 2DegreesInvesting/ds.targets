library(targets)
library(here)
tar_option_set(packages = c(
  "readr",
  "dplyr",
  "ggplot2"
))

source(here("R", "functions.R"))

list(
  tar_target(path, here("data", "mtcars.csv"), format = "file"),
  tar_target(dataset, read_csv(path)),
  tar_target(prepared, prepare_data(dataset)),
  tar_target(summarized, summarize_data(prepared)),
  tar_target(plot, plot_data(summarized)),
  tarchetypes::tar_render(report, "report-targets.Rmd")
)
