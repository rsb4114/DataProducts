#Project
library(shiny)
library(UsingR)
library(caret)
library(car)
library(Hmisc)

data(mtcars)
mtcars$am <- as.factor(mtcars$am); 
mtcars$cyl <- as.factor(mtcars$cyl); 
mtcars$gear <- as.factor(mtcars$gear); 
levels(mtcars$am) <- c("Auto", "Manual")

##this is to set the minumum and maximum limits for inputs
##the prediction function is based on these inputs
minwt <- min(mtcars$wt)
maxwt <- max(mtcars$wt)
meanwt <- mean(mtcars$wt)
minhp <- min(mtcars$hp)
maxhp <- max(mtcars$hp)
meanhp <- mean(mtcars$hp)

shinyUI(pageWithSidebar(
  headerPanel("MTCARS: Predicting MPG For Your Car!!"),
  sidebarPanel(
    sliderInput('wt', 'Weight (lb/1000)',value = meanwt, min = minwt, max = maxwt, step = 0.05),
    sliderInput('hp', 'Gross horsepower',value = meanhp, min = minhp, max = maxhp, step = 1),
    sliderInput('cyl', 'Number of Cylinders', value = 4, min = 4, max = 8, step = 2),
    sliderInput('gear', 'Number of forward gears', value = 3, min = 3, max = 5, step = 1),
    radioButtons("am", "Transmission Auto/Manual", c("Auto","Manual")),
    submitButton('Submit')
  ),
  mainPanel(
    p('Predicted MPG (Miles/(US) gallon) for your car'),
    textOutput('predmpg'),
    p(em("Documentation:",a("Project Details",href="index.html")))
  )
))