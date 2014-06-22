library(shiny)
pvals <- seq(0.01, 0.99, length=1000)
shinyServer(
    function(input, output) {
        output$histo <- renderPlot({
                x <- input$x
                n <- input$n
                alpha <- input$alpha
                beta <- input$beta
                plot(0:1, 0:1, type="n", xlab="p", ylab="", frame=F)
                lines(pvals, dbeta(pvals, alpha, beta) /
                      max(dbeta(pvals, alpha, beta)), lwd=3, col="darkred")
                lines(pvals, dbinom(x, n, pvals) / dbinom(x, n, x/n), lwd=3,
                      col="darkblue")
                lines(pvals, lwd=3, dbeta(pvals, alpha+x, beta+(n-x)) /
                      max(dbeta(pvals, alpha+x, beta+(n-x))), col="darkgreen")
                lines(c(x/n,x/n), 0:1, col="darkblue", lwd=4, lty="dotted")
                text(x/n, 1.03, round(x/n, 3))
                title("red=prior, green=posterior, blue=likelihood")
        })
    }
)
