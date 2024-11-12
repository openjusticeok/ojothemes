#' @title OJO version of the ggproto GeomCol object
#'
#' @description
#' This is a near-exact copy of the default ggplot2 GeomCol ggproto object.
#' The only difference is that I've adjusted it to make the default column width smaller.
#' This ensures that it looks right no matter what the scale of the data you're using.
GeomColOJO <- ggplot2::ggproto(
  "GeomCol",
  ggplot2::GeomRect,
  required_aes = c("x", "y"),

  setup_data = function(data, params) {
    data$width <- data$width %||%
      params$width %||% (ggplot2::resolution(data$x, FALSE) * 0.7) # Set to 70% of resolution rather than default 90%
    transform(data,
              ymin = pmin(y, 0), ymax = pmax(y, 0),
              xmin = x - width / 2, xmax = x + width / 2, width = NULL
    )
  },

  draw_panel = function(self, data, panel_params, coord, width = NULL) {
    # Hack to ensure that width is detected as a parameter
    ggplot2::ggproto_parent(ggplot2::GeomRect, self)$draw_panel(data, panel_params, coord)
  }
)

#' geom_col in the Open Justice Oklahoma style
#'
#' @description
#' A custom version of the geom_col() geom that uses the OJO version of the ggproto object instead of the default
#' (this makes the bars skinnier and nice looking consistently)
#'
#' @param mapping Set of aesthetic mappings created by aes() or aes_(). If specified and inherit.aes = TRUE (the default), it is combined with the default mapping at the top level of the plot. You must supply mapping if there is no plot mapping.
#' @param data The data to be displayed in this layer. There are three options:
#'   If NULL, the default, the data is inherited from the plot data as specified in the call to ggplot().
#'   A data.frame, or other object, will override the plot data. All objects will be fortified to produce a data frame. See fortify() for which variables will be created.
#'   A function will be called with a single argument, the plot data. The return value must be a data.frame., and will be used as the layer data.
#' @param position Position adjustment, either as a string, or the result of a call to a position adjustment function.
#' @param ... Other arguments passed on to layer(). These are often aesthetics, used to set an aesthetic to a fixed value, like color = "red" or size = 3. They may also be parameters to the paired geom/stat.
#' @param na.rm If FALSE, the default, missing values are removed with a warning. If TRUE, missing values are silently removed.
#' @param show.legend logical. Should this layer be included in the legends? NA, the default, includes if any aesthetics are mapped. FALSE never includes, and TRUE always includes.
#' @param inherit.aes If FALSE, overrides the default aesthetics, rather than combining with them. This is most useful for helper functions that define both data and aesthetics and shouldn't inherit behaviour from the default plot specification, e.g. borders.
#'
#' @md
#' @export
geom_col <- function(mapping = NULL, data = NULL,
                     position = "stack",
                     ...,
                     na.rm = FALSE,
                     show.legend = NA,
                     inherit.aes = TRUE) {

  ggplot2::layer(
    data = data,
    mapping = mapping,
    stat = "identity",
    geom = GeomColOJO, # Use OJO version of the ggproto object instead
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      na.rm = na.rm,
      ...
    )
  )
}

#' geom_bar in the Open Justice Oklahoma style
#'
#' #' #' Submit `?ggplot2::geom_bar` to see the full documentation for `geom_bar()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param width bar width
#' @param ... other arguments passed to \code{geom_bar()}
#' @export
geom_bar <- function(mapping = NULL, width = 0.7, ...) {
  ggplot2::geom_bar(mapping = mapping, width = width, ...)
}

#' geom_jitter in the Open Justice Oklahoma style
#'
#' #' Submit `?ggplot2::geom_jitter` to see the full documentation for `geom_jitter()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param size point size
#' @param ... other arguments passed to \code{geom_jitter()}
#' @export
geom_jitter <- function(mapping = NULL, size = 3, ...) {
  ggplot2::geom_jitter(mapping = mapping, size = size, ...)
}

#' geom_line in the Open Justice Oklahoma style
#'
#' Submit `?ggplot2::geom_line` to see the full documentation for `geom_line()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param linewidth line size
#' @param ... other arguments passed to \code{geom_line()}
#' @export
geom_line <- function(mapping = NULL, linewidth = 1.5, ...) {
  ggplot2::geom_line(mapping = mapping, linewidth = linewidth, ...)
}

#' geom_step in the Open Justice Oklahoma style
#'
#' Submit `?ggplot2::geom_step` to see the full documentation for `geom_step()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param size line size
#' @param ... other arguments passed to \code{geom_step()}
#' @export
geom_step <- function(mapping = NULL, size = 1, ...) {
  ggplot2::geom_step(mapping = mapping, size = size, ...)
}

#' geom_path in the Open Justice Oklahoma style
#'
#' Submit `?ggplot2::geom_path` to see the full documentation for `geom_path()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param size line size
#' @param ... other arguments passed to \code{geom_path()}
#' @export
geom_path <- function(mapping = NULL, size = 1, ...) {
  ggplot2::geom_path(mapping = mapping, size = size, ...)
}

#' geom_point in the Open Justice Oklahoma style
#'
#' Submit `?ggplot2::geom_point` to see the full documentation for `geom_point()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param size point size
#' @param ... other arguments passed to \code{geom_point()}
#' @export
geom_point <- function(mapping = NULL, size = 3, ...) {
  ggplot2::geom_point(mapping = mapping, size = size, ...)
}

#' geom_point in the Open Justice Oklahoma style
#'
#' Submit `?ggplot2::geom_point` to see the full documentation for `geom_point()`
#'
#' @md
#' @param mapping mapping from ggplot2
#' @param size text size
#' @param ... other arguments passed to \code{geom_point()}
#' @export
geom_text <- function(mapping = NULL, size = 1 / 0.352777778, ...) {
  ggplot2::geom_text(mapping = mapping, size = size, ...)
}
