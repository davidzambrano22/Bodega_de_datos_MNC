
tab_TasaOcupados <- tabItem(
  tabName = "tasa_ocupados",
  class = "tasa_ocupados",
  tags$style('.tasa_ocupados {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Índices de  Ocupados por Departamento",
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
               tags$p("En esta sección encontrará el número de personas empleadas, la tasa de ocupación y la población en edad laboral para cada área de cualificación y por departamento. Según el DANE (Departamento Administrativo Nacional de Estadística de Colombia), un empleado es una persona que, durante la semana de referencia, realizó alguna actividad económica por al menos una hora, ya sea en forma remunerada (en dinero o en especie) o sin remuneración en una empresa o negocio familiar. La población en edad de trabajar se define como aquellas personas que tienen la edad legal para trabajar, generalmente comprendida entre los 15 y los 64 años.", style = "font-size: 20px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(
    style = "height: 40px;"
  ),
  fluidRow(
    div( style = "font-size: 17px;",
      column(2,
             box(title = "Bases de datos",
                 width = 12,
                 solidHeader = TRUE,
                 status = "primary",
                 selectizeInput("caract_TasaOcu_areaCual", "Seleccione Base",
                                choices = c(
                                  "Área de Cualificación",
                                  "Departamento",
                                  "Índices"
                                )
                 ),
                 
                 conditionalPanel(
                   condition = "input.caract_TasaOcu_areaCual == 'Área de Cualificación'",
                   checkboxGroupInput("caract_TasaOcu_areaCual_", "Seleccione Atributos", 
                                      choices = c(
                                        "Codigo Área" = "Código área",
                                        "Nombre Área cualificación" = "Nombre área cualificación"
                                      ),
                                      selected = c(
                                        "Código área",
                                        "Nombre área cualificación"
                                      )
                   )
                 ),
                 conditionalPanel(
                   condition = "input.caract_TasaOcu_areaCual == 'Departamento'",
                   checkboxGroupInput("caract_TasaOcu_eduAno_", "Seleccione Atributos", 
                                      choices = c(
                                        "Código del departamento" = "Codigo Depto"
                                      )
                   )
                 ),
                 conditionalPanel(
                   condition = "input.caract_TasaOcu_areaCual == 'Índices'",
                   checkboxGroupInput("caract_TasaOcu_indices_", "Seleccione Atributos", 
                                      choices = c(
                                        "Ocupados" = "Ocupados",
                                        "Tasa de Ocupados" = "Tasa de ocupados",
                                        "Población en Edad de Trabajar" = "Población en Edad de Trabajar"
                                      )
                   )
                 ),
                 div(
                   style = "height: 30px;"
                 ),
                 selectizeInput("ocu_depto_año", "Seleccione Año",  # Seleccione por año
                                choices = 2022:2024
                 ),
                 div(
                   style = "height: 10px;"
                 ),
                 selectizeInput("ocu_depto_depto", "Seleccione Departamento",  # Seleccione por departamento
                                choices = c(
                                  "Amazonas", "Antioquia", "Arauca", "Atlántico", "Bolívar", "Boyacá",
                                  "Caldas", "Caquetá", "Casanare", "Cauca", "Cesar", "Chocó", "Córdoba",
                                  "Cundinamarca", "Guainía", "Guaviare", "Huila", "La Guajira", "Magdalena",
                                  "Meta", "Nariño", "Norte de Santander", "Putumayo", "Quindío", "Risaralda",
                                  "San Andrés y Providencia", "Santander", "Sucre", "Tolima", "Valle del Cauca",
                                  "Vaupés", "Vichada"
                                ),
                                selected = c(
                                  "Amazonas", "Antioquia", "Arauca", "Atlántico", "Bolívar", "Boyacá",
                                  "Caldas", "Caquetá", "Casanare", "Cauca", "Cesar", "Chocó", "Córdoba",
                                  "Cundinamarca", "Guainía", "Guaviare", "Huila", "La Guajira", "Magdalena",
                                  "Meta", "Nariño", "Norte de Santander", "Putumayo", "Quindío", "Risaralda",
                                  "San Andrés y Providencia", "Santander", "Sucre", "Tolima", "Valle del Cauca",
                                  "Vaupés", "Vichada"
                                ),
                                multiple = T
                 ),
                 div(
                   style = "height: 30px;"
                 ),
             fluidRow(
               column(2, offset = 1,
                      actionButton("clear_baseTasaOcupados", "Limpiar Filtros", icon = icon("eraser"),
                                   style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                      )
               )
             ),
             div(
               style = "height: 15px;"
             ),
             fluidRow(
               column(2, offset = 1,
                      downloadButton("download_tasa_ocupados", "Descargar Tabla",
                                     style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                                     )
                      )
               )
             ),
             box(title = "Ayuda", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                 width = 12,
                 tags$p("En el filtro, se pueden encontrar las bases y sus atributos, los cuales se podrán seleccionar, filtrar y descargar según los diferentes filtros disponibles. Esto permite a los usuarios personalizar y obtener información específica según sus necesidades particulares.",
                        style = "font-size: 17px;")
             ),
             box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                 width = 12,
                 HTML("<a href='https://www.dane.gov.co/index.php/estadisticas-por-tema/mercado-laboral/empleo-y-desempleo/geih-historicos' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          DANE - Estadísticas por Tema
                        </p>
                     </a>"
                 )
             )
      ),
      column(10, 
             reactableOutput("base_TasaOcupados")
      )
    )
  )
)


tab_OcupadosCIIU <- tabItem(
  tabName = "ocupados_ciiu",
  class = "ocupados_ciiu",
  tags$style('.ocupados_ciiu {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Índices de Ocupados por Sectores CIIU",
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
               tags$p("En esta sección encontrará el número de personas empleadas y la proporción por cada área de cualificación y por código CIIU rev4 a cuatro dígitos. Según el DANE (Departamento Administrativo Nacional de Estadística de Colombia), un empleado es una persona que, durante la semana de referencia, realizó alguna actividad económica por al menos una hora, ya sea en forma remunerada (en dinero o en especie) o sin remuneración en una empresa o negocio familiar.", style = "font-size: 20px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(
    style = "height: 40px;"
  ),
  fluidRow(
    div(style = "font-size: 17px;",
        column(2,
               box(title = "Bases de datos",
                   width = 12,
                   solidHeader = TRUE,
                   status = "primary",
                   selectizeInput("caract_OcuCIIU_areaCual", "Seleccione Base",
                                  choices = c(
                                    "Área de Cualificación",
                                    "Índices"
                                  )
                   ),
                   
                   conditionalPanel(
                     condition = "input.caract_OcuCIIU_areaCual == 'Área de Cualificación'",
                     checkboxGroupInput("caract_ocuCIIU_areaCual_", "Seleccione Atributos", 
                                        choices = c(
                                          "Codigo Área" = "Código área",
                                          "Nombre Área cualificación" = "Nombre área cualificación"
                                        ),
                                        selected = c(
                                          "Código área",
                                          "Nombre área cualificación"
                                        )
                     )
                   ),
                   conditionalPanel(
                     condition = "input.caract_OcuCIIU_areaCual == 'Índices'",
                     checkboxGroupInput("caract_ocuCIIU_indices_", "Seleccione Atributos", 
                                        choices = c(
                                          "Descripción CIIU" = "Descripción CIIU",
                                          "Código CIIU" = "Código CIIU",
                                          "Ocupados" = "Ocupados",
                                          "Proporción ocupados" = "Proporción ocupados"
                                        )
                     )
                   ),
                   div(
                     style = "height: 30px;"
                   ),
                   selectizeInput("ocu_CIIU_año", "Seleccione Año",  # Seleccione por año
                                  choices = 2022:2024
                   ),
                   div(
                     style = "height: 30px;"
                   ),
                   fluidRow(
                     column(2, offset = 1,
                            actionButton("clear_ocupadosCIIU", "Limpiar Filtros", icon = icon("eraser"),
                                         style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                            )
                     )
                   ),
                   div(
                     style = "height: 15px;"
                   ),
                   fluidRow(
                     column(2, offset = 1,
                            downloadButton("download_ocupados_CIIU", "Descargar Tabla",
                                           style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                            )
                     )
                   )
               ),
               box(title = "Ayuda", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                   width = 12,
                   tags$p("En el filtro, se pueden encontrar las bases y sus atributos, los cuales se podrán seleccionar, filtrar y descargar según los diferentes filtros disponibles. Esto permite a los usuarios personalizar y obtener información específica según sus necesidades particulares.",
                          style = "font-size: 17px;")
               ),
               box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                   width = 12,
                   HTML("<a href='https://www.dane.gov.co/index.php/estadisticas-por-tema/mercado-laboral/empleo-y-desempleo/geih-historicos' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          DANE - Estadísticas por Tema
                        </p>
                     </a>"
                   )
               )
        ),
        column(10, 
               reactableOutput("base_ocupadosCIIU")
               )
        )
  )
)

tab_Ocupados_EdadSexo <- tabItem(
  tabName = "ocupados_edadSexo",
  class = "ocupados_edadSexo",
  tags$style('.ocupados_edadSexo {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Índices de Ocupados por Edad y Sexo",
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
               tags$p("En esta sección encontrará el número de personas empleadas y su proporción, según el sexo y diferentes rangos de edad para cada área de cualificación. Según el DANE (Departamento Administrativo Nacional de Estadística de Colombia), un empleado es una persona que, durante la semana de referencia, realizó alguna actividad económica por al menos una hora, ya sea en forma remunerada (en dinero o en especie) o sin remuneración en una empresa o negocio familiar.", style = "font-size: 20px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(
    style = "height: 40px;"
  ),
  fluidRow(
    div(style = "font-size: 17px;",
    column(2,
           box(title = "Bases de datos",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               selectizeInput("caract_OcuEdadSexo_areaCual", "Seleccione Base",
                              choices = c(
                                "Área de Cualificación",
                                "Índices"
                              )
               ),
               
               conditionalPanel(
                 condition = "input.caract_OcuEdadSexo_areaCual == 'Área de Cualificación'",
                 checkboxGroupInput("caract_ocuEdadSexo_areaCual_", "Seleccione Atributos", 
                                    choices = c(
                                      "Codigo Área" = "Código área",
                                      "Nombre Área cualificación" = "Nombre área cualificación"
                                    ),
                                    selected = c(
                                      "Código área",
                                      "Nombre área cualificación"
                                    )
                 )
               ),
               conditionalPanel(
                 condition = "input.caract_OcuEdadSexo_areaCual == 'Índices'",
                 checkboxGroupInput("caract_ocuEdadSexo_indices_", "Seleccione Atributos", 
                                    choices = c(
                                      "Ocupados Hombres" = "Ocupados Hombres",
                                      "Ocupados Mujeres" = "Ocupados Mujeres",
                                      "Proporción Hombres" = "Proporción Hombres",
                                      "Proporción Mujeres" = "Proporción Mujeres"
                                    )
                 )
               ),
               div(
                 style = "height: 30px;"
               ),
               selectizeInput("ocu_edadsexo_año_", "Seleccione Año",  # Seleccione por año
                              choices = 2022:2024
               ),
               div(
                 style = "height: 30px;"
               ),
               uiOutput("ocu_niveledu_rangoEdad"),
               div(
                 style = "height: 30px;"
               ),
               fluidRow(
                 column(2, offset = 1,
                        actionButton("clear_ocupadosEdadSexo", "Limpiar Filtros", icon = icon("eraser"),
                                     style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                        )
                 )
               ),
               div(
                 style = "height: 15px;"
               ),
               fluidRow(
                 column(2, offset = 1,
                        downloadButton("download_ocupadosEdadySexo", "Descargar Tabla",
                                       style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                        )
                 )
               )
           ),
           box(title = "Ayuda", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
               width = 12,
               tags$p("En el filtro, se pueden encontrar las bases y sus atributos, los cuales se podrán seleccionar, filtrar y descargar según los diferentes filtros disponibles. Esto permite a los usuarios personalizar y obtener información específica según sus necesidades particulares.",
                      style = "font-size: 17px;")
           ),
           box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
               width = 12,
               HTML("<a href='https://www.dane.gov.co/index.php/estadisticas-por-tema/mercado-laboral/empleo-y-desempleo/geih-historicos' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          DANE - Estadísticas por Tema
                        </p>
                     </a>"
               )
           )
    ),
    column(10, 
           reactableOutput("base_ocupadosEdadSexo")
           )
    )
  )
)

tab_Ocupados_NivelEdu <- tabItem(
  tabName = "ocupados_NivelEdu",
  class = "ocupados_NivelEdu",
  tags$style('.ocupados_NivelEdu {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Índices de Ocupados por Nivel Educativo",
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
               tags$p("En esta sección encontrará el número de personas empleadas y la proporción para cada área de cualificación y por nivel educativo. Según el DANE (Departamento Administrativo Nacional de Estadística de Colombia), un empleado es una persona que, durante la semana de referencia, realizó alguna actividad económica por al menos una hora, ya sea en forma remunerada (en dinero o en especie) o sin remuneración en una empresa o negocio familiar.", style = "font-size: 20px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(
    style = "height: 40px;"
  ),
  fluidRow(
    div(style = "font-size: 17px;",
        column(2,
               box(title = "Bases de datos",
                   width = 12,
                   solidHeader = TRUE,
                   status = "primary",
                   selectizeInput("caract_OcuNivelEdu_areaCual", "Seleccione Base",
                                  choices = c(
                                    "Área de Cualificación",
                                    "Índices"
                                  )
                   ),
                   
                   conditionalPanel(
                     condition = "input.caract_OcuNivelEdu_areaCual == 'Área de Cualificación'",
                     checkboxGroupInput("caract_OcuNivelEdu_areaCual_", "Seleccione Atributos", 
                                        choices = c(
                                          "Codigo Área" = "Código área",
                                          "Nombre Área cualificación" = "Nombre área cualificación"
                                        ),
                                        selected = c(
                                          "Código área",
                                          "Nombre área cualificación"
                                        )
                     )
                   ),
                   conditionalPanel(
                     condition = "input.caract_OcuNivelEdu_areaCual == 'Índices'",
                     checkboxGroupInput("caract_OcuNivelEdu_indices_", "Seleccione Atributos", 
                                        choices = c(
                                          "Ocupados" = "Ocupados",
                                          "Proporción de Ocupados" = "Proporción Ocupados"
                                        )
                     )
                   ), 
                   div(
                     style = "height: 30px;"
                   ),
                   selectizeInput("ocu_niveledu_año_", "Seleccione Año",  # Seleccione por año
                                  choices = 2022:2024
                   ),
                   uiOutput("ocu_niveledu_niveledu"), # Seleccione por Nivel Educativo
                   div(
                     style = "height: 30px;"
                   ),
                   fluidRow(
                     column(2, offset = 1,
                            actionButton("clear_NivelEdu", "Limpiar Filtros", icon = icon("eraser"),
                                         style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                            )
                     )
                   ),
                   div(
                     style = "height: 15px;"
                   ),
                   fluidRow(
                     column(2, offset = 1,
                            downloadButton("download_Ocu_NivelEdu", "Descargar Tabla",
                                           style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                            )
                     )
                   )
               ),
               box(title = "Ayuda", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                   width = 12,
                   tags$p("En el filtro, se pueden encontrar las bases y sus atributos, los cuales se podrán seleccionar, filtrar y descargar según los diferentes filtros disponibles. Esto permite a los usuarios personalizar y obtener información específica según sus necesidades particulares.",
                          style = "font-size: 17px;")
               ),
               box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                   width = 12,
                   HTML("<a href='https://www.dane.gov.co/index.php/estadisticas-por-tema/mercado-laboral/empleo-y-desempleo/geih-historicos' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          DANE - Estadísticas por Tema
                        </p>
                     </a>"
                   )
               )
    ),
    column(10, 
           reactableOutput("base_ocupadosNivelEdu")
           )
    )
  )
)