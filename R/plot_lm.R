#' Plot a linear model: `Ozone` ~ `Day`
#'
#' @param data The `airquality` dataset.
#'
#' @return An object of class "ggplot".
#' @export
#'
#' @examples
#' plot_lm(airquality)
#' @importFrom ggplot2 ggplot aes geom_smooth
plot_lm <- function(data) {
  Ozone <- NULL
  Day <- NULL
  ggplot(data, aes(Day, Ozone)) +
    geom_smooth(method = "lm")
}
