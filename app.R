# ------------------------------------------------------------
# Number Guessing Game (R Shiny)
# Run in RStudio: open this file -> click "Run App"
# or:  Rscript -e "shiny::runApp('.')"
# ------------------------------------------------------------
library(shiny)

source("R/game_functions.R")

ui <- fluidPage(
  titlePanel("🎯 Number Guessing Game"),
  sidebarLayout(
    sidebarPanel(
      numericInput("guess", "Enter your guess:", value = 50, min = 1, max = 100),
      actionButton("guess_btn", "🎯 Guess"),
      actionButton("new_game", "🔄 New Game")
    ),
    mainPanel(
      h3("Guess a number between 1 and 100"),
      h3(textOutput("result")),
      h4(textOutput("attempts"))
    )
  )
)

server <- function(input, output, session) {
  secret   <- reactiveVal(new_secret())
  attempts <- reactiveVal(0)
  result   <- reactiveVal("Result: Start guessing!")
  won      <- reactiveVal(FALSE)

  observeEvent(input$guess_btn, {
    if (won()) {
      result("Game over! Click New Game to play again.")
      return()
    }
    if (!is_valid_guess(input$guess)) {
      result("Please enter a whole number between 1 and 100.")
      return()
    }
    attempts(attempts() + 1)
    outcome <- check_guess(input$guess, secret())
    if (outcome == "Correct") {
      won(TRUE)
      result(paste0("🎉 Correct! You Won in ", attempts(), " attempts!"))
    } else {
      result(paste("Result:", outcome))
    }
  })

  observeEvent(input$new_game, {
    secret(new_secret())
    attempts(0)
    won(FALSE)
    result("Result: Start guessing!")
  })

  output$result   <- renderText(result())
  output$attempts <- renderText(paste("Attempts:", attempts()))
}

shinyApp(ui, server)
