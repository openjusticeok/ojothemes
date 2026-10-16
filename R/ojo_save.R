# Enforced plot export -----------------------------------------------------
#
# All raster/vector export goes through ragg/svglite so that font resolution
# is identical on every machine (see R/fonts.R). Unit conversion is
# centralized here so analysts can pass communications specs verbatim,
# in any unit.

# Convert a dimension to inches. px is dpi-relative; pt, mm, cm are
# absolute physical units (1 pt = 1/72 in by definition).
.ojo_to_inches <- function(x, unit, dpi = 72) {
  switch(unit,
    "in" = x,
    "px" = x / dpi,
    "pt" = x / 72,
    "mm" = x / 25.4,
    "cm" = x / 2.54
  )
}

.ojo_check_dims <- function(width, height, call = rlang::caller_env()) {
  is_pos_num <- function(x) {
    is.numeric(x) && length(x) == 1L && is.finite(x) && x > 0
  }
  if (!is_pos_num(width) || !is_pos_num(height)) {
    rlang::abort(
      "`width` and `height` must each be a single positive, finite number.",
      call = call
    )
  }
  invisible(NULL)
}

.ojo_check_dpi <- function(dpi, call = rlang::caller_env()) {
  is_pos_num <- function(x) {
    is.numeric(x) && length(x) == 1L && is.finite(x) && x > 0
  }
  if (is.character(dpi)) {
    rlang::abort(
      c(
        "`dpi` must be a single number.",
        "x" = paste0("String aliases like '", dpi, "' are not accepted."),
        "i" = paste0(
          "The spec's device resolution matters: '",
          dpi, "' is ",
          if (identical(dpi, "retina")) 320 else "a preset",
          " dpi. Pass the explicit numeric dpi the spec was authored for."
        )
      ),
      call = call
    )
  }
  if (!is_pos_num(dpi)) {
    rlang::abort("`dpi` must be a single positive number.", call = call)
  }
  invisible(NULL)
}

#' Save a plot as PNG through ragg
#'
#' The enforced way to export ojothemes plots to raster output. Always
#' renders with [ragg::agg_png()], so bundled fonts resolve identically on
#' every platform.
#'
#' `unit` accepts any of `"in"`, `"px"`, `"pt"`, `"mm"`, `"cm"` so
#' communications specs can be passed verbatim:
#'
#' - `unit = "px"` is dpi-relative: pixels are converted to physical size as
#'   `px / dpi`. Unspecified dpi defaults to 72 (1 px = 1/72 in, matching
#'   the graphics device convention). If the spec was authored against a
#'   different resolution (e.g. 144 or 300), pass it explicitly.
#' - `unit = "pt"` is absolute: 1 pt = 1/72 in, independent of dpi.
#' - `unit = "in"`, `"mm"`, `"cm"` are absolute physical sizes.
#'
#' @param plot A ggplot object (or any grid-drawable object).
#' @param filename File name; must end in `.png`.
#' @param width,height Dimensions in `unit`.
#' @param unit One of `"in"`, `"px"`, `"pt"`, `"mm"`, `"cm"`.
#' @param dpi Resolution in dots per inch. Must be a single number; string
#'   aliases (e.g. `"retina"`) are rejected. Defaults to 72.
#' @param ... Passed on to [ggplot2::ggsave()] (e.g. `scale`, `limitsize`,
#'   `bg`).
#'
#' @return The saved file path, invisibly.
#'
#' @examples
#' \dontrun{
#'   ojo_save_png(p, "plot.png", width = 7, height = 5, unit = "in")
#'   ojo_save_png(p, "plot.png", width = 1080, height = 675, unit = "px", dpi = 144)
#'   ojo_save_png(p, "plot.png", width = 504, height = 360, unit = "pt")
#' }
#' @export
ojo_save_png <- function(plot, filename, width, height,
                         unit = c("in", "px", "pt", "mm", "cm"),
                         dpi = 72, ...) {
  unit <- rlang::arg_match(unit)
  .ojo_check_dims(width, height)
  .ojo_check_dpi(dpi)

  ggplot2::ggsave(
    filename,
    plot = plot,
    device = ragg::agg_png,
    width = .ojo_to_inches(width, unit, dpi),
    height = .ojo_to_inches(height, unit, dpi),
    units = "in",
    dpi = dpi,
    ...
  )

  invisible(filename)
}

#' Save a plot as SVG through svglite
#'
#' Vector export via [svglite::svglite()]. SVG is resolution-independent:
#' dimensions are recorded in inches and text is specified in points, so the
#' file scales cleanly to any display or print size. All units are absolute
#' physical sizes (`"px"` is not meaningful for vector output and is not
#' accepted).
#'
#' @inheritParams ojo_save_png
#' @param filename File name; must end in `.svg`.
#' @param ... Passed on to [ggplot2::ggsave()].
#'
#' @return The saved file path, invisibly.
#'
#' @examples
#' \dontrun{
#'   ojo_save_svg(p, "plot.svg", width = 178, height = 125, unit = "mm")
#' }
#' @export
ojo_save_svg <- function(plot, filename, width, height,
                         unit = c("in", "mm", "cm", "pt"), ...) {
  unit <- rlang::arg_match(unit)
  .ojo_check_dims(width, height)

  ggplot2::ggsave(
    filename,
    plot = plot,
    device = svglite::svglite,
    width = .ojo_to_inches(width, unit),
    height = .ojo_to_inches(height, unit),
    units = "in",
    ...
  )

  invisible(filename)
}
