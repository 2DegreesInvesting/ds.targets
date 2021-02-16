read <- function(path, ...) {
  read_csv(path, col_types = getOption("col_types"))
}

clean <- function(raw) {
  mutate(raw, Ozone = replace_na(Ozone, mean(Ozone, na.rm = TRUE)))
}
