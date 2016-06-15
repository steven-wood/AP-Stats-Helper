shinyUI(fluidPage(
  
  # Copy the line below to make a text input box
 
  
  #hr(),
  h1("Confidence Interval Calculator"),
  tabsetPanel(
    tabPanel("One Propotion",  textInput("onePHat", label = h3("p̂ Hat"), value = "Enter the p̂ hat..."),
             textInput("nText", label = h3("N"), value = "Enter N..."),
             textInput("confidenceInterval", label = h3("Confidence Level (Out of 100)"), value = "Enter the Confidence Level..."),
             fluidRow(column(10, verbatimTextOutput("value")))
    ),
   
    tabPanel("One Sample t-Interval",
             textInput("oneSmean", label = h3("mean"), value = "Enter the mean"),
             textInput("oneSSD", label = h3("Standard Deviation"), value = "Enter Standard Deviation..."),
             textInput("OneSNText", label = h3("N"), value = "Enter N..."),
             textInput("oneSConfidenceInterval", label = h3("Confidence Level (Out of 100)"), value = "Enter the Confidence Level..."),
             fluidRow(column(10, verbatimTextOutput("value2")))
    ),
    tabPanel("Table", tableOutput("table"))
  )
  
))