library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Transfer Credit Analysis"),
        sidebarPanel(
                h3('Introduction'),
                br(),
                selectInput("program", "Choose a program:",
                            choices = c("General Education" = "All", "Biology" = "Biology", "Communication" = "Communication", "English" = "English", "Social" = "Social", "Math" = "Math"), selected = "General Education"),
                br(),
                p("This application will plot the number of credit hours transferred to Ferris State University from other programs for the past six years. You may plot the data for all ten courses or just specific programs by making the appropriate selection above. These data have been fitted with a simple linear model. The 95% confidence interval of the model is indicated by the shaded area.")


        ),
        mainPanel(
                h3('Transfer Credits Over Time'),
                plotOutput('view')
        )
))
