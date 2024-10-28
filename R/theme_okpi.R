#' A [ggplot2] theme formatted in the Oklahoma Policy Institute style
#'
#' \code{theme_okpi} provides a [ggplot2] theme formatted according to the
#' Oklahoma Policy Institute style guide for web, with sensible defaults.
#'
#' @md
#' @param base_family The font family to use; Roboto Condensed is the default.
#' @param base_size The base font size to use; 14 is the default.
#' @export
theme_okpi <- function(base_family = "Roboto Condensed",
                       base_size = 14) {
  # Base theme
  theme_okpi <- ggplot2::theme_grey(
    base_size = base_size,
    base_family = base_family
  ) +
  # OKPI customizations
    ggplot2::theme(
      panel.background = ggplot2::element_blank(),
      plot.background = ggplot2::element_blank(),
      legend.background = ggplot2::element_rect(fill = "transparent", colour = NA),
      legend.key = ggplot2::element_rect(fill = "transparent", colour = NA),
      legend.position = "top",
      text = ggplot2::element_text(
        color = "#333333"
      ),
      panel.border = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.minor.x = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_line(linewidth = 0.5),
      panel.grid.minor.y = ggplot2::element_line(linewidth = 0.25),
      panel.spacing = grid::unit(6, "pt"),
      plot.title = ggplot2::element_text(
        size = ggplot2::rel(1.66),
        face = "bold",
        color = palette_okpi_main[3],
        lineheight = 0.7,
        margin = ggplot2::margin(0, 0, 6, 0, "pt")
      ),
      plot.title.position = "plot",
      plot.subtitle = ggplot2::element_text(
        size = ggplot2::rel(1.33),
        face = "bold.italic",
        family = "Roboto Condensed",
        lineheight = 0.7,
        margin = ggplot2::margin(0, 0, 6, 0, "pt")
      ),
      plot.caption.position = "plot",
      plot.caption = ggplot2::element_text(
        size = ggplot2::rel(1),
        lineheight = 0.75,
        face = "italic",
      ),
      legend.title = ggplot2::element_blank(),
      legend.text = ggplot2::element_text(size = ggplot2::rel(1.16)),
      legend.margin = ggplot2::margin(0, 0, 0, 0),
      axis.title = ggplot2::element_text(
        size = ggplot2::rel(1.16),
        face = "bold"
      ),
      axis.text = ggplot2::element_text(
        size = ggplot2::rel(1.16)
      ),
      axis.line.x.bottom = ggplot2::element_line(
        color = "#333333",
      ),
      axis.ticks = ggplot2::element_line(
        color = "#333333",
      ),
      axis.ticks.y = ggplot2::element_blank(),
      strip.background = ggplot2::element_blank(),
      strip.text = ggplot2::element_text(face = "bold")
    )

  # Set scales to use okpi palettes
  scale_color_okpi <- scale_color_manual(values = palette_okpi_main)
  scale_fill_okpi <- scale_fill_manual(values = palette_okpi_main)

  # Update geom defaults to use okpi blue
  update_geom_defaults("point", list(colour = ojothemes::okpi_blue,
                                     fill = ojothemes::okpi_blue))
  update_geom_defaults("line", list(colour = ojothemes::okpi_blue))
  update_geom_defaults("bar", list(fill = ojothemes::okpi_blue))
  update_geom_defaults("col", list(fill = ojothemes::okpi_blue))
  update_geom_defaults("area", list(fill = ojothemes::okpi_blue))
  update_geom_defaults("text", list(colour = "#333333"))
  update_geom_defaults("label", list(fill = "white",
                                     colour = "#333333"))

  # Wrap everything together in a theme
  list(
    theme_okpi,
    scale_color_okpi,
    scale_fill_okpi
  )

}
