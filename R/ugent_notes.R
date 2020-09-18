#' R Markdown output format for exercises
#'
#' This format is based on \code{rmarkdown::pdf_document()}, with a
#' custom Pandox LaTeX template. The argument \code{keep_tex} is passed
#' explicitly to make clear that the tex files can be saved for
#' incorporation in a complete course.
#' 
#' @param ... arguments passed to \code{\link[rmarkdown]{pdf_document}()}
#' @inheritParams rmarkdown::pdf_document
#'
#' @return An R Markdown output format.
#'
#' @examples
#' \dontrun{
#' rmarkdown::draft("MyArticle.Rmd", template = "ugent_notes",
#'                   package = "templatesUGent")
#' }
#' @import rmarkdown
#' @export
ugent_notes <- function(..., keep_tex = FALSE){
  
  res <- system.file(
    "rmarkdown","templates","ugent_notes","resources",
    "template.tex",
    package = "templatesUGent"
  )
  
  if(res == "") stop("Couldn't find ugent_notes", call. = FALSE)
  
  fmt <- rmarkdown::pdf_document(..., keep_tex = keep_tex,
                                 template = res,
                                 pandoc_args = c(
                                   "--top-level-division=chapter"))
  fmt$inherits <- "pdf_document"
  fmt
  
}
