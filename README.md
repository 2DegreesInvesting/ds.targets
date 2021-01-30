
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ds-targets

A series of meetups about data pipelines with the package
“[targets](https://docs.ropensci.org/targets/)”.

The anatomy of a poorly structured project:

    .
    ├── 01_packages.R
    ├── 02_functions.R
    ├── 03_analysis-iris.R
    ├── 03_analysis-mtcars.R
    ├── 03_analysis.Rmd
    ├── 03_analysis.md
    ├── 03_analysis_files
    │   └── figure-gfm
    │       └── unnamed-chunk-2-1.png
    ├── LICENSE.md
    ├── README.Rmd
    ├── README.md
    └── ds-targets.Rproj

Example of an analysis script:

    # Analyze a dataset: Clean it and summarize and plot the mean values of numeric
    # variebles, optionally by groups.

    # Setup -------------------------------------------------------------------

    r_path <- function(...) here::here(...)
    source(r_path("01_packages.R"))
    source(r_path("02_functions.R"))

    # Parameters --------------------------------------------------------------

    dataset <- "http://bit.ly/mtcars_tsv"
    groups <- c("cyl", "carb")
    axes <- c("hp", "mpg")
    facets <- "cyl"

    # Data --------------------------------------------------------------------

    (raw <- vroom(dataset, col_types = cols()))

    # Analysis ----------------------------------------------------------------

    (prep <- raw %>% prepare())

    (means <- prep %>% mean_of_numerics(groups))

    means %>% plot_xy(axes, by = facets)
