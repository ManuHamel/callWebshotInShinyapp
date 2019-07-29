#' @export
file_Webshot_Modif_Exist <- function(repertoire_defaut = "C:\\Users\\Emanuel Hamel\\Dropbox\\Answers Stack Overflow\\Call Webshot in Shinyapp\\callWebshotInShinyapp\\Modified Javascript File")
{
  lien_vers_package <- system.file(package = "webshot")
  lien_vers_fichiers <- paste0(lien_vers_package, "/", "webshot_modif.js")
  bool_File <- file.exists(lien_vers_fichiers)
  if(bool_File == FALSE)
  {
    file.copy(from = paste0(repertoire_defaut, "/", "webshot_modif.js"),
              to = lien_vers_fichiers)
    print("file webshot_modif.js has been copied")
  }else
  {
    print("the file already exists!")
  }
}
