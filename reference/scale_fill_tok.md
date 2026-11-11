# TOK Fill Scale

This function returns a ggplot2 fill scale using the TOK main palette.

## Usage

``` r
scale_fill_tok()
```

## Value

A ggplot2 scale object.

## Examples

``` r
library(ggplot2)
ggplot(mtcars, aes(x = factor(gear), fill = factor(gear))) +
  geom_bar() +
  scale_fill_tok()
```
