# OJO caption text

Creates the text for a caption to add to ggplots and gt tables,
including consistent default "source: " statements.

## Usage

``` r
ojo_make_caption(analyst_name = NA, source = NA)
```

## Arguments

- analyst_name:

  The name of the analyst to credit

- source:

  The domain / source of the data. Can be one of "oscn", "ocdc", or
  "ppb" for canned text, NA for no source, or a custom string.

## Value

A string with the caption text
