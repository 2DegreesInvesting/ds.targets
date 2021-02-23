#' Replace missing values from the column `Ozone` of the dataset `airquality`
#'
#' @param raw A data frame.
#'
#' @return A data frame.
#' @keywords internal
#'
#' @examples
#' clean(airquality)
#' @importFrom dplyr .data
#' @noRd
clean <- function(raw) {
  dplyr::mutate(
    raw,
    Ozone = tidyr::replace_na(.data$Ozone, mean(.data$Ozone, na.rm = TRUE))
  )
}
