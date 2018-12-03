library(shiny)
ui <- fluidPage(
  sliderInput(inputId = "num",
              label="choose a number",
              value=25, min = 1, max=100),
  textInput(inputId = "title",
            label="write a title",
            value = "Histogram of Normal Random Values"),
  actionButton(inputId = "clicks",label="Click me"),
  actionButton(inputId = "go", label="Update"),
  actionButton(inputId = "norm",label="Normal"),
  actionButton(inputId = "unif",label="Uniform"),
  plotOutput("hist"),
  plotOutput("hist2"),
  verbatimTextOutput("stats")
)

server <- function(input, output) {
  rv <- reactiveValues(data2 = rnorm(100))
  
  observeEvent(input$norm, {
               rv$data2 <- rnorm(100)
  })
  observeEvent(input$unif, {
    rv$data2 <- runif(100)
  })
  data <- eventReactive(input$go,{
    rnorm(input$num)
    })
  output$hist <- renderPlot({
    hist(data(), main = input$title)
  })
  output$stats <- renderPrint({
    summary(data())
  })
  observeEvent(input$clicks, {
    print(as.numeric(input$clicks))
  })
  output$hist2 <- renderPlot({
    hist(rv$data2)
  })
}

shinyApp(ui = ui, server = server)