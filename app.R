library(shiny)
library(tidyverse)
library(plotly)
library(rsconnect)

ui <- fluidPage(
  
  titlePanel("School District Instructional Spending per Student"),
  
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(inputId = "schooldistrict",
                  label = NULL,
                  choices = c(afr_expenditures_all$`School District`),
                  selected = NULL),
      checkboxInput("state_median", "Show State Median Line", FALSE),
      checkboxInput("state_avg", "Show State Average Line", FALSE),
      HTML("<p>Data is sourced from the Pennsylvania Department of Education. Click 
           <a href = https://www.education.pa.gov/Teachers%20-%20Administrators/School%20Finances/Finances/AFR%20Data%20Summary/Pages/AFR-Data-Summary-Level.aspx>here</a> to access it!</p>"),
      HTML("<p><img src = blue_line.png height = 12.5 width = 25> is the selected school district's decade expenditures per student.</p>"),
      HTML("<p><img src = black_line.png height = 12.5 width = 25> is the average expenditures across the state.</p>"),
      HTML("<p>Total Spending per Student calculation includes instruction spending, as well as spending on facilities, support services, and other miscellaneous categories.")
    ),
    
    mainPanel(
      conditionalPanel("input.state_median == true && input.state_avg == false", plotlyOutput("districtspending_median", height = "600px")),
      conditionalPanel("input.state_median == false && input.state_avg == false", plotlyOutput("districtspending", height = "600px")),
      conditionalPanel("input.state_median == true && input.state_avg == true", plotlyOutput("districtspending_both", height = "600px")),
      conditionalPanel("input.state_median == false && input.state_avg == true", plotlyOutput("districtspending_avg", height = "600px")),
      verbatimTextOutput(FALSE),
      
    )
  )
)

server <- function(input, output) {
  
  schooldistrictInput <- reactive({
    afr_expenditures_all %>% filter(`School District` == input$schooldistrict)
  })
  
  ### Showing district spending  
  
  output$districtspending <- renderPlotly({
    validate(
      need(input$schooldistrict, "Please select a school district")
    )
    
    ggplot(data = schooldistrictInput(), aes(x = Year)) +
      geom_line(aes(y = `Instructional Expenditures per Student`), color = "#0AB6FF", size = 1.5) +
      geom_point(aes(y = `Instructional Expenditures per Student`), color = "#0AB6FF", size = 3.5) +
      labs(x = "Year", y = "Total Spending per Student (in USD)") +
      scale_x_continuous(breaks=c(2011,2012,2013,2014,2015,2016,2017,2018,2019,2020)) +
      theme(
        axis.title = element_text(face = "bold"),
        legend.position = ("left")
      )
  })
  
  ### Showing district spending + median line
  
  output$districtspending_median <- renderPlotly({
    validate(
      need(input$schooldistrict, "Please select a school district")
    )
    
    ggplot(data = schooldistrictInput(), aes(x = Year)) +
      geom_line(aes(y = `Instructional Expenditures per Student`), color = "#0AB6FF", size = 1.5) +
      geom_point(aes(y = `Instructional Expenditures per Student`), color = "#0AB6FF", size = 3.5) +
      geom_line(aes(y = `Median Instructional Expenditures per Student Across PA`), color = "#7BFF00", size = 1.5) +
      geom_point(aes(y = `Median Instructional Expenditures per Student Across PA`), color = "#7BFF00", size = 3.5) +
      labs(x = "Year", y = "Total Spending per Student (in USD)") +
      scale_x_continuous(breaks=c(2011,2012,2013,2014,2015,2016,2017,2018,2019,2020)) +
      theme(
        axis.title = element_text(face = "bold")
      )
  })
  
  ### Showing district spending + average line
  
  output$districtspending_avg <- renderPlotly({
    validate(
      need(input$schooldistrict, "Please select a school district")
    )
    
    ggplot(data = schooldistrictInput(), aes(x = Year)) +
      geom_line(aes(y = `Instructional Expenditures per Student`), color = "#0AB6FF", size = 1.5) +
      geom_point(aes(y = `Instructional Expenditures per Student`), color = "#0AB6FF", size = 3.5) +
      geom_line(aes(y = `Average Instructional Expenditures per Student Across PA`), color = "#FF009D", size = 1.5) +
      geom_point(aes(y = `Average Instructional Expenditures per Student Across PA`), color = "#FF009D", size = 3.5) +
      labs(x = "Year", y = "TotalSpending per Student (in USD)") +
      scale_x_continuous(breaks=c(2011,2012,2013,2014,2015,2016,2017,2018,2019,2020)) +
      theme(
        axis.title = element_text(face = "bold")
      )
  })
  
  ### Showing district spending + average line + median line
  
  output$districtspending_both <- renderPlotly({
    validate(
      need(input$schooldistrict, "Please select a school district")
    )
    
    ggplot(data = schooldistrictInput(), aes(x = Year)) +
      geom_line(aes(y = `Instructional Expenditures per Student`), color = "#0AB6FF", size = 1.5) +
      geom_point(aes(y = `Instructional Expenditures per Student`), color = "#0AB6FF", size = 3.5) +
      geom_line(aes(y = `Median Instructional Expenditures per Student Across PA`), color = "#7BFF00", size = 1.5) +
      geom_point(aes(y = `Median Instructional Expenditures per Student Across PA`), color = "#7BFF00", size = 3.5) +
      geom_line(aes(y = `Average Instructional Expenditures per Student Across PA`), color = "#FF009D", size = 1.5) +
      geom_point(aes(y = `Average Instructional Expenditures per Student Across PA`), color = "#FF009D", size = 3.5) +
      labs(x = "Year", y = "Total Spending per Student (in USD)") +
      scale_x_continuous(breaks=c(2011,2012,2013,2014,2015,2016,2017,2018,2019,2020)) +
      theme(
        axis.title = element_text(face = "bold")
      )
  })
}

shinyApp(ui = ui, server = server)
