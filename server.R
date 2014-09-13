#Project
library(shiny)
library(UsingR)
library(caret)
library(car)
library(Hmisc)

data(mtcars)
mtcars$am <- as.factor(mtcars$am)
mtcars$cyl <- as.factor(mtcars$cyl)
mtcars$gear <- as.factor(mtcars$gear) 
levels(mtcars$am) <- c("Auto", "Manual")

##this creates a linear regression model using train function in caret package
model <- train(mpg~hp+cyl+gear+am+wt, data = mtcars, method = "lm")

##this is a function to calculate the mpg based on the input from the user
predictmpg <- function(hp, wt, cyl, gear, am) {
  newdata = data.frame(hp=hp, cyl = as.factor(cyl), gear = as.factor(gear), am = as.factor(am), wt = wt)
  predict(model, newdata)  
}

shinyServer(
  function(input, output) {
    output$predmpg <- renderPrint({predictmpg(input$hp, input$wt, input$cyl, input$gear, input$am)})
  }
)
