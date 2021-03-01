#' Explore changes in ozone through time with a linear model
#'
#' @param data The `airquality` data frame with columns `Ozone` and `Day`.
#'
#' @return A liner model.
#' @export
#'
#' @examples
#' linear_model(airquality)
linear_model <- function(data) {
  stats::lm(Ozone ~ Day, data = data)
}
