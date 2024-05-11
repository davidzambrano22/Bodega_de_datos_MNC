library(RSQLite)
library(tidyverse)
library(shiny)
library(shinydashboard)
library(plotly)
library(shinyjs)
library(stringi)
library(reactable)
library(jsonlite)
library(tm)
library(wordcloud2)
library(memoise)

source("dashboard/ui/dashboard_header.R")
source("dashboard/ui/dashboard_sidebar.R")
source("dashboard/ui/dashboard_tabs.R")

# Bases oficiales
source("dashboard/ui/dashboard_BasesOficiales.R")


source("dashboard/ui/dashboard_ConsultaPorEtapa.R")
source("dashboard/ui/dashboard_EstAreaCual.R")
source("dashboard/ui/dashboard_EstEncDem.R")
source("dashboard/ui/dashboard_AnalisisCompetencias.R")

# ContextSector
source("dashboard/ui/Informacion_etapa/contex_sector/dashboard_ContextSector.R")

# Otras Fuentes de Información
source("dashboard/ui/otras_fuentes/dashboard_otras_fuentes.R")

ui <- shinyUI(
    dashboardPage(
        dashboard_header,
        dashboard_sidebar,
        dashboardBody(
            includeCSS("style.css"),
            tabItems(
                tab_home,
                tab_catalogo,
                tab_BasesOficiales,
                tab_ConsultaPorEtapa,
                tab_consulta,
                tab_infogeneral,
                tab_survey,
                tab_EstAreaCual,
                tab_EstEncDemanda,
                tab_AnalisisCompetencias,
                tab_TasaOcupados,
                tab_OcupadosCIIU,
                tab_Ocupados_EdadSexo,
                tab_Ocupados_NivelEdu,
                tab_demandaSPE,
                tab_infoSNIES
            )
        )
    )
)