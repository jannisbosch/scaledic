#' Make report
#'
#' Creates and renders a Markdown Document with overview information about items and scales
#'
#' @param data A data frame with dic information
#' @param items A logical expression for any dic attribute (e.g. scale == "ITRF" & subscale == "Int")
#' @param scales If TRUE, variable names are returned instead of a data frame
#' @export

make_report <- function(data, output_type = "html_document", output_dir = NULL, items = NULL, scales = NULL) {
  rmarkdown::render(
    input = paste0(system.file(package = "scaledic"), "/rmd/Template.Rmd"),
    output_dir = output_dir,
    output_format = output_type,
    params = list(data = data, x1 = items, x2 = scales),
    encoding     = 'UTF-8'
  )
}

