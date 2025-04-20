#' gt_base Function
#'
#' @param data A data frame to be converted into a gt table.
#' @param title Optional. A title for the table. Default is NA.
#' @param subtitle Optional. A subtitle for the table. Default is NA.
#' @param font_size The font size for the table. Default is 14.
#' @param format_cols Should gt::fmt_auto() be applied to all cols?
#' @param analyst_name The name of the analyst to credit in the footnote
#' @param source The source / domain of the data
#'
#' @return A gt table based on the input data frame with specified modifications.
#' @examples
#' \dontrun{
#' gt_base(data = mtcars, title = "Motor Trend Car Road Tests", subtitle = "From mtcars")
#' }
#' @export
#'
gt_base <- function(data,
                    title = NA, subtitle = NA,
                    font_size = 14,
                    format_cols = TRUE,
                    analyst_name = NA, source = NA
){
  x <- data |>
    gt::gt() |>
    gt::tab_options(
      heading.align = "left",
      column_labels.border.top.style = "none",
      table.border.top.style = "none",
      column_labels.border.bottom.style = "none",
      column_labels.border.bottom.width = 1,
      column_labels.border.bottom.color = "#A9A9A9",
      table_body.border.top.style = "none",
      table_body.border.bottom.color = "white",
      heading.border.bottom.style = "none",
      data_row.padding = gt::px(7),
      column_labels.font.size = gt::px(font_size)
    ) |>
    gt::tab_spanner(
      label = snakecase::to_title_case(colnames(data))
    ) |>
    gt::tab_options(
      column_labels.font.size = "medium",
      table.font.size = "medium",
      heading.title.font.size = "medium",
      heading.subtitle.font.size = "small"
    ) |>
    gt::tab_style(
      style = gt::cell_text(color = "#333333",
                            transform = "uppercase",
                            weight = "bold"),
      locations = gt::cells_column_labels(tidyselect::everything())
    ) |>
    gt::tab_style(
      style = list(
        gt::cell_text(weight = "bold",
                      size = gt::px(font_size * 2))
      ),
      locations = gt::cells_title(groups = "title")
    ) |>
    gt::tab_style(
      style = list(
        gt::cell_text(style = "italic",
                      color = "#333333",
                      size = gt::px(font_size * 1.25))
      ),
      locations = gt::cells_title(groups = "subtitle")
    )


  # Add title / subtitle?
  if (!is.na(title) | !is.na(subtitle)) {
    x <- x |>
      gt::tab_header(title = title,
                     subtitle = subtitle)
  }

  # Add col formatting?
  if (format_cols) {
    x <- x |>
      gt::fmt_auto(lg_num_pref = "suf")
  }

  if (!is.na(analyst_name) | !is.na(source)) {
    x <- x |>
      ojo_gt_captions(analyst_name = analyst_name,
                      source = source)
  }

  return(x)
}

#' gt_okpi Function
#'
#' @param data A data frame to be converted into a gt table.
#' @param title Optional. A title for the table. Default is NA.
#' @param subtitle Optional. A subtitle for the table. Default is NA.
#' @param font_size The font size for the table. Default is 14.
#' @param font The font family to use. Default is Roboto Condensed.
#' @param format_cols Should gt::fmt_auto() be applied to all cols?
#' @param analyst_name The name of the analyst to credit in the footnote
#' @param source The source / domain of the data
#'
#' @return A gt table based on the input data frame with specified modifications.
#' @examples
#' \dontrun{
#' okpi_gt(data = mtcars, title = "Motor Trend Car Road Tests", subtitle = "From mtcars")
#' }
#' @export
gt_okpi <- function(data,
                    title = NA, subtitle = NA,
                    font_size = 14,
                    font = "Roboto Condensed",
                    format_cols = TRUE,
                    analyst_name = NA, source = NA){

  x <- data |>
    ojothemes::gt_base(title = title,
                       subtitle = subtitle,
                       font_size = font_size,
                       format_cols = format_cols,
                       analyst_name = analyst_name,
                       source = source) |>
    gt::opt_table_font(
      font = gt::google_font(font)
    ) |>
    gt::tab_style(
      style = list(
        gt::cell_text(color = ojothemes::okpi_red),
        gt::css(padding.left = "10px",
                border.left = paste0("10px solid ", okpi_red, ";"))
      ),
      locations = gt::cells_title(groups = "title")
    ) |>
    gt::tab_style(
      style = list(
        gt::css(padding.left = "10px",
                border.left = paste0("10px solid ", okpi_red, ";"))
        ),
      locations = gt::cells_title(groups = "subtitle")
    )

  return(x)
}

#' gt_ojo Function
#'
#' @param data A data frame to be converted into a gt table.
#' @param title Optional. A title for the table. Default is NA.
#' @param subtitle Optional. A subtitle for the table. Default is NA.
#' @param font_size The font size for the table. Default is 14.
#' @param font The font family to use. Default is Roboto mono
#' @param format_cols Should gt::fmt_auto() be applied to all cols?
#' @param analyst_name The name of the analyst to credit in the footnote
#' @param source The source / domain of the data
#'
#' @return A gt table based on the input data frame with specified modifications.
#' @examples
#' \dontrun{
#' okpi_gt(data = mtcars, title = "Motor Trend Car Road Tests", subtitle = "From mtcars")
#' }
#' @export
gt_ojo <- function(data,
                   title = NA, subtitle = NA,
                   font_size = 14,
                   font = "Roboto Mono",
                   format_cols = TRUE,
                   analyst_name = NA, source = NA
) {

  x <- data |>
    ojothemes::gt_base(title = title,
                       subtitle = subtitle,
                       font_size = font_size,
                       format_cols = format_cols,
                       analyst_name = analyst_name,
                       source = source) |>
    gt::opt_table_font(
      font = gt::google_font(font)
    ) |>
    gt::tab_style(
      style = list(
        gt::css(padding.left = "10px",
                border.left = paste0("10px solid ", okpi_yellow, ";"))
      ),
      locations = gt::cells_title(groups = "title")
    ) |>
    gt::tab_style(
      style = list(
        gt::css(padding.left = "10px",
                border.left = paste0("10px solid ", okpi_yellow, ";"))
        ),
      locations = gt::cells_title(groups = "subtitle")
    )

  return(x)
}

