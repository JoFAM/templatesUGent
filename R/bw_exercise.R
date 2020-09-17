#' R Markdown output format for exercises
#'
#' This format is based on \code{rmarkdown::pdf_document()}, with a
#' custom Pandox LaTeX template. It adapts a number of default values
#' for some of its arguments (eg, \code{keep_tex = TRUE}).
#'
#' @param ... arguments passed to \code{\link[rmarkdown]{pdf_document}()}
#' @inheritParams rmarkdown::pdf_document
#'
#' @return An R Markdown output format.
#' 
#' @section Warning:
#' This function is deprecated and replaced by \code{\link{ugent_notes}}
#'
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "bw_exercise",
#'                   package = "templatesUGent")
#' }
#' @import rmarkdown
#' @export
bw_exercise <- function(..., keep_tex = TRUE){

  res <- system.file(
    "rmarkdown","templates","bw_exercise","resources",
    "template.tex",
    package = "bwtemplate"
  )

  if(res == "") stop("Couldn't find bw_exercise", call. = FALSE)

  fmt <- rmarkdown::pdf_document(..., keep_tex = keep_tex,
                                 template = res)
  fmt$inherits <- "pdf_document"
  fmt

}
#' @section Warning:
#' This function is deprecated and replaced by \code{\link{ugent_notes}}
