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
    dplyr::rename_with(snakecase::to_title_case) |>
    gt::gt() |>
    gt::tab_options(
      heading.align = "left",
      column_labels.border.top.style = "none",
      table.border.top.style = "none",
      column_labels.border.bottom.width = 3,
      heading.border.bottom.style = "none",
      data_row.padding = gt::px(7),
      column_labels.font.size = gt::px(font_size),
      table.border.bottom.style = "none"
    ) |>
    gt::tab_options(
      column_labels.font.size = "medium",
      table.font.size = "medium",
      heading.title.font.size = "medium",
      heading.subtitle.font.size = "small"
    ) |>
    # Bold / uppercase column names
    gt::tab_style(
      style = gt::cell_text(color = "#333333",
                            transform = "uppercase",
                            weight = "bold"),
      locations = gt::cells_column_labels(tidyselect::everything())
    ) |>
    # Bold / big title
    gt::tab_style(
      style = list(
        gt::cell_text(weight = "bold",
                      size = gt::px(font_size * 2))
      ),
      locations = gt::cells_title(groups = "title")
    ) |>
    # Italicized / slightly big subtitle
    gt::tab_style(
      style = list(
        gt::cell_text(style = "italic",
                      color = "#333333",
                      size = gt::px(font_size * 1.25))
      ),
      locations = gt::cells_title(groups = "subtitle")
    ) |>
    gt::tab_style(
      style = gt::cell_text(color = "#333333",
                            transform = "uppercase",
                            weight = "bold"),
      locations = gt::cells_column_spanners(tidyselect::everything())
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
#' @param chosen_font The font family to use. Default is Roboto Condensed.
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
                    chosen_font = "Roboto Condensed",
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
      font = chosen_font
    ) |>
    # Format title
    gt::tab_style(
      style = list(
        gt::cell_text(color = ojothemes::okpi_red),
        gt::css(padding.left = "10px",
                border.left = paste0("10px solid ", okpi_red, ";"))
      ),
      locations = gt::cells_title(groups = "title")
    ) |>
    # Format subtitle
    gt::tab_style(
      style = list(
        gt::css(padding.left = "10px",
                border.left = paste0("10px solid ", okpi_red, ";"))
        ),
      locations = gt::cells_title(groups = "subtitle")
    )
    # # Format spanner headers
    # gt::tab_style(
    #   style = list(
    #     gt::cell_text(
    #       font = chosen_font,
    #       weight = "bold",
    #       size = "larger"
    #     )
    #   ),
    #   locations = gt::cells_column_spanners()
    # )

  return(x)
}

#' gt_ojo Function
#'
#' @param data A data frame to be converted into a gt table.
#' @param title Optional. A title for the table. Default is NA.
#' @param subtitle Optional. A subtitle for the table. Default is NA.
#' @param font_size The font size for the table. Default is 14.
#' @param chosen_font The font family to use. Default is Roboto mono
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
                   chosen_font = "Roboto Mono",
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
      font = chosen_font
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

