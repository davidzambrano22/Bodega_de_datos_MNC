
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