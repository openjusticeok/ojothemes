#' OPI Color Scale
#'
#' This function returns a ggplot2 color scale using the OPI main palette.
#'
#' @return A ggplot2 scale object.
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = wt, y = mpg, color = factor(gear))) +
#'   geom_point(size = 3) +
#'   scale_color_opi()
#' @export
scale_color_opi <- function() {
  ggplot2::scale_color_manual(values = palette_opi_main)
}

#' OPI Fill Scale
#'
#' This function returns a ggplot2 fill scale using the OPI main palette.
#'
#' @return A ggplot2 scale object.
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = factor(gear), fill = factor(gear))) +
#'   geom_bar() +
#'   scale_fill_opi()
#' @export
scale_fill_opi <- function() {
  ggplot2::scale_fill_manual(values = palette_opi_main)
}

#' TOK Color Scale
#'
#' This function returns a ggplot2 color scale using the TOK main palette.
#'
#' @return A ggplot2 scale object.
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = wt, y = mpg, color = factor(gear))) +
#'   geom_point(size = 3) +
#'   scale_color_tok()
#' @export
scale_color_tok <- function() {
  ggplot2::scale_color_manual(values = palette_tok_main)
}

#' TOK Fill Scale
#'
#' This function returns a ggplot2 fill scale using the TOK main palette.
#'
#' @return A ggplot2 scale object.
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(x = factor(gear), fill = factor(gear))) +
#'   geom_bar() +
#'   scale_fill_tok()
#' @export
scale_fill_tok <- function() {
  ggplot2::scale_fill_manual(values = palette_tok_main)
}
