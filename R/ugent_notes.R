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
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "bw_exercise",
#'                   package = "bwtemplate")
#' }
#' @import rmarkdown
#' @export
ugent_notes <- function(..., keep_tex = TRUE){
  
  res <- system.file(
    "rmarkdown","templates","ugent_notes","resources",
    "template.tex",
    package = "templatesUGent"
  )
  
  if(res == "") stop("Couldn't find bw_exercise", call. = FALSE)
  
  fmt <- rmarkdown::pdf_document(..., keep_tex = keep_tex,
                                 template = res,
                                 pandoc_args = "--top-level-division=chapter")
  fmt$inherits <- "pdf_document"
  fmt
  
}
