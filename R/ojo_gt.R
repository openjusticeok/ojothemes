#' @title ojo_gt
#'
#' @param data A data frame to be converted into a gt table.
#' @param title Optional. A title for the table. Default is NA.
#' @param subtitle Optional. A subtitle for the table. Default is NA.
#' @return A gt table based on the input data frame with specified modifications.
#' @examples
#' \dontrun{
#' ojo_gt(data = mtcars, title = "Motor Trend Car Road Tests", subtitle = "From mtcars")
#' }
#' @export
ojo_gt <- function(data, title = NULL, subtitle = NULL, ..., auto_format = TRUE) {
  x <- data |>
    gt::gt(
      ...,
      locale = "en"
    ) |>
    gtExtras::gt_theme_nytimes() |>
    gt::tab_options(
      column_labels.font.size = "medium",
      table.font.size = "medium",
      heading.title.font.size = "medium",
      heading.subtitle.font.size = "small"
    )

  # Add title / subtitle?
  if (!is.null(title)) { # Don't need to check subtitle because it can be passed to tab_header as NULL if it isn't provided
    x <- x |>
      gt::tab_header(
        title = title,
        subtitle = subtitle
      )
  }

  if (auto_format) {
    x <- x |>
      gt::fmt_auto(
        lg_num_pref = "suf" # Use something like 5B instead of 5,000,000,000
      )
  }

  return(x)
}
