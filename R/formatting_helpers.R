#' Helper functions with sensible defaults

#' OJO caption text
#' @description
#' Creates the text for a caption to add to ggplots and gt tables, including consistent default "source: " statements.
#'
#' @param domain The type / domain of the data. Must be "oscn", "ocdc", "ppb",
#' @param name The name of the analyst to credit
ojo_make_caption <- function(analyst_name = NA,
                        domain = NA){

  # Check that given domain is in the list of options
  allowed_domains <- c("oscn", "ocdc", "ppb", NA)
  domain <- tolower(domain)
  domain <- match.arg(domain, choices = allowed_domains)

  domain_text <- dplyr::case_when(
    domain == "oscn" ~ "Source: OK Policy Institute analysis of Oklahoma State Courts Network data.",
    domain == "ocdc" ~ "Source: OK Policy Institute analysis of data from the Oklahoma County Detention Center's 'Jailtracker' system.",
    domain == "ppb" ~  "Source: OK Policy Institute analysis of Oklahoma Pardon and Parole Board records.",
    is.na(domain) ~ ""
  )

  # Construct the caption text
  analyst_name_text <- if(!is.na(analyst_name)){
    paste0("Chart created by ", analyst_name, ".")
  } else {
    ""
  }

  caption <- paste0(domain_text,
                    dplyr::if_else(!is.na(analyst_name) & !is.na(domain), "\n", ""), # Add a newline if both are not NA
                    analyst_name_text)

  return(caption)
}
