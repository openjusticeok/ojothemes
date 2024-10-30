#' OJO caption text
#' @description
#' Creates the text for a caption to add to ggplots and gt tables, including consistent default "source: " statements.
#'
#' @export
#' @param source The domain / source of the data. Can be one of "oscn", "ocdc", or "ppb" for canned text, NA for no source, or a custom string.
#' @param name The name of the analyst to credit
ojo_make_caption <- function(analyst_name = NA,
                             source = NA){

  # Check that given source is in the list of options # Removed to allow for custom string
  # allowed_sources <- c("oscn", "ocdc", "ppb", NA)
  # source <- tolower(source)
  # source <- match.arg(source, choices = allowed_sources)

  source_text <- dplyr::case_when(
    # Can add more canned source statements for different datasets / domains here
    source == "oscn" ~ "Source: OK Policy Institute analysis of Oklahoma State Courts Network data.",
    source == "ocdc" ~ "Source: OK Policy Institute analysis of data from the Oklahoma County Detention Center's 'Jailtracker' system.",
    source == "ppb" ~  "Source: OK Policy Institute analysis of Oklahoma Pardon and Parole Board records.",
    is.na(source) ~ "", # If source = NA, just leave that out of the caption
    TRUE ~ source # If source is anything else, just print it verbatim
  )

  # Construct the caption text (could build in analyst emails here too? i.e. "Chart created by Andrew Bell (abell@okpolicy.org)")
  analyst_name_text <- if(!is.na(analyst_name)){
    paste0("Chart created by ", analyst_name, ".")
  } else {
    ""
  }

  caption <- paste0(source_text,
                    dplyr::if_else(!is.na(analyst_name) & !is.na(source), "\n", ""), # Add a newline if both are not NA
                    analyst_name_text)

  return(caption)
}

#' OJO ggplot labels with defaults
#' @description
#' Wrapper for ggplot2::labs() with consistent defaults.
#'
#' @export
#' @param analyst_name The name of the analyst to credit
#' @param source The data source / source of the data.
ojo_labs <- function (...,
                      analyst_name = NA,
                      source = NA){

  # Do we want to build any more QOL stuff into this? Like we could set it up
  # so that it automatically decides when to display an axis label, formats
  # those to be title case, etc.

  ggplot2::labs(
    ...,
    caption = ojo_make_caption(analyst_name = analyst_name, source = source)
  )

}
