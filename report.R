library(here)

# Data

# * Get raw data.
# * Tidy.
# * Save.

source(here("R", "01-data.R"))
dataset

# Model

# * Get clean data (saved).
# * Fit a model.
# * Save.

source(here("R", "02-model.R"))
fit

# Plot

# * Get model (saved).
# * Plot.
# * Save.

source(here("R", "03-plot.R"))
hist
