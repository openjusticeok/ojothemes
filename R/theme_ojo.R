#' A [ggplot2] theme formatted in the Open Justice Oklahoma style
#'
#' \code{theme_ojo} provides a [ggplot2] theme formatted according to the
#' Open Justice Oklahoma style guide for web, with sensible defaults.
#'
#' @md
#' @param base_family,base_size base font family and size
#' @param base_line_size,base_rect_size base line and rectangle sizes
#' @export
theme_ojo_base <- function(base_size = 16,
                           base_family = "Roboto Mono",
                           base_line_size = 0.5,
                           base_rect_size = 0.5) {

  half_line <- base_size / 2L

  ggplot2::theme(
    line = ggplot2::element_line(colour = "#000000",
                                 linewidth = base_line_size,
                                 linetype = 1L,
                                 lineend = "butt"),
    rect = ggplot2::element_rect(fill = "#FFFFFF",
                                 colour = "#000000",
                                 linewidth = base_rect_size,
                                 linetype = 1L),
    text = ggplot2::element_text(family = base_family,
                                 face = "plain",
                                 colour = "#000000",
                                 size = base_size,
                                 hjust = 0.5,
                                 vjust = 0.5,
                                 angle = 0,
                                 lineheight = 0.9,
                                 margin = ggplot2::margin(),
                                 debug = FALSE),
    # Plot Attributes
    plot.tag = ggplot2::element_text(size = base_size * 1.5,
                                     hjust = 0L,
                                     vjust = 0L,
                                     face = "bold",
                                     margin = ggplot2::margin(b = 10L)),
    plot.tag.position = "topleft",
    plot.title = ggplot2::element_text(size = base_size * 14 / 8.5,
                                       hjust = 0L,
                                       vjust = 0L,
                                       face = "bold",
                                       margin = ggplot2::margin(b = 10L)),
    plot.title.position = "plot",
    plot.subtitle = ggplot2::element_text(size = base_size * 10 / 8.5,
                                          hjust = 0L,
                                          vjust = 0L,
                                          margin = ggplot2::margin(b = 10L)),
    plot.caption = ggplot2::element_text(size = base_size * 9 / 8.5,
                                         hjust = 1L,
                                         vjust = 1L,
                                         margin = ggplot2::margin(t = base_size)),
    plot.caption.position = "plot",
    plot.background = NULL,

    plot.margin = ggplot2::margin(t = half_line,
                                  r = base_line_size * 24,
                                  b = half_line,
                                  l = half_line),
    # axis attributes
    axis.text = ggplot2::element_text(size = base_size),
    axis.text.x = ggplot2::element_text(vjust = 1, margin = ggplot2::margin(t = 4L)),
    axis.text.y = ggplot2::element_text(hjust = 1),
    axis.text.x.top = NULL,
    axis.text.y.right = NULL,
    axis.ticks.length.x = NULL,
    axis.ticks.length.x.top = NULL,
    axis.ticks.length.x.bottom = NULL,
    axis.ticks.length.y = NULL,
    axis.ticks.length.y.left = NULL,
    axis.ticks.length.y.right = NULL,

    axis.title = ggplot2::element_text(face = "italic",
                                       size = base_size),
    axis.title.x = ggplot2::element_text(margin = ggplot2::margin(t = 8L)),
    axis.title.y = ggplot2::element_text(angle = 90L,
                                         margin = ggplot2::margin(r = 12L)),
    axis.title.x.top = NULL,
    axis.title.y.right = NULL,

    axis.ticks = ggplot2::element_line(),
    axis.ticks.length = ggplot2::unit(4L, "pt"),
    axis.ticks.x = ggplot2::element_line(colour = NULL,
                                         linewidth = NULL,
                                         linetype = NULL,
                                         lineend = NULL),
    axis.ticks.y = ggplot2::element_blank(),

    axis.line = ggplot2::element_line(),
    axis.line.x = ggplot2::element_line(colour = NULL,
                                        linewidth = NULL,
                                        linetype = NULL,
                                        lineend = NULL),
    axis.line.y = ggplot2::element_blank(),
    # legend attributes
    legend.background = ggplot2::element_blank(),

    legend.spacing = ggplot2::unit(20L, "pt"),
    legend.spacing.x = ggplot2::unit(4L, "pt"),
    legend.spacing.y = NULL,

    legend.key = ggplot2::element_blank(),
    legend.key.size = ggplot2::unit(10L, "pt"),
    legend.key.height = NULL,
    legend.key.width = NULL,
    legend.key.spacing.x = ggplot2::unit(12L, "pt"),

    legend.text = ggplot2::element_text(size = base_size * 9.5 / 8.5,
                                        vjust = 0.5),
    legend.text.align = NULL,
    legend.title = ggplot2::element_blank(),
    legend.title.align = NULL,

    legend.position = "top",
    legend.direction = "horizontal",
    legend.justification = NULL,
    legend.margin = ggplot2::margin(t = 6L, r = 0L, b = 6L, l = 0L, "pt"),

    legend.box = "horizontal",
    legend.box.margin = NULL,
    legend.box.background = NULL,
    legend.box.spacing = NULL,
    # panel attributes
    panel.background = ggplot2::element_blank(),
    panel.border = ggplot2::element_blank(),
    panel.ontop = FALSE,

    panel.spacing = ggplot2::unit(6L, "pt"),
    panel.spacing.x = NULL,
    panel.spacing.y = NULL,

    panel.grid = NULL,
    panel.grid.major = ggplot2::element_line(),
    panel.grid.major.x = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(colour = "#cccccc"),
    panel.grid.minor = ggplot2::element_line(),
    panel.grid.minor.x = ggplot2::element_blank(),
    panel.grid.minor.y = ggplot2::element_blank(),
    # strip attributes (Faceting)
    strip.background = ggplot2::element_rect(fill = "#cccccc",
                                             colour = NA,
                                             linewidth = 10L),
    strip.text = ggplot2::element_text(face = "bold",
                                       size = base_size * 9.5 / 8.5,
                                       margin = ggplot2::margin(t = 0L, r = 0L, b = 0L, l = 0L)),

    strip.text.x = ggplot2::element_text(margin = ggplot2::margin(t = 4.5, b = 4.5)),
    strip.text.y = ggplot2::element_text(angle = -90L,
                                         margin = ggplot2::margin(l = 4.5, r = 4.5)),
    strip.placement = "inside",
    strip.placement.x =  NULL,
    strip.placement.y =  NULL,
    strip.switch.pad.grid = ggplot2::unit(0.1, "cm"),
    strip.switch.pad.wrap = ggplot2::unit(0.1, "cm"),
    # create a complete format
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
theme_ojo <- function(base_size = 14,
                      base_family = "Roboto Mono",
                      base_line_size = 0.5,
                      base_rect_size = 0.5) {

  theme_ojo_base <- theme_ojo_base(base_size = base_size,
                                   base_family = base_family,
                                   base_line_size = base_line_size,
                                   base_rect_size = base_rect_size)

  # Set scales to use okpi palettes
  scale_color_ojo <- ojothemes::scale_color_ojo()
  scale_fill_ojo <- ojothemes::scale_fill_ojo()

  # Wrap everything together so that the scales are also applied w/ the theme
  list(
    theme_ojo_base,
    scale_color_ojo,
    scale_fill_ojo
  )

}
