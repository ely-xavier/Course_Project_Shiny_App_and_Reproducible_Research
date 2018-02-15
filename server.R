#
# This is the server logic of a Shiny web application. 

library(shiny)
library(ggplot2)
library(dplyr)

#select data
power <- read.csv("power_data.csv")

# Define server logic required to draw a plot
shinyServer(function(input, output) {
  output$distPlot <- renderPlot({
    # build a linear regression model
    fit <- lm(power~vacuum, power) 
    # predicts the power
    pred <- predict(fit, newdata = data.frame(vacuum = input$vacuum))
    
    # draw the graph (with ggplot2)
    plot <- ggplot(data = power, aes(x = vacuum, y = power)) +
            geom_smooth(method = "lm")+
            geom_vline(xintercept = input$vacuum, color = "blue")+
            geom_hline(yintercept = pred, color = "red")
    plot
    
  })
  
  output$result <- renderText({
          #renders the text for the prediction below the graph
          fit <- lm(power~vacuum, power)
          pred <- predict(fit, newdata = data.frame(vacuum = input$vacuum))
          res <- paste(round(pred, digits = 2), "MW")
  })
  
})
