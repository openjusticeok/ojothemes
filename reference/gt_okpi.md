# gt_okpi Function

gt_okpi Function

## Usage

``` r
gt_okpi(
  data,
  title = NA,
  subtitle = NA,
  font_size = 14,
  chosen_font = "Roboto Condensed",
  format_cols = TRUE,
  analyst_name = NA,
  source = NA
)
```

## Arguments

- data:

  A data frame to be converted into a gt table.

- title:

  Optional. A title for the table. Default is NA.

- subtitle:

  Optional. A subtitle for the table. Default is NA.

- font_size:

  The font size for the table. Default is 14.

- chosen_font:

  The font family to use. Default is Roboto Condensed.

- format_cols:

  Should gt::fmt_auto() be applied to all cols?

- analyst_name:

  The name of the analyst to credit in the footnote

- source:

  The source / domain of the data

## Value

A gt table based on the input data frame with specified modifications.

## Examples

``` r
if (FALSE) { # \dontrun{
okpi_gt(data = mtcars, title = "Motor Trend Car Road Tests", subtitle = "From mtcars")
} # }
```
