#' OKPI Extended Palette
#'
#' A vector with hex-color codes that correspond to the extended color palette outlined in the Open Justice Oklahoma Data Visualization Style Guide.
#' \url{http://openjusticeok.github.io/styleguide/}
#'
#' @title OKPI main palette
#' @name palette_okpi_main
#' @family okpi palettes
#' @rdname okpi_palettes
#' @export
palette_okpi_main <- c(
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

# Blue Palette
#' OKPI Blue Palette
#'
#' A palette of blue shades for OKPI.
#'
#' @title OKPI Blue Palette
#' @name okpi_blue_palette
#' @family okpi palettes
#' @rdname okpi_palettes
#' @export
okpi_blue <- "#2a5180"
#' @export
okpi_blue_light <- colorspace::lighten(okpi_blue, amount = 0.95)
#' @export
okpi_blue_palette <- colorRampPalette(c(okpi_blue_light, okpi_blue))

# Red Palette
#' OKPI Red Palette
#'
#' A palette of red shades for OKPI.
#'
#' @title OKPI Red Palette
#' @name okpi_red_palette
#' @family okpi palettes
#' @rdname okpi_palettes
#' @export
okpi_red <- "#982422"
#' @export
okpi_red_light <- colorspace::lighten(okpi_red, amount = 0.95)
#' @export
okpi_red_palette <- colorRampPalette(c(okpi_red_light, okpi_red))

# Yellow Palette
#' OKPI Yellow Palette
#'
#' A palette of yellow shades for OKPI.
#'
#' @title OKPI Yellow Palette
#' @name okpi_yellow_palette
#' @family okpi palettes
#' @rdname okpi_palettes
#' @export
okpi_yellow <- "#fdbc5f"
#' @export
okpi_yellow_light <- colorspace::lighten(okpi_yellow, amount = 0.99)
#' @export
okpi_yellow_palette <- colorRampPalette(c(okpi_yellow_light, okpi_yellow))

# OJO Palettes
#' OJO Main Palette
#'
#' A vector with hex-color codes for the main OJO palette.
#'
#' @title OJO Main Palette
#' @name palette_ojo_main
#' @family ojo palettes
#' @rdname ojo_palettes
#' @export
palette_ojo_main <- c(
  cyan = "#1696d2",
  yellow = "#fdbf11",
  black = "#000000",
  gray = "#d2d2d2",
  magenta = "#ec008b",
  green = "#55b748",
  `space gray` = "#5c5859",
  red = "#db2b27"
)

#' OJO Diverging Palette
#'
#' A vector with hex-color codes for the OJO diverging palette.
#'
#' @title OJO Diverging Palette
#' @name palette_ojo_diverging
#' @family ojo palettes
#' @rdname ojo_palettes
#' @export
palette_ojo_diverging <- c(
  "#ca5800",
  "#fdbf11",
  "#fdd870",
  "#fff2cf",
  "#cfe8f3",
  "#73bfe2",
  "#1696d2",
  "#0a4c6a"
)

#' OJO Quintile Palette
#'
#' A vector with hex-color codes for the OJO quintile palette.
#'
#' @title OJO Quintile Palette
#' @name palette_ojo_quintile
#' @family ojo palettes
#' @rdname ojo_palettes
#' @export
palette_ojo_quintile <- c(
  "#cfe8f3",
  "#73bfe2",
  "#1696d2",
  "#0a4c6a",
  "#000000"
)

#' OJO Politics Palette
#'
#' A vector with hex-color codes for the OJO politics palette.
#'
#' @title OJO Politics Palette
#' @name palette_ojo_politics
#' @family ojo palettes
#' @rdname ojo_palettes
#' @export
palette_ojo_politics <- c(
  "#1696d2",
  "#db2b27"
)

#' OJO Cyan Palette
#'
#' A vector with hex-color codes for the OJO cyan palette.
#'
#' @title OJO Cyan Palette
#' @name palette_ojo_cyan
#' @family ojo palettes
#' @rdname ojo_palettes
#' @export
palette_ojo_cyan <- c(
  "#cfe8f3",
  "#a2d4ec",
  "#73bfe2",
  "#46abdb",
  "#1696d2",
  "#12719e",
  "#0a4c6a",
  "#062635"
)

#' OJO Gray Palette
#'
#' A vector with hex-color codes for the OJO gray palette.
#'
#' @title OJO Gray Palette
#' @name palette_ojo_gray
#' @family ojo palettes
#' @rdname ojo_palettes
#' @export
palette_ojo_gray <- c(
  "#f5f5f5",
  "#ececec",
  "#e3e3e3",
  "#dcdbdb",
  "#d2d2d2",
  "#9d9d9d",
  "#696969",
  "#353535"
)

#' OJO Yellow Palette
#'
#' A vector with hex-color codes for the OJO yellow palette.
#'
#' @title OJO Yellow Palette
#' @name palette_ojo_yellow
#' @family ojo palettes
#' @rdname ojo_palettes
#' @export
palette_ojo_yellow <- c(
  "#fff2cf",
  "#fce39e",
  "#fdd870",
  "#fccb41",
  "#fabe15",
  "#bb8e2d",
  "#7f6127",
  "#3e3215"
)

#' OJO Magenta Palette
#'
#' A vector with hex-color codes for the OJO magenta palette.
#'
#' @title OJO Magenta Palette
#' @name palette_ojo_magenta
#' @family ojo palettes
#' @rdname ojo_palettes
#' @export
palette_ojo_magenta <- c(
  "#f5cbdf",
  "#eb99c2",
  "#e46aa7",
  "#e54096",
  "#e90989",
  "#af1f6b",
  "#761548",
  "#351123"
)

#' OJO Green Palette
#'
#' A vector with hex-color codes for the OJO green palette.
#'
#' @title OJO Green Palette
#' @name palette_ojo_green
#' @family ojo palettes
#' @rdname ojo_palettes
#' @export
palette_ojo_green <- c(
  "#dcedd9",
  "#bcdeb4",
  "#98cf90",
  "#78c26d",
  "#55b748",
  "#408941",
  "#2c5c2d",
  "#1a2e19"
)

#' OJO Space Gray Palette
#'
#' A vector with hex-color codes for the OJO space gray palette.
#'
#' @title OJO Space Gray Palette
#' @name palette_ojo_spacegray
#' @family ojo palettes
#' @rdname ojo_palettes
#' @export
palette_ojo_spacegray <- c(
  "#d5d5d4",
  "#adabac",
  "#848081",
  "#5c5859",
  "#332d2f",
  "#262223",
  "#1a1717",
  "#0e0c0d"
)

#' OJO Red Palette
#'
#' A vector with hex-color codes for the OJO red palette.
#'
#' @title OJO Red Palette
#' @name palette_ojo_red
#' @family ojo palettes
#' @rdname ojo_palettes
#' @export
palette_ojo_red <- c(
  "#f8d5d4",
  "#f1aaa9",
  "#e9807d",
  "#e25552",
  "#db2b27",
  "#a4201d",
  "#6e1614",
  "#370b0a"
)
