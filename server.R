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
# source("data/scripts/excel_reader.R")

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
              size = 8,
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
            theme_minimal()
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
            theme_minimal()
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
            theme_minimal()
        })
        
#######################################################################################
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
