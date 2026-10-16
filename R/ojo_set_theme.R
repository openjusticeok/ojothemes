#' Use Oklahoma Policy Institute [ggplot2] themes
#'
#' \code{ojo_set_theme} provides a [ggplot2] theme formatted according to the
#' Oklahoma Policy Institute style guide, with sensible defaults.
#'
#' @param theme The theme you wish to use. Options are "opi" or "tok".
#' @param base_size The base font size for the theme. All fonts are relative to
#' this value.
#' @param base_line_size The base line size for the theme. All line sizes are
#' relative to this value.
#' @param base_rect_size The base rect size for the theme. All rect sizes are
#' relative to this value.
#' @param scale For `theme_ojo_map()`. Should the legend theme be continuous or discrete?
#' @md
#' @export
ojo_set_theme <- function(theme = "opi",
                          base_size = 18,
                          base_line_size = 0.5,
                          base_rect_size = 0.5,
                          scale = "continuous") {

  list_themes <- c("opi", "tok")
  rlang::arg_match(theme, list_themes)

  if (theme == "opi") {
    ggplot2::set_theme(theme_opi_base(base_size = base_size,
                                      base_line_size = base_line_size,
                                      base_rect_size = base_rect_size))

    base_family <- .ojo_font_opi
    default_color <- opi_blue
    default_palette <- palette_opi_main

  } else if (theme == "tok") {
    ggplot2::set_theme(theme_tok_base(base_size = base_size,
                                      base_family = .ojo_font_tok,
                                      base_line_size = base_line_size,
                                      base_rect_size = base_rect_size))

    base_family <- .ojo_font_tok
    default_color <- tok_blue
    default_palette <- palette_opi_main

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
  # Update the default color for the OPI version of geom_col()
  ggplot2::update_geom_defaults("colOPI", list(fill = default_color))
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
