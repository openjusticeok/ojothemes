test_that("font size heuristics work correctly", {
  # Test data with many labels 
  test_data <- data.frame(
    district = paste("District", 1:30),  # 30 districts (exceeds threshold)
    cases = sample(100:1000, 30),
    type = rep(c("Type A", "Type B"), 15)
  )
  
  # Test calculate_font_size_heuristics
  adjustments <- calculate_font_size_heuristics(
    data = test_data,
    y_var = "district",
    x_var = "cases",
    max_labels_y = 20,
    heuristics = "shrink_font_many_labels"
  )
  
  # Y-axis should be shrunk because we have 30 districts > 20 threshold
  expect_lt(adjustments$axis_text_y, 1.0)
  expect_lt(adjustments$axis_title_y, 1.0)
  
  # X-axis should not be shrunk (numeric data, not many labels)
  expect_equal(adjustments$axis_text_x, 1.0)
  expect_equal(adjustments$axis_title_x, 1.0)
  
  # Test with heuristics = "none"
  no_adjustments <- calculate_font_size_heuristics(
    data = test_data,
    y_var = "district", 
    heuristics = "none"
  )
  
  expect_equal(no_adjustments$axis_text_y, 1.0)
  expect_equal(no_adjustments$axis_title_y, 1.0)
})

test_that("theme functions accept heuristics parameters", {
  # Test that themes can be created with new parameters
  expect_no_error(theme_ojo(heuristics = "all"))
  expect_no_error(theme_ojo(heuristics = "none"))
  expect_no_error(theme_ojo(heuristics = "shrink_font_many_labels"))
  
  expect_no_error(theme_okpi(heuristics = "all"))
  expect_no_error(theme_tok(heuristics = "all"))
  
  # Test with font_size_adjustments
  adjustments <- list(axis_text_y = 0.8, axis_title_y = 0.8)
  expect_no_error(theme_ojo(font_size_adjustments = adjustments))
  expect_no_error(theme_okpi(font_size_adjustments = adjustments))
  expect_no_error(theme_tok(font_size_adjustments = adjustments))
})

test_that("font size calculations are reasonable", {
  # Test with extreme number of labels
  many_labels_data <- data.frame(
    category = paste("Category", 1:50), # 50 categories
    value = 1:50
  )
  
  adjustments <- calculate_font_size_heuristics(
    data = many_labels_data,
    y_var = "category",
    max_labels_y = 20,
    shrink_factor = 0.8,
    heuristics = "shrink_font_many_labels"
  )
  
  # Should shrink but not too much (minimum shrink_factor)
  expect_gte(adjustments$axis_text_y, 0.4)  # 20/50 = 0.4, should use this instead of 0.8
  expect_lt(adjustments$axis_text_y, 1.0)
})