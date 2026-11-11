# OJO version of the ggproto GeomCol object

This is a near-exact copy of the default ggplot2 GeomCol ggproto object.
The only difference is that I've adjusted it to make the default column
width smaller. This ensures that it looks right no matter what the scale
of the data you're using.

## Usage

``` r
GeomColOJO
```

## Format

An object of class `GeomCol` (inherits from `GeomRect`, `Geom`,
`ggproto`, `gg`) of length 4.
