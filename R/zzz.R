.onLoad <- function(libname, pkgname) {
  # Register the bundled fonts so all rendering goes through a known,
  # identical set of font files on every platform. Best-effort; never
  # blocks load.
  ojo_register_fonts()
}
