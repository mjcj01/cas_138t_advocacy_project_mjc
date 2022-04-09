library(shiny)
library(tidyverse)
library(plotly)

ui <- fluidPage(
  titlePanel(h2("School District Expenditures per Student")),
  sidebarLayout(
    sidebarPanel(
      
      selectInput(inputId = "schooldistrict",
                  label = NULL,
                  choices = c(afr_expenditures_all$School.District),
                  selected = NULL),
      checkboxInput("state_avg", "Show State Average Line", FALSE)),
    
    
    mainPanel(
      conditionalPanel("input.state_avg == true", plotlyOutput("districtspending_withstate", height = "600px")),
      conditionalPanel("input.state_avg == false", plotlyOutput("districtspending_nostate", height = "600px")),
      verbatimTextOutput(FALSE),
      
    )
  )
)

server <- function(input, output) {
  schooldistrictInput <- reactive({
    afr_expenditures_all %>% filter(School.District == input$schooldistrict)
  })
  
  output$districtspending_nostate <- renderPlotly({
    validate(
      need(input$schooldistrict, "Please select a school district")
    )
    
    ggplot(data = schooldistrictInput(), aes(x = Year)) +
      geom_line(aes(y = Total.Exp.per.ADM), color = "#0AB6FF", size = 1.5) +
      geom_point(aes(y = Total.Exp.per.ADM), color = "#0AB6FF", size = 3.5) +
      labs(x = "Year", y = "Spending per Student (in USD)") +
      scale_x_continuous(breaks=c(2012,2014,2016,2018,2020)) +
      theme(
        axis.title = element_text(face = "bold", margin = margin(t = 0, r = 100, b = 0, l = 0))
      )
  })
  
  output$districtspending_withstate <- renderPlotly({
    validate(
      need(input$schooldistrict, "Please select a school district")
    )
    
    ggplot(data = schooldistrictInput(), aes(x = Year)) +
      geom_line(aes(y = Total.Exp.per.ADM), color = "#0AB6FF", size = 1.5) +
      geom_point(aes(y = Total.Exp.per.ADM), color = "#0AB6FF", size = 3.5) +
      geom_line(aes(y = state_average_2011_2020$Total.Exp.per.ADM), size = 1.5) +
      geom_point(aes(y = state_average_2011_2020$Total.Exp.per.ADM), size = 3.5) +
      labs(x = "Year", y = "Spending per Student (in USD)") +
      scale_x_continuous(breaks=c(2012,2014,2016,2018,2020)) +
      theme(
        axis.title = element_text(face = "bold")
      )
  })
  
}

shinyApp(ui = ui, server = server)
