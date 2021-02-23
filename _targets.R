library(targets)

# source(file.path("R", "read.R"))
# source(file.path("R", "clean.R"))
# ...

# tar_option_set(packages = "tidyverse")
tar_option_set(envir = getNamespace("ds.targets"))
# tar_option_set(envir = getNamespace("ds.targets"), imports = c("pkg1", "pkg2"))


list(
  tar_target(path, raw_path(), format = "file"),
  tar_target(raw, command = read(path)),
  tar_target(data, clean(raw))
)
