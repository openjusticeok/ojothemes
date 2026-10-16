test_that("bundled fonts are registered and resolvable", {
  fonts <- ojo_fonts()

  ss3 <- fonts[fonts$family == "Source Sans 3", ]
  expect_true(ss3$available)
  # On machines where the family is already installed/registered, the
  # system/registry font provides it instead of the bundle.
  expect_true(ss3$source %in% c("bundled", "local", "fetched", "system"))
})

test_that("bundled fonts expose real weights and italics", {
  regular <- systemfonts::glyph_info("H", family = "Source Sans 3", size = 100)
  bold <- systemfonts::glyph_info("H", family = "Source Sans 3", size = 100, weight = "bold")
  italic <- systemfonts::glyph_info("H", family = "Source Sans 3", size = 100, italic = TRUE)

  expect_gt(bold$width, regular$width)
  # True italics have different metrics than regular (synthetic slant keeps
  # advance widths identical).
  expect_gt(abs(italic$width - regular$width) / regular$width, 0.01)
})

test_that("ojo_fonts reports all known families", {
  fonts <- ojo_fonts()
  expect_setequal(
    fonts$family,
    c("Source Sans 3", "Myriad Pro")
  )
  expect_true(all(c("family", "available", "source", "path") %in% names(fonts)))
})
