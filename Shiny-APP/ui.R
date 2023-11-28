#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
library(DT)
# Define UI for application that draws a histogram
shinyUI(
navbarPage("IRIS Trend Data Analysis Application",
    tabPanel("Analysis",
    fluidPage(

    # Application title
    titlePanel("Iris Trend data Analysis"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        
        sidebarPanel(width=3,
                     h3("About Data"),
                     div("iris is a data frame with 150 cases (rows) and 5 variables
                (columns) named Sepal.Length, Sepal.Width, Petal.Length, Petal.Width, and Species."),
            selectInput("variable_box", "Select Variable for Boxplot:", choices = c(
                "Sepal Length"="Sepal.Length",
                "Sepal Width"="Sepal.Width",
                "Petal Length"="Petal.Length",
                "Petal Width"="Petal.Width"
                
            ),selected = "Sepal Length"),
            checkboxInput("showPoints", "Show Data Points", value = TRUE),
            selectInput("variable_scatter_x", "Select Variable for Scatter Plot (X):", choices = c(
                "Sepal Length"="Sepal.Length",
                "Sepal Width"="Sepal.Width",
                "Petal Length"="Petal.Length",
                "Petal Width"="Petal.Width")),
            selectInput("variable_scatter_y", "Select Variable for Scatter Plot (Y):", choices = c(
                "Sepal Length"="Sepal.Length",
                "Sepal Width"="Sepal.Width",
                "Petal Length"="Petal.Length",
                "Petal Width"="Petal.Width")),
            checkboxInput("showTrendLine", "Show Trend Line", value = TRUE),
            checkboxInput("ShowSummary",'Show Summary Of the Data',value=TRUE),
            br(),br(),
            mainPanel(verbatimTextOutput("DataSummary"))
           
        ),

        # Show a plot of the generated distribution
        mainPanel( 
    
            column(width=6,plotlyOutput("irisBoxPlot", height = "600px", width = "800px")),
            br(),br(),
            column(width=8,plotlyOutput("irisScatterPlot",height = "600px", width = "800px")),
            
        )
    )
)),
tabPanel("Data",
            h2("Edgar Anderson's Iris Data: Description"),
            div(" This famous (Fisher's or Anderson's) iris data set gives the measurements in 
                centimeters of the variables sepal length and width and petal length and width, 
                respectively, for 50 flowers from each of 3 species of iris. The species are Iris setosa, 
                versicolor, and virginica.","\n","The data were collected by Anderson, Edgar (1935). 
                The irises of the Gaspe Peninsula, Bulletin of the American Iris Society, 59, 2–5."),
            br(),br(),
         h3("Reference"),
         div("The data were collected by Anderson, Edgar (1935). The irises of the Gaspe Peninsula, 
             Bulletin of the American Iris Society, 59, 2–5."),
         br(),br(),
            h3("DATA:",
               br(),br(),
               
            mainPanel(
                # Data Summary
                DTOutput("summaryTable"))),
         br(),br(),
         
         ),



tabPanel("About Iris Trend Data Analysis",
         h2("About the Iris Trend data Analysis Application"),
         div(" The primary goal of the Iris Trend Data Analysis 
             Application is to empower users, including researchers, 
             analysts, and enthusiasts, to explore and understand the 
             Iris dataset interactively. By offering descriptive statistics,
             visualizations, and the potential for linear regression analysis, 
             the application facilitates data-driven decision-making
             and hypothesis generation."),
             br(),br(),
             h4("The source code for this application can be found
                            on GitHub:",
             br(),br(),
             a(href = "https://github.com/A-Vdev/Shiny-Application-and-Reproducible-Pitch.git",
               "https://github.com/A-Vdev/Shiny-Application-and-Reproducible-Pitch.git")),
            
         
         
         )

))
