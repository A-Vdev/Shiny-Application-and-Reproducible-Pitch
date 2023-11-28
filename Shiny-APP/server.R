#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
data(iris)

# Define server logic 
function(input, output) {
    thematic::thematic_shiny()
    output$summaryTable <- renderDT({
        data.frame(iris)
    
        })
    output$DataSummary <- renderPrint({
        if(input$ShowSummary){summary(iris)}
        })
    
    output$irisBoxPlot<-renderPlotly({
        p<-ggplot(iris, aes_string(x = iris$Species, y = input$variable_box, fill = "Species")) +
            geom_boxplot() +
            labs(title = paste("Trend of", input$variable_box, "across Species"),
                 x = "Species", y = input$variable_box)
        
        if(input$showPoints){
            p<-p+geom_jitter()
        }
        ggplotly(p)
    
    })
    # Reactive expression to filter the dataset based on the selected variables
    filtered_data <- reactive({
        iris[, c("Species", input$variable_scatter_x, input$variable_scatter_y)]
    })
    
    output$irisScatterPlot <- renderPlotly({
        p_scatter <- ggplot(filtered_data(), aes(x = .data[[input$variable_scatter_x]], 
                                                 y = .data[[input$variable_scatter_y]], 
                                                 color = Species)) +
            geom_point(size = 1, alpha = 0.7) +
            labs(title = paste("Scatter Plot of", input$variable_scatter_y, "vs", input$variable_scatter_x),
                 x = input$variable_scatter_x, y = input$variable_scatter_y)
        
        #Add trend lines if the checkbox is checked
        if (input$showTrendLine) {
            p_scatter <- p_scatter + geom_smooth(method = "lm", se = FALSE)
        }
        ggplotly(p_scatter)
    })
}


