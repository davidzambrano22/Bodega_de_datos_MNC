library(shinyWidgets)

tab_areasCualificacion <- tabItem(
  tabName = "tab_catalogo",
  class = "tab_catalogo",
  tags$style('.tab_catalogo {
                             background-color: #ffffff;
              }'),
  div(style = "height: 30px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Catálogo de las Áreas de Cualificación del MNC",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
    )
  ),
  div(
    style = "height: 60px;"
  ),
  fluidRow(
    column(10, offset=1,
    box(title = "Panel Interactivo de Información",
        width = 12,
        solidHeader = TRUE,
        status = "primary",
        collapsible = T,
        collapsed = F,
        tags$p("En esta sección, encontrará datos estadísticos desagregados y representados gráficamente en un tablero interactivo de Power BI. Estos datos proporcionan una visión detallada de las áreas de cualificación, facilitando el análisis y la comprensión de cada componente del Marco Nacional de Cualificaciones (MNC). Para acceder al panel interactivo y explorar la información de manera más dinámica, haga clic en el siguiente enlace:", style = "font-size: 20px;"),
        div(style = "height: 10px;"),
        div(style="text-align:center;",
            actionButton("link_to_powerBI_report",
                         icon = icon("bar-chart"),
                         HTML(
                           " <a href= 'https://app.powerbi.com/view?r=eyJrIjoiNjFmNzI1ZjItMWM5Yy00MGMzLWIzODItOGNlNmUwNTM5NzIzIiwidCI6ImIzZTVkYjVlLTI5NDQtNDgzNy05OWY1LTc0ODhhY2U1NDMxOSIsImMiOjh9' style='color:#333;' target='_blank'> Panel Interactivo</a>",
                         ),
                         style = "color: #333; background-color: #ffffff; font-size: 20px;"
            )
        ),
        style = "font-size: 18px; text-align: justify;"
    )
  )
  ),
  div(
    style = "height: 50px;"
  ),
  fluidRow(
    div(style = "height: 30px;"),
    column(10, offset=1,
    box(title= "Áreas del MNC con Información Disponible",
        width = 12,
        solidHeader = TRUE,
        status = "primary",
        collapsible = F,
        div(style="height: 40px;"),
        fluidRow(
          column(4, 
                 div(class = "box-areas",
                     actionButton("artes_button",
                                  img(id = "artes_button_",
                                      src = "images/artes.png"),
                                  class = "areas-button"
                                     ),
                     div(style = "height: 20px;"),
                     tags$p("Artes visuales, Plásticas, y del Patrimonio Cultural (AVPP)", style = "font-size: 20px;")
                     )
                 ),
          column(4,
                 div(class = "box-areas",
                     actionButton("conservacion_button",
                                  img(id = "conservacion_button_",
                                      src = "images/ambiental.png"),
                                  class = "areas-button"
                                  ),
                     div(style = "height: 20px;"),
                     tags$p("Conservación, Protección y Saneamiento Ambiental (CPSA)", style = "font-size: 20px;")
                     )
                   
                 ),
                 column(4, 
                        div(class = "box-areas",
                            actionButton("fisicas_button",
                                         img(id = "fisicas_button_",
                                             src = "images/fisicas.png"),
                                         class = "areas-button"
                            ),
                            div(style = "height: 20px;"),
                            tags$p("Actividades físicas, Deportivas y Recreativas (AFIR)", style = "font-size: 20px;")
                        )
                        
                 )
               ),
               div(
                 style = "height: 60px;"
               ),
               fluidRow(
                 column(4, 
                        div(class = "box-areas",
                            actionButton("alimentos_button",
                                         img(id = "alimentos_button_",
                                             src = "images/alimentos.png"),
                                         class = "areas-button"
                            ),
                            div(style = "height: 20px;"),
                            tags$p("Elaboración y Transformación de Alimentos (ETAL)", style = "font-size: 20px;")
                        )
                        
                 ),
                 column(4, 
                        div(class = "box-areas",
                            actionButton("agropecuarias_button",
                                         img(id = "agropecuarias_button_",
                                             src = "images/agropecuarias.png"),
                                         class = "areas-button"
                            ),
                            div(style = "height: 20px;"),
                            tags$p("Agropecuario, Silvicultura, Pesca, Acuicultura y Veterinaria (AGVE)", style = "font-size: 20px;")
                            )
                        )
                 )
      )
    )
    )
)

