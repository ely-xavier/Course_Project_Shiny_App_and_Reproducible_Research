#This is the user-interface definition of a Shiny web application.

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Electrical Power Output Prediction of Combined Cycle Power Plant at Full Load"),
  
  # Inputs
  sidebarLayout(
    sidebarPanel(
        helpText("This application predicts the electrical power output of a combined 
                 power plant based on Exhaust Vacuum (cm Hg) and set to work at full load"),
        h3(helpText("Select:")),
                
        sliderInput("vacuum",
                    "Exhaust Vacuum (cm Hg):",
                    min = 25.36,
                    max = 81.56,
                    step = 0.01,
                    value = 54.31)
    
    ),
    
    # Show a plot of the generated prediction
    mainPanel(
       plotOutput("distPlot"),
       h4("Predicted Power Output (MW):"),
       h3(textOutput("result"))
    )
  )
))