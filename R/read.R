#' Read a .csv file into a tibble, quietly
#'
#' @param path Path to a .csv file.
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' # Setup
#' tmp <- tempfile()
#' readr::write_csv(airquality, tmp)
#'
#' # Verbose
#' readr::read_csv(tmp)
#'
#' # Quiet
#' read(tmp)
read <- function(path) {
  readr::read_csv(path, col_types = readr::cols())
}
