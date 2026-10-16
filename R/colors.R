#' OPI Palettes
#'
#' A vector with hex-color codes that correspond to the extended color palette outlined in the Oklahoma Policy Institute Data Visualization Style Guide.
#' \url{http://openjusticeok.github.io/styleguide/}
#'
#' @title OPI main palette
#' @name palette_opi_main
#' @export
palette_opi_main <- c(
  "#2f507f", # Dark Blue
  "#9fB8db", # Light Blue
  "#972421", # Red
  "#febd60", # Yellow
  "#7f7f7f", # Grey
  "#89a44c", # Green
  "#715990", # Purple
  "#4198af", # Turquoise
  "#dd8727", # Orange
  "#632623", # Maroon
  "#fec010", # Bright Yellow
  "#d09392", # Pink
  "#b9cd95", # Light Green
  "#a99bbc" # Light Purple
)

#' @title OPI blue
#' @name opi_blue
#' @export
opi_blue <- "#2a5180"
#' @title OPI blue light
#' @name opi_blue_light
#' @export
opi_blue_light <- colorspace::lighten(opi_blue, amount = 0.95)
#' @title OPI Blue palette
#' @name opi_blue_palette
#'
#' @param n The number of colors to return
#'
#' @export
opi_blue_palette <- colorRampPalette(c(opi_blue_light, opi_blue))

#' @title OPI Red
#' @name opi_red
#' @export
opi_red <- "#982422"
#' @title OPI Red light
#' @name opi_red_light
#' @export
opi_red_light <- colorspace::lighten(opi_red, amount = 0.95)
#' @title OPI Red palette
#' @name opi_red_palette
#'
#' @param n The number of colors to return
#'
#' @export
opi_red_palette <- colorRampPalette(c(opi_red_light, opi_red))

#' @title OPI yellow
#' @name opi_yellow
#' @export
opi_yellow <- "#fdbc5f"
#' @title OPI yellow light
#' @name opi_yellow_light
#' @export
opi_yellow_light <- colorspace::lighten(opi_yellow, amount = 0.99)
#' @title OPI Yellow palette
#' @name opi_yellow_palette
#'
#' @param n The number of colors to return
#'
#' @export
opi_yellow_palette <- colorRampPalette(c(opi_yellow_light, opi_yellow))

#' @title TOK main palette
#' @name palette_tok_main
#' @export
palette_tok_main <- c(
  "#407fc1", # Blue
  "#ec2a28", # Red
  "#febf66", # Bright Yellow
  "#2c9381", # Green
  "#dd8000", # Orange
  "#533191", # Purple
  "#4198af", # Turquoise
  "#e26275", # Pink
  "#b9cd95", # Light Green
  "#a99bbc" # Light Purple
)

#' TOK Blue
#' @title TOK Blue
#' @name tok_blue
#' @export
tok_blue <- "#407fc1"
