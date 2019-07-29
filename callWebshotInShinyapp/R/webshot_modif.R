#' @export
webshot_modif <- function(url, path_to_file,
                          path_to_webshot_js = '"C:/Users/Emanuel Hamel/Documents/R/win-library/3.5/webshot/webshot_modif.js"')
{
  library(webshot)
  arg1 <- paste0("[{\'url\':\'", url, "\'", ",\'file\':\'", path_to_file, "\'}]")
  path_To_Phantom <-  find_phantom()
  args <- c(path_to_webshot_js, arg1)
  system2(command = path_To_Phantom,
          args = args,
          stdout = TRUE)
}
