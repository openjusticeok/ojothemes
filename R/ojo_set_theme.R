#' Use Oklahoma Policy Institute [ggplot2] themes
#'
#' \code{ojo_set_theme} provides a [ggplot2] theme formatted according to the
#' Oklahoma Policy Institute style guide, with sensible defaults.
#'
#' @param theme The theme you wish to use. Options are "okpi", "ojo", or "tok".
#' @param base_size The base font size for the theme. All fonts are relative to
#' this value.
#' @param base_line_size The base line size for the theme. All line sizes are
#' relative to this value.
#' @param base_rect_size The base rect size for the theme. All rect sizes are
#' relative to this value.
#' @param scale For `theme_ojo_map()`. Should the legend theme be continuous or discrete?
#'
#' @md
#' @export
ojo_set_theme <- function(theme = "okpi",
                          base_size = 18,
                          base_line_size = 0.5,
                          base_rect_size = 0.5,
                          scale = "continuous") {

  list_themes <- c("okpi", "ojo", "tok")
  rlang::arg_match(theme, list_themes)

  if(theme == "okpi"){
    ggplot2::theme_set(theme_okpi_base(base_size = base_size,
                                       base_line_size = base_line_size,
                                       base_rect_size = base_rect_size))

    base_family <- "Roboto Condensed"
    default_color <- ojothemes::okpi_blue
    default_palette <- ojothemes::palette_okpi_main

  } else if (theme == "ojo") {
    ggplot2::theme_set(theme_ojo_base(base_size = base_size,
                                      base_line_size = base_line_size,
                                      base_rect_size = base_rect_size))

    base_family <- "Roboto Mono"
    default_color <- "black"
    default_palette <- ojothemes::palette_ojo_main

  } else if (theme == "tok") {
    ggplot2::theme_set(theme_tok_base(base_size = base_size,
                                      base_family = "Roboto Condensed",
                                      base_line_size = base_line_size,
                                      base_rect_size = base_rect_size))

    base_family <- "Roboto Condensed"
    default_color <- ojothemes::tok_blue
    default_palette <- ojothemes::palette_okpi_main

  }

  # add base_family font to text and label geoms ---------------------------
  ggplot2::update_geom_defaults("text", list(family = base_family))
  ggplot2::update_geom_defaults("label", list(family = base_family))
  # ggplot2::update_geom_defaults("text_repel", list(family = base_family)) # Keep ggrepel in this?
  # ggplot2::update_geom_defaults("label_repel", list(family = base_family))

  # set default color scales  ----------------------------------------------
  options(
    ggplot2.continuous.colour = "gradient",
    ggplot2.continuous.fill = "gradient",
    # Set default fill / color scales to match the theme
    ggplot2.discrete.fill = default_palette,
    ggplot2.discrete.colour = default_palette
  )

  # set default colors for monochromatic geoms ------------------------------
  ggplot2::update_geom_defaults("bar", list(fill = default_color))
  # Update the default color for the OJO version of geom_col()
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
