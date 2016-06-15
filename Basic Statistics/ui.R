library(shiny)


shinyUI(pageWithSidebar(
  
  
  headerPanel("1-Var Statistics Calculator"),
  
  
  sidebarPanel(
    
    p("Data input:"),
    p('Put each value '),
    p('on its own line'),
    tags$textarea(id="textarea.in", rows=30, cols=10, "")
    
  ),
  
  
  mainPanel(
   
  
               
               h3("Statistics"),
               verbatimTextOutput("textarea.out"),
               
               br(),
               
               h3("Histogram"),
               
               plotOutput("distPlot"),
               
               h3("Box plot"),
               
               plotOutput("boxPlot")
               
             
      )
      
     
    
  
))