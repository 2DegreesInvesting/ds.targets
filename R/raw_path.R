#' Path to raw data
#'
#' @return A string
#' @export
#'
#' @examples
#' raw_path()
raw_path <- function() {
  system.file(
    "extdata", "raw_data.csv",
    package = "ds.targets",
    mustWork = TRUE
  )
}
