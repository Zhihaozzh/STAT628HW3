#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
library(shinythemes)
# Define UI for application that draws a histogram
shinyUI(
    dashboardPage(
        dashboardHeader(title="Suggestions about hotels",titleWidth=300),
        
        dashboardSidebar(
            sidebarMenu(
                menuItem(text="About",tabName="about",icon=icon("clipboard")),
                
                         menuItem("Hotel owner",tabName="data",icon=icon("database")),
                         menuItem("Customer",tabName="customer",icon=icon("database")),
               
                
                menuItem("Link to git",tabName="link",icon=icon("code") )
                
            )
        ),
    
    
    dashboardBody(
        tabItems(
            tabItem(tabName = "about",
                    fluidPage(
                        theme=shinytheme("flatly"),
                        p("In this project, we utilize different types of analysis to help hotel owners better serve their customers and get higher star ratings on Yelp. Some results are pretty surprising like people don't care much on whether hotel would provide free WiFi. And we deeply understand that our results rely on some assumptions which are not perfectly matched. Besides, every result is associated with 5% type I error. They bring some uncertainty to our conclusion. Anyway, we hope the analysis above could help hotel owners to make reliable decision and get better and better.")
                    )),
            tabItem(tabName = "data",
                    fluidPage(
                        theme=shinytheme("flatly"),
                        h1("Do you want to ask:"),
            
                        tags$ol(
                            tags$li("Features for hotels to improve their star ratings. For example, should hotel provides free WiFi?"),
                            tags$li("How to improve the performance of hotel to better serve their customers according to customers' reviews on Yelp. For example, is it important to update old facilities?")
                        ),
                        h1("Frequency based suggestions"),
                        tags$ol(
                            tags$li("Customer tend to mention the word \"car\" more when they rate lower"),
                            plotOutput("car", height = 300, width = 300),
                            p("which may suggest that they need places(or cheaper places) to park their cars."),
                            tags$li("Customer tend to mention the word \"desk\" more when they rate lower"),
                            plotOutput("desk", height = 300, width = 300),
                            p("which may suggest that they need desks to use their laptops."),
                            tags$li("Customer tend to mention the word \"staff\" more when they rate higher"),
                            plotOutput("staff", height = 300, width = 300),
                            p("which may suggest that outstanding performance of staff easily leave customers a nice impression."),
                            tags$li("Customer tend to mention the word \"manager\" more when they rate lower"),
                            plotOutput("manager", height = 300, width = 300),
                            p("which may suggest that a manager who can handle trivials well is necessary."),
                            tags$li("Customer tend to mention the word \"clean\" more when they rate higher"),
                            plotOutput("clean", height = 300, width = 300),
                            p("which may suggest that a clean place is significant.")
                        )
                        
                    )
                    ),
            tabItem(tabName = "customer",
                    
                    fluidPage(
                        theme=shinytheme("flatly"),
                        # Application title
                        titlePanel("Top three hotels for you"),
                        
                        # Sidebar with a slider input
                        sidebarLayout(
                            sidebarPanel(
                                textInput("text", label = h3("Which city do you want to go to"), value = "Beachwood"),
                                actionButton(inputId = "go",label = "Update")
                            ),
                            
                            mainPanel(
                                dataTableOutput("distPlot")
                            )
                        )
                    )
                    ),
            tabItem(tabName = "link",
                    p("Any advice? Welcome to our github"),
                    a("our github",href="https://github.com/Zhihaozzh/STAT628HW3"))
        )
    )
   )
)
