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

# Pie charts
library(plotly)

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

# Load base descriptivas v1
base_mediosBusqueda <- read_excel("data/input/bases/Base2Descriptivasv1.xls", sheet = "MediosBusqueda")
base_MotivosNoVacante <- read_excel("data/input/bases/Base2Descriptivasv1.xls", sheet = "MotivosNOVacante")
base_AccionesVacante <- read_excel("data/input/bases/Base2Descriptivasv1.xls", sheet = "AccionesVacante")
base_DiseñoPrograma <- read_excel("data/input/bases/Base2Descriptivasv1.xls", sheet = "DisenoPrograma")

# Load Base descriptivas 5 
base_brechasCantidad = read_excel("data/input/bases/Base5DescriptivasBrechas.xls", sheet = "BrechasCantidad")
base_brechasCalidad = read_excel("data/input/bases/Base5DescriptivasBrechas.xls", sheet = "BrechasCalidad")
base_pertinencia = read_excel("data/input/bases/Base5DescriptivasBrechas.xls", sheet = "BrechasPertinencia")
base_demanda__ = read_excel("data/input/bases/Base5DescriptivasBrechas.xls", sheet = "BaseDemanda")

# Load Caracterización Tables
base_TasaOcupados <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Tasa de ocupados")
names(base_TasaOcupados)[4] <- "Código área"
base_TasaOcupados <- base_TasaOcupados %>%
  mutate(
    `Ocupados` = round(`Ocupados`, 0),
    `Tasa de ocupados` = round(`Tasa de ocupados`, 2),
    `Población en Edad de Trabajar` = round(`Población en Edad de Trabajar`, 0)
  )

base_OcupadosCIIU <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Ocupados por división CIIU")
names(base_OcupadosCIIU)[1] <- "Código área"
names(base_OcupadosCIIU)[3] <-"Código CIIU"

base_OcupadosCIIU <- base_OcupadosCIIU %>%
  mutate(
    `Ocupados` = round(`Ocupados`, 0),
    `Proporción ocupados` = round(`Proporción ocupados`, 2)
  )


base_OcupadosEdadSexo <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Ocupados por edad y sexo")
names(base_OcupadosEdadSexo)[1] <- "Código área"  

base_OcupadosEdadSexo <- base_OcupadosEdadSexo %>%
  mutate(
    `Ocupados Hombres` = round(`Ocupados Hombres`, 0),
    `Ocupados Mujeres` = round(`Ocupados Mujeres`, 0),
    `Proporción Hombres` = round(`Proporción Hombres`, 2),
    `Proporción Mujeres` = round(`Proporción Mujeres`, 2)
  )

base_OcupadosNivelEdu <- read_excel("data/input/bases/Caracterizacion.xlsx", sheet = "Ocupados por Nivel edu")
names(base_OcupadosNivelEdu)[1] <- "Código área"  

base_OcupadosNivelEdu <- base_OcupadosNivelEdu %>%
  mutate(
    `Ocupados` = round(`Ocupados`, 0),
    `Proporción Ocupados` = round(`Proporción Ocupados`, 2),
    `Nivel educativo` = gsub("\\*", "", `Nivel educativo`)
  )

# Load SPE tables
DemandaSPE <- read_dta("data/input/bases/BaseFinalSPEV2.dta")
names(DemandaSPE) <- c("Año","Código municipio","Departamento","Municipio","Experiencia laboral","Rangos salariales","Código CIIU",
                       "Nivel educativo","Código Ocupación","Ocupación","Código área","Nombre área cualificación","Cantidad Vacantes","Puestos Trabajo")

base_OfertaSNIES <- read_excel("data/input/bases/InformacionSNIES.xlsx")
names(base_OfertaSNIES) <- c(
  "Código institución padre","Código institución","Nombre_institución","Estado institución","Carácter_académico",
  "Sector","Registro unico","Código snies del programa","Código anterior icfes","Nombre del programa",
  "Titulo_otorgado","Estado programa","Justificacion","Justificacion detallada","Reconocimiento del ministerio",
  "Resolución de aprobación","Fecha de resolución","Fecha ejecutoria","Vigencia años","Fecha de registro en snies",
  "Cine f 2013 ac campo amplio","Cine f 2013 ac campo específic","Cine f 2013 ac campo detallado","Área de conocimiento","Núcleo básico del conocimiento",
  "Nivel académico","Nivel de formación","Modalidad","Número créditos","Número periodos de duración",
  "Periodicidad","Se ofrece por ciclos propedéut","Periodicidad admisiones","Programa en convenio","Departamento oferta programa", 
  "Municipio oferta programa","Costo matrícula estud nuevos","Código área","Nombre área cualificación" 
)

base_oferta_educativa <- read_excel("data/input/bases/OfertaEducativa.xls")

# create a connection to the database called "mcn-relational.db"
con <- dbConnect(RSQLite::SQLite(), "data/db/mnc-relational.db")

# Read areas table from database
areas_cualificacion <- dbReadTable(con, "areas_cualificacion")

# Read CUOC table
cuoc_table_ <- read_excel("data/input/bases/CUOC.xls")

# Open facts table nd modify variables
main_bases <- dbReadTable(con, "fact_table")
main_bases_names <- c(
  "Sección","División","Grupo","Código CIIU","Descripción",
  "Código área","Nombre área cualificación","Código CINE2011 AC","Campos Detallado","Código Grandes Grupos",
  "Grandes Grupos","Código Subgrupos principales","Subgrupos principales","Código subgrupos","Subgrupos",
  "Códigos Grupos primarios","Grupos primarios","Código Ocupación","Ocupación","Código denominaciones",
  "Denominacion","Código CIUO08AC","Código CNO","Ocupación Afín","Nombre Ocupación Afín",
  "Nombre Destreza","Nombre Conocimiento","Nivel Competencia","Descripción Ocupación","Consecutivo Función",
  "Redacción Función","Valor agregado","Ocupados CIIU","Ocupados Total","Año",
  "Tasacrecimiento","BQ Atraccion D","BP Desarticulacion D","BQ DeficitP D","Denominacion CDC",
  "BC Conocimientos D","BC destreza D","BP Conocimientos D","BP destreza D","BQ Programa D",
  "BQ Atraccion vacanteD","BP Experiencia_vacanteD","BC Competencia vacanteD","BQ Atraccion vacante ocu","BP Experiencia vacante ocu",
  "BC Competencia vacante ocu","BC Conocimientos ocu","BC destreza ocu","BP Conocimientos ocu","BP destreza ocu",
  "BQ Programa ocu","BQ Atraccion ocu","BP Desarticulacion ocu","BQ DeficitP ocu"
)
names(main_bases) <- main_bases_names

main_bases <- main_bases %>%
  mutate(Tasacrecimiento = round(Tasacrecimiento, 2),
                      `Valor agregado` = round(`Valor agregado`, 2),
                      `Ocupados CIIU` = round(`Ocupados CIIU`, 2),
                      `Ocupados Total` = round(`Ocupados Total`, 2),
)

# Load Difícil Consecución
base_cargosDificilConsec = read_excel("data/input/bases/Base3DescriptivasCDC.xls", sheet = "CargosDC")
base_estadisticas_DC <- read_excel("data/input/bases/Base3DescriptivasCDC.xls", sheet = "NúmeroDC")
base_cargos_criticos <- read_excel("data/input/bases/Base3DescriptivasCDC.xls", sheet = "CargosCriticos")
base_demanda <- read_excel("data/input/bases/Base3DescriptivasCDC.xls", sheet = "DemandaSA&IS")

# Load Brechas Empresas
base_brechaEmpresasEstadisticas <- read_excel("data/input/bases/BrechasEmpresas.xls", sheet = "Estadisticas")
names(base_brechaEmpresasEstadisticas)[1] <- "Código área"
names(base_brechaEmpresasEstadisticas)[2] <- "Nombre área cualificación"
names(base_brechaEmpresasEstadisticas)[3] <- "Ocupación Misional"

base_brechaEmpresasDenominación = read_excel("data/input/bases/BrechasEmpresas.xls", sheet = "Denominacion")
names(base_brechaEmpresasDenominación)[1] <- "Código área"
names(base_brechaEmpresasDenominación)[2] <- "Nombre área cualificación"

base_brechaEmpresasOcupacion = read_excel("data/input/bases/BrechasEmpresas.xls", sheet = "Ocupacion")
names(base_brechaEmpresasOcupacion)[1] <- "Código área"
names(base_brechaEmpresasOcupacion)[2] <- "Nombre área cualificación"

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
        
        # Deploy selectizeinput object
        output$select_area_catalog_2_1 <- renderUI({
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
        
        # Deploy selectizeinput object
        output$select_area_catalog_2_2 <- renderUI({
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
            wordcloud2a(size = 0.5, color = "random-dark", rotateRatio = 0, widgetsize = 100)
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
            wordcloud2a(size = 0.5, color = "random-dark", rotateRatio = 0, widgetsize = 100)
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
            wordcloud2a(size = 0.5, color = "random-dark", rotateRatio = 0, widgetsize = 100)
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
        # observeEvent(input$clear_areas_5, {
        #   updateSelectizeInput(session, "select_area_catalog_5", selected = character(0))
        # })
        
        # ############################# PLOTS GESTION VACANTES
        
        
          output$select_area_gestionVacantes <- renderUI({
            choices <- setNames(names(base_socioemocionales)[2:6], c("ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                                                                     "AGROPECUARIO, SILVICULTURA, PESCA, ACUICULTURA Y VETERINARIA",
                                                                     "ARTES VISUALES, PLÁSTICAS Y DEL PATRIMONIO CULTURAL",
                                                                     "CONSERVACIÓN, PROTECCIÓN Y SANEAMIENTO AMBIENTAL",
                                                                     "ELABORACIÓN Y TRANSFORMACIÓN DE ALIMENTOS")
            )
            selectizeInput("select_area_gestionVacantes_", "Seleccione Área:",
                           choices = choices,
                           selected = names(base_socioemocionales)[2],
                           multiple = F
            )
          })
        
        
        # Deploy Medios de búsqueda plots -------------------------------------------------------------
        output$medios_busqueda_plot <- renderPlot({
          selected_column <- input$select_area_gestionVacantes_
          base_mediosBusqueda %>%
            dplyr::select(`Medios de búsqueda de personal`, !!sym(selected_column)) %>% 
            arrange(desc(!!sym(selected_column))) %>% 
            head(5) %>%
            ggplot() +
            geom_col(
              aes(x = `Medios de búsqueda de personal`,
                  y = !!sym(selected_column),
                  fill = `Medios de búsqueda de personal`
              )
            ) +
            geom_text(aes(
              x = `Medios de búsqueda de personal`,
              y = !!sym(selected_column),
              label = !!sym(selected_column),
              color = `Medios de búsqueda de personal`),
              vjust = -0.5,
              size = 8,
              fontface = "bold") +
            labs(
              # title = "Número de actividades económicas por área de cualificación",
              y = "",
              x = ""
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
        output$motivosNovacante_plot <- renderPlot({
          selected_column <- input$select_area_gestionVacantes_
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
              y = "",
              x = ""
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
          
          # Deploy Acciones Diseño Programa -------------------------------------------------------------
          output$disenoPrograma_plot <- renderPlot({
            selected_column <- input$select_area_gestionVacantes_
            base_DiseñoPrograma %>%
              dplyr::select(`La empresa se involucra en el diseño y/o actualización de programas de formación`, !!sym(selected_column)) %>% 
              arrange(desc(!!sym(selected_column))) %>% 
              head(5) %>%
              ggplot() +
              geom_col(
                aes(x = `La empresa se involucra en el diseño y/o actualización de programas de formación`,
                    y = !!sym(selected_column),
                    fill = `La empresa se involucra en el diseño y/o actualización de programas de formación`
                )
              ) +
              geom_text(aes(
                x = `La empresa se involucra en el diseño y/o actualización de programas de formación`,
                y = !!sym(selected_column),
                label = !!sym(selected_column),
                color = `La empresa se involucra en el diseño y/o actualización de programas de formación`),
                vjust = -0.5,
                size = 8,
                fontface = "bold") +
              labs(
                # title = "Número de actividades económicas por área de cualificación",
                y = "",
                x = ""
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
          
          # Deploy Acciones Vacatnte plots -------------------------------------------------------------
          output$accionesVacante_plot <- renderPlot({
            selected_column <- input$select_area_gestionVacantes_
            base_AccionesVacante %>%
              dplyr::select(`Acciones para cubrir una vacante`, !!sym(selected_column)) %>% 
              arrange(desc(!!sym(selected_column))) %>% 
              head(5) %>%
              ggplot() +
              geom_col(
                aes(x = `Acciones para cubrir una vacante`,
                    y = !!sym(selected_column),
                    fill = `Acciones para cubrir una vacante`
                )
              ) +
              geom_text(aes(
                x = `Acciones para cubrir una vacante`,
                y = !!sym(selected_column),
                label = !!sym(selected_column),
                color = `Acciones para cubrir una vacante`),
                vjust = -0.5,
                size = 8,
                fontface = "bold") +
              labs(
                # title = "Número de actividades económicas por área de cualificación",
                y = "",
                x = ""
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
        
        # Deploy selectizeinput object 3_1
        output$select_area_catalog_3_1 <- renderUI({
          choices <- setNames(names(base_socioemocionales)[2:6], c("ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                                                                   "AGROPECUARIO, SILVICULTURA, PESCA, ACUICULTURA Y VETERINARIA",
                                                                   "ARTES VISUALES, PLÁSTICAS Y DEL PATRIMONIO CULTURAL",
                                                                   "CONSERVACIÓN, PROTECCIÓN Y SANEAMIENTO AMBIENTAL",
                                                                   "ELABORACIÓN Y TRANSFORMACIÓN DE ALIMENTOS")
          )
          selectizeInput("select_area_catalog_3_1", "Seleccione Área:",
                         choices = choices,
                         selected = "AFIR",
                         multiple = T
          )
        })
        
        # Deploy selectizeinput object 3_2
        output$select_area_catalog_3_2 <- renderUI({
          choices <- setNames(names(base_socioemocionales)[2:6], c("ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                                                                   "AGROPECUARIO, SILVICULTURA, PESCA, ACUICULTURA Y VETERINARIA",
                                                                   "ARTES VISUALES, PLÁSTICAS Y DEL PATRIMONIO CULTURAL",
                                                                   "CONSERVACIÓN, PROTECCIÓN Y SANEAMIENTO AMBIENTAL",
                                                                   "ELABORACIÓN Y TRANSFORMACIÓN DE ALIMENTOS")
          )
          selectizeInput("select_area_catalog_3_2", "Seleccione Área:",
                         choices = choices,
                         selected = "AFIR",
                         multiple = T
          )
        })
        
        # Deploy selectizeinput object 3_2_1
        output$select_area_catalog_3_2_1 <- renderUI({
          choices <- setNames(names(base_socioemocionales)[2:6], c("ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                                                                   "AGROPECUARIO, SILVICULTURA, PESCA, ACUICULTURA Y VETERINARIA",
                                                                   "ARTES VISUALES, PLÁSTICAS Y DEL PATRIMONIO CULTURAL",
                                                                   "CONSERVACIÓN, PROTECCIÓN Y SANEAMIENTO AMBIENTAL",
                                                                   "ELABORACIÓN Y TRANSFORMACIÓN DE ALIMENTOS")
          )
          selectizeInput("select_area_catalog_3_2_1", "Seleccione Área:",
                         choices = choices,
                         selected = "AFIR",
                         multiple = T
          )
        })
        
        # Deploy selectizeinput object 3_3
        output$select_area_catalog_3_3 <- renderUI({
          choices <- setNames(names(base_socioemocionales)[2:6], c("ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                                                                   "AGROPECUARIO, SILVICULTURA, PESCA, ACUICULTURA Y VETERINARIA",
                                                                   "ARTES VISUALES, PLÁSTICAS Y DEL PATRIMONIO CULTURAL",
                                                                   "CONSERVACIÓN, PROTECCIÓN Y SANEAMIENTO AMBIENTAL",
                                                                   "ELABORACIÓN Y TRANSFORMACIÓN DE ALIMENTOS")
          )
          selectizeInput("select_area_catalog_3_3", "Seleccione Área:",
                         choices = choices,
                         selected = "AFIR",
                         multiple = T
          )
        })
        
        # Deploy selectizeinput object 3_4
        output$select_area_catalog_3_4 <- renderUI({
          choices <- setNames(names(base_socioemocionales)[2:6], c("ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                                                                   "AGROPECUARIO, SILVICULTURA, PESCA, ACUICULTURA Y VETERINARIA",
                                                                   "ARTES VISUALES, PLÁSTICAS Y DEL PATRIMONIO CULTURAL",
                                                                   "CONSERVACIÓN, PROTECCIÓN Y SANEAMIENTO AMBIENTAL",
                                                                   "ELABORACIÓN Y TRANSFORMACIÓN DE ALIMENTOS")
          )
          selectizeInput("select_area_catalog_3_4", "Seleccione Área:",
                         choices = choices,
                         selected = "AFIR",
                         multiple = T
          )
        })
        
        # Observe to event clear button 3
        observeEvent(input$clear_areas_3, {
          updateSelectizeInput(session, "select_area_catalog_3", selected = character(0))
        })
        
        # Observe to event clear button 3_1
        observeEvent(input$clear_areas_3_1, {
          updateSelectizeInput(session, "select_area_catalog_3_1", selected = character(0))
        })
        
        # Observe to event clear button 3_2
        observeEvent(input$clear_areas_3_2, {
          updateSelectizeInput(session, "select_area_catalog_3_2", selected = character(0))
        })
        
        # Observe to event clear button 3_2
        observeEvent(input$clear_areas_3_2_1, {
          updateSelectizeInput(session, "select_area_catalog_3_2_1", selected = character(0))
        })
        
        # Observe to event clear button 3_3
        observeEvent(input$clear_areas_3_3, {
          updateSelectizeInput(session, "select_area_catalog_3_3", selected = character(0))
        })
        
        # Observe to event clear button 3_4
        observeEvent(input$clear_areas_3_4, {
          updateSelectizeInput(session, "select_area_catalog_3_4", selected = character(0))
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
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3_1) %>%
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
              title = "",
              y = "",
              x = ""
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 86)
            ) +
            theme_few() +
            theme(text = element_text(size = 15),
            plot.title = element_text(hjust = 0.5) 
            )
        })
        
        # Pie chart descriptivas área de desempeño
        colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')
        output$pie_descriptivas_area <- renderPlotly({
          base_descriptivas %>% dplyr::select(`Código_área`, `¿Cuál es su área de desempeño?`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3_1) %>%
            group_by(`¿Cuál es su área de desempeño?`) %>% count(`¿Cuál es su área de desempeño?`) %>% 
            plot_ly(labels = ~`¿Cuál es su área de desempeño?`, values = ~n, type="pie",
                    textposition = 'inside',
                    textinfo = 'label+percent',
                    insidetextfont = list(color = '#FFFFFF'),
                    hoverinfo = 'text',
                    text = ~paste('', n, ''),
                    marker = list(colors = colors,
                                  line = list(color = '#FFFFFF', width = 1)),
                    #The 'pull' attribute can also be used to create space between the sectors
                    showlegend = FALSE) %>%
            layout(title = '',
                   font = list(size = 13)) %>% 
            layout(
                width = 500,
                height = 500,
                xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        })
        
   # -----------------Descriptivas Sector Económico
        output$descriptivas_sectorEcon <- renderPlot({
          base_descriptivas %>% dplyr::select(`Código_área`, `Sector Económico`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3_1) %>%
            group_by(`Sector Económico`) %>% count(`Sector Económico`) %>%
            ggplot() +
            geom_col(aes(
              x = `Sector Económico`,
              y = `n`,
              fill = `Sector Económico`)) +
            geom_text(aes(
              x = `Sector Económico`,
              y = `n`,
              label = `n`,
              color = `Sector Económico`),
              vjust = -0.5,
              size = 8,
              show.legend = FALSE,
              fontface = "bold") +
            labs(
              title = "",
              y = "",
              x = ""
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 86)
            ) +
            theme_few() +
            theme(text = element_text(size = 15),
                  plot.title = element_text(hjust = 0.5) 
            )
        })
        
        # Pie chart descriptivas área de desempeño
        colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')
        output$pie_descriptivas_sectorEcon <- renderPlotly({
          base_descriptivas %>% dplyr::select(`Código_área`, `Sector Económico`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3_1) %>%
            group_by(`Sector Económico`) %>% count(`Sector Económico`) %>% 
            plot_ly(labels = ~`Sector Económico`, values = ~n, type="pie",
                    textposition = 'inside',
                    textinfo = 'label+percent',
                    insidetextfont = list(color = '#FFFFFF'),
                    hoverinfo = 'text',
                    text = ~paste('', n, ''),
                    marker = list(colors = colors,
                                  line = list(color = '#FFFFFF', width = 1)),
                    #The 'pull' attribute can also be used to create space between the sectors
                    showlegend = FALSE) %>%
            layout(title = '',
                   font = list(size = 13)) %>% 
            layout(
              width = 500,
              height = 500,
              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        })
        

# -----------------Descriptivas tamaño empresa
        output$tamano_empresa <- renderPlot({
          base_descriptivas %>% dplyr::select(`Código_área`, `Tamaño empresa`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3_1) %>%
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
              title = "",
              y = "",
              x = ""
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 40)
            ) +
            theme_few() +
            theme(text = element_text(size = 15),
                  plot.title = element_text(hjust = 0.5) 
            ) 
        })
        
        # Pie chart descriptivas por Tamaño de la Empresa
        colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')
        output$pie_tamano_empresa <- renderPlotly({
          base_descriptivas %>% dplyr::select(`Código_área`, `Tamaño empresa`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3_1) %>%
            group_by(`Tamaño empresa`) %>% count(`Tamaño empresa`) %>% 
            plot_ly(labels = ~`Tamaño empresa`, values = ~n, type="pie",
                    textposition = 'inside',
                    textinfo = 'label+percent',
                    insidetextfont = list(color = '#FFFFFF'),
                    hoverinfo = 'text',
                    text = ~paste('', n, ''),
                    marker = list(colors = colors,
                                  line = list(color = '#FFFFFF', width = 1)),
                    #The 'pull' attribute can also be used to create space between the sectors
                    showlegend = FALSE) %>% 
            layout(title = '',
                                                    font = list(size = 13)) %>% 
            layout(
              width = 500,
              height = 500,
              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        })

# -----------------Descriptivas Cargos dificil consecusión
        output$dificil_consecucion <- renderPlot({
          base_cargosDificilConsec %>% dplyr::select(`Código_área`, `CargosCriticosDificilC`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3_3) %>%
            group_by(`CargosCriticosDificilC`) %>% count(`CargosCriticosDificilC`) %>%
            ggplot() +
            geom_col(aes(
              x = `CargosCriticosDificilC`,
              y = `n`,
              fill = as.character(`CargosCriticosDificilC`))) +
            geom_text(aes(
              x = `CargosCriticosDificilC`,
              y = `n`,
              label = `n`,
              color = `CargosCriticosDificilC`),
              vjust = -0.5,
              size = 8,
              show.legend = FALSE,
              fontface = "bold") +
            labs(
              title = "",
              y = "",
              fill = "CargosCriticosDificilC"
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 61)
            ) +
            theme_few() +
            theme(text = element_text(size = 15),
                  plot.title = element_text(hjust = 0.5) 
            )
        })
        
        output$base_estadisticas_DC <- renderReactable(
          base_estadisticas_DC %>% reactable(
            filterable = F, minRows = 6
          )
        )
        
        # UiOutput Cargos Críticos por Área
        output$select_area_CargosCriticos <- renderUI({
          choices <- base_cargos_criticos$`Nombreáreacualificación`
          selectizeInput("select_area_CargosCriticos_", "Seleccione Área:",
                         choices = choices,
                         selected = "ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                         multiple = T
          )
        })
        
        output$base_cargosCriticos <- renderReactable(
          base_cargos_criticos %>% 
            filter(`Nombreáreacualificación` %in% input$select_area_CargosCriticos_) %>%
            reactable(
            filterable = T, defaultPageSize = 7
          )
        )
        
        # Clear cargos criticos
        observeEvent(input$clear_CargosCriticos, {
          updateSelectizeInput(session, "select_area_CargosCriticos_", selected = character(0))
        })
        
        # Download base_cargoscriticos
        output$download_tablaCargosCriticos <- downloadHandler(
          filename = function(){"CargosCriticos.csv"},
          content = function(file){
            write.csv2(base_cargos_criticos %>% 
                         filter(`Nombreáreacualificación` %in% input$select_area_CargosCriticos_),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )
        
        
        # UiOutput Base demanda
        output$select_area_baseDemanda <- renderUI({
          choices <- base_demanda$`Nombreáreacualificación`
          selectizeInput("select_area_BaseDemanda_", "Seleccione Área:",
                         choices = choices,
                         selected = "ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                         multiple = T
          )
        })
        
        output$base_demanda_ <- renderReactable(
          base_demanda  %>% 
            filter(`Nombreáreacualificación` %in% input$select_area_BaseDemanda_) %>%
            reactable(
            filterable = T, minRows = 10
          )
        )
        
        # Clear base demanda
        observeEvent(input$clear_tablaDemandaS, {
          updateSelectizeInput(session, "select_area_BaseDemanda_", selected = character(0))
        })
        
        # Download base_demanda
        output$download_tablaDemandaS <- downloadHandler(
          filename = function(){"DemandaSatisfechaeInsatisfecha.csv"},
          content = function(file){
            write.csv2(base_demanda  %>% 
                         filter(`Nombreáreacualificación` %in% input$select_area_BaseDemanda_),
                       file,
                       row.names = T,
                       fileEncoding = "ISO-8859-1"
            )
          }
        )

        
        
        # Pie chart cargos de dificil consecucion
        colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')
        output$pie_dificil_consecucion <- renderPlotly({
          base_descriptivas %>% dplyr::select(`Código_área`, `Cargos dificil consecusión`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3_3) %>%
            group_by(`Cargos dificil consecusión`) %>% count(`Cargos dificil consecusión`) %>% 
            plot_ly(labels = ~`Cargos dificil consecusión`, values = ~n, type="pie",
                    textposition = 'inside',
                    textinfo = 'label+percent',
                    insidetextfont = list(color = '#FFFFFF'),
                    hoverinfo = 'text',
                    text = ~paste('', n, ''),
                    marker = list(colors = colors,
                                  line = list(color = '#FFFFFF', width = 1)),
                    #The 'pull' attribute can also be used to create space between the sectors
                    showlegend = FALSE) %>%  layout(title = '',
                                                    font = list(size = 13)) %>% 
            layout(
              width = 500,
              height = 500,
              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        })
        
        # -----------------Descriptivas Departamentos
        output$departamentos <- renderPlot({
          base_descriptivas %>% dplyr::select(`Código_área`, `Departamento`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3_1) %>%
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
              title = "",
              y = "",
              x = "",
              fill = "Cargos de difícil consecución"
            ) +
            # change the y max limit to the highest bar plus 10
            scale_y_continuous(
              limits = c(0, 61)
            ) +
            theme_few() +
            theme(text = element_text(size = 15),
                  plot.title = element_text(hjust = 0.5) 
            )
        }) 
        
        # Pie chart por Departamentos
        colors <- c('rgb(211,94,96)', 'rgb(128,133,133)', 'rgb(144,103,167)', 'rgb(171,104,87)', 'rgb(114,147,203)')
        output$pie_departamentos <- renderPlotly({
          base_descriptivas %>% dplyr::select(`Código_área`, `Departamento`) %>%
            dplyr::filter(`Código_área` %in%  input$select_area_catalog_3_1) %>%
            group_by(`Departamento`) %>% count(`Departamento`) %>% 
            plot_ly(labels = ~`Departamento`, values = ~n, type="pie",
                    textposition = 'inside',
                    textinfo = 'label+percent',
                    insidetextfont = list(color = '#FFFFFF'),
                    hoverinfo = 'text',
                    text = ~paste('', n, ''),
                    marker = list(colors = colors,
                                  line = list(color = '#FFFFFF', width = 1)),
                    #The 'pull' attribute can also be used to create space between the sectors
                    showlegend = FALSE) %>%  layout(title = '',
                                                    font = list(size = 13)) %>% 
            layout(
              width = 500,
              height = 500,
              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
        })
        
########################################## BASES BRECHAS EMPRESAS ##########################################
        ##### Estadísticas generales
        output$select_area_BrechasEmpEst <- renderUI({
          choices <- base_brechaEmpresasEstadisticas$`Nombre área cualificación`
          selectizeInput("select_area_BrechasEmpEst_", "Seleccione Área:",
                         choices = choices,
                         selected = "ACTIVIDADES FÍSICAS, DEPORTIVAS Y RECREATIVAS",
                         multiple = T
          )
        })
        
        output$BrechasEmpEst <- renderReactable(
          base_brechaEmpresasEstadisticas %>% 
            filter(`Nombre área cualificación` %in% input$select_area_BrechasEmpEst_) %>% reactable(
            filterable = F, minRows = 3
          )
        )
        
        # Clear Button
        observeEvent(input$clear_BrechasEmpEst, {
          updateSelectizeInput(session, "select_area_BrechasEmpEst_", selected = character(0))
        })
        
        ##### Brechas KH a Nivel de Ocupación
        output$BrechasKHOcupacion <- renderReactable(
          base_brechaEmpresasOcupacion %>% 
            dplyr::select(`Código área`,
                   `Nombre área cualificación`,
                   input$brechasKHOcupacion_areaCualificacion,
                   input$brechasKHOcupacion_CaracGenerales,
                   input$brechasKHOcupacion_DenominacionesBrechas,
                   input$brechasKHOcupacion_IndicadoresBrechas,
                   input$brechasKHOcupacion_TotalIndicadores
                   ) %>%
            reactable(
              filterable = T, minRows = 6
            )
        )
        
        #Download BUtton
        output$download_KHOcupacion <- downloadHandler(
          filename = function(){"Brechas Capital Humano a Nivel de Ocupación.csv"},
          content = function(file){
            write.csv2(base_brechaEmpresasOcupacion %>% 
                         dplyr::select(`Código área`,
                                       `Nombre área cualificación`,
                                       input$brechasKHOcupacion_areaCualificacion,
                                       input$brechasKHOcupacion_CaracGenerales,
                                       input$brechasKHOcupacion_DenominacionesBrechas,
                                       input$brechasKHOcupacion_IndicadoresBrechas,
                                       input$brechasKHOcupacion_TotalIndicadores
                         ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )
        
        # Clear Button
        observeEvent(input$clear_KHOcupacion, {
          updateSelectizeInput(session, "brechasKHOcupacion_areaCualificacion", selected = character(0))
        })
        
        observeEvent(input$clear_KHOcupacion, {
          updateSelectizeInput(session, "brechasKHOcupacion_CaracGenerales", selected = character(0))
        })
        
        observeEvent(input$clear_KHOcupacion, {
          updateSelectizeInput(session, "brechasKHOcupacion_DenominacionesBrechas", selected = character(0))
        })
        
        observeEvent(input$clear_KHOcupacion, {
          updateSelectizeInput(session, "brechasKHOcupacion_IndicadoresBrechas", selected = character(0))
        })
        
        observeEvent(input$clear_KHOcupacion, {
          updateSelectizeInput(session, "brechasKHOcupacion_TotalIndicadores", selected = character(0))
        })
        
        ##### Brechas KH a Nivel de Denominación
        output$BrechasKHDenominacion <- renderReactable(
          base_brechaEmpresasDenominación %>% 
            dplyr::select(`Código área`,
                          `Nombre área cualificación`,
                          input$brechasKHDenominacion_areaCualificacion,
                          input$brechasKHDenominacion_CaracGenerales,
                          input$brechasKHDenominacion_EmpresasBrechas,
                          input$brechasKHDenominacion_IndicadoresBrechas,
                          input$brechasKHDenominacion_TotalIndicadores
            ) %>%
            reactable(
              filterable = T, minRows = 6
            )
        )
        
        #Download BUtton
        output$download_KHOcupacion <- downloadHandler(
          filename = function(){"Brechas Capital Humano a Nivel de Denominación.csv"},
          content = function(file){
            write.csv2(base_brechaEmpresasDenominación %>% 
                         dplyr::select(`Código área`,
                                       `Nombre área cualificación`,
                                       input$brechasKHDenominacion_areaCualificacion,
                                       input$brechasKHDenominacion_CaracGenerales,
                                       input$brechasKHDenominacion_EmpresasBrechas,
                                       input$brechasKHDenominacion_IndicadoresBrechas,
                                       input$brechasKHDenominacion_TotalIndicadores
                         ),
                       file,
                       row.names = T,
                       fileEncoding = "ISO-8859-1"
            )
          }
        )
        
        # Clear Button
        observeEvent(input$clear_KHDenominacion, {
          updateSelectizeInput(session, "brechasKHDenominacion_areaCualificacion", selected = character(0))
        })
        
        observeEvent(input$clear_KHDenominacion, {
          updateSelectizeInput(session, "brechasKHDenominacion_CaracGenerales", selected = character(0))
        })
        
        observeEvent(input$clear_KHDenominacion, {
          updateSelectizeInput(session, "brechasKHDenominacion_EmpresasBrechas", selected = character(0))
        })
        
        observeEvent(input$clear_KHDenominacion, {
          updateSelectizeInput(session, "brechasKHDenominacion_IndicadoresBrechas", selected = character(0))
        })
        
        observeEvent(input$clear_KHDenominacion, {
          updateSelectizeInput(session, "brechasKHDenominacion_TotalIndicadores", selected = character(0))
        })
        
########################################## BASES CARACTERIZACIÓN ##########################################
        
  ####################### TASA OCUPADOS
        output$base_TasaOcupados <- renderReactable(
          base_TasaOcupados %>% select(
            `Código área`,
            Año,
            Departamento,
            input$caract_TasaOcu_areaCual_,
            input$caract_TasaOcu_eduAno_,
            input$caract_TasaOcu_indices_
          ) %>% filter(Año %in% input$ocu_depto_año) %>% 
            filter(Departamento %in% input$ocu_depto_depto) %>% 
            reactable(
            filterable = TRUE, minRows = 10
          )
        )
        # Clear Button
        observeEvent(input$clear_baseTasaOcupados, {
          updateSelectizeInput(session, "caract_TasaOcu_areaCual_", selected = character(0))
        })
        
        observeEvent(input$clear_baseTasaOcupados, {
          updateSelectizeInput(session, "ocu_depto_depto", selected = character(0))
        })
        
        observeEvent(input$clear_baseTasaOcupados, {
          updateSelectizeInput(session, "ocu_depto_año", selected = character(0))
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
              `Código área`,
              Año,
              Departamento,
              input$caract_TasaOcu_areaCual_,
              input$caract_TasaOcu_eduAno_,
              input$caract_TasaOcu_indices_
            ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )
        
  ####################### OCUPADOS CIIU
        output$base_ocupadosCIIU <- renderReactable(
          base_OcupadosCIIU %>% select(
            `Código área`,
            Año,
            input$caract_ocuCIIU_areaCual_,
            input$caract_ocuCIIU_Ano_,
            input$caract_ocuCIIU_indices_
          ) %>% filter(Año %in% input$ocu_CIIU_año) %>% 
            reactable(
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
              `Código área`,
              Año,
              input$caract_ocuCIIU_areaCual_,
              input$caract_ocuCIIU_Ano_,
              input$caract_ocuCIIU_indices_
            ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )
        
  ####################### OCUPADOS EDAD Y SEXO
        output$base_ocupadosEdadSexo <- renderReactable(
          base_OcupadosEdadSexo %>% select(
            `Código área`,
            Año,
            `Rango de edad`,
            input$caract_ocuEdadSexo_areaCual_,
            input$caract_ocuEdadSexo_Ano_,
            input$caract_ocuEdadSexo_Edad_,
            input$caract_ocuEdadSexo_indices_) %>% 
            filter(Año %in% input$ocu_edadsexo_año_) %>%
            filter(`Rango de edad` %in% input$ocu_niveledu_rangoEdad_) %>%
            reactable(
            filterable = TRUE, minRows = 10
          )
        )
        
        # Selectize Input
        output$ocu_niveledu_rangoEdad <- renderUI({
          selectizeInput("ocu_niveledu_rangoEdad_", "Seleccione Rango de Edad:",
                         choices = names(table(base_OcupadosEdadSexo$`Rango de edad`)),
                         multiple = T,
                         selected = names(table(base_OcupadosEdadSexo$`Rango de edad`))
          )
        })
        
        # Clear Button
        observeEvent(input$clear_ocupadosEdadSexo, {
          updateSelectizeInput(session, "caract_ocuEdadSexo_areaCual_", selected = character(0))
        })
        
        observeEvent(input$clear_ocupadosEdadSexo, {
          updateSelectizeInput(session, "ocu_niveledu_rangoEdad_", selected = character(0))
        })
        
        observeEvent(input$clear_ocupadosEdadSexo, {
          updateSelectizeInput(session, "ocu_edadsexo_año_", selected = character(0))
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
              `Código área`,
              Año,
              `Rango de edad`,
              input$caract_ocuEdadSexo_areaCual_,
              input$caract_ocuEdadSexo_Ano_,
              input$caract_ocuEdadSexo_Edad_,
              input$caract_ocuEdadSexo_indices_
            ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )
        
  ####################### OCUPADOS NIVEL EDUCATIVO
        output$base_ocupadosNivelEdu <- renderReactable(
          base_OcupadosNivelEdu %>% select(
            `Código área`,
            Año,
            `Nivel educativo`,
            input$caract_OcuNivelEdu_areaCual_,
            input$caract_OcuNivelEdu_Ano_,
            input$caract_OcuNivelEdu_indices_
          ) %>%
            filter(Año %in% input$ocu_niveledu_año_) %>%
            filter(`Nivel educativo` %in% input$ocu_niveledu_niveledu_) %>% 
            reactable(
            filterable = TRUE, minRows = 10
          )
        )
        
        # Selectize Input
        output$ocu_niveledu_niveledu <- renderUI({
          selectizeInput("ocu_niveledu_niveledu_", "Seleccione Nivel Educativo:",
                         choices = names(table(base_OcupadosNivelEdu$`Nivel educativo`)),
                         multiple = T,
                         selected = names(table(base_OcupadosNivelEdu$`Nivel educativo`))
          )
        })
        
        # Clear Button
        observeEvent(input$clear_NivelEdu, {
          updateSelectizeInput(session, "caract_OcuNivelEdu_areaCual_", selected = character(0))
        })
        
        observeEvent(input$clear_NivelEdu, {
          updateSelectizeInput(session, "ocu_niveledu_niveledu_", selected = character(0))
        })
        
        observeEvent(input$clear_NivelEdu, {
          updateSelectizeInput(session, "ocu_niveledu_año_", selected = character(0))
        })
        
        #Download Button
        output$download_Ocu_NivelEdu <- downloadHandler(
          filename = function(){"Ocupados_NivelEducativo.csv"},
          content = function(file){
            write.csv2(base_OcupadosNivelEdu %>% select(
              `Código área`,
              Año,
              `Nivel educativo`,
              input$caract_OcuNivelEdu_areaCual_,
              input$caract_OcuNivelEdu_Ano_,
              input$caract_OcuNivelEdu_indices_
            ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )
        
######################################### BRECHAS ###################################################       
        # Brechas Cantidad
        output$base_brechasCantidad <- renderReactable(
          base_brechasCantidad %>% select(
            `Código_área`,
            `Nombreáreacualificación`,
            input$caract_brechasCalidad_cargo_,
            input$caract_calidad_razones_,
            input$indicadores_brechas_,
            input$brechasCantidad_areaCual_
          ) %>% 
            reactable(
              filterable = TRUE, minRows = 10
            )
        )
        
        #  Clear Buttons
        observeEvent(input$clear_brechasCalidad, {
          updateSelectizeInput(session, "caract_brechasCalidad_cargo_", selected = character(0))
        })
        
        observeEvent(input$clear_brechasCalidad, {
          updateSelectizeInput(session, "caract_calidad_razones_", selected = character(0))
        })
        observeEvent(input$clear_brechasCalidad, {
          updateSelectizeInput(session, "indicadores_brechas_", selected = character(0))
        })
        observeEvent(input$clear_brechasCalidad, {
          updateSelectizeInput(session, "brechasCantidad_areaCual_", selected = character(0))
        })
        
        #Download Button
        output$download_Ocu_NivelEdu <- downloadHandler(
          filename = function(){"Ocupados_NivelEducativo.csv"},
          content = function(file){
            write.csv2(base_brechasCantidad %>% select(
              input$caract_brechasCalidad_cargo_,
              input$caract_calidad_razones_,
              input$indicadores_brechas_,
              input$brechasCantidad_areaCual_
            ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )
        
        # Brechas Calidad
        
        output$base_brechasCalidad_ <- renderReactable(
          base_brechasCalidad %>% select(
            `Código_área`,
            `Nombreáreacualificación`,
            input$brechasCantidad_areaCual_1,
            input$caract_brechasCalidad_cargo_1,
            input$caract_calidad_razones_1,
            input$indicadores_brechas_1
          ) %>% 
            reactable(
              filterable = TRUE, minRows = 10
            )
        )
        
        #  Clear Buttons
        observeEvent(input$clear_brechasCalidad_1, {
          updateSelectizeInput(session, "brechasCantidad_areaCual_1", selected = character(0))
        })
        
        observeEvent(input$clear_brechasCalidad_1, {
          updateSelectizeInput(session, "caract_brechasCalidad_cargo_1", selected = character(0))
        })
        observeEvent(input$clear_brechasCalidad_1, {
          updateSelectizeInput(session, "caract_calidad_razones_1", selected = character(0))
        })
        observeEvent(input$clear_brechasCalidad_1, {
          updateSelectizeInput(session, "indicadores_brechas_1", selected = character(0))
        })
        
        #Download Button
        output$download_brechasCalidad_1 <- downloadHandler(
          filename = function(){"Ocupados_NivelEducativo.csv"},
          content = function(file){
            write.csv2(base_brechasCalidad %>% select(
              `Código_área`,
              `Nombre áreacu alificación`,
              input$brechasCantidad_areaCual_1,
              input$caract_brechasCalidad_cargo_1,
              input$caract_calidad_razones_1,
              input$indicadores_brechas_1
            ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )

        # Brechas Pertinencia
        output$base_brechasPertinencia <- renderReactable(
          base_pertinencia %>% select(
            `Código_área`,
            `Nombreáreacualificación`,
            input$brechasPertienencia_area,
            input$brechasPertienencia_cargo,
            input$brechasPertienencia_razones,
            input$brechasPertienencia_Indicadores
          ) %>% 
            reactable(
              filterable = TRUE, minRows = 10
            )
        )
        
        #  Clear Buttons
        observeEvent(input$clear_brechasPertinencia, {
          updateSelectizeInput(session, "brechasPertienencia_area", selected = character(0))
        })
        
        observeEvent(input$clear_brechasPertinencia, {
          updateSelectizeInput(session, "brechasPertienencia_cargo", selected = character(0))
        })
        observeEvent(input$clear_brechasPertinencia, {
          updateSelectizeInput(session, "brechasPertienencia_razones", selected = character(0))
        })
        observeEvent(input$clear_brechasPertinencia, {
          updateSelectizeInput(session, "brechasPertienencia_Indicadores", selected = character(0))
        })
        
        #Download Button
        output$download_base_pertinencia <- downloadHandler(
          filename = function(){"Ocupados_NivelEducativo.csv"},
          content = function(file){
            write.csv2(base_pertinencia %>% select(
              `Código_área`,
              `Nombreáreacualificación`,
              input$brechasPertienencia_area,
              input$brechasPertienencia_cargo,
              input$brechasPertienencia_razones,
              input$brechasPertienencia_Indicadores
            ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )
        
        
        ### Base Demanda
        
        output$base_demanda__ <- renderReactable(
          base_demanda__ %>% select(
            `Código_área`,
            `Nombreáreacualificación`,
            input$caract_OtrasFuentes_baseDemanda_caracCargo_,
            input$caract_OtrasFuentes_baseDemanda_razones_,
            input$caract_OtrasFuentes_infoEncuesta_infoInstitu_,
            input$caract_OtrasFuentes_baseDemanda_indicadores_
          ) %>% 
            reactable(
              filterable = TRUE, minRows = 10
            )
        )
        
        #  Clear Buttons
        observeEvent(input$clear_baseDemanda__, {
          updateSelectizeInput(session, "caract_OtrasFuentes_baseDemanda_caracCargo_", selected = character(0))
        })
        
        observeEvent(input$clear_baseDemanda__, {
          updateSelectizeInput(session, "caract_OtrasFuentes_baseDemanda_razones_", selected = character(0))
        })
        observeEvent(input$clear_baseDemanda__, {
          updateSelectizeInput(session, "caract_OtrasFuentes_infoEncuesta_infoInstitu_", selected = character(0))
        })
        observeEvent(input$clear_baseDemanda__, {
          updateSelectizeInput(session, "caract_OtrasFuentes_baseDemanda_indicadores_", selected = character(0))
        })
        
        #Download Button
        output$download_ofertaDemanda__ <- downloadHandler(
          filename = function(){"OfertaDemanda.csv"},
          content = function(file){
            write.csv2(base_demanda__ %>% select(
              `Código_área`,
              `Nombreáreacualificación`,
              input$caract_OtrasFuentes_baseDemanda_caracCargo_,
              input$caract_OtrasFuentes_baseDemanda_razones_,
              input$caract_OtrasFuentes_infoEncuesta_infoInstitu_,
              input$caract_OtrasFuentes_baseDemanda_indicadores_
            ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )
        
        base_demanda
        
######################################### OTRAS FUENTES DE INFORMACIÓN ###################################################
        
  ####################### INFORMACIÓN DEMANDA SPE
        output$base_demandaSPE <- renderReactable(
          DemandaSPE %>% select(
            `Código área`,
            `Nombre área cualificación`,
            `Año`,
            `Departamento`,
            input$caract_OtrasFuentes_SPE_otros_,
            input$caract_OtrasFuentes_SPE_generales_,
            input$caract_OtrasFuentes_SPE_Areas_
          ) %>% filter(Año %in% input$otrasFuentes_SPE_año) %>% 
            filter(Departamento %in% input$otrasFuentes_SPE_depto_) %>% 
            reactable(
            filterable = TRUE, minRows = 10
          )
        )
        
        output$otrasFuentes_SPE_depto <- renderUI({
          selectizeInput("otrasFuentes_SPE_depto_", "Seleccione Departamento:",
                         choices = names(table(DemandaSPE$`Departamento`)),
                         multiple = T,
                         selected = names(table(DemandaSPE$`Departamento`))
          )
        })
        
        # Clear Button
        observeEvent(input$clear_SPE, {
          updateSelectizeInput(session, "caract_OtrasFuentes_SPE_otros_", selected = character(0))
        })
        
        observeEvent(input$clear_SPE, {
          updateSelectizeInput(session, "otrasFuentes_SPE_año", selected = character(0))
        })
        
        observeEvent(input$clear_SPE, {
          updateSelectizeInput(session, "otrasFuentes_SPE_depto_", selected = character(0))
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
              `Año`,
              `Departamento`,
              input$caract_OtrasFuentes_SPE_otros_,
              input$caract_OtrasFuentes_SPE_generales_,
              input$caract_OtrasFuentes_SPE_Areas_
            ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )
        
  ####################### INFORMACIÓN OFERTA SNIES
        output$base_OfertaSNIES <- renderReactable(
          base_OfertaSNIES %>% select(
            `Código área`,
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
          filename = function(){"Información_OfertaEducativa.csv"},
          content = function(file){
            write.csv2(base_OfertaSNIES %>% select(
              `Código área`,
              input$caract_OtrasFuentes_snies_Areas_,
              input$caract_OtrasFuentes_snies_programa_,
              input$caract_OtrasFuentes_snies_general_
            ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
            )
          }
        )
        
  ####################### ENCUESTA OFERTA EDUCATIVA
        output$base_encuestaOferta <- renderReactable(
          base_oferta_educativa %>% select(
            `Código_área`,
            input$caract_OtrasFuentes_infoEncuesta_area_,
            input$caract_OtrasFuentes_infoEncuesta_infoPrograma_,
            input$caract_OtrasFuentes_infoEncuesta_competencias_,
            input$caract_OtrasFuentes_infoEncuesta_infoInstitu_,
            input$caract_OtrasFuentes_infoEncuesta_infoEmpleados_
          ) %>% reactable(
            filterable = TRUE, minRows = 10
          )
        )
        
        # Clear Button
        observeEvent(input$clear_encuestaOferta, {
          updateSelectizeInput(session, "caract_OtrasFuentes_infoEncuesta_area_", selected = character(0))
        })
        observeEvent(input$clear_encuestaOferta, {
          updateSelectizeInput(session, "caract_OtrasFuentes_infoEncuesta_infoPrograma_", selected = character(0))
        })
        observeEvent(input$clear_encuestaOferta, {
          updateSelectizeInput(session, "caract_OtrasFuentes_infoEncuesta_competencias_", selected = character(0))
        })
        observeEvent(input$clear_encuestaOferta, {
          updateSelectizeInput(session, "caract_OtrasFuentes_infoEncuesta_infoInstitu_", selected = character(0))
        })
        observeEvent(input$clear_encuestaOferta, {
          updateSelectizeInput(session, "caract_OtrasFuentes_infoEncuesta_infoEmpleados_", selected = character(0))
        })
        
        #Download Button
        output$download_encuestaOferta <- downloadHandler(
          filename = function(){"Encuesta_OfertaEducativa.csv"},
          content = function(file){
            write.csv2(base_oferta_educativa %>% select(
              `Código_área`,
              input$caract_OtrasFuentes_infoEncuesta_area_,
              input$caract_OtrasFuentes_infoEncuesta_infoPrograma_,
              input$caract_OtrasFuentes_infoEncuesta_competencias_,
              input$caract_OtrasFuentes_infoEncuesta_infoInstitu_,
              input$caract_OtrasFuentes_infoEncuesta_infoEmpleados_
            ),
            file,
            row.names = T,
            fileEncoding = "ISO-8859-1"
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
            fileEncoding = "ISO-8859-1"
            )
          }
        )
  


# Switch tabs using images in Catalogo tab --------------------------------

        observeEvent(input$artes_button, {
          updateTabItems(session, "Sidebar", selected = "bases_oficiales")
        })
        
        observeEvent(input$fisicas_button, {
          updateTabItems(session, "Sidebar", selected = "bases_oficiales")
        })
        
        observeEvent(input$agropecuarias_button, {
          updateTabItems(session, "Sidebar", selected = "bases_oficiales")
        })
        
        observeEvent(input$alimentos_button, {
          updateTabItems(session, "Sidebar", selected = "bases_oficiales")
        })
        
        observeEvent(input$conservacion_button, {
          updateTabItems(session, "Sidebar", selected = "bases_oficiales")
        })
        
        # Switch tabs using images in Información por Etapas tab --------------------------------
        observeEvent(input$link_to_ocu_dept, {
          updateTabItems(session, "Sidebar", selected = "tasa_ocupados")
        })

        observeEvent(input$link_to_ocu_sect, {
          updateTabItems(session, "Sidebar", selected = "ocupados_ciiu")
        })
        
        observeEvent(input$link_to_ocu_edad, {
          updateTabItems(session, "Sidebar", selected = "ocupados_edadSexo")
        })
        
        observeEvent(input$link_to_ocu_nivEdu, {
          updateTabItems(session, "Sidebar", selected = "ocupados_NivelEdu")
        })
        
        # Switch tabs using Brechas de capital humano --------------------------------
        observeEvent(input$link_to_cantidad, {
          updateTabItems(session, "Sidebar", selected = "brechas_Cantidad")
        })
        
        observeEvent(input$link_to_calidad, {
          updateTabItems(session, "Sidebar", selected = "brechasCalidad")
        })
        
        observeEvent(input$link_to_pertinencia, {
          updateTabItems(session, "Sidebar", selected = "brechas_pertinencia")
        })
        
# Behavior of MAIN DATABASES ---------------------------------------
        
        # Render table
        output$main_databases <- renderReactable(
          main_bases %>%
            select(
                   c(`Código área`,
                     input$area_cualificacion,
                     input$denominacion_cuoc,
                     input$cine,
                     input$ciiu
                   )
            ) %>% distinct() %>%
            reactable(
              filterable = TRUE,
              minRows = 10,
              defaultPageSize = 15 # Fijar el número máximo de filas que se muestran a 15
            )
        )
        
        # Download table
        output$download_mainBases <- downloadHandler(
          filename = function(){"Bases_Oficiales.csv"},
          content = function(file){
            write.csv2(main_bases %>% 
                         select(`Código área`,
                               input$area_cualificacion,
                               input$denominacion_cuoc,
                               input$cine,
                               input$ciiu
                               ),
            file,
            row.names = F,
            fileEncoding = "ISO-8859-1"
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
