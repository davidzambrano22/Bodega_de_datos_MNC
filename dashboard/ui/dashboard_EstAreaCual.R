

tab_EstAreaCual <- tabItem(
  div(style = "height: 20px;"),
  tabName = "est_area_cual",
  class = "est_area_cual",
  tags$style('.tab_consulta {
                             background-color: #ffffff;
              }'),
  
  div(style = "height: 20px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Información General",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
           tags$p("En esta sección podrá consultar ...",
                  style = "text-align: center; font-size: 22px;"
           )
    )
  ),
  div(
    style = "height: 40px;"
  ),
  
  fluidRow(
    box(width = 12,
        fluidRow(
          column(2,
                 uiOutput("select_area_catalog")
          ),
          column(3,
                 div(style = "height: 24px;"),
                 actionButton("clear_areas", "Limpiar Filtros", icon = icon("eraser"),
                              style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
                 )
          )
        ),
        fluidRow(
          column(4,
                 tags$h2("Sectores CIIU", style = "text-align: center;"),
                 plotOutput("CIIU_plot")
          ),
          column(4,
                 tags$h2("Denominaciones CUOC", style = "text-align: center;"),
                 plotOutput("CUOC_plot")   
          ),
          column(4,
                 tags$h2("Educación CINE", style = "text-align: center;"),
                 plotOutput("CINE_plot") 
          )
        )
    )
  )
)