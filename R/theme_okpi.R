#' A [ggplot2] theme formatted in the Oklahoma Policy Institute style
#'
#' \code{theme_okpi} provides a [ggplot2] theme formatted according to the
#' Oklahoma Policy Institute style guide for web, with sensible defaults.
#'
#' @md
#' @param base_family The font family to use; Roboto Condensed is the default.
#' @param base_size The base font size to use; 16 is the default.
#' @param base_line_size The base line size to use; 0.5 is the default.
#' @param base_rect_size The base rect size to use; 0.5 is the default.
#' @export
theme_okpi_base <- function(base_size = 16,
                            base_family = "Roboto Condensed",
                            base_line_size = 0.5,
                            base_rect_size = 0.5) {

  ggplot2::theme(
    line = ggplot2::element_line(colour = "#333333",
                                 linewidth = base_line_size,
                                 linetype = 1L,
                                 lineend = "butt"),
    rect = ggplot2::element_rect(fill = "#ffffff",
                                 colour = NA,
                                 linewidth = base_rect_size,
                                 linetype = 1L),
    text = ggplot2::element_text(family = base_family,
                                 face = "plain",
                                 colour = "#333333",
                                 size = base_size,
                                 angle = 0,
                                 lineheight = 0.9,
                                 margin = ggplot2::margin(),
                                 debug = FALSE),
    panel.background = ggplot2::element_blank(),
    plot.background = ggplot2::element_blank(),
    legend.background = ggplot2::element_rect(fill = "transparent", colour = NA),
    legend.key = ggplot2::element_rect(fill = "transparent", colour = NA),
    legend.position = "top",
    panel.border = ggplot2::element_blank(),
    panel.grid.major.x = ggplot2::element_blank(),
    panel.grid.minor.x = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(linewidth = 0.5, color = "#cccccc"),
    panel.grid.minor.y = ggplot2::element_blank(),
    panel.spacing = grid::unit(6, "pt"),
    plot.title = ggplot2::element_text(
      size = ggplot2::rel(2),
      face = "bold",
      hjust = 0,
      color = palette_okpi_main[3],
      lineheight = 0.7,
      margin = ggplot2::margin(0, 0, 6, 0, "pt")
    ),
    plot.title.position = "plot",
    plot.subtitle = ggplot2::element_text(
      size = ggplot2::rel(1.66),
      face = "bold.italic",
      hjust = 0,
      family = "Roboto Condensed",
      lineheight = 0.7,
      margin = ggplot2::margin(0, 0, 18, 0, "pt")
    ),
    plot.caption.position = "plot",
    plot.caption = ggplot2::element_text(
      size = ggplot2::rel(1.2),
      lineheight = 0.75,
      face = "italic",
      hjust = 1,
      margin = ggplot2::margin(18, 0, 0, 0, "pt")
    ),
    legend.title = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(size = ggplot2::rel(1.16)),
    legend.margin = ggplot2::margin(0, 0, 0, 0),
    axis.title = ggplot2::element_text(
      size = ggplot2::rel(1.16),
      face = "bold",
      hjust = 0.5,
    ),
    axis.title.y = ggplot2::element_text(
      angle = 90,
      margin = ggplot2::margin(0, 12, 0, 0, "pt")
    ),
    axis.text = ggplot2::element_text(
      size = ggplot2::rel(1.16),
      hjust = 0.5
    ),
    axis.line.x.bottom = ggplot2::element_line(
      color = "#333333",
    ),
    axis.ticks = ggplot2::element_line(
      color = "#333333",
    ),
    axis.ticks.y = ggplot2::element_blank(),
    strip.background = ggplot2::element_blank(),
    strip.text = ggplot2::element_text(face = "bold"),

    complete = TRUE
  )
}

#' A [ggplot2] theme formatted in the Oklahoma Policy Institute style
#'
#' \code{theme_okpi} provides a [ggplot2] theme formatted according to the
#' Oklahoma Policy Institute style guide for web, with sensible defaults,
#' and also inclusdes the OKPI fill and color scales.
#'
#' @md
#' @param base_family The font family to use; Roboto Condensed is the default.
#' @param base_size The base font size to use; 14 is the default.
#' @param base_line_size The base line size to use; 0.5 is the default.
#' @param base_rect_size The base rect size to use; 0.5 is the default.
#' @export
theme_okpi <- function(base_size = 14,
                       base_family = "Roboto Condensed",
                       base_line_size = 0.5,
                       base_rect_size = 0.5) {

  theme_okpi_base <- theme_okpi_base(base_size = base_size,
                                     base_family = base_family,
                                     base_line_size = base_line_size,
                                     base_rect_size = base_rect_size)

  # Set scales to use okpi palettes
  scale_color_okpi <- ojothemes::scale_color_okpi()
  scale_fill_okpi <- ojothemes::scale_fill_okpi()

  # Wrap everything together so that the scales are also applied w/ the theme
  list(
    theme_okpi_base,
    scale_color_okpi,
    scale_fill_okpi
  )

}
