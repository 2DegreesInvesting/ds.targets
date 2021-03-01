library(targets)
library(tarchetypes)

options(TZ="Germany/Berlin")
tar_option_set(imports = "ds.targets", packages = c("ds.targets", "tidyverse"))

list(
  # External
  tar_target(path, raw_path(), format = "file"),
  # Internal: _targets/objects/
  tar_target(raw, command = read(path)),
  tar_target(data, clean(raw)),
  tar_target(model, linear_model(data)),
  # External
  tar_render(lm, "lm.Rmd", output_format = "md_document"),
  tar_render(plot, "plot.Rmd", output_format = "md_document")
)
