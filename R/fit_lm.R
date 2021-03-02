#' Explore changes in ozone through time with a linear model
#'
#' @param data The `airquality` data frame with columns `Ozone` and `Day`.
#'
#' @return A liner model.
#' @export
#'
#' @examples
#' fit_lm(airquality)
fit_lm <- function(data) {
  Ozone <- NULL
  Day <- NULL
  stats::lm(Ozone ~ Day, data = data)
}
