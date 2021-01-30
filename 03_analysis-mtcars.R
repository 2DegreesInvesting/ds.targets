# Analyze a dataset: Clean it and summarize and plot the mean values of numeric
# variebles, optionally by groups.

# Setup -------------------------------------------------------------------

r_path <- function(...) here::here(...)
source(r_path("01_packages.R"))
source(r_path("02_functions.R"))

# Parameters --------------------------------------------------------------

dataset <- "http://bit.ly/mtcars_tsv"
group <- c("cyl", "carb")
x <- "hp"
y <- "mpg"
facets <- "cyl"

# Data --------------------------------------------------------------------

(raw <- vroom(dataset, col_types = cols()))

# Analysis ----------------------------------------------------------------

(prep <- raw %>% prepare())

(means <- prep %>% mean_of_numerics(group))

means %>% plot_xy(x, y, by = facets)
