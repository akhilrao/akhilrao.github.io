# conditionalProbApp

library(shiny)

ui <- fluidPage(
  headerPanel('Conditional probability calculator'),
  sidebarPanel('Input parameters for events of interest. ',
    numericInput(inputId="event.a",label='Occurrences of event A', 150,
      min = 0),
    numericInput(inputId="event.b", label='Occurrences of event B', 500,
                 min = 0),
    numericInput(inputId="population.a", label='Population size for event A', 1000,
                 min = 0),
    numericInput(inputId="population.b", label='Population size for event B', 1000,
                 min = 0),
    h4("Comparison event (black line): probability(died in USA in 2010|85 or older in USA in 2010)"),
    h6("Number of deaths in USA in 2010 (event A): 2,550,000"),
    h6("Population over 85 in USA in 2010 (event B): 5,176,000"),
    h6("Total US population in 2010 (population size, N_A = N_B): 310,000,000"),
    h6("P(A|B)=P(B|A)*(P(A)/P(B))")
  ),
  mainPanel(
    plotOutput(outputId="plot1")
  )
)

server <- function(input, output) {
  
  P.b.given.a <- seq(0,1,by=0.01)
  ones <- rep(1,length=length(P.b.given.a))
  baseline.pa <- 2550000/310000000
  baseline.pb <- 5176000/310000000
  baseline <- pmin(P.b.given.a*(baseline.pa/baseline.pb),ones)
  
  output$plot1 <- renderPlot({
    plot(pmin(P.b.given.a*((input$event.a/input$population.a)/(input$event.b/input$population.b)),ones),type="l",main="Probability of A given B", xlab="Assumed P(B|A)", ylab="P(A|B)",xaxt="n", ylim=c(0,1),col=2)
 axis(1,at=1:101,labels=P.b.given.a)
    lines(baseline,col=1)
     })

}

shinyApp(ui = ui, server = server)
