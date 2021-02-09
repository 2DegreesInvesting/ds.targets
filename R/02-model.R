library(biglm)
library(tidyverse)

input <- here::here("output/dataset.csv")
dataset <- read_csv(input, col_types = cols())

fit <- biglm(Ozone ~ Wind + Temp, dataset)

output <- here::here("output/fit.rds")
saveRDS(fit, output)
