library(biglm)
library(tidyverse)

path_in <- here::here("objects", "dataset.csv")
dataset <- read_csv(path_in, col_types = cols())

fit <- biglm(Ozone ~ Wind + Temp, dataset)

path_out <- here::here("objects", "fit.rds")
saveRDS(fit, path_out)
