library(RSQLite)
library(tidyverse)
library(shiny)
library(shinydashboard)
library(shinyjs)
library(stringi)
library(reactable)
library(jsonlite)
library(readxl)
library(ggthemes) 
library(haven)

# Allow to create world clouds
library(tm)
library(wordcloud2)
library(wordcloud)
library(memoise)

# Write databases
source("data/scripts/excel_reader.R")

# load the kobo.R file
source("kobo.R")
# Load wordcloud2a script
source("wordcloud2a.R")

# Load base descriptivas
base_descriptivas = read_excel("data/input/bases/Base1Descriptivas.xls")
base_socioemocionales = read_excel("data/input/bases/Base2Descriptivas.xls", sheet = "Socioemocionales")
base_conocimientos = read_excel("data/input/bases/Base2Descriptivas.xls", sheet = "Conocimientos")
base_destrezas = read_excel("data/input/bases/Base2Descriptivas.xls", sheet = "Destrezas")
base_misionales = read_excel("data/input/bases/Base2Descriptivas.xls", sheet = "OtroCMisionales")
base_medios = read_excel("data/input/bases/Base2Descriptivas.xls", sheet = "MediosBusqueda")
base_motivos = read_excel("data/input/bases/Base2Descriptivas.xls", sheet = "MotivosNOVacante")

# Load Caracterización Tables
base_TasaOcupados <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Tasa de ocupados") %>%
  mutate(
    `Ocupados` = round(`Ocupados`, 2),
    `Tasa de ocupados` = round(`Tasa de ocupados`, 2)
  )
base_OcupadosCIIU <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Ocupados por división CIIU") %>%
  mutate(
    `Ocupados` = round(`Ocupados`, 2),
    `Proporción ocupados` = round(`Proporción ocupados`, 2)
  )
base_OcupadosEdadSexo <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Ocupados por edad y sexo") %>%
  mutate(
    `Ocupados Hombres` = round(`Ocupados Hombres`, 2),
    `Ocupados Mujeres` = round(`Ocupados Hombres`, 2),
    `%Hombres` = round(`%Hombres`, 2),
    `% Mujeres` = round(`% Mujeres`, 2)
  )
base_OcupadosNivelEdu <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Ocupados por Nivel edu") %>%
  mutate(
    `Ocupados` = round(`Ocupados`, 2),
    `% Ocupados` = round(`% Ocupados`, 2)
  )

# Load SPE tables
DemandaSPE <- read_dta("data/input/bases/DemandaSPE.dta")
base_OfertaSNIES <- read_excel("data/input/bases/InformacionSNIES.xlsx")

# create a connection to the database called "mcn-relational.db"
con <- dbConnect(RSQLite::SQLite(), "data/db/mnc-relational.db")

# Read areas table from database
areas_cualificacion <- dbReadTable(con, "areas_cualificacion")

# Read CUOC table
cuoc_table_ <- read_excel("data/input/bases/CUOC.xls")

# Open facts table nd modifie variables
main_bases <- dbReadTable(con, "fact_table")
main_bases <- main_bases %>%
  mutate(Tasacrecimiento = round(Tasacrecimiento, 2),
                      Valoragregado = round(Valoragregado, 2),
                      OcupadosCIIU = round(OcupadosCIIU, 2),
                      OcupadosTotal = round(OcupadosTotal, 2),
)


shinyServer(function(input, output, session) {

        output$areas_catalog <- renderReactable(
            areas_cualificacion %>%
            reactable(
                columns = list(
                    codigo_area = colDef(
                        name = "Código de área",
                        align = "center",
                        maxWidth = 120,
                        filterable = TRUE
                    ),
                    nombre_area = colDef(
                        name = "Área de cualificación",
                        filterable = TRUE
                    )
                ),
                bordered = TRUE,
                highlight = TRUE,
                selection = "multiple",
                onClick = "select",
                defaultPageSize = 5,
                rowStyle = list(cursor = "pointer"),
                pageSizeOptions = c(5, 10, 15),
                showPageSizeOptions = TRUE
            )
        )
        
        # Make Selectinput object to show in server.R #Tab_consulta
        
        # Deploy selectizeinput object
        output$select_area_catalog <- renderUI({
          selectizeInput("select_area_catalog_", "Seleccione Área:",
                         choices = areas_cualificacion$nombre_area,
                         selected = "ARTES VISUALES, PLÁSTICAS Y DEL PATRIMONIO CULTURAL",
                         multiple = T
                         )
        })
        # Observe to event clar button 
        observeEvent(input$clear_areas, {
          updateSelectizeInput(session, "select_area_catalog_", selected = character(0))
        })
       

####################################### CIIU DATABASE ###############################################
        
        output$table_CIIU <- renderReactable({
          sql_template <- "
              SELECT \"Código_área\" AS \"Código de Área\", COUNT(\"Descripción\") AS \"Actividad Económica\"
              FROM CIIU
              WHERE \"Nombre área cualificación\" IN (%s) AND \"Descripción\" IS NOT NULL
              GROUP BY \"Código_área\"
          ;"
          string_query <- input$select_area_catalog_
          # print(string_query)
          quoted_query <- toString(sapply(string_query, function(x) paste0("'", x, "'")))
          
          query_template <- sprintf(sql_template, quoted_query)
          dbGetQuery(con, query_template) %>% reactable()
        })
        
        # Deploy CIIU plots -------------------------------------------------------------
        output$CIIU_plot <- renderPlot({
          sql_template <- "
              SELECT \"Código_área\" AS codigo_area, COUNT(\"Descripción\") AS actividad_economica
              FROM CIIU
              WHERE \"Nombre área cualificación\" IN (%s) AND \"Descripción\" IS NOT NULL
              GROUP BY \"Código_área\"
          ;"
          string_query <- input$select_area_catalog_
          quoted_query <- toString(sapply(string_query, function(x) paste0("'", x, "'")))
          
          query_template <- sprintf(sql_template, quoted_query)
          data <- dbGetQuery(con, query_template)
          data %>%
            ggplot() +
            geom_col(aes(
              x = codigo_area,
              y = actividad_economica,
              fill = codigo_area)) +
            # put the labels on top of the bars rotate 90 degrees and with the bar color
            geom_text(aes(
              x = codigo_area,
              y = actividad_economica,
              label = actividad_economica,
              color = codigo_area),
              vjust = -0.5,
              size = 11,
              fontface = "bold") +
            labs(
              # title = "Número de actividades económicas por área de cualificación",
              x = "Área de cualificación",
              y = "Número de actividades económicas (CIIU)"
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, max(data$actividad_economica) + 10)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)
            )
        })

########################################## CUOC DATABASE #############################################
        
        output$table_CUOC <- renderReactable({
          sql_template <- "
              SELECT \"Código_área\" AS codigo_area, COUNT(\"Código denominaciones\") AS Denominacion
              FROM CUOC
              WHERE \"Nombre área cualificación\" IN (%s)
              GROUP BY \"Código_área\"
          ;"
          string_query <- input$select_area_catalog_
          quoted_query <- toString(sapply(string_query, function(x) paste0("'", x, "'")))
          query_template <- sprintf(sql_template, quoted_query)
          dbGetQuery(con, query_template) %>% reactable()
        })
        
        # Deploy CUOC plots -------------------------------------------------------------
        output$CUOC_plot <- renderPlot({
          sql_template <- "
              SELECT \"Código_área\" AS codigo_area, COUNT(\"Código Ocupación\") AS denominacion
              FROM CUOC
              WHERE \"Nombre área cualificación\" IN (%s)
              GROUP BY \"Código_área\"
          ;"
          string_query <- input$select_area_catalog_
          quoted_query <- toString(sapply(string_query, function(x) paste0("'", x, "'")))
          query_template <- sprintf(sql_template, quoted_query)
          data <- dbGetQuery(con, query_template)
          data %>%
            ggplot() +
            geom_col(aes(
              x = codigo_area,
              y = denominacion,
              fill = codigo_area)) +
            # put the labels on top of the bars rotate 90 degrees and with the bar color
            geom_text(aes(
              x = codigo_area,
              y = denominacion,
              label = denominacion,
              color = codigo_area),
              vjust = -0.5,
              size = 8,
              fontface = "bold") +
            labs(
              # title = "Número de actividades económicas por área de cualificación",
              x = "Área de cualificación",
              y = "Número de denominaciones (CUOC)"
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, max(data$denominacion) + 100)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)
            )
        })

########################################## CINE DATABASE #############################################
       
        output$table_CINE <- renderReactable({
          sql_template <- "
              SELECT \"Código_área\" AS codigo_area, COUNT(\"Código CINE-2011 AC\") AS campo_detallado
              FROM CINE
              WHERE \"Nombre área cualificación\" IN (%s)
          ;"
          string_query <- input$select_area_catalog_
          quoted_query <- toString(sapply(string_query, function(x) paste0("'", x, "'")))
          query_template <- sprintf(sql_template, quoted_query)
          dbGetQuery(con, query_template) %>% reactable()
        })
        
        # Deploy CINE plots -------------------------------------------------------------
        output$CINE_plot <- renderPlot({
          sql_template <- "
              SELECT \"Código_área\" AS codigo_area, COUNT(\"Código CINE-2011 AC\") AS campo_detallado
              FROM CINE
              WHERE \"Nombre área cualificación\" IN (%s)
              GROUP BY codigo_area
          ;"
          string_query <- input$select_area_catalog_
          quoted_query <- toString(sapply(string_query, function(x) paste0("'", x, "'")))
          query_template <- sprintf(sql_template, quoted_query)
          data <- dbGetQuery(con, query_template)
          data %>%
            ggplot() +
            geom_col(aes(
              x = codigo_area,
              y = campo_detallado,
              fill = codigo_area)) +
            # put the labels on top of the bars rotate 90 degrees and with the bar color
            geom_text(aes(
              x = codigo_area,
              y = campo_detallado,
              label = campo_detallado,
              color = codigo_area),
              vjust = -0.5,
              size = 8,
              fontface = "bold") +
            labs(
              # title = "Número de actividades económicas por área de cualificación",
              x = "Área de cualificación",
              y = "Número de campos detallados (CINE)"
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, max(data$campo_detallado) + 3)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)
            )
        })
        
########################################## PLOTS FOR DESCRIPTIVAS 2 #############################################
        
        # Deploy selectizeinput object
        output$select_area_catalog_2 <- renderUI({
          choices <- setNames(names(base_socioemocionales)[2:6], c("ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                                                                   "AGROPECUARIO, SILVICULTURA, PESCA, ACUICULTURA Y VETERINARIA",
                                                                   "ARTES VISUALES, PLÁSTICAS Y DEL PATRIMONIO CULTURAL",
                                                                   "CONSERVACIÓN, PROTECCIÓN Y SANEAMIENTO AMBIENTAL",
                                                                   "ELABORACIÓN Y TRANSFORMACIÓN DE ALIMENTOS")
                              )
          
          selectizeInput("select_area_catalog_2", "Seleccione área de cualificación",
                         choices = choices,
                         multiple = F
          )
        })
        
        
        # Deploy habilidades socioemocionales plots -------------------------------------------------------------
        output$socioemocionales <- renderPlot({
          selected_column <- input$select_area_catalog_2
          base_socioemocionales %>%
            dplyr::select(`Habilidades Socioemocionales`, selected_column) %>% 
            arrange(desc(!!sym(selected_column))) %>% 
            head(5) %>%
            ggplot() +
            geom_col(
              aes(x = `Habilidades Socioemocionales`,
                  y = !!sym(selected_column),
                  fill = `Habilidades Socioemocionales`
              )
            ) +
            geom_text(aes(
              x = `Habilidades Socioemocionales`,
              y = !!sym(selected_column),
              label = !!sym(selected_column),
              color = `Habilidades Socioemocionales`),
              vjust = -0.5,
              size = 8,
              fontface = "bold") +
            labs(
              # title = "Número de actividades económicas por área de cualificación",
              y = "Acumulado de habilidades socioemocionales",
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 34)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)
            ) +
            scale_x_discrete(labels = NULL)
        })
        
        output$wordcloud_habilidades <- renderWordcloud2({
          selected_column <- input$select_area_catalog_2
          base_socioemocionales %>%
            dplyr::select(`Habilidades Socioemocionales`, selected_column) %>% 
            arrange(desc(!!sym(selected_column))) %>% 
            head(7) %>%
            wordcloud2a(size = 0.2, color = "random-dark", rotateRatio = 0, widgetsize = 100)
        })

        # Deploy conocimientos plots -------------------------------------------------------------
        output$conocimientos <- renderPlot({
          selected_column <- input$select_area_catalog_2
          
          base_conocimientos %>% group_by(`Código_área`, `Conocimiento`) %>%
            summarise(total = sum(`Frecuencia`)) %>%
            filter(`Código_área` %in% selected_column) %>%
            arrange(desc(`total`)) %>%
            head(5) %>%
            ggplot() +
            geom_col(
              aes(x = `Conocimiento`,
                  y = `total`,
                  fill = `Conocimiento`
              )
            ) +
            geom_text(aes(
              x = `Conocimiento`,
              y = `total`,
              label = `total`,
              color = `Conocimiento`),
              vjust = -0.5,
              size = 8,
              fontface = "bold") +
            labs(
              # title = "Acumulado de conocimientos por área de cualificación",
              caption = NULL,
              y = "Acumulado de conocimientos",
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 50)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)) +
            scale_x_discrete(labels = NULL)
        })
        
        output$wordcloud_conocimientos <- renderWordcloud2({
          selected_column <- input$select_area_catalog_2
          base_conocimientos %>% group_by(`Código_área`, `Conocimiento`) %>%
            summarise(total = sum(`Frecuencia`)) %>%
            filter(`Código_área` %in% selected_column) %>% 
            as.data.frame() %>%
            arrange(desc(`total`)) %>%
            head(5) %>%
            dplyr::select(`Conocimiento`, `total`) %>%
            wordcloud2a(size = 0.2, color = "random-dark", rotateRatio = 0, widgetsize = 100)
        })
        
        
        # Deploy destrezas plots -------------------------------------------------------------
        output$destrezas <- renderPlot({
          selected_column <- input$select_area_catalog_2
          
          base_destrezas %>% group_by(`Código_área`, `destreza`) %>%
            summarise(total = sum(`Frecuencia`)) %>%
            filter(`Código_área` %in% selected_column) %>%
            arrange(desc(`total`)) %>%
            head(5) %>%
            ggplot() +
            geom_col(
              aes(x = `destreza`,
                  y = `total`,
                  fill = `destreza`
              )
            ) +
            geom_text(aes(
              x = `destreza`,
              y = `total`,
              label = `total`,
              color = `destreza`),
              vjust = -0.5,
              show.legend = FALSE,
              size = 8,
              fontface = "bold") +
            labs(
              fill = "Destreza",
              caption = NULL,
              y = "Acumulado de destrezas",
              x = "Destrezas"
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 64)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)) +
            scale_x_discrete(labels = NULL)
        })
        
        output$wordcloud_destrezas <- renderWordcloud2({
          selected_column <- input$select_area_catalog_2
          base_destrezas %>% group_by(`Código_área`, `destreza`) %>%
            summarise(total = sum(`Frecuencia`)) %>%
            filter(`Código_área` %in% selected_column) %>% 
            as.data.frame() %>% 
            arrange(desc(`total`)) %>%
            head(5) %>%
            dplyr::select(`destreza`, `total`) %>%
            wordcloud2a(size = 0.2, color = "random-dark", rotateRatio = 0, widgetsize = 100)
        })
        
        
        # -------------------------------------------------
        # Deploy selectizeinput object 5
        output$select_area_catalog_5 <- renderUI({
          choices <- setNames(names(base_socioemocionales)[2:6], c("ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                                                                   "AGROPECUARIO, SILVICULTURA, PESCA, ACUICULTURA Y VETERINARIA",
                                                                   "ARTES VISUALES, PLÁSTICAS Y DEL PATRIMONIO CULTURAL",
                                                                   "CONSERVACIÓN, PROTECCIÓN Y SANEAMIENTO AMBIENTAL",
                                                                   "ELABORACIÓN Y TRANSFORMACIÓN DE ALIMENTOS")
          )
          selectizeInput("select_area_catalog_5", "Seleccione Área:",
                         choices = choices,
                         multiple = F
          )
        })
        
        # Observe to event clear button 5
        observeEvent(input$clear_areas_5, {
          updateSelectizeInput(session, "select_area_catalog_5", selected = character(0))
        })
        
        # Deploy Medios de búsqueda plots -------------------------------------------------------------
        output$medios <- renderPlot({
          selected_column <- input$select_area_catalog_5
          
          base_medios %>%
            dplyr::select(`Medios de busqueda de personal`, !!sym(selected_column)) %>% 
            arrange(desc(!!sym(selected_column))) %>% 
            head(5) %>%
            ggplot() +
            geom_col(
              aes(x = `Medios de busqueda de personal`,
                  y = !!sym(selected_column),
                  fill = `Medios de busqueda de personal`
              )
            ) +
            geom_text(aes(
              x = `Medios de busqueda de personal`,
              y = !!sym(selected_column),
              label = !!sym(selected_column),
              color = `Medios de busqueda de personal`),
              vjust = -0.5,
              size = 8,
              fontface = "bold") +
            labs(
              # title = "Número de actividades económicas por área de cualificación",
              y = "Acumulado de medios de búsqueda",
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 30)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)
            ) +
            scale_x_discrete(labels = NULL)
        })
        
        # Deploy Motivos No Vacatnte plots -------------------------------------------------------------
        output$motivosNovacante <- renderPlot({
          selected_column <- input$select_area_catalog_5
          base_motivos %>%
            dplyr::select(`Motivos no se cubrió la vacante`, !!sym(selected_column)) %>% 
            arrange(desc(!!sym(selected_column))) %>% 
            head(5) %>%
            ggplot() +
            geom_col(
              aes(x = `Motivos no se cubrió la vacante`,
                  y = !!sym(selected_column),
                  fill = `Motivos no se cubrió la vacante`
              )
            ) +
            geom_text(aes(
              x = `Motivos no se cubrió la vacante`,
              y = !!sym(selected_column),
              label = !!sym(selected_column),
              color = `Motivos no se cubrió la vacante`),
              vjust = -0.5,
              size = 8,
              fontface = "bold") +
            labs(
              # title = "Número de actividades económicas por área de cualificación",
              y = "Acumulado de medios de motivos",
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 30)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)
            ) +
            scale_x_discrete(labels = NULL)
        })

############################################ PLOTS DESCRIPTIVAS ###########################################
        # Deploy selectizeinput object 3
        output$select_area_catalog_3 <- renderUI({
          choices <- setNames(names(base_socioemocionales)[2:6], c("ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                                                                   "AGROPECUARIO, SILVICULTURA, PESCA, ACUICULTURA Y VETERINARIA",
                                                                   "ARTES VISUALES, PLÁSTICAS Y DEL PATRIMONIO CULTURAL",
                                                                   "CONSERVACIÓN, PROTECCIÓN Y SANEAMIENTO AMBIENTAL",
                                                                   "ELABORACIÓN Y TRANSFORMACIÓN DE ALIMENTOS")
          )
          selectizeInput("select_area_catalog_3", "Seleccione Área:",
                         choices = choices,
                         selected = "AFIR",
                         multiple = T
          )
        })
        
        # Observe to event clear button 
        observeEvent(input$clear_areas_3, {
          updateSelectizeInput(session, "select_area_catalog_3", selected = character(0))
        })
        
                                 # -------------------------------------------------
        # Deploy selectizeinput object 4
        output$select_area_catalog_4 <- renderUI({
          choices <- setNames(names(base_socioemocionales)[2:6], c("ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                                                                   "AGROPECUARIO, SILVICULTURA, PESCA, ACUICULTURA Y VETERINARIA",
                                                                   "ARTES VISUALES, PLÁSTICAS Y DEL PATRIMONIO CULTURAL",
                                                                   "CONSERVACIÓN, PROTECCIÓN Y SANEAMIENTO AMBIENTAL",
                                                                   "ELABORACIÓN Y TRANSFORMACIÓN DE ALIMENTOS")
          )
          selectizeInput("select_area_catalog_4", "Seleccione Área:",
                         choices = choices,
                         multiple = T
          )
        })
        
        # Observe to event clear button 4
        observeEvent(input$clear_areas_4, {
          updateSelectizeInput(session, "select_area_catalog_4", selected = character(0))
        })

        
# -----------------Descriptivas área de desempeño
        output$descriptivas_area <- renderPlot({
          base_descriptivas %>% dplyr::select(`Código_área`, `¿Cuál es su área de desempeño?`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3) %>%
            group_by(`¿Cuál es su área de desempeño?`) %>% count(`¿Cuál es su área de desempeño?`) %>%
            ggplot() +
            geom_col(aes(
              x = `¿Cuál es su área de desempeño?`,
              y = `n`,
              fill = `¿Cuál es su área de desempeño?`)) +
            geom_text(aes(
              x = `¿Cuál es su área de desempeño?`,
              y = `n`,
              label = `n`,
              color = `¿Cuál es su área de desempeño?`),
              vjust = -0.5,
              size = 8,
              show.legend = FALSE,
              fontface = "bold") +
            labs(
              # title = "Número de actividades económicas por área de cualificación",
              y = "Acumulado de empresas"
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 86)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)
            )
        })

# -----------------Descriptivas tamaño empresa
        output$tamano_empresa <- renderPlot({
          base_descriptivas %>% dplyr::select(`Código_área`, `Tamaño empresa`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3) %>%
            group_by(`Tamaño empresa`) %>% count(`Tamaño empresa`) %>%
            ggplot() +
            geom_col(aes(
              x = `Tamaño empresa`,
              y = `n`,
              fill = `Tamaño empresa`)) +
            geom_text(aes(
              x = `Tamaño empresa`,
              y = `n`,
              label = `n`,
              color = `Tamaño empresa`),
              vjust = -0.5,
              size = 8,
              fontface = "bold") +
            labs(
              # title = "Número de actividades económicas por área de cualificación",
              y = "Acumulado de empresas"
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 40)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)
            ) 
        })

# -----------------Descriptivas Cargos dificil consecusión
        output$dificil_consecucion <- renderPlot({
          base_descriptivas %>% dplyr::select(`Código_área`, `Cargos dificil consecusión`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3) %>%
            group_by(`Cargos dificil consecusión`) %>% count(`Cargos dificil consecusión`) %>%
            ggplot() +
            geom_col(aes(
              x = `Cargos dificil consecusión`,
              y = `n`,
             fill = as.character(`Cargos dificil consecusión`))) +
            geom_text(aes(
              x = `Cargos dificil consecusión`,
              y = `n`,
              label = `n`,
              color = `Cargos dificil consecusión`),
              vjust = -0.5,
              size = 8,
              show.legend = FALSE,
              fontface = "bold") +
            labs(
              # title = "Número de actividades económicas por área de cualificación",
              y = "Acumulado de empresas",
              fill = "Cargos de difícil consecución"
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 61)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)
            )
        })
        
        # -----------------Descriptivas Departamentos
        output$departamentos <- renderPlot({
          base_descriptivas %>% dplyr::select(`Código_área`, `Departamento`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3) %>%
            group_by(`Departamento`) %>% count(`Departamento`) %>%
            ggplot() +
            geom_col(aes(
              x = `Departamento`,
              y = `n`,
              fill = as.character(`Departamento`))) +
            geom_text(aes(
              x = `Departamento`,
              y = `n`,
              label = `n`,
              color = `Departamento`),
              vjust = -0.5,
              size = 8,
              show.legend = FALSE,
              fontface = "bold") +
            labs(
              # title = "Número de actividades económicas por área de cualificación",
              y = "Acumulado de empresas",
              fill = "Cargos de difícil consecución"
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 61)
            ) +
            theme_few() +
            theme(text = element_text(size = 15)
            )
        }) 
########################################## BASES CARACTERIZACIÓN ##########################################
        
  ####################### TASA OCUPADOS
        output$base_TasaOcupados <- renderReactable(
          base_TasaOcupados %>% select(
            input$caract_TasaOcu_areaCual_,
            input$caract_TasaOcu_eduAno_,
            input$caract_TasaOcu_indices_
          ) %>% reactable(
            filterable = TRUE, minRows = 10
          )
        )
        # Clear Button
        observeEvent(input$clear_baseTasaOcupados, {
          updateSelectizeInput(session, "caract_TasaOcu_areaCual_", selected = character(0))
        })
        
        observeEvent(input$clear_baseTasaOcupados, {
          updateSelectizeInput(session, "caract_TasaOcu_eduAno_", selected = character(0))
        })
        
        observeEvent(input$clear_baseTasaOcupados, {
          updateSelectizeInput(session, "caract_TasaOcu_indices_", selected = character(0))
        })
        
        #Download Button
        output$download_tasa_ocupados <- downloadHandler(
          filename = function(){"Ocupados_departamentos.csv"},
          content = function(file){
            write.csv2(base_TasaOcupados %>% select(
              input$caract_TasaOcu_areaCual_,
              input$caract_TasaOcu_eduAno_,
              input$caract_TasaOcu_indices_
            ),
            file,
            row.names = T,
            # fileEncoding = "ASCII"
            )
          }
        )
        
  ####################### OCUPADOS CIIU
        output$base_ocupadosCIIU <- renderReactable(
          base_OcupadosCIIU %>% select(
            input$caract_ocuCIIU_areaCual_,
            input$caract_ocuCIIU_Ano_,
            input$caract_ocuCIIU_indices_
          ) %>% reactable(
            filterable = TRUE, minRows = 10
          )
        )
        
        # Clear Button
        observeEvent(input$clear_ocupadosCIIU, {
          updateSelectizeInput(session, "caract_ocuCIIU_areaCual_", selected = character(0))
        })
        
        observeEvent(input$clear_ocupadosCIIU, {
          updateSelectizeInput(session, "caract_ocuCIIU_Ano_", selected = character(0))
        })
        
        observeEvent(input$clear_ocupadosCIIU, {
          updateSelectizeInput(session, "caract_ocuCIIU_indices_", selected = character(0))
        })
        
        #Download Button
        output$download_ocupados_CIIU <- downloadHandler(
          filename = function(){"Ocupados_SectoresCIIU.csv"},
          content = function(file){
            write.csv2(base_OcupadosCIIU %>% select(
              input$caract_ocuCIIU_areaCual_,
              input$caract_ocuCIIU_Ano_,
              input$caract_ocuCIIU_indices_
            ),
            file,
            row.names = T,
            # fileEncoding = "ASCII"
            )
          }
        )
        
  ####################### OCUPADOS EDAD Y SEXO
        output$base_ocupadosEdadSexo <- renderReactable(
          base_OcupadosEdadSexo %>% select(
            input$caract_ocuEdadSexo_areaCual_,
            input$caract_ocuEdadSexo_Ano_,
            input$caract_ocuEdadSexo_Edad_,
            input$caract_ocuEdadSexo_indices_
          ) %>% reactable(
            filterable = TRUE, minRows = 10
          )
        )
        
        # Clear Button
        observeEvent(input$clear_ocupadosEdadSexo, {
          updateSelectizeInput(session, "caract_ocuEdadSexo_areaCual_", selected = character(0))
        })
        
        observeEvent(input$clear_ocupadosEdadSexo, {
          updateSelectizeInput(session, "caract_ocuEdadSexo_Ano_", selected = character(0))
        })
        
        observeEvent(input$clear_ocupadosEdadSexo, {
          updateSelectizeInput(session, "caract_ocuEdadSexo_Edad_", selected = character(0))
        })
        
        observeEvent(input$clear_ocupadosEdadSexo, {
          updateSelectizeInput(session, "caract_ocuEdadSexo_indices_", selected = character(0))
        })
        
        #Download Button
        output$download_ocupadosEdadySexo <- downloadHandler(
          filename = function(){"Ocupados_EdadySexo.csv"},
          content = function(file){
            write.csv2(base_OcupadosEdadSexo %>% select(
              input$caract_ocuEdadSexo_areaCual_,
              input$caract_ocuEdadSexo_Ano_,
              input$caract_ocuEdadSexo_Edad_,
              input$caract_ocuEdadSexo_indices_
            ),
            file,
            row.names = T,
            # fileEncoding = "ASCII"
            )
          }
        )
        
  ####################### OCUPADOS NIVEL EDUCATIVO
        output$base_ocupadosNivelEdu <- renderReactable(
          base_OcupadosNivelEdu %>% select(
            input$caract_OcuNivelEdu_areaCual_,
            input$caract_OcuNivelEdu_Ano_,
            input$caract_OcuNivelEdu_indices_
          ) %>% reactable(
            filterable = TRUE, minRows = 10
          )
        )
        
        # Clear Button
        observeEvent(input$clear_NivelEdu, {
          updateSelectizeInput(session, "caract_OcuNivelEdu_areaCual_", selected = character(0))
        })
        
        observeEvent(input$clear_NivelEdu, {
          updateSelectizeInput(session, "caract_OcuNivelEdu_areaCual_", selected = character(0))
        })
        
        observeEvent(input$clear_NivelEdu, {
          updateSelectizeInput(session, "caract_OcuNivelEdu_areaCual_", selected = character(0))
        })
        
        #Download Button
        output$download_Ocu_NivelEdu <- downloadHandler(
          filename = function(){"Ocupados_NivelEducativo.csv"},
          content = function(file){
            write.csv2(base_OcupadosNivelEdu %>% select(
              input$caract_OcuNivelEdu_areaCual_,
              input$caract_OcuNivelEdu_Ano_,
              input$caract_OcuNivelEdu_indices_
            ),
            file,
            row.names = T,
            # fileEncoding = "ASCII"
            )
          }
        )
######################################### OTRAS FUENTES DE INFORMACIÓN ###################################################
        
  ####################### INFORMACIÓN DEMANDA SPE
        output$base_demandaSPE <- renderReactable(
          DemandaSPE %>% select(
            input$caract_OtrasFuentes_SPE_otros_,
            input$caract_OtrasFuentes_SPE_generales_,
            input$caract_OtrasFuentes_SPE_Areas_
          ) %>% reactable(
            filterable = TRUE, minRows = 10
          )
        )
        
        # Clear Button
        observeEvent(input$clear_SPE, {
          updateSelectizeInput(session, "caract_OtrasFuentes_SPE_otros_", selected = character(0))
        })
        
        observeEvent(input$clear_SPE, {
          updateSelectizeInput(session, "caract_OtrasFuentes_SPE_generales_", selected = character(0))
        })
        
        observeEvent(input$clear_SPE, {
          updateSelectizeInput(session, "caract_OtrasFuentes_SPE_Areas_", selected = character(0))
        })
        
        #Download Button
        output$download_SPE <- downloadHandler(
          filename = function(){"InformaciónDemandaSPE.csv"},
          content = function(file){
            write.csv2(DemandaSPE %>% select(
              input$caract_OtrasFuentes_SPE_otros_,
              input$caract_OtrasFuentes_SPE_generales_,
              input$caract_OtrasFuentes_SPE_Areas_
            ),
            file,
            row.names = T,
            # fileEncoding = "ASCII"
            )
          }
        )
        
  ####################### INFORMACIÓN OFERTA SNIES
        output$base_OfertaSNIES <- renderReactable(
          base_OfertaSNIES %>% select(
            input$caract_OtrasFuentes_snies_Areas_,
            input$caract_OtrasFuentes_snies_programa_,
            input$caract_OtrasFuentes_snies_general_
          ) %>% reactable(
            filterable = TRUE, minRows = 10
          )
        )
        
        # Clear Button
        observeEvent(input$clear_snies, {
          updateSelectizeInput(session, "caract_OtrasFuentes_snies_Areas_", selected = character(0))
        })
        
        observeEvent(input$clear_snies, {
          updateSelectizeInput(session, "caract_OtrasFuentes_snies_programa_", selected = character(0))
        })
        
        observeEvent(input$clear_snies, {
          updateSelectizeInput(session, "caract_OtrasFuentes_snies_general_", selected = character(0))
        })
        
        #Download Button
        output$download_snies <- downloadHandler(
          filename = function(){"InformaciónDemandaSPE.csv"},
          content = function(file){
            write.csv2(base_OfertaSNIES %>% select(
              input$caract_OtrasFuentes_snies_Areas_,
              input$caract_OtrasFuentes_snies_programa_,
              input$caract_OtrasFuentes_snies_general_
            ),
            file,
            row.names = T,
            # fileEncoding = "ASCII"
            )
          }
        )
        
###########################################################################################################
        output$selected_row_details <- renderText({
            selected <- getReactableState("areas_catalog", "selected")
            req(selected)
            # print the selected rows in the console which ids are in selected
            areas_cualificacion[selected, ]$codigo_area
        })


        output$joined_table <- renderReactable(
            dbGetQuery(
                con, "
                SELECT 
                --ciiu.division,
                --ciiu.grupo,
                ciiu.clase,
                ciiu.descripcion,
                cine.codigo_area,
                cine.area_cualificacion,
                cine.codigo_cine_2011_ac,
                cine.campos_detallado
                FROM ciiu_actividades_areas ciiu
                JOIN areas_cualificacion areas USING (codigo_area)
                JOIN cine_actividades_areas cine USING (codigo_area)
                WHERE ciiu.clase IS NOT NULL
                ;"
            ) %>%
            as_tibble() %>%
            select(input$general_variables) %>%
            reactable(
                bordered = TRUE,
                highlight = TRUE,
                filterable = TRUE, minRows = 10
            )
        )

# SURVEY ENCUESTA ---------------------------------------------------------


        output$survey_table <- renderReactable(
            datos %>%
            select(
                   c(input$info_general,
                     input$brechas,
                     input$otros, 
                     input$destrezas,
                     input$conocimientos,
                     input$programas)
                   ) %>%
            reactable(
                filterable = TRUE, minRows = 10
            )
        )
        
        observeEvent(input$clear_survey, {
          updateSelectizeInput(session, "info_general", selected = character(0))
        })
        
        observeEvent(input$clear_survey, {
          updateSelectizeInput(session, "otros", selected = character(0))
        })
        
        observeEvent(input$clear_survey, {
          updateSelectizeInput(session, "destrezas", selected = character(0))
        })
        
        observeEvent(input$clear_survey, {
          updateSelectizeInput(session, "conocimientos", selected = character(0))
        })
        
        observeEvent(input$clear_survey, {
          updateSelectizeInput(session, "programas", selected = character(0))
        })
        
        # Download button of survey table
        output$download_survey <- downloadHandler(
          filename = function(){"encuesta_filtrada.csv"},
          content = function(file){
            write.csv2(datos %>% select(
                                      c(input$info_general,
                                        input$otros,
                                        input$destrezas,
                                        input$conocimientos,
                                        input$programas
                                        )
            ),
            file,
            row.names = T,
            # fileEncoding = "ASCII"
            )
          }
        )
  


# Switch tabs using images in Catalogo tab --------------------------------

        observeEvent(input$artes_button, {
          updateTabItems(session, "tabs", selected = "bases_oficiales")
        })
        
        observeEvent(input$fisicas_button, {
          updateTabItems(session, "tabs", selected = "bases_oficiales")
        })
        
        observeEvent(input$agropecuarias_button, {
          updateTabItems(session, "tabs", selected = "bases_oficiales")
        })
        
        observeEvent(input$alimentos_button, {
          updateTabItems(session, "tabs", selected = "bases_oficiales")
        })
        
        observeEvent(input$conservacion_button, {
          updateTabItems(session, "tabs", selected = "bases_oficiales")
        })
        

# Behavior of DESCRIPTIVOS POR ÁREA ---------------------------------------
        
        # Render table
        output$main_databases <- renderReactable(
          main_bases %>%
            select(
                   c(
                     input$area_cualificacion,
                     input$denominacion_cuoc,
                     input$cine,
                     input$ciiu,
                     input$caract_sector,
                     input$brechas_hum
                   )
            ) %>% distinct() %>%
            reactable(
              filterable = TRUE,
              minRows = 10,
              defaultPageSize = 15 # Fijar el número máximo de filas que se muestran a 15
            )
        )
        
        # Download table
        output$download_csv <- downloadHandler(
          filename = function(){"datos_consolidados.csv"},
          content = function(file){
            write.csv2(main_bases %>%
                         select( 
                           c(
                             input$area_cualificacion,
                             input$denominacion_cuoc,
                             input$cine,
                             input$ciiu,
                             input$caract_sector,
                             input$brechas_hum
                             )
                           ),
            file,
            row.names = T#,
            # fileEncoding = "ASCII"
            )
          }
        )
        
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, "area_cualificacion", selected = character(0))
        })
       
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, "denominacion_cuoc", selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, "cine", selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, "ciiu", selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, c("caract_sector"), selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, c("select_sex_caract"), selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, c("select_dept_caract"), selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, c("select_year_caract"), selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, c("brechas_hum"), selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, c("select_sex_brechas"), selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, c("select_dept_brechas"), selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, c("select_year_brechas"), selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, "analisis_funcional", selected = character(0))
        })
        
        observeEvent(input$clear_bases, {
          updateSelectizeInput(session, "estructura_cualificacion", selected = character(0))
        })
        
        
        # toggle sidebar
        observeEvent(input$showSidebar, {
          shinyjs::show(id = "sidebar")
        })
        observeEvent(input$hideSidebar, {
          shinyjs::toggle(id = "sidebar")
        })

})
