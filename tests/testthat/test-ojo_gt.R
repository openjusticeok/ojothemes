test_that("gt_opi style is consistent", {
  data <- tibble::tibble(
    county = c("Tulsa", "Oklahoma"),
    variable1 = c(95, 85),
    variable2 = c(4.25, 3.12),
    variable3 = c("factor1", "factor2")
  )

  vdiffr::expect_doppelganger("demo-gt_opi", {
    gt_opi(
      data,
      title = "A demo table",
      subtitle = "Towards beauty in our tables",
      analyst_name = "Brancen Gregory",
      source = ojo_source_text("oscn")
    )
  })
})
