test_that("unit conversion is correct", {
  expect_equal(ojothemes:::.ojo_to_inches(7, "in"), 7)
  expect_equal(ojothemes:::.ojo_to_inches(504, "pt"), 7)
  expect_equal(ojothemes:::.ojo_to_inches(177.8, "mm"), 7)
  expect_equal(ojothemes:::.ojo_to_inches(17.78, "cm"), 7)
  expect_equal(ojothemes:::.ojo_to_inches(1080, "px", dpi = 144), 7.5)
  expect_equal(ojothemes:::.ojo_to_inches(1080, "px", dpi = 72), 15)
})

test_that("px and pt specs at 72 dpi are equivalent", {
  expect_equal(
    ojothemes:::.ojo_to_inches(1080, "px", dpi = 72),
    ojothemes:::.ojo_to_inches(1080, "pt")
  )
})

test_that("ojo_save_png rejects string dpi aliases", {
  p <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(displ, hwy)) +
    ggplot2::geom_point()

  expect_error(
    ojo_save_png(p, tempfile(fileext = ".png"), width = 7, height = 5, dpi = "retina"),
    "dpi"
  )
  expect_error(
    ojo_save_png(p, tempfile(fileext = ".png"), width = 7, height = 5, dpi = "print"),
    "dpi"
  )
})

test_that("ojo_save_png validates dimensions", {
  p <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(displ, hwy)) +
    ggplot2::geom_point()

  expect_error(
    ojo_save_png(p, tempfile(fileext = ".png"), width = -1, height = 5),
    "positive"
  )
  expect_error(
    ojo_save_png(p, tempfile(fileext = ".png"), width = c(7, 8), height = 5),
    "single positive, finite number"
  )
})

read_png_dims <- function(path) {
  raw <- readBin(path, what = "raw", n = 24)
  stopifnot(identical(raw[1:8], as.raw(c(0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A))))
  c(
    width = unpack_int(raw[17:20]),
    height = unpack_int(raw[21:24])
  )
}

unpack_int <- function(raw) {
  sum(as.integer(raw) * 256^(3:0))
}

test_that("ojo_save_png produces exact pixel dimensions", {
  skip_if_not_installed("ragg")
  p <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(displ, hwy)) +
    ggplot2::geom_point()

  f1 <- tempfile(fileext = ".png")
  ojo_save_png(p, f1, width = 2100, height = 1500, unit = "px", dpi = 300)
  expect_equal(as.numeric(read_png_dims(f1)), c(2100, 1500))

  f2 <- tempfile(fileext = ".png")
  ojo_save_png(p, f2, width = 7, height = 5, unit = "in", dpi = 300)
  expect_equal(as.numeric(read_png_dims(f2)), c(2100, 1500))
})

test_that("unit specs round-trip to pixel-identical PNGs", {
  skip_if_not_installed("ragg")
  p <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(displ, hwy)) +
    ggplot2::geom_point() +
    ggplot2::labs(title = "Open Justice Oklahoma")

  f_in <- tempfile(fileext = ".png")
  f_pt <- tempfile(fileext = ".png")
  f_mm <- tempfile(fileext = ".png")

  ojo_save_png(p, f_in, width = 7, height = 5, unit = "in", dpi = 300)
  ojo_save_png(p, f_pt, width = 504, height = 360, unit = "pt", dpi = 300)
  ojo_save_png(p, f_mm, width = 177.8, height = 127, unit = "mm", dpi = 300)

  expect_identical(
    unname(tools::md5sum(f_in)),
    unname(tools::md5sum(f_pt))
  )
  expect_identical(
    unname(tools::md5sum(f_in)),
    unname(tools::md5sum(f_mm))
  )
})

test_that("ojo_save_svg writes a nonempty svg file", {
  skip_if_not_installed("svglite")
  p <- ggplot2::ggplot(ggplot2::mpg, ggplot2::aes(displ, hwy)) +
    ggplot2::geom_point()

  f <- tempfile(fileext = ".svg")
  ojo_save_svg(p, f, width = 178, height = 125, unit = "mm")
  expect_true(file.exists(f))
  expect_gt(file.size(f), 0)
  lines <- paste(readLines(f, n = 5), collapse = " ")
  expect_match(lines, "svg", fixed = TRUE)

  expect_error(
    ojo_save_svg(p, tempfile(fileext = ".svg"), width = 7, height = 5, unit = "px"),
    "`unit`"
  )
})
