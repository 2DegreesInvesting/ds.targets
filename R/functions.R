source_all <- function(path = "R") {
  files <- list.files(here::here(path), full.names = TRUE, pattern = "[.]R$")
  suppressMessages(
    lapply(files, source)
  )

  invisible(path)
}

