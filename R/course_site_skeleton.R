#' @title course_site_skeleton
#' @param path The path to be used to generate the templates
#' @importFrom xfun read_utf8 in_dir sans_ext same_path write_utf8 with_ext
#' @export
course_site_skeleton <- function(path) {

  # ensure directory exists
  dir.create(path, recursive = TRUE, showWarnings = FALSE)

  # copy 'resources' folder to path
  resources = bookdown_file('rstudio', 'templates', 'project', 'resources')

  files = list.files(resources, recursive = TRUE, include.dirs = FALSE)

  source = file.path(resources, files)
  target = file.path(path, files)
  file.copy(source, target)

  # add book_filename to _bookdown.yml and default to the base path name
  # f = file.path(path, '_bookdown.yml')
  # x = read_utf8(f)
  # write_utf8(c(sprintf('book_filename: "%s"', basename(path)), x), f)

  TRUE
}
