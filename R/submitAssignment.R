
submitAssignment <- function() {
  # should get a list of assignments from DB
  ui <- miniPage(
    includeHighlightJs(),
    gadgetTitleBar("Submit Assignment"),
    miniContentPanel(
      h4("Sumbit assingment"),
      hr(),
      stableColumnLayout(
        selectInput("assignment_type", "Assignment", c("HW00", "HW01", "HW02")),
        submitButton("Submit")
      ),
      verbatimTextOutput("result")
    )
  )
  server <- function(input, output, session) {
    # Get the document context.
    context <- rstudioapi::getActiveDocumentContext()
    output$result <- renderText({
      paste("Input text is:", context$path)
    })
    observeEvent(input$done, {
      invisible(stopApp())
    })
  }
  viewer <- dialogViewer("Sumbit Assignment", width = 800, height = 600)
  runGadget(ui, server, viewer = viewer)
}