#' Memor PDF Memo Template
#' @description This function is used to compile the OIR document template
#' @param logo File path to Company logo file. The logo will be printed on
#' the top right corner of the first page and the size will be adjusted to
#' `logo_height`.
#' @param company Company Name as the page footnote. You can input a list of
#' values, such as company name, address, telephone and email.
#' @param short_title A shorten version of the title to be printed on the
#' top-right corner of every page, except the front page.
#' @param watermark Watermark Text to be printed on the page. You can change
#' its color via `watermark_color`.
#' @param confidential T/F value for whether a red confidential sign will
#' be printed.
#' @param libertine T/F. Libertine is a collection of open fonts for western
#' languages. We found it fits this template quite well. Default is `FALSE`
#' though we highly recommend you to turn it on.
#' @param chinese T/F for Chinese language support. Default is `FALSE`.
#' @param logo_height Height of the logo image. This logo image will be scaled
#' to height and the default height is 1.2cm.
#' @param watermark_color Color for the watermark text. Default is "gray".
#' @param footer_on_first_page T/F value for whether the company info footer
#' will be displayed on the front page.
#' @param toc T/F value for table of contents. See ?rmarkdown::pdf_document
#' for details
#' @param lot T/F value for list of tables.
#' @param lof T/F value for list of figures.
#' @param number_sections T/F value for whether sections should be numbered.
#' See ?rmarkdown::pdf_document for details
#' @param fancy_captions T/F value for whether to apply special formatting to
#' captions.
#' @param latex_engine LaTeX engine. See ?rmarkdown::pdf_document for details
#' @param ... other options to be passed to rmarkdown::pdf_document. See
#' ?rmarkdown::pdf_document for details
#'
#' @importFrom rmarkdown pdf_document pandoc_variable_arg
#' @import knitr
#'
#'
#' @export
oir <- function(
                     logo = NULL, company = NULL, short_title = NULL,
                     watermark = NULL, confidential = FALSE,
                     libertine = FALSE, chinese = FALSE,
                     logo_height = "1.2cm", watermark_color = "gray",
                     footer_on_first_page = TRUE,
                     toc = FALSE, lot = FALSE, lof = FALSE,
                     fancy_captions = TRUE,
                     number_sections = TRUE, latex_engine = "xelatex", ...) {

  memor_args <- c()

  if (!is.null(logo)) {
    memor_args <- c(memor_args, pandoc_variable_arg("logo", logo),
                    pandoc_variable_arg("logo_height", logo_height))
  }

  if (!is.null(company)) {
    if (is.list(company) && length(company) > 1) {
      company <- paste(unlist(company),
                       collapse = " \\hspace{.025 in} $\\cdot$ \\hspace{.05 in} ")
    }
    memor_args <- c(memor_args, pandoc_variable_arg("company", company))
  }

  if (!is.null(short_title)) {
    memor_args <- c(memor_args, pandoc_variable_arg("short_title", short_title))
  }

  if (footer_on_first_page) {
    memor_args <- c(memor_args,
                    pandoc_variable_arg("footer_on_first_page", "yes"))
  }

  if (confidential) {
    memor_args <- c(memor_args, pandoc_variable_arg("confidential", "yes"))
  }

  if (libertine) {
    memor_args <- c(memor_args, pandoc_variable_arg("libertine", "yes"))
  }

  if (chinese) {
    memor_args <- c(memor_args, pandoc_variable_arg("chinese", "yes"))
  }

  if (!is.null(watermark)) {
    memor_args <- c(memor_args, pandoc_variable_arg("watermark", watermark),
                    pandoc_variable_arg("watermark_color", watermark_color))
  }

  if (lot) memor_args <- c(memor_args, pandoc_variable_arg("lot", "yes"))
  if (lof) memor_args <- c(memor_args, pandoc_variable_arg("lof", "yes"))

  if (fancy_captions) {
    memor_args <- c(memor_args, pandoc_variable_arg("fancy_captions", "yes"))
  }

  template <- system.file("rmarkdown/templates/oir/resources/oir.tex",
                          package = "wfutemplates")

  config <- bookdown::pdf_document2(
    latex_engine = latex_engine,
    template = template,
    number_sections = number_sections,
    toc = toc,
    ...
  )

  pre_pandoc <- config$pandoc$args
  config$pandoc$args <- c(pre_pandoc, memor_args)

  return(config)
}
