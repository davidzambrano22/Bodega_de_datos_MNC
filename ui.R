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

# Home
source("dashboard/ui/home/tab_home.R")
# Bases oficiales
source("dashboard/ui/bases_oficiales/dashboard_BasesOficiales.R")
# Estadísticas
source("dashboard/ui/estadisticas_areas_MNC/dashboard_estadisticas.R")
# Areas de Cualificación
source("dashboard/ui/areas_cualificacion/dashborard_areasCualificacion.R")
#INFOETAPAS
source("dashboard/ui/Informacion_etapa/info_etapas.R")
# ContextSector
source("dashboard/ui/Informacion_etapa/contex_sector/dashboard_ContextSector.R")
# Otras Fuentes de Información
source("dashboard/ui/otras_fuentes/dashboard_otras_fuentes.R")
# Brechas
source("dashboard/ui/Brechas/brechas.R")

ui <- fluidPage(
    useShinyjs(),
    dashboardPage(
        dashboard_header,
        dashboard_sidebar,
        dashboardBody(
          tags$head(
            tags$style(
              HTML("
             
             /* Customize sidebar font size */
             .sidebar .sidebar-menu,
             .sidebar .treeview-menu > li > a {
             font-size: 17px;
             }

             /* Customize sidebar background color */
             .sidebar {
               background-color: #333333;
             }

             /* Customize sidebar text color */
             .sidebar .list-group-item,
             .sidebar .treeview-menu > li > a {
               color: #F5F5F5; /* Change to your preferred text color */
             }
             
             
             /* Customize Áreas boxes */
             .box-areas {
             text-align: center;
             }
             
             .areas-button {
             width: 225px;
             height: 160px; 
             }
            ")
            )
          ),
            tabItems(
                tab_home,
                tab_BasesOficiales,
                tab_areasCualificacion,
                tab_survey,
                tab_EstAreaCual,
                tab_EstEncDemanda,
                tab_AnalisisCompetencias,
                tab_TasaOcupados,
                tab_OcupadosCIIU,
                tab_Ocupados_EdadSexo,
                tab_Ocupados_NivelEdu,
                tab_demandaSPE,
                tab_infoSNIES,
                tab_estadisticas_generales,
                tab_infoEtapas,
                tab_dificilConsecucion,
                tab_mediosBusqueda,
                tab_EncuestaOfertaEdu,
                tab_brechasCantidad,
                tab_brechasCalidad,
                tab_brechasPertinencia,
                tab_BaseDemanda_,
                tab_brechasKH,
                tab_brechasKHOcupacion,
                tab_brechasDenominacion
            )
        )
    )
)