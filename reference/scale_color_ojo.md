# OJO Color Scale

This function returns a ggplot2 color scale using the OJO main palette.

## Usage

``` r
scale_color_ojo()
```

## Value

A ggplot2 scale object.

## Examples

``` r
library(ggplot2)
#> 
#> Attaching package: ‘ggplot2’
#> The following objects are masked from ‘package:ojothemes’:
#> 
#>     geom_bar, geom_col, geom_jitter, geom_line, geom_path, geom_point,
#>     geom_step, geom_text
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(gear))) +
  geom_point(size = 3) +
  scale_color_ojo()
```
