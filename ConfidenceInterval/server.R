shinyServer(function(input, output) {
  
  # You can access the value of the widget with input$text, e.g.
  output$value <- renderPrint({
      calculateOneProportion()
    })
  
  calculateOneProportion <- reactive({
    p <- as.numeric(input$onePHat)
    q <- 1-p
    n <- as.numeric(input$nText)
    cl <- as.numeric(input$confidenceInterval)
    cl <- (1-(cl/100))/2 + cl/100
    tStar <- qnorm(cl)
    error <- tStar*(sqrt((p*q)/n))
    #left <- a-error
    #right <- a+error
    
    return(c(paste("Margin Of Error is", toString(error)),
           paste("Confidence Interval: (", toString(p-error), ",", toString(p+error), ")")))
  })
  
  output$value2 <- renderPrint({
    calculateTwoSample()
  })
  
  calculateTwoSample <- reactive({
    mean <- as.numeric(input$oneSMean)
    sd <- as.numeric(input$oneSSD)
    n <- as.numeric(input$OneSNText)
    cl <- as.numeric(input$oneSConfidenceInterval)
    cl <- (1-(cl/100))/2 + cl/100
    tStar <- qt(cl, n-1)
    error <- tStar*(sd/sqrt(n))
    #left <- a-error
    #right <- a+error
    
    return(c(paste("Margin Of Error is", toString(error)),
             paste("Confidence Interval: (", toString(mean-error), ",", toString(mean+error), ")")))
  })
  
  
})