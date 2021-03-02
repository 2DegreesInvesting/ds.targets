#' Save a ggplot and output a path suitable for an extarnal targets file
#'
#' @param plot An object of class "ggplot".
#' @param path A path where to save the plot.
#'
#' @return A character string.
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' plot <- ggplot(airquality, aes(Ozone, Day)) +
#'   geom_smooth(method = "lm")
#' path <- tempfile(fileext = ".png")
#' out <- save_plot(path, plot)
#' out
#'
#' file.exists(out)
save_plot <- function(path, plot) {
  ggplot2::ggsave(path, plot)
  invisible(path)
}
