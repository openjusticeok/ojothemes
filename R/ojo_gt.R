#' ojo_gt Function
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
ojo_gt <- function(data, title = NA, subtitle = NA) {
  x <- data |>
    gt::gt() |>
    gtExtras::gt_theme_nytimes() |>
    gt::tab_spanner(
      label = str_to_titlecase(colnames(data))
    ) |>
    gt::tab_options(
      column_labels.font.size = "medium",
      table.font.size = "medium",
      heading.title.font.size = "medium",
      heading.subtitle.font.size = "small"
    )

  # Add title / subtitle?
  if (!is.na(title) | !is.na(subtitle)) {
    x <- x |>
      gt::tab_header(title = title,
                     subtitle = subtitle)
  }

  return(x)
}
