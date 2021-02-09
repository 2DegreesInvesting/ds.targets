library(biglm)
library(tidyverse)

input <- here::here("objects", "dataset.csv")
dataset <- read_csv(input, col_types = cols())

fit <- biglm(Ozone ~ Wind + Temp, dataset)

output <- here::here("objects", "fit.rds")
saveRDS(fit, output)
