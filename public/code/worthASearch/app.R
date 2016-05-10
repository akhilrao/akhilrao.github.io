# worthASearchApp

library(shiny)

ui <- fluidPage(
  headerPanel('Is this worth a search?'),
  sidebarPanel(
    numericInput(inputId="v",label="Searcher's willingness-to-pay for item", 1000,
                 min = 0),
    numericInput(inputId="c", label='Search cost', 5,
                 min = 0),
    numericInput(inputId="n", label='Number of sellers in search region', 50,
                 min = 0),
    numericInput(inputId="p", label='Average price for item in region',750,min=0),
    h4("Benchmark search (black line): Expected value of searching for a car in a city"),
    h6("WTP for a car (v): $6,000"),
    h6("Number of sellers in city (n): 20"),
    h6("Probability average seller has an acceptable car (s): 0.25"),
    h6("Average price of a car (p): $5,000"),
    h6("Average search cost (c): $7"),
    h6("Expected quality of a seller (b) = (p/n)*((1-p^n)/(1-p))"),
    h6("Expected value of one search = b*(v-p)-c")
  ),
  mainPanel(
    plotOutput(outputId="plot1")
  )
)

server <- function(input, output) {
  
  P.s <- seq(0,0.9,by=0.01)
  baseline.v <- 6000
  baseline.n <- 20
  baseline.p <- 5000
  baseline.c <- 7
  baseline.b <- (P.s/baseline.n)*((1-P.s^baseline.n)/(1-P.s))
  baseline <- baseline.b*(baseline.v-baseline.p) - baseline.c
  
  output$plot1 <- renderPlot({
    b <- (P.s/input$n)*((1-P.s^input$n)/(1-P.s))
    plot( (b*(input$v-input$p)-input$c) ,type="l",main="Expected value of one search", xlab="Probability average seller has desired item", ylab="EV(search)",xaxt="n",col=2)
 axis(1,at=1:91,labels=P.s)
    lines(baseline,col=1)
    abline(h=0,col=1)
     })

}

shinyApp(ui = ui, server = server)
