library(shiny)
library(webshot)
library(subprocess)
library(callWebshotInShinyapp)

#### if necessary... install_phantomjs()

file_Webshot_Modif_Exist(repertoire_defaut = "C:\\Users\\Emanuel Hamel\\Dropbox\\Answers Stack Overflow\\Call Webshot in Shinyapp\\callWebshotInShinyapp\\Modified Javascript File")

server <- function(session, input, output)
{
  output$distPlot <- renderPlot({
                                   hist(rnorm(input$obs), col = 'darkgray', border = 'white')
                                })

  observeEvent(input$screenshot,
               {
                  cdat <- session$clientData
                  url <- paste0(cdat$url_protocol,"//",cdat$url_hostname,":", cdat$url_port, cdat$url_pathname, cdat$url_search)
                  print("Selected URL")
                  print(url)
                  path_to_file <- '"C:/Users/Emanuel Hamel/Dropbox/Answers Stack Overflow/Call Webshot in Shinyapp/callWebshotInShinyapp/Save Screenshot PNG/webshot.png"'
                  lien_vers_package <- system.file(package = "webshot")
                  path_to_webshot_js <- '"C:/Users/Emanuel Hamel/Documents/R/win-library/3.6/webshot/webshot_modif.js"'
                  arg1 <- paste0("[{\'url\':\'", url, "\'", ",\'file\':\'", path_to_file, "\'}]")
                  path_To_Phantom <- find_phantom()
                  args <- c(path_to_webshot_js, arg1)
                  print("start spawn")
                  spawn_process(command = path_To_Phantom, arguments = args)
                  print("done")
               }
              )
}

ui <- fluidPage(
                sidebarLayout(
                                sidebarPanel(
                                              actionButton("screenshot","Take a screenshot"), br(),
                                              sliderInput("obs", "Number of observations:", min = 10, max = 500,
                                                          value = 100)
                                            ),
                                             mainPanel(plotOutput("distPlot"), plotOutput("plot"))
                              )
               )

shinyApp(ui = ui, server = server)

