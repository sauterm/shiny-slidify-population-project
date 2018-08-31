

library(shiny)
library(rCharts)
library(readr)

pop <- read_csv("mergedpop.csv", col_types = cols(Population = col_number()))
source("Global.R")

options(RCHART_WIDTH = 500)

shinyServer(function(input, output) {
          
          # Generate a chart for the selected Variable
          output$plot <- renderChart2({
                    selected <- input$Variable
                    Variable <- subset(pop, Variable == selected & Year %in% seq(input$range[1], input$range[2], 1))
                    h1 <- hPlot(
                              x = "Year", 
                              y = "Population", 
                              data = Variable, 
                              type = "line")
          })
          
          # Generate an HTML table view of the data
          output$table <- renderDataTable({
                    pop
          })
})