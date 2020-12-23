library(shiny)
library(tidyverse)
m<-max(diamonds$carat)
c<-c(diamonds$clarity)
c
ui <- fluidPage(
  sliderInput(inputId="num", label="Choose a Number", value=2.0, min=1, max=m),
  plotOutput("hist"),
  
  selectInput(inputId="Variable", "cuts:",c ),
  plotOutput("ggplot")
)
?renderTable
server <- function(input, output) {
  output$hist <- renderPlot({
    title <- "Histogram 1"
    hist(rnorm(input$num), main=title)
  })
 
  output$ggplot <- renderPlot({
    ggplot(data = diamonds) + 
      geom_point(mapping = aes(x =input$Variable , y = price))
  })
  
  
 
  
}

shinyApp(ui = ui, server = server)
