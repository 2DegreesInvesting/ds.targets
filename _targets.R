library(targets)
library(tarchetypes)

tar_option_set(imports = "ds.targets", packages = c("ds.targets"))

list(
  # External
  tar_target(path, raw_path(), format = "file"),

  # Internal: _targets/objects/
  tar_target(raw, command = read(path)),
  tar_target(data, clean(raw)),
  tar_target(lm_fit, fit_lm(data)),
  tar_target(lm_plot, plot_lm(data)),

  # External
  tar_target(lm_figure, save_plot(path = "output/plot.png", plot = lm_plot)),
  tarchetypes::tar_render(lm, "lm.Rmd", output_format = "md_document"),
  tarchetypes::tar_render(plot, "plot.Rmd", output_format = "md_document")
)
