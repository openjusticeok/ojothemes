.onAttach <- function(libname, pkgname) {

  # set os options
  if (.Platform$OS.type == "windows") {
    packageStartupMessage("Setting Windows options...")
    grDevices::windows.options(width = 8.33333333333333,
                               height = 5.55555555555556)
    grDevices::windowsFonts(Lato = grDevices::windowsFont("Roboto Mono"))
    grDevices::windowsFonts(FontAwesome = grDevices::windowsFont("FontAwesome"))
  } else {
    packageStartupMessage("Setting Mac/Linux options...")
    grDevices::quartz.options(width = 8.33333333333333,
                              height = 5.55555555555556,
                              dpi = 72)
  }

  # Register the bundled fonts and enable showtext
  # No internet connection required
  tryCatch(
    {
      font_dir <- system.file("fonts", package = "ojothemes")
      registered <- 0L

      if (nzchar(font_dir) && !"Roboto Mono" %in% sysfonts::font_families()) {
        sysfonts::font_add(
          "Roboto Mono",
          regular = file.path(font_dir, "RobotoMono-Regular.ttf"),
          bold = file.path(font_dir, "RobotoMono-Bold.ttf"),
          italic = file.path(font_dir, "RobotoMono-Italic.ttf"),
          bolditalic = file.path(font_dir, "RobotoMono-BoldItalic.ttf")
        )
        registered <- registered + 1L
      }

      if (nzchar(font_dir) && !"Roboto Condensed" %in% sysfonts::font_families()) {
        sysfonts::font_add(
          "Roboto Condensed",
          regular = file.path(font_dir, "RobotoCondensed-Regular.ttf"),
          bold = file.path(font_dir, "RobotoCondensed-Bold.ttf"),
          italic = file.path(font_dir, "RobotoCondensed-Italic.ttf"),
          bolditalic = file.path(font_dir, "RobotoCondensed-BoldItalic.ttf")
        )
        registered <- registered + 1L
      }

      if (registered > 0L) {
        showtext::showtext_auto()
      }
    },
    error = function(e) {
      packageStartupMessage("Could not set up OJO fonts: ", conditionMessage(e))
    }
  )

}
