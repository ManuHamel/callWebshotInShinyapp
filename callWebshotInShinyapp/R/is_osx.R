#' @export
is_osx <- function()
{
  Sys.info()[['sysname']] == 'Darwin'
}
