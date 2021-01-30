#' Read a delimited file into a tibble
#'
#' @param ... Arguments passed to [voom::vroom()].
#'
#' @examples
#' # Setup toy data to read
#' path <- tempfile()
#' data <- mtcars
#' vroom::vroom_write(data, path)
#'
#' # Compare
#' throws_message <- vroom::vroom(path)
#' no_message <- read(path)
#' no_message
read <- function(...) {
  pause()

  vroom(..., col_types = cols())
}

#' Prapare a tibble with clean names
#'
#' @param data A data frame.
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' # Compare
#' iris %>% head()
#' iris %>% prepare_data()
prepare <- function(data) {
  pause()

  data %>%
    as_tibble() %>%
    clean_names()
}

#' Summarize numeric columns by groups
#'
#' @param data A data frame.
#' @param ... Groups to group by.
#' @param .f A function, e.g. mean.
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' iris %>% mean_of_numerics("Species")
#'
#' by <- c("cyl", "carb")
#' mtcars %>% mean_of_numerics(by, .fns = sd)
mean_of_numerics <- function(data, by) {
  pause()

  data %>%
    group_by(!!!rlang::syms(by)) %>%
    summarise(across(where(is.double), .fns = mean), .groups = "drop")
}

#' Create a classic scatterplot with optional facets
#'
#' @param data A data frame.
#' @param x,y Strings. The axes of the plot.
#' @param ... Passed to [ggplot2::aes()].
#'
#' @return A ggplot.
#' @export
#'
#' @examples
#' x <- "hp"
#' y <- "mpg"
#' datasets::mtcars %>% plot_xy(x, y)
#' datasets::mtcars %>% plot_xy(x, y, by = "cyl")
plot_xy <- function(data, x, y, by = NULL) {
  pause()

  p <- ggplot(data, aes(.data[[x]], .data[[y]])) +
    geom_point() +
    theme_classic()

  if (is.null(by)) {
    return(p)
  }
  p + facet_wrap(vars(.data[[by]]))
}

# Helpers -----------------------------------------------------------------

pause <- function() {
  default <- 0L
  custom <- getOption("pause")

  if (is.null(custom)) {
    Sys.sleep(default)
  } else {
    Sys.sleep(custom)
  }
}
