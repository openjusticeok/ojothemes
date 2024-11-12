test_that("theme_okpi is stable", {
  data <- tibble::tibble(
    county = c("Tulsa", "Oklahoma"),
    variable1 = c(95, 85),
    variable2 = c(4.25, 3.12),
    variable3 = c("factor1", "factor2")
  )

  vdiffr::expect_doppelganger("demo-theme_okpi", {
    ojo_set_theme()

    ggplot2::ggplot(
      data,
      ggplot2::aes(x = variable1, y = variable2, group = variable3)
    ) +
      geom_col()
  })
})
