#' @export
is_solaris <- function()
{
  Sys.info()[['sysname']] == 'SunOS'
}
