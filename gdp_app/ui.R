#gdp_app - an example application using the Shiny library
#Eric Howard, University of Washington, Seattle, WA
#Feburary 20, 2014
#Based on the shiny tutorial at http://rstudio.github.io/shiny/tutorial/

library(shiny)

#Read in CSV file to get a list of country names
df <- read.csv('GDP.csv', header=T)
colnames(df) <- c("country", "year", "value", "footnote")
#Adjust the value to be in billions of U.S. dollars
df$value <- df$value/1000000000

#Create a list of unique country names
country.names <- as.character(unique(df[,1]))

#Determine maximum GDP value to set limits for the y-axis
max.GDP <- max(df$value)

#Define UI for application that produces a line plot based on GDP
shinyUI(pageWithSidebar(
  
  #Application title
  headerPanel("GDP by Country"), 
  
  #Sidebar with a list to select the country that you are interested in
  sidebarPanel(
    #Select the country you are intersted in from a list
    selectInput("country", "Select a country:",
                choices = country.names),
    #Create a slider so that the y-axis can be rescaled dynamically
    sliderInput("gdp.scale", "Rescale the y axis:",
                min = 100,
                max = max.GDP,
                value = max.GDP,
                step = 100)
    ),
  
  #Show the lines plots of GDP by year, with the selected country being highligthed
  mainPanel(
    plotOutput("GDPplot"))
))
