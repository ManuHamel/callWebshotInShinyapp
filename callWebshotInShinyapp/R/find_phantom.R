#' @export
find_phantom <- function(quiet = FALSE)
{
  path <- Sys.which( "phantomjs" )
  if(path != "") return(path)

  for(d in phantom_paths())
  {
    exec <- if (is_windows()) "phantomjs.exe" else "phantomjs"
    path <- file.path(d, exec)
    if(utils::file_test("-x", path)) break else path <- ""
  }

  if(path == "")
  {
    # It would make the most sense to throw an error here. However, that would
    # cause problems with CRAN. The CRAN checking systems may not have phantomjs
    # and may not be capable of installing phantomjs (like on Solaris), and any
    # packages which use webshot in their R CMD check (in examples or vignettes)
    # will get an ERROR. We'll issue a message and return NULL; other

    if(!quiet)
    {
      message(
        "PhantomJS not found. You can install it with webshot::install_phantomjs(). ",
        "If it is installed, please make sure the phantomjs executable ",
        "can be found via the PATH variable."
      )
    }
    return(NULL)
  }
  path.expand(path)
}
