read_and_clean <- function(path) {
  raw_data <- read_csv(path, col_types = cols())

  raw_data %>%
    mutate(Ozone = replace_na(Ozone, mean(Ozone, na.rm = TRUE)))
}

fit_model <- function(data) {
  biglm(Ozone ~ Wind + Temp, data)
}

create_plot <- function(data) {
  ggplot(data) +
    geom_histogram(aes(x = Ozone)) +
    theme_gray(24)
}

