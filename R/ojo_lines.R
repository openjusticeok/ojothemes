ojo_lines <- function(data,
                      x,
                      y,
                      ...,
                      color_variable = NA,
                      facet_variable = NA,
                      legend_labels = "default",
                      facet_labels = "default",
                      custom_color_palette = NA,
                      number_of_columns = 1,
                      legend_n_rows = 1,
                      data_to_highlight = NA,
                      highlight_color = "#cf0000",
                      highlight_legend_label = NA,
                      add_covid_labels = FALSE) {
  # Create strings from inputs
  x_string <- deparse(substitute(x))
  if (is.symbol(substitute(y)) | is.language(substitute(y))) {
    y_string <- deparse(substitute(y))
  } else if (is.language(substitute(y))) {
    y_string <- sapply(substitute(y)[-1], function(x) deparse(x))
    y_string <- str_flatten(y_string)
  } else {
    y_string <- y
  }
  color_variable_string <- deparse(substitute(color_variable))
  facet_variable_string <- deparse(substitute(facet_variable))
  # if (color_variable_string == "variable") {
  #   color_variable_string <- ""
  # }

  # Regex selection of the x, y, and color_variable columns.
  regex_columns <-
    paste0(
      x_string,
      "|",
      if_else(
        color_variable_string == "variable",
        "",
        paste0(color_variable_string, "|")
      ),
      if_else(
        facet_variable_string == "" | facet_variable_string == "NA",
        "",
        paste0(facet_variable_string, "|")
      ),
      y_string
    )
  plot_data <- data |>
    select(matches(regex_columns))

  # Construct wide data to input to ggplot based on the color_variable input
  if (color_variable_string == "") {
    plot_data <-
      plot_data |>
      pivot_longer(!{{ x }}, names_to = "variable", values_to = "value")

    p <-
      plot_data |>
      ggplot(aes(x = {{ x }}, y = value, color = variable))

    number_of_variables <-
      plot_data |>
      distinct(variable) |>
      pull() |>
      length()
  } else {
    plot_data <-
      plot_data |>
      pivot_longer(
        !any_of(c(x_string, color_variable_string, facet_variable_string)),
        names_to = "variable", values_to = "value"
      )

    p <-
      plot_data |>
      ggplot(aes(x = {{ x }}, y = value, color = {{ color_variable }}))

    number_of_variables <-
      plot_data |>
      distinct({{ color_variable }}) |>
      pull() |>
      length()
  }

  # Format labels for use in ggplot
  if (any(legend_labels == "default") & length(legend_labels) == 1) {
    legend_labels <- plot_data |>
      distinct(.data[[color_variable_string]]) |>
      pull()
    names(legend_labels) <- legend_labels
  } else if (any(!is.na(legend_labels))) {
    color_variable_values <- plot_data |>
      distinct(.data[[color_variable_string]]) |>
      pull()
    legend_labels <- rep(legend_labels, length(color_variable_values))
    names(legend_labels) <- color_variable_values
  }
  if (any(facet_labels == "default") & length(facet_labels) == 1) {
    facet_labels <- plot_data |>
      distinct({{ facet_variable }}) |>
      pull()
    names(facet_labels) <- facet_labels
  }

  # Optional labels for covid eviction moratoriums.
  if (add_covid_labels == TRUE) {
    label_data <-
      plot_data |>
      summarise(maxValue = max(value), .by = variable)
    p <-
      p +
      covid_eviction_labels(label_data = label_data)
  }

  p <-
    p +
    geom_line(linewidth = 1.5) +
    geom_point(shape = 19, size = 2)

  # Add optional highlighting of certain data points.
  if (is.object(data_to_highlight)) {
    data_to_highlight <- data_to_highlight |>
      select(matches(regex_columns)) |>
      pivot_longer(
        !any_of(c(x_string, color_variable_string)),
        names_to = "variable", values_to = "value"
      )

    p <- p +
      geom_point(data = data_to_highlight, shape = 19, size = 2, aes(color = highlight_color))

    p <- p +
      scale_color_manual(
        values = c(
          highlight_color,
          ojo_pal[1:number_of_variables]
        )
      ) +
      guides(color = guide_legend(
        order = 1, # Ensures the "color" legend items come first.
        override.aes = list(
          shape = rep(19, number_of_variables + 1),
          linetype = 0,
          size = 3,
          fill = NA
        ),
        nrow = legend_n_rows
      ))

    # Customize color palette
    if (any(!is.na(custom_color_palette))) {
      p <- p +
        scale_color_manual(
          values = c(
            highlight_color,
            custom_color_palette[1:number_of_variables]
          )
        )
    }

    # Add custom labels for legend
    if (any(!is.na(legend_labels))) {
      highlight_legend_label <- highlight_legend_label
      names(highlight_legend_label) <- highlight_color

      if (any(!is.na(custom_color_palette))) {
        p <- p +
          scale_color_manual(
            values = c(
              highlight_color,
              custom_color_palette[1:number_of_variables]
            ),
            labels = c(highlight_legend_label, legend_labels)
          )
      } else {
        p <- p +
          scale_color_manual(
            values = c(
              highlight_color,
              ojo_pal[1:number_of_variables]
            ),
            labels = c(highlight_legend_label, legend_labels)
          )
      }
    }
  } else {
    p <- p +
      scale_color_manual(values = ojo_pal[1:number_of_variables]) +
      guides(color = guide_legend(
        order = 1, # Ensures the "color" legend items come first.
        override.aes = list(
          shape = rep(19, number_of_variables),
          linetype = 0,
          size = 3,
          fill = NA
        ),
        nrow = legend_n_rows
      ))

    # Customize color pallette
    if (any(!is.na(custom_color_palette))) {
      p <- p +
        scale_color_manual(values = custom_color_palette[1:number_of_variables])
    }

    # Add custom labels for legend
    if (any(!is.na(legend_labels))) {
      if (any(!is.na(custom_color_palette))) {
        p <- p +
          scale_color_manual(
            values = custom_color_palette[1:number_of_variables],
            labels = legend_labels
          )
      } else {
        p <- p +
          scale_color_manual(
            values = ojo_pal[1:number_of_variables],
            labels = legend_labels
          )
      }
    }
  }

  p <- p +
    scale_y_continuous(labels = scales::label_comma())

  p <- p +
    geom_point(shape = 21, size = 2, stroke = 1, color = "black")

  if (facet_variable_string != "NA") {
    p <-
      p +
      facet_wrap(
        vars({{ facet_variable }}),
        ncol = number_of_columns, scales = "free",
        labeller = as_labeller(facet_labels)
      )
  }

  p <-
    p +
    custom_ojo_theme() +
    theme(
      axis.title = element_blank()
    )

  if (any(is.na(facet_labels)) & length(facet_labels) == 1) {
    p <-
      p +
      theme(
        strip.text = element_blank()
      )
  }


  # TODO: Add Option to Change BG Color (Default to White or Transparent?)
  # if (any(!is.na(background_color))) {
  #     p <- p +
  #       theme(
  #         plot.background = element_rect(fill = background_color)
  #       )
  # }

  return(p)
}
