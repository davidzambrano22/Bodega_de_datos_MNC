library(RSQLite)
library(tidyverse)
library(shiny)
library(shinydashboard)
library(plotly)
library(shinyjs)
library(stringi)
library(reactable)
library(jsonlite)

source("dashboard/ui/dashboard_header.R")
source("dashboard/ui/dashboard_sidebar.R")
source("dashboard/ui/dashboard_tabs.R")


ui <- shinyUI(
    dashboardPage(
        dashboard_header,
        dashboard_sidebar,
        dashboardBody(
            includeCSS("style.css"),
            tabItems(
                tab_home,
                tab_catalogo,
                tab_consulta,
                tab_infogeneral,
                tab_survey
            )
        )
    )
)