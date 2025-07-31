#' Calculate font size adjustments based on label count heuristics
#'
#' This function analyzes the data to determine if font size adjustments are needed
#' based on the number of labels that will be displayed on axes.
#'
#' @param data A data frame containing the plot data
#' @param x_var The variable name for x-axis (optional)
#' @param y_var The variable name for y-axis (optional)
#' @param facet_vars Vector of variable names used for faceting (optional)
#' @param max_labels_x Maximum number of x-axis labels before shrinking font (default: 10)
#' @param max_labels_y Maximum number of y-axis labels before shrinking font (default: 20)
#' @param shrink_factor The factor by which to shrink font size (default: 0.8)
#' @param heuristics Character vector of heuristics to apply. Can be "all", "none", or specific heuristics like "shrink_font_many_labels"
#'
#' @return A list containing font size multipliers for different plot elements
#' @export
calculate_font_size_heuristics <- function(data,
                                           x_var = NULL,
                                           y_var = NULL,
                                           facet_vars = NULL,
                                           max_labels_x = 10,
                                           max_labels_y = 20,
                                           shrink_factor = 0.8,
                                           heuristics = "all") {
  
  # Initialize default multipliers (no adjustment)
  adjustments <- list(
    axis_text_x = 1.0,
    axis_text_y = 1.0,
    axis_title_x = 1.0,
    axis_title_y = 1.0,
    strip_text = 1.0
  )
  
  # Check if heuristics should be applied
  if ("none" %in% heuristics || length(heuristics) == 0) {
    return(adjustments)
  }
  
  # Apply shrink_font_many_labels heuristic
  if ("all" %in% heuristics || "shrink_font_many_labels" %in% heuristics) {
    
    # Count unique labels for x-axis
    if (!is.null(x_var) && x_var %in% names(data)) {
      x_labels <- length(unique(data[[x_var]]))
      if (x_labels > max_labels_x) {
        # Calculate shrink factor based on how much we exceed the threshold
        shrink_multiplier <- max(shrink_factor, max_labels_x / x_labels)
        adjustments$axis_text_x <- shrink_multiplier
        adjustments$axis_title_x <- shrink_multiplier
      }
    }
    
    # Count unique labels for y-axis
    if (!is.null(y_var) && y_var %in% names(data)) {
      y_labels <- length(unique(data[[y_var]]))
      if (y_labels > max_labels_y) {
        # Calculate shrink factor based on how much we exceed the threshold
        shrink_multiplier <- max(shrink_factor, max_labels_y / y_labels)
        adjustments$axis_text_y <- shrink_multiplier
        adjustments$axis_title_y <- shrink_multiplier
      }
    }
    
    # Count unique labels for faceting variables
    if (!is.null(facet_vars) && length(facet_vars) > 0) {
      for (var in facet_vars) {
        if (var %in% names(data)) {
          facet_labels <- length(unique(data[[var]]))
          # For facets, we use a more conservative threshold
          if (facet_labels > 6) {
            shrink_multiplier <- max(shrink_factor, 6 / facet_labels)
            adjustments$strip_text <- min(adjustments$strip_text, shrink_multiplier)
          }
        }
      }
    }
  }
  
  return(adjustments)
}

#' Apply font size heuristics to a ggplot theme
#'
#' This is a helper function that can be used to modify theme elements based on
#' font size heuristics calculated from data.
#'
#' @param theme_obj A ggplot2 theme object
#' @param adjustments A list of font size adjustments (from calculate_font_size_heuristics)
#' @param base_size The base font size used in the theme
#'
#' @return A modified ggplot2 theme object
#' @export
apply_font_size_heuristics <- function(theme_obj, adjustments, base_size = 14) {
  
  # Apply adjustments to the theme
  theme_obj <- theme_obj + 
    ggplot2::theme(
      axis.text.x = ggplot2::element_text(size = base_size * adjustments$axis_text_x),
      axis.text.y = ggplot2::element_text(size = base_size * adjustments$axis_text_y),
      axis.title.x = ggplot2::element_text(size = base_size * adjustments$axis_title_x),
      axis.title.y = ggplot2::element_text(size = base_size * adjustments$axis_title_y),
      strip.text = ggplot2::element_text(size = base_size * adjustments$strip_text)
    )
  
  return(theme_obj)
}