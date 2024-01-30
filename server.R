library(RSQLite)
library(tidyverse)
library(shiny)
library(shinydashboard)
library(shinyjs)
library(stringi)
library(reactable)
library(jsonlite)
library(readxl)

# load the kobo.R file
source("kobo.R")

# create a connection to the database called "mcn-relational.db"
con <- dbConnect(RSQLite::SQLite(), "data/db/mnc-relational.db")

areas_cualificacion <- dbReadTable(con, "areas_cualificacion")


# Abrir base de datos consolidada
main_bases <- readxl::read_xls("data/input/bases/BaseFinal.xls", guess_max = 2021) %>% 
  slice(c(2021:5000)) %>% as.tibble() 
  

dim(main_bases)

main_bases$`Tasa crecimiento 2022` <- as.double(main_bases$`Tasa crecimiento 2022`)
main_bases$`Valor agregado 2022` <- as.double(main_bases$`Valor agregado 2022`)
main_bases$`Ocupados CIIU 2022` <- as.double(main_bases$`Ocupados CIIU 2022`)
main_bases$`Ocupados Total 2022` <- as.double(main_bases$`Ocupados Total 2022`)

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

        output$tabla_ciiu <- renderReactable({
            selected <- getReactableState("areas_catalog", "selected")
            req(selected)
            ids_selected <- toString(
                sprintf("'%s'", areas_cualificacion[selected, ]$codigo_area)
                )
            sql_template <- "
                SELECT codigo_area, area_cualificacion, clase, descripcion
                FROM ciiu_actividades_areas
                WHERE codigo_area IN (%s) AND clase IS NOT NULL
                ;"
            sql_query <- sprintf(sql_template, ids_selected)
            dbGetQuery(
                con, sql_query) %>%
            reactable(
                columns = list(
                    codigo_area = colDef(
                        name = "Código de área",
                        align = "center",
                        maxWidth = 120,
                        filterable = TRUE
                    ),
                    area_cualificacion = colDef(
                        name = "Área de cualificación",
                        filterable = TRUE
                    ),
                    clase = colDef(
                        name = "Clase",
                        align = "center",
                        maxWidth = 120,
                        filterable = TRUE
                    ),
                    descripcion = colDef(
                        name = "Descripción",
                        filterable = TRUE
                    )
                ),
                bordered = TRUE,
                highlight = TRUE,
                defaultPageSize = 5,
                rowStyle = list(cursor = "pointer"),
                pageSizeOptions = c(5, 10, 15),
                showPageSizeOptions = TRUE
            )
        })

        output$tabla_cuoc <- renderReactable({
            selected <- getReactableState("areas_catalog", "selected")
            req(selected)
            ids_selected <- toString(
                sprintf("'%s'", areas_cualificacion[selected, ]$codigo_area)
                )
            sql_template <- "
                SELECT codigo_area, area_cualificacion, indice_numerico, denominaciones
                FROM cuoc_index_2022
                WHERE codigo_area IN (%s)
                ;"
            sql_query <- sprintf(sql_template, ids_selected)
            dbGetQuery(
                con, sql_query)  %>%
            reactable(
                columns = list(
                    codigo_area = colDef(
                        name = "Código de área",
                        align = "center",
                        maxWidth = 120,
                        filterable = TRUE
                    ),
                    area_cualificacion = colDef(
                        name = "Área de cualificación",
                        filterable = TRUE
                    ),
                    indice_numerico = colDef(
                        name = "Índice numérico",
                        align = "center",
                        maxWidth = 120,
                        filterable = TRUE
                    ),
                    denominaciones = colDef(
                        name = "Denominaciones",
                        filterable = TRUE
                    )
                ),
                bordered = TRUE,
                highlight = TRUE,
                defaultPageSize = 5,
                rowStyle = list(cursor = "pointer"),
                pageSizeOptions = c(5, 10, 15),
                showPageSizeOptions = TRUE
            )
        })

        output$tabla_cine <- renderReactable({
            selected <- getReactableState("areas_catalog", "selected")
            req(selected)
            ids_selected <- toString(
                sprintf("'%s'", areas_cualificacion[selected, ]$codigo_area)
                )
            sql_template <- "
                SELECT *
                FROM cine_actividades_areas
                WHERE codigo_area IN (%s)
                ;"
            sql_query <- sprintf(sql_template, ids_selected)
            dbGetQuery(
                con, sql_query) %>%
            reactable(
                columns = list(
                    codigo_area = colDef(
                        name = "Código de área",
                        align = "center",
                        maxWidth = 120,
                        filterable = TRUE
                    ),
                    area_cualificacion = colDef(
                        name = "Área de cualificación",
                        filterable = TRUE
                    ),
                    codigo_cine_2011_ac = colDef(
                        name = "Código CINE",
                        align = "center",
                        maxWidth = 120,
                        filterable = TRUE
                    ),
                    campos_detallado = colDef(
                        name = "Campos Detallado",
                        filterable = TRUE
                    )
                ),
                bordered = TRUE,
                highlight = TRUE,
                defaultPageSize = 5,
                rowStyle = list(cursor = "pointer"),
                pageSizeOptions = c(5, 10, 15),
                showPageSizeOptions = TRUE
            )
        })

        output$selected_row_details <- renderText({
            selected <- getReactableState("areas_catalog", "selected")
            req(selected)
            # print the selected rows in the console which ids are in selected
            areas_cualificacion[selected, ]$codigo_area
        })

        output$actividades_areas_plot <- renderPlot({
            selected <- getReactableState("areas_catalog", "selected")
            req(selected)
            ids_selected <- toString(
                sprintf("'%s'", areas_cualificacion[selected, ]$codigo_area)
                )
            sql_template <- "
                SELECT codigo_area, COUNT(clase) AS actividades_economicas
                FROM ciiu_actividades_areas
                WHERE clase IS NOT NULL AND codigo_area IN (%s)
                GROUP BY codigo_area;"
            sql_query <- sprintf(sql_template, ids_selected)
            data <- dbGetQuery(con, sql_query)
            data %>%
                ggplot() +
                geom_col(aes(
                    x = codigo_area,
                    y = actividades_economicas,
                    fill = codigo_area)) +
                # put the labels on top of the bars rotate 90 degrees and with the bar color
                geom_text(aes(
                    x = codigo_area,
                    y = actividades_economicas,
                    label = actividades_economicas,
                    color = codigo_area),
                    vjust = -0.5,
                    size = 8,
                    fontface = "bold") +
                labs(
                    # title = "Número de actividades económicas por área de cualificación",
                    x = "Área de cualificación",
                    y = "Número de actividades económicas (CIIU)"
                ) +
                # change the y max limit to the highest bar plus 10
                scale_y_continuous(
                    limits = c(0, max(data$actividades_economicas) + 10)
                ) +
                theme_minimal()
        })

        output$ocupaciones_areas_plot <- renderPlot({
            selected <- getReactableState("areas_catalog", "selected")
            req(selected)
            ids_selected <- toString(
                sprintf("'%s'", areas_cualificacion[selected, ]$codigo_area)
                )
            sql_template <- "
                SELECT codigo_area, COUNT(indice_numerico) AS denominaciones
                FROM cuoc_index_2022
                WHERE codigo_area IN (%s)
                GROUP BY codigo_area;"
            sql_query <- sprintf(sql_template, ids_selected)
            data <- dbGetQuery(con, sql_query)
            data %>%
                ggplot() +
                geom_col(aes(
                    x = codigo_area,
                    y = denominaciones,
                    fill = codigo_area)) +
                # put the labels on top of the bars rotate 90 degrees and with the bar color
                geom_text(aes(
                    x = codigo_area,
                    y = denominaciones,
                    label = denominaciones,
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
                    limits = c(0, max(data$denominaciones) + 100)
                ) +
                theme_minimal()
        })

        output$cine_areas_plot <- renderPlot({
            selected <- getReactableState("areas_catalog", "selected")
            req(selected)
            ids_selected <- toString(
                sprintf("'%s'", areas_cualificacion[selected, ]$codigo_area)
                )
            sql_template <- "
                SELECT 
                codigo_area, COUNT(codigo_cine_2011_ac) AS campo_detallado
                FROM cine_actividades_areas
                WHERE codigo_area IN (%s)
                GROUP BY codigo_area;"
            sql_query <- sprintf(sql_template, ids_selected)
            data <- dbGetQuery(con, sql_query)
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
                theme_minimal()
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

# HOME --------------------------------------------------------------------

# observeEvent(input$more_info {
#   runjs('$("#col_aprende").attr("href", "https://www.example.com");')
#   # Trigger a click on the hidden link
#   runjs('$("#col_aprende")[0].click();')
# })
        
# SURVEY ENCUESTA ---------------------------------------------------------


        output$survey_table <- renderReactable(
            datos %>%
            select("Seleccione el área de cualificación para la cual esta realizando la entrevista.",
                   c(input$survey_variables_1,
                   input$survey_variables_2, 
                   input$survey_variables_3,
                   input$survey_variables_4)
                   ) %>%
            reactable(
                filterable = TRUE, minRows = 10
            )
        )
        
        observeEvent(input$clear_infoGeneral, {
          updateSelectizeInput(session, "survey_variables_1", selected = character(0))
        })
        
        observeEvent(input$clear_otrosCargos, {
          updateSelectizeInput(session, "survey_variables_2", selected = character(0))
        })
        
        observeEvent(input$clear_estrategias, {
          updateSelectizeInput(session, "survey_variables_3", selected = character(0))
        })
        
        observeEvent(input$clear_habilidades, {
          updateSelectizeInput(session, "survey_variables_4", selected = character(0))
        })
        
        # Descargar tabla
        output$download_survey_csv <- downloadHandler(
          filename = function(){"encuesta_filtrada.csv"},
          content = function(file){
            write.csv(datos %>% select(
                                      "Seleccione el área de cualificación para la cual esta realizando la entrevista.",
                                      c(input$survey_variables_1,
                                        input$survey_variables_2, 
                                        input$survey_variables_3,
                                        input$survey_variables_4)
            ), file, row.names = FALSE, fileEncoding = "UTF-8")
          }
        )

# Images for Home page ----------------------------------------------------

        
        output$img_fases <- renderImage({
          path_to_png <- "www/images/ruta_diagrama_1.png"
          list(
            src = path_to_png,
            width = "100%",
            height = "100%",
            alt = "Chart")
        }, deleteFile = F)
        
        output$img_fases_descripcion <- renderImage({
          path_to_png <- "www/images/ruta_descripcion_2.png"
          list(
            src = path_to_png,
            width = "100%",
            height = "100%",
            alt = "Chart")
        }, deleteFile = F)
        

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
              filterable = TRUE, minRows = 10
            )
        )
        
        # Download table
        output$download_csv <- downloadHandler(
          filename = function(){"datos_consolidados.csv"},
          content = function(file){
            write.csv(main_bases %>% select("Ocupación",
                                            c(
                                              input$area_cualificacion,
                                              input$denominacion_cuoc,
                                              input$cine,
                                              input$ciiu
                                            )
              
            ), file, row.names = FALSE, fileEncoding = "UTF-8")
          }
        )
        
        
        observeEvent(input$clear_area, {
          updateSelectizeInput(session, "area_cualificacion", selected = character(0))
        })
       
        observeEvent(input$clear_CUOC, {
          updateSelectizeInput(session, "denominacion_cuoc", selected = character(0))
        })
        
        observeEvent(input$clear_CINE, {
          updateSelectizeInput(session, "cine", selected = character(0))
        })
        
        observeEvent(input$clear_CIIU, {
          updateSelectizeInput(session, "ciiu", selected = character(0))
        })
        
        observeEvent(input$clear_caracterizacion, {
          updateSelectizeInput(session, "caract_sector", selected = character(0))
        })
        
        observeEvent(input$clear_brechas, {
          updateSelectizeInput(session, "brechas_hum", selected = character(0))
        })
        
        observeEvent(input$clear_analisis, {
          updateSelectizeInput(session, "analisis_funcional", selected = character(0))
        })
        
        observeEvent(input$clear_estructura, {
          updateSelectizeInput(session, "estructura_cualificacion", selected = character(0))
        })

})
