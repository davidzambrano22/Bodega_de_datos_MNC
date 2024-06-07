
tab_infoEtapas <- tabItem(
  tabName = "info_etapas",
  class = "info_etapas",
  tags$style('.info_etapas {
                             background-color: #ffffff;
              }'),
  div(style = "height: 60px;"),
  fluidRow(
    column(2,
           div(style = "height: 150px;"),
           div(style = "font-size: 17px;",
           box(
             title = "Material de Apoyo",
             width = 12,
             solidHeader = TRUE,
             status = "primary",
             collapsible = T,
             HTML("<a href='Fichas brechas.pdf' target='_blank'> 
                        <p align: center; color: #4682B4; font-size: 17px;'>
                          Fichas Brechas
                        </p>
                     </a>"
                  )
             )
           )
           ),
    column(8,
           tags$h1("Información por Etapas del MNC",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
           div(style = "height: 30px;"),
           tags$p("Este aplicativo es una herramienta especializada para almacenar y gestionar información relacionada con el Marco Nacional de Cualificaciones (MNC). Facilita la visualización y almacenamiento de datos provenientes de las distintas fases, incluyendo la Contextualización Sectorial, Brechas de Capital Humano, Análisis Funcional y Ocupacional, y la Estructuración de Cualificaciones. El sistema asegura una carga de datos estructurada, garantizando su seguridad e integridad, y permite al usuario realizar búsquedas filtradas para obtener información específica de manera eficiente, así como su posterior descarga.",
                  style = "font-size: 22px; text-align: justify;"
           )
    )
  ),
  div(style = "height: 30px;"),
  fluidRow(
    div(style = "font-size: 21px;",
      column(8, offset = 2,
             box(width = 12, align = "justify",
                 title = "Contextualización del Sector",
                 status = "primary",
                 solidHeader = TRUE,
                 collapsible = T,
                 collapsed = F,
                 tags$p(
                   "La contextualización del sector es el proceso de analizar y comprender en detalle los diversos factores que influyen en un sector específico. Esto incluye la delimitación de los sectores asociados al área de cualificación, la identificación de actores clave, y la evaluación de las características socioeconómicas, tecnológicas, organizacionales y ambientales.",
                   style = "font-size: 22px; tex-align: center;"
                   ),
                 tags$p(
                 "Podrá encontrar información detallada sobre:"
                 ),
                 tags$ul(
                   tags$li(
                     actionLink("link_to_ocu_dept", label = "Ocupados por Departamentos")
                     ),
                   tags$li(
                     actionLink("link_to_ocu_sect", label = "Ocupados por Sectores")
                   ),
                   tags$li(
                     actionLink("link_to_ocu_edad", label = "Ocupados por Edad y Sexo")
                   ),
                   tags$li(
                     actionLink("link_to_ocu_nivEdu", label = "Ocupados por Nivel Educativo")
                   )
                   )
                 )
             )
      )
    ),
  div(style = "height: 30px;"),
  fluidRow(
    div(style = "font-size: 21px;",
        column(8, offset = 2,
               box(width = 12, align = "justify",
                   title = "Brechas de Capital humano",
                   status = "primary",
                   solidHeader = TRUE,
                   collapsible = T,
                   collapsed = F,
                   tags$p(
                     "Las brechas de capital humano (BKH) representan los desajustes entre las competencias que tienen los trabajadores y las habilidades o conocimientos que requieren las empresas en el mercado laboral. ",
                     style = "font-size: 22px; tex-align: center;"
                   ),
                   tags$p(
                     "Las brechas de capital humano se clasifican en:"
                   ),
                   tags$ul(
                     tags$li(
                       actionLink("link_to_cantidad", label = "Cantidad:"),
                       tags$p("Se refiere al número insuficiente de trabajadores con las competencias necesarias para cubrir las demandas del mercado laboral.")
                     ),
                     tags$li(
                       actionLink("link_to_calidad", label = "Calidad:"),
                       tags$p("Indica la falta de habilidades o conocimientos específicos que se requieren para desempeñar un trabajo de manera efectiva.")
                     ),
                     tags$li(
                       actionLink("link_to_pertinencia", label = "Pertinencia:"),
                       tags$p("Se relaciona con la adecuación de las competencias de los trabajadores a las necesidades y exigencias del mercado laboral.")
                     )
                   )
               )
        )
    )
  )
)