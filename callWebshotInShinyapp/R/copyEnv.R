#' @export
copyEnv <- function(from, to, names = ls(from, all.names = TRUE))
{
  mapply(assign, names, mget(names, from), list(to), SIMPLIFY = FALSE, USE.NAMES = FALSE)
  invisible(NULL)
}
