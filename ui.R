
library(shiny)
install.packages("devtools")
install.packages("Rcpp")
library(devtools)
library(Rcpp)
install_github('ramnathv/rCharts', force= TRUE)

# Define UI 
shinyUI(fluidPage(
          titlePanel("USA, India, and World population growth 1960-2009"),
          
          
          # Sidebar 
          sidebarLayout(
                    sidebarPanel(
                              helpText("Learn the population growth pattern between",
                                
                                  "the USA< India & World 1960 until 2009."),
                              br(),
                              radioButtons(inputId = "Variable", 
                                           label = "Select a Variable:", 
                                           choices = c("US Population", "World Population", "India Population"), 
                                           selected = "US Population"), 
                              br(),
                              sliderInput("range",
                                          label = "Years to display:",
                                          min = 1960,
                                          max = 2009,
                                          value = c(1960, 2009), 
                                          format = "0000"), 
                              br(),
                              helpText("The values for the years from 1960",
                                       "and later are existing forecasts.", 
                                       "Please hover over the lines to get exact",
                                       "values or click on the Raw Data tab.",
                                       "For more infomation on how the data was", 
                                       "collected and how the app works,",
                                       "please check the ", tags$a(href="https://rpubs.com/Laughing_Lamp", "project documentation"),
                                       "and whole code and data can",
                                       tags$a(href="https://rpubs.com/Laughing_Lamp", "be found here.")),
                              br() 
                    )),
                    
                    # Show the plot 
                    mainPanel(
                              tabsetPanel(
                                        tabPanel("Plot",showOutput("plot", "highcharts")),
                                        tabPanel("Raw Data", dataTableOutput("table"))
                                       
                              )
                    )
          )
)