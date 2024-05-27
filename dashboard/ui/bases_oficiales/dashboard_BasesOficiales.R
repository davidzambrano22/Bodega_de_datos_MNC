

tab_BasesOficiales <- tabItem(
  tabName = "bases_oficiales",
  class = "bases_oficiales",
  tags$style('.bases_oficiales {
                             background-color: #ffffff;
              }'),
  div(style = "height: 20px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Bases de Datos Oficiales",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
    )
    
  ),
  div(style = "height: 40px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = F,
               tags$p("A través de esta sección los usuarios podrán acceder a información detallada que integra las diversas áreas de cualificación del Marco Nacional de Cualificaciones (MNC). Esta información se basa en las fuentes de la Clasificación Nacional de Ocupaciones (CUOC), la Clasificación Internacional Normalizada de la Educación Adaptada a Colombia (CINE-F), y la Clasificación Industrial Internacional Uniforme (CIIU) rev. 4. Con esta integración, se proporciona un acceso completo y actualizado a las clasificaciones esenciales para el análisis ocupacional y educativo en Colombia.", style = "font-size: 20px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(style = "height: 40px;"),
  fluidRow(
    div(style = "font-size: 17px;",
    column(2,
           box(title = "Bases de datos",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               selectizeInput("select_main_base", "Seleccione Base",
                              choices = c(
                                "Areas de Cualificación",
                                "Ocupaciones CUOC",
                                "Educación CINE",
                                "Sectores CIIU"
                              )
               ),
               
               conditionalPanel(
                 condition = "input.select_main_base == 'Areas de Cualificación'",
                 checkboxGroupInput("area_cualificacion", "Seleccione Atributos", 
                                    choices = c(
                                      "Código Área" = "Código área",
                                      "Nombre área cualificación" = "Nombre área cualificación"
                                    ),
                                    selected = c(
                                      "Código área",
                                      "Nombre área cualificación"
                                    )
                 )
               ),
               conditionalPanel(
                 condition = "input.select_main_base == 'Ocupaciones CUOC'",
                 checkboxGroupInput("denominacion_cuoc", "Seleccione Atributos", 
                                    choices = c(
                                      "Código Grandes Grupos" = "Código Grandes Grupos",
                                      "Grandes Grupos" = "Grandes Grupos",
                                      "Código Subgrupos principales" = "Código Subgrupos principales",
                                      "Subgrupos principales" = "Subgrupos principales",
                                      "Código subgrupos" = "Código subgrupos",
                                      "Subgrupos" = "Subgrupos",
                                      "Códigos Grupos primarios" = "Códigos Grupos primarios",
                                      "Grupos primarios" = "Grupos primarios",
                                      "Código Ocupación" = "Código Ocupación",
                                      "Ocupación" = "Ocupación",
                                      "Código denominaciones" = "Código denominaciones",
                                      "Denominacion" = "Denominacion",
                                      "Código CIUO 08 A.C." = "Código CIUO08AC",
                                      "Código CNO" = "Código CNO",
                                      "Nombre Ocupación Afín" = "Nombre Ocupación Afín",
                                      "Nombre Destreza" = "Nombre Destreza", 
                                      "Nombre Conocimiento" = "Nombre Conocimiento",
                                      "Nivel Competencia" = "Nivel Competencia",
                                      "Descripción Ocupación" = "Descripción Ocupación",
                                      "Consecutivo Función" = "Consecutivo Función",
                                      "Redacción Función" = "Redacción Función"
                                    )
                 )
               ),
               conditionalPanel(
                 condition = "input.select_main_base == 'Educación CINE'",
                 checkboxGroupInput("cine", "Seleccione Atributos", 
                                    choices = c(
                                      "Código CINE-2011 AC" = "Código CINE2011 AC",
                                      "Campos Detallado" = "Campos Detallado"
                                    )
                 )
               ),
               conditionalPanel(
                 condition = "input.select_main_base == 'Sectores CIIU'",
                 checkboxGroupInput("ciiu", "Seleccione Atributos", 
                                    choices = c(
                                      "Sección" = "Sección",
                                      "División" = "División",
                                      "Grupo" = "Grupo",
                                      "Código_ciiu" = "Código CIIU",
                                      "Descripción" = "Descripción"
                                    )
                 )
               ),
               div(
                 style = "height: 30px;"
               ),
               fluidRow(
                       column(2, offset = 1,
                              actionButton("clear_bases", "Limpiar Filtros", icon = icon("eraser"),
                                           style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                              )
                       )
                     ),
               div(
                 style = "height: 15px;"
               ),
               fluidRow(
                 column(2, offset = 1,
                        downloadButton("download_mainBases", "Descargar Tabla",
                                       style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                        )
                 )
                 
               )
           ),
           div(
             style = "height: 200px;"
           ),
           box(title = "Ayuda", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
               width = 12,
               tags$p("En el filtro, se pueden encontrar las bases y sus atributos, los cuales se podrán seleccionar, filtrar y descargar según los diferentes filtros disponibles. Esto permite a los usuarios personalizar y obtener información específica según sus necesidades particulares.",
                      style = "font-size: 17px;")
           ),
           box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
               width = 12,
               HTML("<a href='https://www.dane.gov.co/index.php/sistema-estadistico-nacional-sen/normas-y-estandares/nomenclaturas-y-clasificaciones/clasificaciones#clasificaciones-adaptadas' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          DANE - Clasificaciones
                        </p>
                     </a>"
               ),
               HTML("<a href='https://especiales.colombiaaprende.edu.co/mnc/catalogo.html' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          Marco Nacional de Cualificaciones
                        </p>
                     </a>"
               )
           )
           
    ),
    column(10, 
           reactableOutput("main_databases")
    )
  )
  )
)