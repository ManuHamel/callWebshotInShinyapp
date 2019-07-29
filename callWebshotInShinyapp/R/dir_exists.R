#' @export
dir_exists <- function(path)
{
  utils::file_test('-d', path)
}
