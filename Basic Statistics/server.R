library(shiny)
library(psych)
library(beeswarm)
library(rsconnect)



shinyServer(function(input, output) {
  
  options(warn=-1)
  
  bs <- reactive({
    x <- input$textarea.in
    x <- as.numeric(unlist(strsplit(x, "[\n, \t]")))
    result <- describe(x)[2:5]
    summary <- summary(x)
    return(list(result, summary))
  })
  
  

  makedistPlot <- function(){
    x <- input$textarea.in
    x <- as.numeric(unlist(strsplit(x, "[\n, \t]")))
    
    x <- x[!is.na(x)]
    
    h <- hist(x, las=1, breaks="FD",
               main="", col = "cyan")

  }
  
  
  output$distPlot <- renderPlot({
   makedistPlot()
  })
  
  
  
  makeboxPlot <- function(){
    x <- input$textarea.in
    x <- as.numeric(unlist(strsplit(x, "[\n, \t]")))
    
    boxplot(x, horizontal=TRUE)
    
  
  }
  
  
  output$boxPlot <- renderPlot({
    makeboxPlot()
  })
  
  
  

  
  
  output$textarea.out <- renderPrint({
    bs()
  })
  
  
})
