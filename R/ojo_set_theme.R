#' Use Oklahoma Policy Institute [ggplot2] themes
#'
#' \code{ojo_set_theme} provides a [ggplot2] theme formatted according to the
#' Oklahoma Policy Institute style guide, with sensible defaults.
#'
#' @param theme The theme you wish to use. Options are "okpi", "ojo", or "tok".
#' @param base_size The base font size for the theme. All fonts are relative to
#' this value.
#' @param base_family The base font family for the theme.
#' @param base_line_size The base line size for the theme. All line sizes are
#' relative to this value.
#' @param base_rect_size The base rect size for the theme. All rect sizes are
#' relative to this value.
#' @param scale For `theme_ojo_map()`. Should the legend theme be continuous or discrete?
#'
#' @md
#' @export
ojo_set_theme <- function(theme = "okpi",
                          base_size = 14,
                          base_family = "Roboto Condensed",
                          base_line_size = 0.5,
                          base_rect_size = 0.5,
                          scale = "continuous") {

  list_themes <- c("okpi", "ojo", "tok")
  rlang::arg_match(theme, list_themes)

  if(theme == "okpi"){
    ggplot2::theme_set(theme_okpi(base_size = base_size,
                                  base_family = base_family,
                                  base_line_size = base_line_size,
                                  base_rect_size = base_rect_size)[[1]]) # Need the [[1]] because theme_okpi() returns a list of [[1]] the theme, and [[2]] + [[3]] the scales

    default_color <- ojothemes::okpi_blue

  } else if (theme == "ojo") {
    ggplot2::theme_set(theme_ojo(base_size = base_size,
                                 base_family = base_family,
                                 base_line_size = base_line_size,
                                 base_rect_size = base_rect_size)[[1]])

    default_color <- "black"

  } else if (theme == "tok") {
    ggplot2::theme_set(theme_tok(base_size = base_size,
                                 base_family = base_family,
                                 base_line_size = base_line_size,
                                 base_rect_size = base_rect_size)[[1]])

    default_color <- "#407fc1"

  }

  # add base_family font to text and label geoms ---------------------------
  ggplot2::update_geom_defaults("text", list(family = base_family))
  ggplot2::update_geom_defaults("label", list(family = base_family))
  ggplot2::update_geom_defaults("text_repel", list(family = base_family))
  ggplot2::update_geom_defaults("label_repel", list(family = base_family))

  # set default color scales for -------------------------------------------
  options(
    ggplot2.continuous.colour = "gradient",
    ggplot2.continuous.fill = "gradient",
    ggplot2.discrete.fill = ojothemes::palette_okpi_main,
    ggplot2.discrete.colour = ojothemes::palette_okpi_main
  )

  # set default colors for monochromatic geoms ------------------------------
  ggplot2::update_geom_defaults("bar", list(fill = default_color))
  ggplot2::update_geom_defaults("colOJO", list(fill = default_color))
  ggplot2::update_geom_defaults("point", list(colour = default_color))
  ggplot2::update_geom_defaults("line", list(colour = default_color))
  ggplot2::update_geom_defaults("step", list(colour = default_color))
  ggplot2::update_geom_defaults("path", list(colour = default_color))
  ggplot2::update_geom_defaults("boxplot", list(fill = default_color))
  ggplot2::update_geom_defaults("density", list(fill = default_color))
  ggplot2::update_geom_defaults("violin", list(fill = default_color))

  # set default colors for monochromatic stats ------------------------------
  ggplot2::update_stat_defaults("count", list(fill = default_color))
  ggplot2::update_stat_defaults("boxplot", list(fill = default_color))
  ggplot2::update_stat_defaults("density", list(fill = default_color))
  ggplot2::update_stat_defaults("ydensity", list(fill = default_color))

}
