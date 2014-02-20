#gdp_app - an example application using the Shiny library
#Eric Howard, University of Washington, Seattle, WA
#Feburary 20, 2014
#Based on the shiny tutorial at http://rstudio.github.io/shiny/tutorial/

library(shiny)
#load in the GDP data
df <- read.csv('GDP.csv', header=T)
#Rename the columns
colnames(df) <- c("country", "year", "value", "footnote")

#Rescale the value to billions of dollars
df$value <- df$value/1000000000

#Adjust the year column to integers
df$year <- as.numeric(as.character(df$year))

#Assign df to the global environment
assign("df", df, envir=globalenv())

#Define the logic requried to generate the GDP line plots from the data
shinyServer(function(input, output){
  output$GDPplot <- renderPlot({ #renderPlot() - passes the plot the user interface
    max.GDP <- input$gdp.scale #takes the value from the gdp.scale sliderInput() element in the UI
    min.GDP <- 0
    unique.country <- unique(df$country)
    highlight.country <- input$country #takes the value from the country selectInput() element in the UI
    #Create a new plot
    plot.new()
    plot.window(xlim =c(min(na.omit(df$year)), max(na.omit(df$year))), ylim=c(min.GDP, max.GDP))
    #Loop through and create line plots for each country in grey
    for (cty in unique.country){
      sub.df <- subset(df, country==cty)
      lines(x=sub.df$year, y=sub.df$value, col="grey")
    }
    
    #Create and label the x and y axis
    axis(side=1, xlab="Year")
    axis(side=2, ylab="GDP (billion US$)")
    
    #Subset the GDP data.frame for just the selected country
    sub.df <- subset(df, country==highlight.country)
    #Add a line, in red, for the select country
    lines(x=sub.df$year, y=sub.df$value, col="red", lwd=2)
    #Add a title to the plot
    title(main=sprintf("%s GDP by year", highlight.country), xlab="Year", ylab="GDP (billion US dollars)")
  })
})