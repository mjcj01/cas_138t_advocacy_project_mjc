library(shiny)
library(tidyverse)
library(plotly)
library(rsconnect)

ui <- fluidPage(
  
  titlePanel("School District Expenditures per Student"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(inputId = "schooldistrict",
                  label = NULL,
                  choices = c(afr_expenditures_all$`School District`),
                  selected = NULL),
      checkboxInput("state_avg", "Show State Average Line", FALSE),
      HTML("<p>Data is sourced from the Pennsylvania Department of Education. Click 
           <a href = https://www.education.pa.gov/Teachers%20-%20Administrators/School%20Finances/
           Finances/AFR%20Data%20Summary/Pages/AFR-Data-Summary-Level.aspx>here</a> to access it!</p>"),
      HTML("<p><img src = blue_line.png height = 12.5 width = 25> is the selected school district's decade expenditures per student.</p>"),
      HTML("<p><img src = black_line.png height = 12.5 width = 25> is the average expenditures across the state.</p>")
    ),
    
    mainPanel(
      conditionalPanel("input.state_avg == true", plotlyOutput("districtspending_withstate", height = "600px")),
      conditionalPanel("input.state_avg == false", plotlyOutput("districtspending_nostate", height = "600px")),
      verbatimTextOutput(FALSE),
      
    )
  )
)

server <- function(input, output) {
  
  schooldistrictInput <- reactive({
    afr_expenditures_all %>% filter(`School District` == input$schooldistrict)
  })
  
  output$districtspending_nostate <- renderPlotly({
    validate(
      need(input$schooldistrict, "Please select a school district")
    )
    
    ggplot(data = schooldistrictInput(), aes(x = Year)) +
      geom_line(aes(y = `Expenditures per Student`), color = "#0AB6FF", size = 1.5) +
      geom_point(aes(y = `Expenditures per Student`), color = "#0AB6FF", size = 3.5) +
      labs(x = "Year", y = "Spending per Student (in USD)") +
      scale_x_continuous(breaks=c(2011,2012,2013,2014,2015,2016,2017,2018,2019,2020)) +
      theme(
        axis.title = element_text(face = "bold"),
        legend.position = ("left")
      )
  })
  
  output$districtspending_withstate <- renderPlotly({
    validate(
      need(input$schooldistrict, "Please select a school district")
    )
    
    ggplot(data = schooldistrictInput(), aes(x = Year)) +
      geom_line(aes(y = `Expenditures per Student`), color = "#0AB6FF", size = 1.5) +
      geom_point(aes(y = `Expenditures per Student`), color = "#0AB6FF", size = 3.5) +
      geom_line(aes(y = `Average Expenditures per Student Across PA`), size = 1.5) +
      geom_point(aes(y = `Average Expenditures per Student Across PA`), size = 3.5) +
      labs(x = "Year", y = "Spending per Student (in USD)") +
      scale_x_continuous(breaks=c(2011,2012,2013,2014,2015,2016,2017,2018,2019,2020)) +
      theme(
        axis.title = element_text(face = "bold")
      )
  })
  
}

shinyApp(ui = ui, server = server)
