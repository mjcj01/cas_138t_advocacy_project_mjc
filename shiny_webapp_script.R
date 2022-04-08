library(shiny)

ui <- fluidPage(
  titlePanel(h2("School District Expenditures per Student")),
  sidebarLayout(
    sidebarPanel(
      
      selectInput(inputId = "schooldistrict",
                  label = "Choose a School District",
                  choices = c(afr_expenditures_all$School.District),
                  selected = "Bermudian Springs SD")),
    
    mainPanel(
      plotOutput("districtspending")
    )
  )
)

server <- function(input, output) {
 schooldistrictInput <- reactive({
   afr_expenditures_all %>% filter(School.District == input$schooldistrict)
 })
 
 output$districtspending <- renderPlot({
   
   schooldistrict <- schooldistrictInput()
   ggplot(schooldistrict, aes(x = Year, y = Total.Exp.per.ADM)) +
     geom_line()
   
 })
 
}

shinyApp(ui = ui, server = server)
