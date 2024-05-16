

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
  div(style = "height: 40px;"),
  fluidRow(
    box(width=12,
        fluidRow(
          column(6,
                 uiOutput("select_area_catalog_2")
          )
        ),
        tags$h2("Habilidades Socioemocionales", style = "text-align: center; font-weight: bold; color: #4682B4;"),
        tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
        div(style = "height: 30px;"),
        fluidRow(
          
          column(7,
                 plotOutput("socioemocionales")
          ),
          column(4,
                 wordcloud2Output("wordcloud_habilidades")
          )
        ),
        
        div(style = "height: 30px;"),
        fluidRow(
          tags$h2("Conocimientos CUOC", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 10px;"),
          column(7,
                 plotOutput("conocimientos")
                 
          ), 
          column(4,
                 wordcloud2Output("wordcloud_conocimientos")
          )
        ),
        
        div(style = "height: 30px;"),
        fluidRow(
          tags$h2("Destrezas CUOC", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 10px;"),
          column(7,
                 plotOutput("destrezas")
                 
          ), 
          column(4,
                 wordcloud2Output("wordcloud_destrezas")
                 )
          )
        )
  )
)

tab_areasDesempeño <- tabItem(
  div(style = "height: 20px;"),
  tabName = "est_areasDesempeño",
  class = "est_areasDesempeño",
  tags$style('.est_areasDesempeño {
                             background-color: #ffffff;
              }'),
  fluidRow(
    tags$h2("Área de Desempeño", style = "text-align: center; font-weight: bold; color: #4682B4;"),
    tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
    div(style = "height: 10px;"),
    column(2,
           box(title="Seleccione:",
             width=12,
             status="primary",
             solidHeader=T,
             uiOutput("select_area_catalog_3")
               )
           
    ),
    column(8, offset = 1,
           plotOutput("descriptivas_area")
           )
      )
)

tab_EstAreaCual <- tabItem(
  div(style = "height: 20px;"),
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
                 box(title = "Bases de datos",
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
                     tags$p("En esta sección, encontrará datos estadísticos desagregados y representados gráficamente en un tablero de PBI. Para acceder al panel interactivo, haga clic en el siguiente enlace:", style = "font-size: 20px;"),
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
        ),
        fluidRow(
          tags$h2("Tamaño de la Empresa", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 10px;"),
          column(10, offset = 1,
                 plotOutput("tamano_empresa")
          )
        ),
        div(style = "height: 10px;"),
        fluidRow(
          tags$h2("Cargos Críticos de Difícil Consecución", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 10px;"),
          column(10, offset = 1,
                 plotOutput("dificil_consecucion")
          )
        ),
        fluidRow(
          tags$h2("Departamentos", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 10px;"),
          column(10, offset = 1,
                 plotOutput("departamentos")
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
        fluidRow(
          tags$h2("Medios de Búsqueda", style = "text-align: center; font-weight: bold; color: #4682B4;"),
          tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
          div(style = "height: 10px;"),
          column(10, offset = 1,
                 plotOutput("medios")
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

