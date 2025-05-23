% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scales.R
\name{scale_fill_okpi}
\alias{scale_fill_okpi}
\title{OKPI Fill Scale}
\usage{
scale_fill_okpi()
}
\value{
A ggplot2 scale object.
}
\description{
This function returns a ggplot2 fill scale using the OKPI main palette.
}
\examples{
library(ggplot2)
ggplot(mtcars, aes(x = factor(gear), fill = factor(gear))) +
  geom_bar() +
  scale_fill_okpi()
}
