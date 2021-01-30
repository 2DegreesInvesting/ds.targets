# Analyze a dataset: Clean it and summarize and plot the mean values of numeric
# variebles, optionally by groups.

# Setup -------------------------------------------------------------------

r_path <- function(...) here::here(...)
source(r_path("01_packages.R"))
source(r_path("02_functions.R"))

# Parameters --------------------------------------------------------------

dataset <- github_url("mtcars.tsv", from = "2DegreesInvesting/ds-targets-data")
groups <- c("cyl", "carb")
axes <- c("hp", "mpg")
facets <- "cyl"

# Data --------------------------------------------------------------------

(raw <- vroom(dataset, col_types = cols()))

# Analysis ----------------------------------------------------------------

(prep <- raw %>% prepare())

(means <- prep %>% mean_of_numerics(groups))

means %>% plot_xy(axes, by = facets)
