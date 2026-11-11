# gt_base Function

gt_base Function

## Usage

``` r
gt_base(
  data,
  title = NA,
  subtitle = NA,
  font_size = 14,
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
gt_base(data = mtcars, title = "Motor Trend Car Road Tests", subtitle = "From mtcars")
} # }
```
