
# ############################# ANÁLISIS DE COMPETENCIAS ############################
tab_AnalisisCompetencias <- tabItem(
  tabName = "analisis_competencias",
  class = "analisis_competencias",
  tags$style('.analisis_competencias {
                             background-color: #ffffff;
              }'),
  div(style = "height: 20px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Análisis de Competencias",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
    )
  ),
  div(style = "height: 30px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = F,
               tags$p("En esta sección encontrará información sobre los conocimientos y destrezas de la Clasificación Única de Ocupaciones para Colombia (CUOC) solicitados para los cargos críticos o de difícil consecución por parte de las empresas, así como sobre las habilidades socioemocionales propuestas por la Fundación Corona.", style = "font-size: 18px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(style = "height: 60px;"),
  fluidRow(
          div(style = "font-size: 17px;",
          column(2,
                 div(style="height: 40px;"),
                 box(title="Seleccione:",
                     width=12,
                     status="primary",
                     solidHeader=T,
                     uiOutput("select_area_catalog_2")
                 ),
                 box(title = "Ayuda",
                     width = 12,
                     solidHeader = TRUE,
                     status = "primary",
                     collapsible = T,
                     collapsed = T,
                     tags$p("En esta sección, encontrará datos de la encuesta de demanda y brechas de capital humano realizada a las empresas desagregados y representados gráficamente.", style = "font-size: 18px;"),
                     tags$p("El número de observaciones corresponde al número de las encuestas realizadas en cada área de cualificación.", style = "font-size: 18px;"),
                     div(style = "height: 10px;"),
                     style = "font-size: 18px; text-align: left;"
                 )
                 
          ),
          column(8, offset=1,
                 box(width =12, status = "primary",
                 fluidRow(
                   
                          tags$h1("Conocimientos CUOC",
                                  style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                          ),
                          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
                 ),
                 div(style = "height: 30px;"),
                 fluidRow(
                   div(style = "text-align: center;",
                       plotOutput("conocimientos")
                   )
                   ),
                 fluidRow(
                   wordcloud2Output("wordcloud_conocimientos")
                 )
          )
                 )
          
          )
  ),
  div(style="height: 60px;"),
  fluidRow(
    div(style = "font-size: 17px;",
        column(2),
        column(8, offset = 1,
               box(width = 12, status = "primary",
               fluidRow(
                        tags$h1("Habilidades Socioemocionales",
                                style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                        ),
                        tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
               ),
               div(style = "height: 40px;"),
               fluidRow(
               div(style = "text-align: center;",
                   plotOutput("socioemocionales")
                   )
               ),
               fluidRow(
                 wordcloud2Output("wordcloud_habilidades")
               )
        )
        )
        
    )
  ),
  div(style="height: 60px;"),
  fluidRow(
    div(style = "font-size: 17px;",
        column(2),
        column(8, offset = 1,
               box(width = 12, status = "primary",
                   fluidRow(
                            tags$h1("Destrezas CUOC",
                                    style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                            ),
                            tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
                   ),
                   div(style = "height: 40px;"),
                   fluidRow(
                     div(style = "text-align: center;",
                         plotOutput("destrezas")
                     )
                   ),
                   fluidRow(
                     wordcloud2Output("wordcloud_destrezas")
                   )
               )
        )
        
    )
  )
)

# ################################ INFORMACIÓN GENERAL ################################

# ############################# ÁREAS DE DESEMPEÑO ############################
tab_estadisticas_generales <- tabItem(
  div(style = "height: 20px;"),
  tabName = "est_generales",
  class = "est_generales",
  tags$style('.est_generales {
                             background-color: #ffffff;
              }'),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Estadísticas Encuesta Demanda",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
    tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
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
               tags$p("En esta sección, los usuarios podrán encontrar una serie de estadísticas presentadas mediante gráficos de barras y de pastel. Esta información proviene de las encuestas de demanda y brechas de capital humano realizadas a diferentes empresas.", style = "font-size: 18px;"),
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
               box(title="Seleccione:",
                   width=12,
                   status="primary",
                   solidHeader=T,
                   uiOutput("select_area_catalog_3_1"),
                   div(style="height: 20px;"),
                   column(2, offset =1,
                          actionButton("clear_areas_3_1", "Limpiar Filtros", icon = icon("eraser"),
                                       style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                          )
                   )
               ),
               box(title = "Ayuda",
                   width = 12,
                   solidHeader = TRUE,
                   status = "primary",
                   collapsible = T,
                   collapsed = T,
                   tags$p("En esta sección, encontrará datos de la encuesta de demanda y brechas de capital humano realizada a las empresas desagregados y representados gráficamente.", style = "font-size: 18px;"),
                   tags$p(tags$b("Nota: "),"El número de observaciones corresponde al número de las encuestas realizadas en cada área de cualificación."),
                   div(style = "height: 10px;"),
                   style = "font-size: 18px; text-align: left;"
               )
               
        ),
        column(8, offset = 1,
               div(style = "height: 20px;"),
               box(width = 12, status = "primary",
                   fluidRow(
                     column(8, offset = 2,
                            tags$h1("Departamento",
                                    style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                            ),
                            tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
                     )
                   ),
               fluidRow(
                 plotOutput("departamentos")
               ),
               div(style="height: 60px;"),
               fluidRow(
                 column(5, offset=2,
                        plotlyOutput("pie_departamentos")
                        )
                 )
               )
        )
    )
  ),
  div(style = "height: 200px;"),
  fluidRow(
    div(style = "font-size: 17px;",
        column(2),
        column(8, offset = 1,
               div(style = "height: 20px;"),
               box(width = 12, status = "primary",
                   fluidRow(
                     column(8, offset = 2,
                            tags$h1("Tamaño de la Empresa",
                                    style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                            ),
                            tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
                     )
                   ),
                   fluidRow(
                     plotOutput("tamano_empresa")
                   ),
                   div(style="height: 60px;"),
                   fluidRow(
                     column(5, offset=2,
                            plotlyOutput("pie_tamano_empresa")
                     )
                   )
               )
        )
    )
  ),
  div(style = "height: 200px;"),
  fluidRow(
    div(style = "font-size: 17px;",
        column(2),
        column(8, offset = 1,
               div(style = "height: 20px;"),
               box(width = 12, status = "primary",
                   fluidRow(
                     column(8, offset = 2,
                            tags$h1("Sector Económico",
                                    style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                            ),
                            tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
                     )
                   ),
                   fluidRow(
                     plotOutput("descriptivas_sectorEcon")
                   ),
                   div(style="height: 60px;"),
                   fluidRow(
                     column(5, offset=2,
                            plotlyOutput("pie_descriptivas_sectorEcon")
                     )
                   )
               )
        )
    )
  ),
  div(style = "height: 200px;"),
    fluidRow(
      div(style = "font-size: 17px;",
      column(2),
      column(8, offset = 1,
             div(style = "height: 20px;"),
             box(width = 12, status = "primary",
                 fluidRow(
                   column(8, offset = 2,
                          tags$h1("Áreas de Desempeño",
                                  style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                          ),
                          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
                   )
                 ),
                 fluidRow(
                   plotOutput("descriptivas_area")
                 ),
                 div(style="height: 60px;"),
                 fluidRow(
                   column(5, offset=2,
                          plotlyOutput("pie_descriptivas_area")
                          )
                   )
                 )
             )
      )
      ),
  div(style= "height: 80px;"),
  
)

# ############################# DIFÍCIL CONSECUCIÓN ############################
tab_dificilConsecucion <- tabItem(
  div(style = "height: 20px;"),
  tabName = "est_dificilConsecucion",
  class = "est_dificilConsecucion",
  tags$style('.est_dificilConsecucion {
                             background-color: #ffffff;
              }'),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Cargos Críticos de Difícil Consecución",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 30%;"),
    )
  ),
  div(style="height: 40px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = T,
               tags$p("En esta sección se detallan los cargos de difícil consecución y/o críticos que fueron reportados por las empresas en las encuestas realizadas en cada área. Además, se presentan los cargos misionales de cada área junto con la demanda satisfecha e insatisfecha, derivada del cruce entre los cargos de difícil consecución y los cargos misionales.", style = "font-size: 18px;"),
               tags$p(tags$b("Cargo crítico de difícil consecución:"), "Se refiere a una posición dentro de una organización que es esencial para el cumplimiento de sus objetivos estratégicos o para el desarrollo de sus actividades principales. Estos cargos son considerados críticos debido a su impacto significativo en el funcionamiento y el éxito de la empresa. La dificultad de consecución se refiere a la complejidad para reclutar y retener personal cualificado para ocupar dichas posiciones, ya sea por la escasez de candidatos con las habilidades necesarias o por otras razones relacionadas con el mercado laboral.", style = "font-size: 18px;"),
               tags$p(tags$b("Demanda de capital humano satisfecha e insatisfecha por las empresas:"), "Se refiere a la capacidad de la empresa para cubrir sus necesidades de personal con los recursos humanos disponibles en el mercado laboral. La demanda satisfecha ocurre cuando la empresa puede reclutar y retener a los empleados necesarios para cubrir sus vacantes y cumplir con sus requerimientos operativos. En contraste, la demanda insatisfecha surge cuando la empresa enfrenta dificultades para encontrar personal calificado o cuando no puede retener a sus empleados clave, lo que resulta en vacantes no cubiertas o en una fuerza laboral subóptima.", style = "font-size: 18px;"),
               div(style = "height: 10px;"),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(style = "height: 60px;"),
  fluidRow(
    column(2,
           box(title = "Ayuda",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = T,
               tags$p("El cálculo de la Demanda Satisfecha e Insatisfecha: Se consideran insatisfechos los casos en los que los cargos de difícil consecución coinciden con los cargos misionales. Por el contrario, aquellos en los que no hay coincidencia se consideran satisfechos. Además, se identifican cargos críticos que no están contemplados dentro de los cargos misionales.", style = "font-size: 18px;"),
               tags$p("Recuerde: El cálculo de la demanda satisfecha e insatisfecha solo se realiza sobre los cargos misionales asociados a cada área de cualificación.", style = "font-size: 18px;"),
               div(style = "height: 10px;"),
               style = "font-size: 18px; text-align: left;"
           )
           ),
    column(9,
           box(width = 12, status = "primary",
             fluidRow(
               column(8, offset = 2,
                      tags$h1("Principales indicadores",
                              style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                      ),
                      tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
               )
             ),
             div(style = "height: 30px;"),
             div(style = "font-size: 17px;",
                 reactableOutput("base_estadisticas_DC")
                 ),
              
             )
           )
  ),
  div(style="height: 50px;"),
  fluidRow(
    div(style = "font-size: 17px;",
        column(2,
               box(title="Áreas de Cualificación",
                   width=12,
                   status="primary",
                   solidHeader=T,
                   uiOutput("select_area_catalog_3_3"),
                   div(style="height: 20px;"),
                   column(2, offset =1,
                          actionButton("clear_areas_3_3", "Limpiar Filtros", icon = icon("eraser"),
                                       style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                          )
                   )
               )
        ),
        column(9, 
               box(width = 12, status = "primary",
                 fluidRow(
                   column(9, offset = 2,
                          tags$h1("Total Cargos de Difícil Consecución",
                                  style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                          ),
                          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
                   )
                 ),
                 div(style = "height: 30px;"),
                 fluidRow(
                   plotOutput("dificil_consecucion")
                 )
                 )
        )
    )
  ),
  div(style = "height: 40px;"),
  fluidRow(
    column(2,
           box(
             title="Filtro por Área",
             width=12,
             status="primary",
             solidHeader=T,
             div(style="height: 20px;"),
             uiOutput("select_area_CargosCriticos"),
             div(style = "height: 24px;"),
             fluidRow(
               column(2, offset =1,
                      actionButton("clear_CargosCriticos", "Limpiar Filtros", icon = icon("eraser"),
                                   style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                      )
               )
             ),
             div(style = "height: 24px;"),
             fluidRow(
               column(2, offset =1,
                      downloadButton("download_tablaCargosCriticos", "Descargar Tabla",
                                     style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                      )
               )
             )
           ),
           div(style = "height: 1180px;"),
           box(
             title="Filtro por Área",
             width=12,
             status="primary",
             solidHeader=T,
             div(style="height: 20px;"),
             uiOutput("select_area_baseDemanda"),
             div(style = "height: 24px;"),
             fluidRow(
               column(2, offset =1,
                      actionButton("clear_tablaDemandaS", "Limpiar Filtros", icon = icon("eraser"),
                                   style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                      )
               )
             ),
             div(style = "height: 24px;"),
             fluidRow(
               column(2, offset =1,
                      downloadButton("download_tablaDemandaS", "Descargar Tabla",
                                     style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                      )
               )
             )
           )
    ),
    column(9,
           fluidRow(
             box(width = 12, status = "primary",
              tags$h1("Tabla de Cargos Críticos",
                      style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
              ),
              tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
             div(style = "height: 30px;"),
             div(style = "font-size: 17px;",
                 reactableOutput("base_cargosCriticos")
             ),
             )
           ),
           div(style="height: 50px;"),
           fluidRow(
             box(width = 12, status = "primary",
               tags$h1("Información de Demanda Satisfecha e Insatisfecha",
                       style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
               ),
               tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
             div(style = "height: 30px;"),
             div(style = "font-size: 17px;",
               reactableOutput("base_demanda_")
             )
           )
           )
    )
  )
)

# ############################# MEDIOS DE BÚSQUEDA ############################
tab_mediosBusqueda <- tabItem(
  div(style = "height: 20px;"),
  tabName = "est_mediosBusqueda",
  class = "est_mediosBusqueda",
  tags$style('.est_mediosBusqueda {
                             background-color: #ffffff;
              }'),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Gestión de Vacantes y Formación Empresarial",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 30%;"),
    )
  ),
  div(style="height: 40px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = F,
               tags$p("En esta sección, los usuarios podrán explorar datos detallados sobre los motivos por los cuales las empresas no logran cubrir vacantes, las acciones que emprenden para llenar esas posiciones, y el grado de involucramiento de las empresas en el diseño y actualización de programas de formación. Además, se presentan los diversos medios de búsqueda utilizados por las empresas para cubrir sus vacantes.", style = "font-size: 18px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(style = "height: 30px;"),
  fluidRow(
    div(style = "font-size: 17px;",
        column(2,
               box(title="Áreas de Cualificación",
                   width=12,
                   status="primary",
                   solidHeader=T,
                   uiOutput("select_area_gestionVacantes"),
                   div(style="height: 20px;")
                   # column(2, offset =1,
                   #        actionButton("clear_areas_5", "Limpiar Filtros", icon = icon("eraser"),
                   #                     style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                   #        )
                   # )
               ),
               box(title = "Ayuda",
                   width = 12,
                   solidHeader = TRUE,
                   status = "primary",
                   collapsible = T,
                   collapsed = T,
                   tags$p("En esta sección, encontrará datos de la encuesta de demanda y brechas de capital humano realizada a las empresas desagregados y representados gráficamente.", style = "font-size: 18px;"),
                   tags$p(tags$b("Nota: "),"El número de observaciones corresponde al número de las encuestas realizadas en cada área de cualificación."),
                   div(style = "height: 10px;"),
                   style = "font-size: 18px; text-align: left;"
               )
               
        ),
        column(8, offset = 1,
               fluidRow(
                   box(width = 12, status = "primary",
                       tags$h1("Diseño Programa",
                               style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                       ),
                       tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
                       div(style="height: 30px;"),
                   fluidRow(
                     plotOutput("disenoPrograma_plot")
                   )
                   )
               ),
               fluidRow(
                   div(style="height: 60px;"),
                   box(width = 12, status = "primary",
                       tags$h1("Medios de Búsqueda",
                               style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                       ),
                       tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
                       div(style="height: 30px;"),
                   fluidRow(
                     plotOutput("medios_busqueda_plot")
                   )
                   )
               ),
               fluidRow(
                   div(style="height: 60px;"),
                   box(width = 12, status = "primary",
                       
                       tags$h1("Motivos No Vacante",
                               style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                       ),
                       tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
                       div(style="height: 30px;"),
                   fluidRow(
                     plotOutput("motivosNovacante_plot")
                     )
                   )
               ),
               fluidRow(
               div(style="height: 60px;"),
               box(width = 12, status = "primary",
                   
                   tags$h1("Acciones Vacante",
                           style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                   ),
                   tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
               fluidRow(
                 plotOutput("accionesVacante_plot")
                 )
               )
               )
               )
        )
    )
  )

# ############################# ÁREAS DE CUALIFICACIÓN ############################

tab_EstAreaCual <- tabItem(
  tabName = "est_area_cual",
  class = "est_area_cual",
  tags$style('.est_area_cual {
                             background-color: #ffffff;
              }'),
  
  div(style = "height: 20px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Estadísticas Áreas MNC",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
           
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
               tags$p("En esta sección, los usuarios podrán acceder a gráficos con información detallada que integra las diversas áreas de cualificación del Marco Nacional de Cualificaciones (MNC) con otras estadísticas.", style = "font-size: 18px;"),
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
  div(style="height: 20px;"),
  fluidRow(
      div(style = "font-size: 17px;",
          column(2,
                 div(style="height: 40px;"),
                 box(title = "Áreas de Cualificaión",
                     width = 12,
                     solidHeader = TRUE,
                     status = "primary",
                     uiOutput("select_area_catalog"),
                     div(style="height:20px;"),
                     column(2, offset =1,
                     actionButton("clear_areas", "Limpiar Filtros", icon = icon("eraser"),
                                  style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                                  )
                     )
                  ),
                 box(title = "Ayuda",
                     width = 12,
                     solidHeader = TRUE,
                     status = "primary",
                     collapsible = T,
                     collapsed = T,
                     tags$p("Las estadísticas que se presentan en esta sección, incluyen el número de denominaciones o cargos de la Clasificación Única de Ocupaciones para Colombia (CUOC), el número de campos detallados de la Clasificación Internacional Normalizada de la Educación Adaptada a Colombia (CINE-F), y el número de actividades económicas de la Clasificación Industrial Internacional Uniforme (CIIU) rev. 4.", style = "font-size: 18px;"),
                     div(style = "height: 10px;"),
                     style = "font-size: 18px; text-align: left;"
                 )
           ),
          column(7, offset=1,
                 fluidRow(
                   box(width = 12, status = "primary",
                       tags$h1("Sectores CIIU",
                               style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                       ),
                       tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
                       div(style = "height: 40px;"),
                      plotOutput("CIIU_plot")
                   )
                   ),
                 div(style = "height: 30px;"),
                 fluidRow(
                   box(width = 12, status = "primary",
                       tags$h1("Denominaciones CUOC",
                               style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                       ),
                       tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
                       div(style = "height: 40px;"),
                       plotOutput("CUOC_plot") 
                   )
                 ),
                 div(style = "height: 30px;"),
                   box(width = 12, status = "primary",
                       fluidRow(
                         tags$h1("Educación CINE",
                                 style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                         ),
                         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
                         div(style = "height: 40px;"),
                       plotOutput("CINE_plot")
                   )
                 )
                 )
      )
  )
)


tab_EstEncDemanda <- tabItem(
  tabName = "est_enc_dem",
  class = "est_enc_dem",
  tags$style('.est_enc_dem {
                             background-color: #ffffff;
              }'),
  div(style = "height: 20px;"),
  fluidRow(
    
    column(8, offset = 2,
           tags$h1("Estadísticas Encuesta Demanda",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
           tags$p("En esta sección podrá ...",
                  style = "text-align: center; font-size: 22px;"
           )
    )
  ),
  div(style = "height: 40px;"),
  
  fluidRow(
    box(width = 12,
        fluidRow(
          tags$h1("Área de Cualificación", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 30px;")
        ),
        fluidRow(
          column(2,
                 uiOutput("select_area_catalog_3")
          ),
          column(3,
                 div(style = "height: 24px;"),
                 actionButton("clear_areas_3", "Limpiar Filtros", icon = icon("eraser"),
                              style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
                 )
          )
        ),
        fluidRow(
          tags$h2("Área de Desempeño", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 10px;"),
          column(10, offset = 1,
                 plotOutput("descriptivas_area")
          )
        )
    ),
    box(width=12,
        fluidRow(
          tags$h1("Área de Cualificación", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 30px;")
        ),
        fluidRow(
          column(2,
                 uiOutput("select_area_catalog_5")
          )
        ),
        
        div(style = "height: 30px;"),
        fluidRow(
          tags$h2("Motivos de Búsqueda y Consecución de Vacantes", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 10px;"),
          column(10, offset = 1,
                 plotOutput("motivosNovacante")
          )
        )
    )
  )
)

tab_brechasKH <- tabItem(
  div(style = "height: 20px;"),
  tabName = "brechasKH",
  class = "brechasKH",
  tags$style('.brechasKH {
                             background-color: #ffffff;
              }'),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Estadísticas Brechas Capital Humano",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 30%;"),
    )
  ),
  div(style="height: 40px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = F,
               tags$p("En la sección sobre Brechas de Capital Humano, encontrará información detallada por área de cualificación y ocupación misional. Los datos incluyen indicadores de brecha de cantidad (BQ), brecha de calidad (BC) y brecha de pertinencia (BP), tanto para número de denominaciones como para número de ocupaciones según cada área de cualificación. La información se desglosa según si se trata de una ocupación o denominación misional y se agregan totales para cada área de cualificación.", style = "font-size: 18px;"),
               div(style = "height: 10px;"),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(style = "height: 60px;"),
  fluidRow(
    column(2,
           box(
             title = "Filtro por Área",
             width = 12,
             solidHeader = TRUE,
             status = "primary",
             uiOutput("select_area_BrechasEmpEst"),
             div(style = "height: 24px;"),
             actionButton("clear_BrechasEmpEst", "Limpiar Filtros", icon = icon("eraser"),
                          style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
             )
           ),
           box(title = "Ayuda",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = T,
               tags$p("Los indicadores presentados para las brechas de cantidad (BQ), brecha de calidad (BC) y brecha de pertinencia (BP), en el caso de denominaciones, indican el número de denominaciones que presentan la brecha específica dentro de cada área de cualificación.", style = "font-size: 18px;"),
               tags$p("Por ejemplo, para la brecha BQ Denominación en el caso de AFIR, 56 denominaciones cuentan con una brecha de cantidad. De esas, 21 denominaciones no forman parte de las ocupaciones misionales y 35 denominaciones pertenecen a las ocupaciones misionales.", style = "font-size: 18px;"),
               tags$p("De igual forma, cuando el indicador es para las ocupaciones, este representa el número de ocupaciones que tienen una brecha. Siguiendo con el ejemplo de BQ Ocupación en el caso de AFIR, 28 ocupaciones cuentan con una brecha de cantidad, de las cuales 18 no son ocupaciones misionales y 10 sí son ocupaciones misionales.", style = "font-size: 18px;"),
               div(style = "height: 10px;"),
               style = "font-size: 18px; text-align: left;"
           )
    ),
    column(9,
           box(width = 12, status = "primary",
               fluidRow(
                 column(8, offset = 2,
                        tags$h1("Principales indicadores",
                                style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                        ),
                        tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
                 )
               ),
               div(style = "height: 30px;"),
               div(style = "font-size: 17px;",
                   reactableOutput("BrechasEmpEst")
               ),
               
           )
    )
  )
)


tab_brechasKHOcupacion <- tabItem(
  div(style = "height: 20px;"),
  tabName = "brechasKHOcupacion",
  class = "brechasKHOcupacion",
  tags$style('.brechasKHOcupacion {
                             background-color: #ffffff;
              }'),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Brechas Capital Humano a Nivel de Ocupación",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 30%;"),
    )
  ),
  div(style="height: 40px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = F,
               tags$p("En esta sección, se presentan los indicadores de Brechas de Cantidad (BQ), Calidad (BC) y Pertinencia (BP) a nivel de Ocupación de la CUOC. Asimismo, se presentan otros indicadores como el número de denominaciones que tiene cada brecha y el total de brechas por cada gran categoría.", style = "font-size: 18px;"),
               div(style = "height: 10px;"),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(style = "height: 60px;"),
  fluidRow(
    div(style = "font-size: 16px;",
    column(2,
           box(
             title = "Filtros",
             width = 12,
             solidHeader = TRUE,
             status = "primary",
             selectizeInput("select_brechasKHOcupacion", "Seleccione Base",
                            choices = c(
                              "Area MNC",
                              "Características generales",
                              "Denominaciones Brechas",
                              "Indicadores Brechas",
                              "Total Indicadores Brechas"
                            )
             ),
             conditionalPanel(
               condition = "input.select_brechasKHOcupacion == 'Area MNC'",
               checkboxGroupInput("brechasKHOcupacion_areaCualificacion", "Seleccione Atributos", 
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
               condition = "input.select_brechasKHOcupacion == 'Características generales'",
               checkboxGroupInput("brechasKHOcupacion_CaracGenerales", "Seleccione Atributos", 
                                  choices = c(
                                    "Código Ocupación",
                                    "Ocupación",
                                    "Ocupación Misional"
                                  )
               )
             ),
             conditionalPanel(
               condition = "input.select_brechasKHOcupacion == 'Denominaciones Brechas'",
               checkboxGroupInput("brechasKHOcupacion_DenominacionesBrechas", "Seleccione Atributos", 
                                  choices = c(
                                    "Den_BQ__Atraccion_vacante",
                                    "Den_BQ__Programa",
                                    "Den_BQ__Atraccion",
                                    "Den_BQ__DeficitP",
                                    "Den_BP__Experiencia_vacant",
                                    "Den_BP__Conocimientos",
                                    "Den_BP__destreza",
                                    "Den_BP__Desarticulacion",
                                    "Den_BC__Competencia_vacante",
                                    "Den_BC__Conocimientos",
                                    "Den_BC__destreza",
                                    "Den_BC__Calidad"
                                  )
               )
             ),
             conditionalPanel(
               condition = "input.select_brechasKHOcupacion == 'Indicadores Brechas'",
               checkboxGroupInput("brechasKHOcupacion_IndicadoresBrechas", "Seleccione Atributos", 
                                  choices = c(
                                    "BQ__Atraccion_vacante",
                                    "BQ__Programa",
                                    "BQ__Atraccion",
                                    "BQ__DeficitP",
                                    "BP__Experiencia_vacant",
                                    "BP__Conocimientos",
                                    "BP__destreza",
                                    "BP__Desarticulacion",
                                    "BC__Competencia_vacante",
                                    "BC__Conocimientos",
                                    "BC__destreza",
                                    "BC__Calidad"
                                  )
               )
             ),
             conditionalPanel(
               condition = "input.select_brechasKHOcupacion == 'Total Indicadores Brechas'",
               checkboxGroupInput("brechasKHOcupacion_TotalIndicadores", "Seleccione Atributos", 
                                  choices = c(
                                    "BQ__BrechaCantidad",
                                    "BP__BrechaPertinencia",
                                    "BC__BrechaCalidad"
                                  )
               )
             ),
             div(style = "height: 24px;"),
             fluidRow(
             column(2, offset = 1,
             actionButton("clear_KHOcupacion", "Limpiar Filtros", icon = icon("eraser"),
                          style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                          )
             )
             ),
             div(style = "height: 24px;"),
             fluidRow(
             column(2, offset = 1,
             downloadButton("download_KHOcupacion", "Descargar Tabla",
                            style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                            )
             )
             )
           ),
           box(title = "Ayuda",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = T,
               tags$p("Los indicadores presentados en la tabla se encuentran para cada área a nivel de ocupación de la CUOC. Por ejemplo, los que aparecen con la \"Den\" indican el número de denominaciones que tiene la brecha a la ocupación.", style = "font-size: 18px;"),
               tags$p("Por ejemplo, en el caso de la ocupación 12191 para AFIR, se tiene que 1 denominación presenta brecha Den_BQ__Programa.", style = "font-size: 18px;"),
               tags$p("Asimismo, en el caso de las variables que inician con BQ, BP o BC, corresponden a la brecha que existe a nivel de ocupación de la CUOC.", style = "font-size: 18px;"),
               tags$p("Siguiendo el ejemplo para el indicador de BQ_Programa, existe una brecha. En el caso de los indicadores que inician con BP_Brecha, es una medida que contabiliza para cada categoría cuántos de los cuatro indicadores presentan brecha. Siguiendo con el ejemplo, para el BP_BrechaPertinencia existe solo un indicador asociado a las subbrechas de pertinencia que presenta brechas.", style = "font-size: 18px;"),
               div(style = "height: 10px;"),
               style = "font-size: 18px; text-align: left;"
           ),
           box(title = "Material de Apoyo",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = T,
               HTML("<a href='BrechasOcupacion.pdf' target='_blank'>
                     <p align: center; color: #4682B4;'>
                       PDF Brechas de Ocupación
                     </p>
                       </a>"
               ),
               style = "font-size: 18px; text-align: left;"
           )
    ),
    column(9,
           box(width = 12, status = "primary",
               fluidRow(
                 column(8, offset = 2,
                        tags$h1("Principales indicadores",
                                style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                        ),
                        tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
                 )
               ),
               div(style = "height: 30px;"),
               div(style = "font-size: 17px;",
                   reactableOutput("BrechasKHOcupacion")
               ),
               
           )
    )
  )
  )
)

tab_brechasDenominacion <- tabItem(
  div(style = "height: 20px;"),
  tabName = "brechasDenominacion",
  class = "brechasDenominacion",
  tags$style('.brechasDenominacion {
                             background-color: #ffffff;
              }'),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Brechas Capital Humano a Nivel de Denominación",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 30%;"),
    )
  ),
  div(style="height: 40px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = F,
               tags$p("En esta sección, se presentan los indicadores de Brechas de Cantidad (BQ), Calidad (BC) y Pertinencia (BP) a nivel de Denominación de la CUOC. Asimismo, se presentan otros indicadores como el número de Empresas que tiene cada brecha y el total de brechas por cada gran categoría.", style = "font-size: 18px;"),
               div(style = "height: 10px;"),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(style = "height: 60px;"),
  fluidRow(
    div(style = "font-size: 16px;",
    column(2,
           box(
             title = "Filtros",
             width = 12,
             solidHeader = TRUE,
             status = "primary",
             selectizeInput("select_brechasKHDenominacion", "Seleccione Base",
                            choices = c(
                              "Area MNC",
                              "Características generales",
                              "Empresas Brechas",
                              "Indicadores Brechas",
                              "Total Indicadores Brechas"
                            )
             ),
             conditionalPanel(
               condition = "input.select_brechasKHDenominacion == 'Area MNC'",
               checkboxGroupInput("brechasKHDenominacion_areaCualificacion", "Seleccione Atributos", 
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
               condition = "input.select_brechasKHDenominacion == 'Características generales'",
               checkboxGroupInput("brechasKHDenominacion_CaracGenerales", "Seleccione Atributos", 
                                  choices = c(
                                    "Ocupación Misional",
                                    "Código denominaciones",
                                    "Denominacion",
                                    "Código Ocupación",
                                    "Ocupación"
                                  )
               )
             ),
             conditionalPanel(
               condition = "input.select_brechasKHDenominacion == 'Empresas Brechas'",
               checkboxGroupInput("brechasKHDenominacion_EmpresasBrechas", "Seleccione Atributos", 
                                  choices = c(
                                    "Empresas_BQ__Atraccion_vacante",
                                    "Empresas_BQ__Programa",
                                    "Empresas_BQ__Atraccion",
                                    "Empresas_BQ__DeficitP",
                                    "Empresas_BP__Experiencia_vacante",
                                    "Empresas_BP__Conocimientos",
                                    "Empresas_BP__destreza",
                                    "Empresas_BP__Desarticulacion",
                                    "Empresas_BC__Competencia_vacante",
                                    "Empresas_BC__Conocimientos",
                                    "Empresas_BC__destreza",
                                    "Empresas_BC__Calidad"
                                  )
               )
             ),
             conditionalPanel(
               condition = "input.select_brechasKHDenominacion == 'Indicadores Brechas'",
               checkboxGroupInput("brechasKHDenominacion_IndicadoresBrechas", "Seleccione Atributos", 
                                  choices = c(
                                    "BQ__Atraccion_vacante",
                                    "BQ__Programa",
                                    "BQ__Atraccion",
                                    "BQ__DeficitP",
                                    "BP__Experiencia_vacante",
                                    "BP__Conocimientos",
                                    "BP__destreza",
                                    "BP__Desarticulacion",
                                    "BC__Competencia_vacante",
                                    "BC__Conocimientos",
                                    "BC__destreza",
                                    "BC__Calidad"
                                  )
               )
             ),
             conditionalPanel(
               condition = "input.select_brechasKHDenominacion == 'Total Indicadores Brechas'",
               checkboxGroupInput("brechasKHDenominacion_TotalIndicadores", "Seleccione Atributos", 
                                  choices = c(
                                    "BQ__BrechaCantidad",
                                    "BP__BrechaPertinencia",
                                    "BC__BrechaCalidad"
                                  )
               )
             ),
             div(style = "height: 24px;"),
             fluidRow(
               column(2, offset = 1,
                      actionButton("clear_KHDenominacion", "Limpiar Filtros", icon = icon("eraser"),
                                   style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                      )
               )
             ),
             div(style = "height: 24px;"),
             fluidRow(
               column(2, offset = 1,
                      downloadButton("download_KHOcupacion", "Descargar Tabla",
                                     style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                      )
               )
             )
           ),
           box(title = "Ayuda",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = T,
               tags$p("Ayuda de brechas denominación: Los indicadores presentados en la tabla se encuentran para cada área a nivel de denominación de la CUOC. Por ejemplo, los que aparecen con la \"Empresas\" indican el número de empresas de la encuesta de demanda y brechas de capital humano que respondieron que tiene la brecha a la denominación.", style = "font-size: 18px;"),
               tags$p("Por ejemplo, en el caso de la denominación 12191.007 para AFIR, se tiene que 2 empresas presentan brecha de Empresa_BQ__Programa.", style = "font-size: 18px;"),
               tags$p("Asimismo, en el caso de las variables que inician con BQ, BP o BC, corresponden a la brecha que existe a nivel de denominación de la CUOC.", style = "font-size: 18px;"),
               tags$p("Siguiendo el ejemplo para el indicador de BQ_Programa, existe una brecha. En el caso de los indicadores que inician con BP_Brecha, es una medida que contabiliza para cada categoría cuántos de los cuatro indicadores presentan brecha. Siguiendo con el ejemplo, para el BP_BrechaPertinencia existe solo un indicador asociado a las subbrechas de pertinencia que presenta brechas.", style = "font-size: 18px;"),
               div(style = "height: 10px;"),
               style = "font-size: 18px; text-align: left;"
           ),
           box(title = "Material de Apoyo",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = T,
               HTML("<a href='BrechasDenominacion.pdf' target='_blank'>
                     <p align: center; color: #4682B4;'>
                       PDF Brechas de Denominación
                     </p>
                       </a>"
               ),
               style = "font-size: 18px; text-align: left;"
           )
    ),
    column(9,
           box(width = 12, status = "primary",
               fluidRow(
                 column(8, offset = 2,
                        tags$h1("Principales indicadores",
                                style = "font-size: 35px; text-align: center; font-weight: bold; color: #4682B4;"
                        ),
                        tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
                 )
               ),
               div(style = "height: 30px;"),
               div(style = "font-size: 17px;",
                   reactableOutput("BrechasKHDenominacion")
               ),
               
           )
    )
  )
  )
)
