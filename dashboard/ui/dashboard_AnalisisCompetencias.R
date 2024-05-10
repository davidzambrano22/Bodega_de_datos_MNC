

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
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
           tags$p("En esta sección podrá consultar ...",
                  style = "text-align: center; font-size: 22px;"
           )
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

