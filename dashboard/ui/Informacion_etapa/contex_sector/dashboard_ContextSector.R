
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
                                  "Departamento y Año",
                                  "Índices"
                                )
                 ),
                 
                 conditionalPanel(
                   condition = "input.caract_TasaOcu_areaCual == 'Área de Cualificación'",
                   checkboxGroupInput("caract_TasaOcu_areaCual_", "Seleccione Atributos", 
                                      choices = c(
                                        "Codigo Área" = "Código_área",
                                        "Nombre Área cualificación" = "Nombre área cualificación"
                                      ),
                                      selected = c(
                                        "Código_área",
                                        "Nombre área cualificación"
                                      )
                   )
                 ),
                 conditionalPanel(
                   condition = "input.caract_TasaOcu_areaCual == 'Departamento y Año'",
                   checkboxGroupInput("caract_TasaOcu_eduAno_", "Seleccione Atributos", 
                                      choices = c(
                                        "Departamento" = "Departamento",
                                        "Código del departamento" = "Codigo Depto",
                                        "Año" = "Año"
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
               style = "height: 50px;"
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
             box(title = "Guía", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                 width = 12,
                 tags$p("En esta sección encontrará información sobre...",
                        style = "font-size: 17px; text-align: justify;"
                 ),
                 tags$a("Descargar el instructivo...", href="fichas_brechas.pdf", target="_blank", style = "font-size: 17px;")
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
                                    "Año",
                                    "Índices"
                                  )
                   ),
                   
                   conditionalPanel(
                     condition = "input.caract_OcuCIIU_areaCual == 'Área de Cualificación'",
                     checkboxGroupInput("caract_ocuCIIU_areaCual_", "Seleccione Atributos", 
                                        choices = c(
                                          "Codigo Área" = "Código_área",
                                          "Nombre Área cualificación" = "Nombre área cualificación"
                                        ),
                                        selected = c(
                                          "Código_área",
                                          "Nombre área cualificación"
                                        )
                     )
                   ),
                   conditionalPanel(
                     condition = "input.caract_OcuCIIU_areaCual == 'Año'",
                     checkboxGroupInput("caract_ocuCIIU_Ano_", "Seleccione Atributos", 
                                        choices = c(
                                          "Año" = "Año"
                                        )
                     )
                   ),
                   conditionalPanel(
                     condition = "input.caract_OcuCIIU_areaCual == 'Índices'",
                     checkboxGroupInput("caract_ocuCIIU_indices_", "Seleccione Atributos", 
                                        choices = c(
                                          "Descripción CIIU" = "Descripción CIIU",
                                          "Código CIIU" = "Código_ciiu",
                                          "Ocupados" = "Ocupados",
                                          "Proporción ocupados" = "Proporción ocupados"
                                        )
                     )
                   ),
                   div(
                     style = "height: 50px;"
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
               box(title = "Guía", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                   width = 12,
                   tags$p("En esta sección encontrará información sobre...",
                          style = "font-size: 17px; text-align: justify;"
                   ),
                   tags$a("Descargar el instructivo...", href="fichas_brechas.pdf", target="_blank", style = "font-size: 17px;")
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
                                "Rangos de Edad",
                                "Año",
                                "Índices"
                              )
               ),
               
               conditionalPanel(
                 condition = "input.caract_OcuEdadSexo_areaCual == 'Área de Cualificación'",
                 checkboxGroupInput("caract_ocuEdadSexo_areaCual_", "Seleccione Atributos", 
                                    choices = c(
                                      "Codigo Área" = "Código_área",
                                      "Nombre Área cualificación" = "Nombre área cualificación"
                                    ),
                                    selected = c(
                                      "Código_área",
                                      "Nombre área cualificación"
                                    )
                 )
               ),
               conditionalPanel(
                 condition = "input.caract_OcuEdadSexo_areaCual == 'Año'",
                 checkboxGroupInput("caract_ocuEdadSexo_Ano_", "Seleccione Atributos", 
                                    choices = c(
                                      "Año" = "Año"
                                    )
                 )
               ),
               conditionalPanel(
                 condition = "input.caract_OcuEdadSexo_areaCual == 'Rangos de Edad'",
                 checkboxGroupInput("caract_ocuEdadSexo_Edad_", "Seleccione Atributos", 
                                    choices = c(
                                      "Rango de edad" = "Rango de edad"
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
                 style = "height: 50px;"
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
           box(title = "Guía", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
               width = 12,
               tags$p("En esta sección encontrará información sobre...",
                      style = "font-size: 17px; text-align: justify;"
               ),
               tags$a("Descargar el instructivo...", href="fichas_brechas.pdf", target="_blank", style = "font-size: 17px;")
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
                                    "Año",
                                    "Índices"
                                  )
                   ),
                   
                   conditionalPanel(
                     condition = "input.caract_OcuNivelEdu_areaCual == 'Área de Cualificación'",
                     checkboxGroupInput("caract_OcuNivelEdu_areaCual_", "Seleccione Atributos", 
                                        choices = c(
                                          "Codigo Área" = "Código_área",
                                          "Nombre Área cualificación" = "Nombre área cualificación"
                                        ),
                                        selected = c(
                                          "Código_área",
                                          "Nombre área cualificación"
                                        )
                     )
                   ),
                   conditionalPanel(
                     condition = "input.caract_OcuNivelEdu_areaCual == 'Año'",
                     checkboxGroupInput("caract_OcuNivelEdu_Ano_", "Seleccione Atributos", 
                                        choices = c(
                                          "Año" = "Año"
                                        )
                     )
                   ),
                   conditionalPanel(
                     condition = "input.caract_OcuNivelEdu_areaCual == 'Índices'",
                     checkboxGroupInput("caract_OcuNivelEdu_indices_", "Seleccione Atributos", 
                                        choices = c(
                                          "Nivel Educativo" = "Nivel educativo",
                                          "Ocupados" = "Ocupados",
                                          "Porcentaje de Ocupados" = "Proporción Ocupados"
                                        )
                     )
                   ), 
                   div(
                     style = "height: 50px;"
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
               box(title = "Guía", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                   width = 12,
                   tags$p("En esta sección encontrará información sobre...",
                          style = "font-size: 17px; text-align: justify;"
                   ),
                   tags$a("Descargar el instructivo...", href="fichas_brechas.pdf", target="_blank", style = "font-size: 17px;")
               )
    ),
    column(10, 
           reactableOutput("base_ocupadosNivelEdu")
           )
    )
  )
)