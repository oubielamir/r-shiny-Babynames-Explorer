library(shiny)
library(ggplot2)
library(dplyr)
library(babynames)

ui <- fluidPage(

    titlePanel("Baby Name Explorer"),

    sidebarLayout(
      sidebarPanel(textInput('name', 'Enter Name')),
      mainPanel(plotOutput('trend'))

    )

)


server <- function(input, output, session){

  output$trend <- renderPlot({

    data_name <- subset(babynames, name == input$name)

    ggplot(data_name, aes(year, prop, color = sex)) + geom_line()

  })

}

shinyApp(ui = ui, server = server)










