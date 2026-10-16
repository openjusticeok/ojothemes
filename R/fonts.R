# Font layer for ojothemes ------------------------------------------------
#
# Fonts are bundled under inst/fonts/ and registered explicitly through
# systemfonts at package load. Explicit registration (rather than relying on
# directory scanning or system installs) guarantees identical font matching
# and text metrics on every platform, so plots render pixel-identically
# across Windows, macOS, and Linux.
#
# The bundled font is a variable font (SIL OFL licensed):
#   - Source Sans 3 (weights 200-900 + italics)
# systemfonts resolves weight/italic faces from the variable font file.

.ojo_bundled_fonts <- list(
  "Source Sans 3" = list(
    plain      = "SourceSans3-VF.ttf",
    bold       = "SourceSans3-VF.ttf",
    italic     = "SourceSans3-Italic-VF.ttf",
    bolditalic = "SourceSans3-Italic-VF.ttf"
  )
)

# Theme font constants: every theme uses the bundled Source Sans 3.
.ojo_font_opi <- "Source Sans 3"
.ojo_font_tok <- "Source Sans 3"

# Families commonly requested by analysts. Proprietary fonts (e.g. Myriad
# Pro) cannot be bundled or downloaded; see ojo_fonts() and the vignette.
.ojo_analyst_fonts <- c("Myriad Pro")

.ojo_known_fonts <- function() {
  c(names(.ojo_bundled_fonts), .ojo_analyst_fonts)
}

# Directories scanned for local font files (systemfonts' `./fonts` and
# `~/fonts` convention) plus the session tempdir used by require_font().
.ojo_local_font_dirs <- function() {
  local_dirs <- c(
    tempdir(),
    normalizePath("./fonts", mustWork = FALSE),
    normalizePath(path.expand("~/fonts"), mustWork = FALSE)
  )
  unique(normalizePath(local_dirs, mustWork = FALSE))
}

#' Register the bundled fonts with systemfonts
#'
#' Called in `.onLoad()`. Registration is conflict-safe: if a family with the
#' same name is already visible (system-installed or registered from
#' `./fonts`), the existing font wins and no error is raised.
#'
#' @noRd
ojo_register_fonts <- function() {
  fonts_dir <- system.file("fonts", package = "ojothemes")

  for (family in names(.ojo_bundled_fonts)) {
    spec <- lapply(.ojo_bundled_fonts[[family]], function(f) {
      file.path(fonts_dir, f)
    })
    if (any(!file.exists(unlist(spec)))) {
      rlang::warn(
        c(
          paste0("Bundled font files for '", family, "' are missing."),
          "i" = "Plots using this family will fall back to a default font."
        )
      )
      next
    }
    tryCatch(
      {
        do.call(systemfonts::register_font, c(list(name = family), spec))
      },
      error = function(e) NULL
    )
  }

  # Tabular-figures variant for aligned numerals in tables
  tryCatch(
    {
      systemfonts::register_variant(
        "Source Sans 3 Tabular",
        "Source Sans 3",
        features = systemfonts::font_feature(tnum = 1)
      )
    },
    error = function(e) NULL
  )

  # Base pdf()/postscript() devices can't resolve variable-font families
  # (e.g. when R CMD check runs .Rd examples). Alias each bundled family to
  # the default Type1 font so those devices work; real rendering goes
  # through systemfonts (ragg/svglite), which resolves the actual font.
  tryCatch(
    {
      sans <- grDevices::pdfFonts("sans")$sans
      for (family in names(.ojo_bundled_fonts)) {
        do.call(grDevices::pdfFonts, stats::setNames(list(sans), family))
      }
    },
    error = function(e) NULL
  )

  invisible(NULL)
}

# Does the family actually exist in the registry or on the system?
# (match_fonts() silently remaps missing families to a best match, so we
# can't rely on it alone to detect availability.)
.ojo_family_present <- function(family) {
  if (family %in% systemfonts::registry_fonts()$family) {
    return(TRUE)
  }
  family %in% systemfonts::system_fonts()$family
}

#' Check which ojothemes fonts are available
#'
#' `ojo_fonts()` reports where each font family used by ojothemes resolves
#' from on the current machine. Use it to diagnose font issues before
#' rendering or exporting plots.
#'
#' Families sourced from `"bundled"` are shipped inside the package and are
#' always available. `"local"` fonts come from the project's `./fonts`
#' directory (or `~/fonts`), which is the supported workflow for proprietary
#' fonts that cannot be redistributed, such as Adobe Myriad Pro: place
#' licensed `.otf`/`.ttf` files in a `fonts/` folder next to your project
#' and they will be found automatically.
#'
#' @param families Font families to check. Defaults to all fonts known to
#'   ojothemes: the bundled font and common analyst fonts.
#'
#' @return A `data.frame` with columns `family`, `available`, `source`
#'   (`"bundled"`, `"local"`, `"fetched"`, `"system"`, or `"missing"`), and
#'   `path`.
#'
#' @examples
#' ojo_fonts()
#' @export
ojo_fonts <- function(families = .ojo_known_fonts()) {
  fonts_dir <- system.file("fonts", package = "ojothemes")

  rows <- lapply(families, function(family) {
    if (!.ojo_family_present(family)) {
      return(data.frame(
        family = family,
        available = FALSE,
        source = "missing",
        path = NA_character_,
        stringsAsFactors = FALSE
      ))
    }
    match <- tryCatch(
      systemfonts::match_fonts(family),
      error = function(e) NULL
    )
    if (is.null(match)) {
      data.frame(
        family = family,
        available = FALSE,
        source = "missing",
        path = NA_character_,
        stringsAsFactors = FALSE
      )
    } else {
      path <- match$path[[1]]
      source <- if (startsWith(path, fonts_dir)) {
        "bundled"
      } else if (startsWith(path, tempdir())) {
        "fetched"
      } else if (any(startsWith(path, .ojo_local_font_dirs()))) {
        "local"
      } else {
        "system"
      }
      data.frame(
        family = family,
        available = TRUE,
        source = source,
        path = path,
        stringsAsFactors = FALSE
      )
    }
  })

  out <- do.call(rbind, rows)
  rownames(out) <- NULL
  out
}
