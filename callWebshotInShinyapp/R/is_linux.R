#' @export
is_linux <- function()
{
  Sys.info()[['sysname']] == 'Linux'
}
