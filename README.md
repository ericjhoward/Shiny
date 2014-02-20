# gdp_app - an example ap to the Shiny library
This is a simple example of how to create an application using the Shiny library.
This example is based on the shiny tutorial produced by RStudio, Inc
http://rstudio.github.io/shiny/tutorial/

This example uses data from the UN on GDP per country in U.S. dollars by year which was download from: http://data.un.org/Data.aspx?q=GDP&d=WDI&f=Indicator_Code%3aNY.GDP.MKTP.CD

The UN data was cleaned by removing all of the regional level categories (i.e. “World”, “low income”, “North America”, etc.) and some of the country names were simplified so they are easier to read in the interactive app.

# Using this application
This application can be run by using the following steps
- Installing the R shiny library from the CRAN repository
- Download the files associated with application from the archive https://github.com/ericjhoward/Shiny/archive/master.zip
- Unzip the folder into a directory of your choice
- Run the application using the following R code:
```R 
#Load the shiny library
library(shiny)

#Set your working directory to the location of the folder you unzipped
setwd(“~/gdp_app”)
#run the app
runApp()
```


