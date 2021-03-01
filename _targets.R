library(targets)

options(TZ="Germany/Berlin")
tar_option_set(imports = "ds.targets", packages = c("ds.targets", "tidyverse"))

list(
  tar_target(path, raw_path(), format = "file"),
  tar_target(raw, command = read(path)),
  tar_target(data, clean(raw)),
  tar_target(model, linear_model(data))

)
