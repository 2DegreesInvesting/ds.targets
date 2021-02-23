library(targets)

tar_option_set(imports = "ds.targets", packages = "ds.targets")
# Or
# tar_option_set(envir = getNamespace("ds.targets"))

list(
  tar_target(path, raw_path(), format = "file"),
  tar_target(raw, command = read(path)),
  tar_target(data, clean(raw))
)
