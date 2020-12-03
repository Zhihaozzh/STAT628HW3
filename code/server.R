#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)
# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {

    busidata<-read.csv("https://raw.githubusercontent.com/Zhihaozzh/STAT628HW3/main/dataprocessing/business_clean.csv")
    freqd<-read.csv("https://raw.githubusercontent.com/Zhihaozzh/STAT628HW3/main/dataprocessing/freqvsstar.csv")
    output$car<-renderPlot(
        {
            barplot(freqd[,5],col = "lightskyblue",main="car")
        }, height = 300, width = 300
    )
    output$desk<-renderPlot(
        {
            barplot(freqd[,6],col = "lightskyblue",main="desk")
        }, height = 300, width = 300
    )
    output$staff<-renderPlot(
        {
            barplot(freqd[,7],col = "lightskyblue",main="staff")
        }, height = 300, width = 300
    )
    output$manager<-renderPlot(
        {
            barplot(freqd[,10],col = "lightskyblue",main="manager")
        }, height = 300, width = 300
    )
    output$clean<-renderPlot(
        {
            barplot(freqd[,13],col = "lightskyblue",main="clean")
        }, height = 300, width = 300
    )
    data<-eventReactive(input$go,{
        citydata<-busidata[which(busidata$city==input$text),]
        citydata[order(-citydata$stars),c(2,5)]
        
    })
    output$distPlot <- renderDataTable({
        head(data(),3)
    })

})
