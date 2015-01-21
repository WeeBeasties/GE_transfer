library(shiny)
library(ggplot2)
data <- read.csv("bigTable.csv",row.names=NULL)

shinyServer(
        function(input, output) {
                programInput  <- reactive({
                        switch(input$program,
                               "Biology" = "Biology",
                               "Communication" = "Communication",
                               "English" = "English",
                               "Communication" = "Communication",
                               "Math" = "Math",
                               "All" = "All",
                               "Social" = "Social")
                })
                output$view <- renderPlot({
                        this.Data <- data[data$Program == input$program, ]
                        ggplot(this.Data, aes(x=Year, y=Total, group=Semester, color=Semester)) +
                                geom_line(size=1) +
                                geom_point(size=4, shape=21, fill="white") +
                                geom_smooth(method='lm', size=1, color="darkgray") +
                                ggtitle(as.character(input$program)) +
                                xlab("\nYear") +
                                ylab("Total Number of Transfer SCH\n") +
                                theme(axis.title.x = element_text(face="bold", colour="#000000", size=12),
                                      axis.title.y = element_text(face="bold", colour="#000000", size=12),
                                      plot.title = element_text(lineheight=1.5, face="bold"))
                })
        })
