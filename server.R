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

# Allow to create world clouds
library(tm)
library(wordcloud2)
library(memoise)


# load the kobo.R file
source("kobo.R")
# Load wordcloud2a script
source("wordcloud2a.R")

# Load base descriptivas
base_descriptivas = read_excel("data/input/bases/Base1Descriptivas.xls")
base_socioemocionales = read_excel("data/input/bases/Base2Descriptivas.xls", sheet = "Socioemocionales")
base_conocimientos = read_excel("data/input/bases/Base2Descriptivas.xls", sheet = "Conocimientos")
base_destrezas = read_excel("data/input/bases/Base2Descriptivas.xls", sheet = "Destrezas")

# create a connection to the database called "mcn-relational.db"
con <- dbConnect(RSQLite::SQLite(), "data/db/mnc-relational.db")

# Read areas table from database
areas_cualificacion <- dbReadTable(con, "areas_cualificacion")

# Open facts table
main_bases <- dbReadTable(con, "fact_table")
colnames(main_bases) <- gsub("\\.", " ", colnames(main_bases))
print(colnames(main_bases))

  # readxl::read_xls("data/input/bases/BaseFinal.xls", guess_max = 2021) %>% 
  # slice(c(2021:5000)) %>% as.tibble() 

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
              SELECT \"Código_área\" AS codigo_area, COUNT(\"Código\") AS Denominacion
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
              SELECT \"Código_área\" AS codigo_area, COUNT(\"Código\") AS denominacion
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
          selectizeInput("select_area_catalog_2", "Seleccione área de cualificación",
                         choices = names(base_socioemocionales)[2:6],
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
            wordcloud2a(size = 1, color = "random-dark", rotateRatio = 0)
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
            # geom_text(aes(
            #   x = `Conocimiento`,
            #   y = selected_column,
            #   label = selected_column,
            #   color = `Conocimiento`),
            #   vjust = -0.5,
            #   size = 8,
            #   fontface = "bold") +
            labs(
              # title = "Acumulado de conocimientos por área de cualificación",
              caption = NULL,
              y = "Acumulado de conocimientos",
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 34)
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
            as.data.frame() %>% dplyr::select(`Conocimiento`, `total`) %>%
            wordcloud2a(size = 1, color = "random-dark", rotateRatio = 0)
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
            # geom_text(aes(
            #   x = `Conocimiento`,
            #   y = selected_column,
            #   label = selected_column,
            #   color = `Conocimiento`),
            #   vjust = -0.5,
            #   size = 8,
            #   fontface = "bold") +
            labs(
              # title = "Acumulado de conocimientos por área de cualificación",
              caption = NULL,
              y = "Acumulado de destrezas",
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 34)
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
            as.data.frame() %>% dplyr::select(`destreza`, `total`) %>%
            wordcloud2a(size = 1, color = "random-dark", rotateRatio = 0)
        })

############################################ PLOTS DESCRIPTIVAS ###########################################
        # Deploy selectizeinput object
        output$select_area_catalog_3 <- renderUI({
          selectizeInput("select_area_catalog_3", "Seleccione Área:",
                         choices = names(table(base_descriptivas$`Código_área`)),
                         multiple = T
          )
        })
        
        # Observe to event clear button 
        observeEvent(input$clear_areas_3, {
          updateSelectizeInput(session, "select_area_catalog_3", selected = character(0))
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
              limits = c(0, 40)
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
            select("Seleccione el área de cualificación para la cual esta realizando la entrevista.",
                   c(input$info_general,
                   input$otros_cargos, 
                   input$estrategias_cierre,
                   input$habilidades_socio)
                   ) %>%
            reactable(
                filterable = TRUE, minRows = 10
            )
        )
        
        observeEvent(input$clear_survey, {
          updateSelectizeInput(session, "info_general", selected = character(0))
        })
        
        observeEvent(input$clear_survey, {
          updateSelectizeInput(session, "otros_cargos", selected = character(0))
        })
        
        observeEvent(input$clear_survey, {
          updateSelectizeInput(session, "estrategias_cierre", selected = character(0))
        })
        
        observeEvent(input$clear_survey, {
          updateSelectizeInput(session, "habilidades_socio", selected = character(0))
        })
        
        # Download button of survey table
        output$download_survey <- downloadHandler(
          filename = function(){"encuesta_filtrada.csv"},
          content = function(file){
            write.csv2(datos %>% select(
                                      "Seleccione el área de cualificación para la cual esta realizando la entrevista.",
                                      c(input$info_general,
                                        input$otros_cargos, 
                                        input$estrategias_cierre,
                                        input$habilidades_socio)
            ), file, row.names = T, fileEncoding = "ASCII")
          }
        )


# Switch tabs using images in Catalogo tab --------------------------------

        observeEvent(input$artes_button, {
          updateTabItems(session, "tabs", selected = "infogeneral")
        })
        
        observeEvent(input$fisicas_button, {
          updateTabItems(session, "tabs", selected = "infogeneral")
        })
        
        observeEvent(input$agropecuarias_button, {
          updateTabItems(session, "tabs", selected = "infogeneral")
        })
        
        observeEvent(input$alimentos_button, {
          updateTabItems(session, "tabs", selected = "infogeneral")
        })
        
        observeEvent(input$conservacion_button, {
          updateTabItems(session, "tabs", selected = "infogeneral")
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
                     input$caract_sector
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
            write.csv2(main_bases %>% select("Ocupación",
                                            c(
                                              input$area_cualificacion,
                                              input$denominacion_cuoc,
                                              input$cine,
                                              input$ciiu
                                            )
              
            ), file, row.names = T, fileEncoding = "ASCII")
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

})
