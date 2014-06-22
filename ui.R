library(shiny)
shinyUI(pageWithSidebar(
        headerPanel("Bayesian Inference"),
        sidebarPanel(
                h3('Control box'),
                p("bionomial distribution"),
                numericInput('x','x', 13, min=0, max=100, step=1),
                numericInput('n','n', 20, min=0, max=100, step=1),
                sliderInput("alpha", "alpha", 1, min=0.01, max=10, step=0.05),
                sliderInput("beta", "beta", 1, min=0.01, max=10, step=0.05),
                p("Posterior ∝ Likelihood ⨉ Prior")
                ),
        mainPanel(plotOutput("histo"))
))
