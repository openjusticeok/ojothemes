# Use Oklahoma Policy Institute ggplot2 themes

`ojo_set_theme` provides a ggplot2 theme formatted according to the
Oklahoma Policy Institute style guide, with sensible defaults.

## Usage

``` r
ojo_set_theme(
  theme = "okpi",
  base_size = 18,
  base_line_size = 0.5,
  base_rect_size = 0.5,
  scale = "continuous"
)
```

## Arguments

- theme:

  The theme you wish to use. Options are "okpi", "ojo", or "tok".

- base_size:

  The base font size for the theme. All fonts are relative to this
  value.

- base_line_size:

  The base line size for the theme. All line sizes are relative to this
  value.

- base_rect_size:

  The base rect size for the theme. All rect sizes are relative to this
  value.

- scale:

  For `theme_ojo_map()`. Should the legend theme be continuous or
  discrete?
