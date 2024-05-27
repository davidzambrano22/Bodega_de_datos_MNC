
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
           tags$h1("Conocimientos CUOC",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
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
                 box(title = "Guía",
                     width = 12,
                     solidHeader = TRUE,
                     status = "primary",
                     collapsible = T,
                     collapsed = T,
                     tags$p("En esta sección, encontrará datos estadísticos desagregados y representados gráficamente en un tablero de PBI. Para acceder al panel interactivo, haga clic en el siguiente enlace:", style = "font-size: 20px;"),
                     div(style = "height: 10px;"),
                     style = "font-size: 18px; text-align: justify;"
                 )
                 
          ),
          column(10,
                 fluidRow(
                   div(style = "text-align: center;",
                   box(width = 12,
                       plotOutput("conocimientos")
                      )
                   )
                   ),
                 fluidRow(
                   wordcloud2Output("wordcloud_conocimientos")
                 )
                 )
          
          )
  ),
  div(style="height: 60px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Habilidades Socioemocionales",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
    )
  ),
  div(style = "height: 40px;"),
  fluidRow(
    div(style = "font-size: 17px;",
        column(2,
               # div(style="height: 40px;"),
               # box(title="Seleccione:",
               #     width=12,
               #     status="primary",
               #     solidHeader=T,
               #     uiOutput("select_area_catalog_2_2")
               # ),
               # box(title = "Guía",
               #     width = 12,
               #     solidHeader = TRUE,
               #     status = "primary",
               #     collapsible = T,
               #     collapsed = T,
               #     tags$p("En esta sección, encontrará datos estadísticos desagregados y representados gráficamente en un tablero de PBI. Para acceder al panel interactivo, haga clic en el siguiente enlace:", style = "font-size: 20px;"),
               #     div(style = "height: 10px;"),
               #     style = "font-size: 18px; text-align: justify;"
               # )
               
        ),
        column(10,
               fluidRow(
               div(style = "text-align: center;",
                   box(width = 12,
                       wordcloud2Output("wordcloud_habilidades")
                   )
               )
               ),
               fluidRow(
                 plotOutput("socioemocionales")
               )
        )
        
    )
  ),
  div(style="height: 60px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Destrezas CUOC",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
    )
  ),
  div(style = "height: 60px;"),
  fluidRow(
    div(style = "font-size: 17px;",
        column(2,
               # div(style="height: 40px;"),
               # box(title="Seleccione:",
               #     width=12,
               #     status="primary",
               #     solidHeader=T,
               #     uiOutput("select_area_catalog_2")
               # ),
               # box(title = "Guía",
               #     width = 12,
               #     solidHeader = TRUE,
               #     status = "primary",
               #     collapsible = T,
               #     collapsed = T,
               #     tags$p("En esta sección, encontrará datos estadísticos desagregados y representados gráficamente en un tablero de PBI. Para acceder al panel interactivo, haga clic en el siguiente enlace:", style = "font-size: 20px;"),
               #     div(style = "height: 10px;"),
               #     style = "font-size: 18px; text-align: justify;"
               # )
               
        ),
        column(10,
               fluidRow(
                 div(style = "text-align: center;",
                     box(width = 12,
                         wordcloud2Output("wordcloud_destrezas")
                     )
                 )
               ),
               fluidRow(
                 plotOutput("destrezas")
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
           tags$h1("Estadísticas por Áreas de Desempeño",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
    tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      )
    ),
    div(style = "height: 60px;"),
    fluidRow(
      div(style = "font-size: 17px;",
      column(2,
             box(title="Áreas de Cualificación:",
               width=12,
               status="primary",
               solidHeader=T,
               uiOutput("select_area_catalog_3"),
               div(style="height: 20px;"),
               column(2, offset =1,
                      actionButton("clear_areas_3", "Limpiar Filtros", icon = icon("eraser"),
                                   style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                      )
               )
                 ),
             box(title = "Guía",
                 width = 12,
                 solidHeader = TRUE,
                 status = "primary",
                 collapsible = T,
                 collapsed = T,
                 tags$p("En esta sección, encontrará datos estadísticos desagregados y representados gráficamente en un tablero de PBI. Para acceder al panel interactivo, haga clic en el siguiente enlace:", style = "font-size: 20px;"),
                 div(style = "height: 10px;"),
                 style = "font-size: 18px; text-align: justify;"
             )
             
      ),
      column(9, offset = 0,
               box(status = "primary",
                   width = 12,
                   solidHeader = T,
                   fluidRow(
                     column(5, offset=2,
                            plotlyOutput("pie_descriptivas_area")
                            )
                   ),
                   div(style="height: 100px;"),
                   fluidRow(
                     plotOutput("descriptivas_area")
                     )
               )
             )
      )
      ),
    div(style="height: 50px;"),
    fluidRow(
      column(8, offset = 2,
             tags$h1("Estadísticas por Departamentos",
                     style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
             ),
             tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      )
    ),
    div(style = "height: 60px;"),
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
                 box(title = "Guía",
                     width = 12,
                     solidHeader = TRUE,
                     status = "primary",
                     collapsible = T,
                     collapsed = T,
                     tags$p("En esta sección, encontrará datos estadísticos desagregados y representados gráficamente en un tablero de PBI. Para acceder al panel interactivo, haga clic en el siguiente enlace:", style = "font-size: 20px;"),
                     div(style = "height: 10px;"),
                     style = "font-size: 18px; text-align: justify;"
                 )
                 
          ),
          column(8, offset = 1,
                 fluidRow(
                   column(5, offset=2,
                          plotlyOutput("pie_departamentos")
                   )
                 ),
                 div(style="height: 100px;"),
                 fluidRow(
                   plotOutput("departamentos")
                 )
          )
      )
    ),
    div(style="height: 50px;"),
    fluidRow(
      column(8, offset = 2,
             tags$h1("Estadísticas por Tamaño de la Empresa",
                     style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
             ),
             tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      )
    ),
    div(style = "height: 60px;"),
    fluidRow(
      div(style = "font-size: 17px;",
          column(2,
                 box(title="Seleccione:",
                     width=12,
                     status="primary",
                     solidHeader=T,
                     uiOutput("select_area_catalog_3_2"),
                     div(style="height: 20px;"),
                     column(2, offset =1,
                            actionButton("clear_areas_3_2", "Limpiar Filtros", icon = icon("eraser"),
                                         style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                            )
                     )
                 ),
                 box(title = "Guía",
                     width = 12,
                     solidHeader = TRUE,
                     status = "primary",
                     collapsible = T,
                     collapsed = T,
                     tags$p("En esta sección, encontrará datos estadísticos desagregados y representados gráficamente en un tablero de PBI. Para acceder al panel interactivo, haga clic en el siguiente enlace:", style = "font-size: 20px;"),
                     div(style = "height: 10px;"),
                     style = "font-size: 18px; text-align: justify;"
                 )
                 
          ),
          column(8, offset = 1,
                 fluidRow(
                   column(5, offset=2,
                          plotlyOutput("pie_tamano_empresa")
                   )
                 ),
                 div(style="height: 100px;"),
                 fluidRow(
                   plotOutput("tamano_empresa")
                 )
          )
      )
    )
  
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
           tags$h1("Estadísticas por Cargos de Difícil Consecución",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
    )
  ),
  div(style = "height: 60px;"),
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
               ),
               box(title = "Guía",
                   width = 12,
                   solidHeader = TRUE,
                   status = "primary",
                   collapsible = T,
                   collapsed = T,
                   tags$p("En esta sección, encontrará datos estadísticos desagregados y representados gráficamente en un tablero de PBI. Para acceder al panel interactivo, haga clic en el siguiente enlace:", style = "font-size: 20px;"),
                   div(style = "height: 10px;"),
                   style = "font-size: 18px; text-align: justify;"
               )
               
        ),
        column(8, offset = 1,
               fluidRow(
                 column(5, offset=2,
                        plotlyOutput("pie_dificil_consecucion")
                 )
               ),
               div(style="height: 100px;"),
                 fluidRow(
                   plotOutput("dificil_consecucion")
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
           tags$h1("Estadísticas por Medios de Búsqueda",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
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
                   uiOutput("select_area_catalog_5"),
                   div(style="height: 20px;")
                   # column(2, offset =1,
                   #        actionButton("clear_areas_5", "Limpiar Filtros", icon = icon("eraser"),
                   #                     style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                   #        )
                   # )
               ),
               box(title = "Guía",
                   width = 12,
                   solidHeader = TRUE,
                   status = "primary",
                   collapsible = T,
                   collapsed = T,
                   tags$p("En esta sección, encontrará datos estadísticos desagregados y representados gráficamente en un tablero de PBI. Para acceder al panel interactivo, haga clic en el siguiente enlace:", style = "font-size: 20px;"),
                   div(style = "height: 10px;"),
                   style = "font-size: 18px; text-align: justify;"
               )
               
        ),
        column(8, offset = 1,
               fluidRow(
                 column(5, offset=2,
                        plotlyOutput("pie_medios")
                 )
               ),
               div(style="height: 100px;"),
               fluidRow(
                 plotOutput("medios")
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
           tags$h1("Estadísticas por Área de Cualificación",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
           
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
                 box(title = "Guía",
                     width = 12,
                     solidHeader = TRUE,
                     status = "primary",
                     collapsible = T,
                     collapsed = T,
                     tags$p("...", style = "font-size: 20px;"),
                     div(style = "height: 10px;"),
                     style = "font-size: 18px; text-align: justify;"
                 )
           ),
          column(7, offset=1,
                 fluidRow(
                   tags$h2("Sectores CIIU", style = "text-align: center;"),
                   plotOutput("CIIU_plot")
                   ),
                 fluidRow(
                   tags$h2("Denominaciones CUOC", style = "text-align: center;"),
                   plotOutput("CUOC_plot")   
                 ),
                 fluidRow(
                   tags$h2("Educación CINE", style = "text-align: center;"),
                   plotOutput("CINE_plot")
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
          tags$h1("Estadísticas Descriptivas por Área de Cualificación", style = "text-align: center; font-weight: bold; color: #4682B4;"),
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
          tags$h1("Estadísticas Descriptivas por Área de Cualificación", style = "text-align: center; font-weight: bold; color: #4682B4;"),
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
  ),
)

