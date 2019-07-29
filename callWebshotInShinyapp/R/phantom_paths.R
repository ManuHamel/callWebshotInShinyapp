#' @export
phantom_paths <- function()
{
  if(is_windows())
  {
    path <- Sys.getenv('APPDATA', '')

    path <- if (dir_exists(path)) file.path(path, 'PhantomJS')

  }else if(is_osx())
  {
    path <- '~/Library/Application Support'

    path <- if (dir_exists(path)) file.path(path, 'PhantomJS')

  }else
  {
    path <- '~/bin'
  }

  path <- c(path, file.path(system.file(package = 'webshot'), 'PhantomJS'))

  path
}

