# OKPI Color Scale

This function returns a ggplot2 color scale using the OKPI main palette.

## Usage

``` r
scale_color_okpi()
```

## Value

A ggplot2 scale object.

## Examples

``` r
library(ggplot2)
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(gear))) +
  geom_point(size = 3) +
  scale_color_okpi()
```
