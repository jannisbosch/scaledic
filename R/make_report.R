#' Make report
#'
#' Creates and renders a Markdown Document with overview information about items and scales
#'
#' @param data A data frame with dic information
#' @param items A logical expression for any dic attribute (e.g. scale == "ITRF" & subscale == "Int")
#' @param scales If TRUE, variable names are returned instead of a data frame
#' @export

install_github("jannisbosch/scaledic")

library(quarto)
library(devtools)
library(scaledic)

data <- ex_itrf

make_report <- function(data, output_type = "html_document", output_dir = NULL, items = NULL, scales = NULL) {
  quarto::quarto_render(
    input = paste0(system.file(package = "scaledic"), "/rmd/Template.qmd"),
    output_dir = output_dir,
    output_format = output_type,
    params = list(data = data, x1 = items, x2 = scales),
    encoding     = 'UTF-8'
  )
}
make_report(data, output_dir = "abc.qmd", items = "bla", scales = "blubb")

items <- "bla"

quarto::quarto_render(
  input = paste0(system.file(package = "scaledic"), "/rmd/Template.qmd"),
  output_format = "html",
  output_file = "test.qmd",
  execute_params = list(x1 = items)
)
