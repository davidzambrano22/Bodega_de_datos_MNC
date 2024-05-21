
# TABS --------------------------------------------------------------------
tab_home <- tabItem(
    tabName = "home",
    class = "tab_home",
    tags$style('.tab_home {
                             background-color: #ffffff;
              }'),
    div(style = "height: 20px;"),
    fluidRow(
      column(width = 3,  offset = 1,
             img(src = "https://upload.wikimedia.org/wikipedia/commons/3/30/LOGO_PLAN_DE_DESARROLLO_COLOMBIA_POTENCIA_DE_LA_VIDA_2022-2026.png",
                             width = "75%", style = "max-width: 100%; height: auto;")
             ),
      column(width = 3, offset = 5,
             img(src = "https://www.mineducacion.gov.co/1780/channels-977_logo.png", 
                width = "75%", style = "max-width: 100%; height: auto;")
             )
    ),
    div(style = "height: 60px;"),
    
    fluidRow(
      column(8, offset = 2,
             tags$h1("Sistema de gestión de datos del MNC",
                     style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
             ),
             tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
             tags$p("Este aplicativo es una herramienta especializada para almacenar y gestionar información relacionada con el Marco Nacional de Cualificaciones (MNC). Facilita la visualización y almacenamiento de datos provenientes de las distintas fases, incluyendo la Contextualización Sectorial, Brechas de Capital Humano, Análisis Funcional y Ocupacional, y la Estructuración de Cualificaciones. El sistema asegura una carga de datos estructurada, garantizando su seguridad e integridad, y permite al usuario realizar búsquedas filtradas para obtener información específica de manera eficiente, así como su posterior descarga.",
                    style = "font-size: 22px; text-align: justify;"
                      )
      )
    ),
    div(style = "height: 20px; color: #4682B4;"),
    
    fluidRow(
      column(8, offset = 2,
      tags$h1("¿Cómo navegar en el sistema?",
              style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
              ),
      tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
      tags$p("Esta herramienta cuenta con cinco secciones de consulta a través de las cuales se puede obtener información detallada para las diferentes áreas de cualificación:",
             style = "text-align: justify; font-size: 22px;"
             )
      )
    ),
    fluidRow(
      column(12, tags$div(style = "height: 20px;")), # Empty space with 20px height
    ),
    
    fluidRow(
      column(8, offset = 2,
             box(width = 12, align = "justify",
                 title = span(tagList(icon("book"),
                                      "Áreas de Cualificación"),
                              style = "font-size: 22px;"
                 ),
                 status = "primary",
                 solidHeader = TRUE,
                 tags$p(
                   "En esta sección se presentan las áreas de cualificación disponibles, con acceso a toda la información relevante para su consulta. Aquí, los usuarios pueden explorar y obtener detalles específicos en tableros de Power BI y documentación asociada a cada área.",
                   style = "font-size: 22px; tex-align: center;"
                 )
             )
      )
    ),
    
    fluidRow(
      column(8, offset = 2,
             box(width = 12, align = "justify",
                 title = span(tagList(icon("cloud"),
                                      "Bases de Datos Oficiales"),
                              style = "font-size: 22px;"
                 ),
                 status = "primary",
                 solidHeader = TRUE,
                 tags$p(
                   "A través de esta sección el usuario podrá acceder a información que integra las áreas de cualificación del MNC con las fuentes de la Clasificación Nacional de Ocupaciones (CUOC), la Clasificación Internacional Normalizada de la Educación Adaptada a Colombia (CINE) y la Clasificación Industrial Internacional Uniforme (CIIU) rev. 4.",
                   style = "font-size: 22px; tex-align: center;"
                 )
             )
      )
    ),
    fluidRow(
      column(8, offset = 2,
             box(width = 12, align = "justify",
                 title = span(tagList(icon("bar-chart"),
                                      "Información por Etapas MNC"),
                              style = "font-size: 22px;"
                 ),
                 status = "primary",
                 solidHeader = TRUE,
                 tags$p(
                   "En esta sección, se puede encontrar información recopilada para cada una de las etapas del Marco Nacional de Cualificaciones (MNC): la Contextualización Sectorial, las Brechas de Capital Humano, el Análisis Funcional y Ocupacional, y la Estructuración de Cualificaciones. Esta información se presenta desagregada a través de diferentes indicadores, lo que permite a los usuarios acceder a datos específicos y detallados. ",
                   style = "font-size: 22px; tex-align: center;"
                 )
             )
      )
    ),
    fluidRow(
      column(8, offset = 2,
             box(width = 12, align = "justify",
                 title = span(tagList(icon("question-circle"),
                                      "Otras Fuentes de Información"),
                              style = "font-size: 22px;"
                 ),
                 status = "primary",
                 solidHeader = TRUE,
                 tags$p(
                   "En esta sección, puede encontrar información recopilada de diversas fuentes, como la Encuesta de Demanda realizada a las empresas, la Encuesta de Oferta Educativa realizada a las Instituciones de Educación Superior y para el trabajo, información sobre demanda proveniente de las bases de datos de ofertas laborales del Servicio Público de Empleo (SPE), e información de las ofertas educativas provenientes del Sistema Nacional de Información de la Educación Superior (SNIES).",
                   style = "font-size: 22px; tex-align: center;"
                 )
             )
      )
    ),
    fluidRow(
      column(8, offset = 2,
             tags$h1("¿Qué debemos saber sobre el MNC?",
                     style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
             ),
             tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
             )
      ),
      div(style = "height: 20px;"),
             
     fluidRow(
       column(8, offset = 2,
        HTML("<p style='font-size: 22px;  text-align: justify;'>
           <span style='color: black; font-size: 22px;'> <b>MNC:</b> </span>
           Es un componente del Sistema Nacional de Cualificaciones (SNC) y se define como el instrumento que permite estructurar y clasificar las Cualificaciones en un esquema de ocho (8) niveles ordenados y expresados en términos de Conocimientos, Destrezas y Actitudes, aplicables en contextos de estudio, trabajo o en ambos, de acuerdo con la secuencialidad y complejidad de los aprendizajes que logran las personas en las diferentes Vías de Cualificación.
           </p>
           
           <p style='font-size: 22px;  text-align: justify;'>
           <span style='color: black; font-size: 22px;'> <b>Nivel de Cualificación:</b> </span>
           Establece el grado de complejidad, amplitud y profundidad de los Resultados de Aprendizaje, ordenados secuencialmente en términos de Conocimientos, Destrezas y Actitudes, lo que permite clasificar las Cualificaciones en el Marco Nacional de Cualificaciones (MNC).
           </p>
           
           <p style='font-size: 22px;  text-align: justify;'>
           <span style='color: black; font-size: 22px;'> <b>Cualificación:</b> </span>
           Es el reconocimiento formal que se otorga a una persona por parte de una institución autorizada después de un proceso de evaluación que evidencia el logro de los Resultados de Aprendizaje definidos en la Estructura de la Cualificación y vinculados a un nivel del Marco Nacional de Cualificaciones (MNC). Las Cualificaciones se reconocen mediante los títulos o certificados que se obtienen a través de las diferentes Vías de Cualificación de acuerdo con las normas y lineamientos del Sistema Nacional de Cualificaciones.
           </p>
           
           <p style='font-size: 22px;  text-align: justify;'>
           <span style='color: black; font-size: 22px; text-align: justify;'> <b>Estructura de cualificación:</b> </span>
           Es un documento técnico que hace parte de los Catálogos Sectoriales de Cualificaciones y contiene las Competencias y Resultados de Aprendizaje que debe alcanzar una persona para el reconocimiento de la Cualificación asociada a un nivel del Marco Nacional de Cualificaciones (MNC). La Estructura de Cualificación sirve como referente para el diseño curricular y el reconocimiento de los Aprendizajes Previos.
           </p>
           "
        ),
        div(style = "height: 20px;"),
        HTML("<a href='https://especiales.colombiaaprende.edu.co/mnc/catalogo.html' target='_blank'> 
                      <p style='font-size: 22px; text-align: left; color: #4682B4;'>
                        Más información >
                      </p>
                   </a>"
        ),
        div(style = "height: 20px;"),
        HTML("<i class='hand-pointer' style = 'color:#D55E00;'></i> <a href='MNC_PPX.pdf' target='_blank'> 
                      <p style='font-size: 22px; text-align: left; color: #4682B4;'>
                        Guía Metodológica y Contextual del Marco Nacional de Cualificaciones >
                      </p>
                   </a>"
             )
        )
      ),
    div(style = "height: 20px; color: #4682B4;"),
    fluidRow(
      tags$h1("Ruta Metodológica para el Diseño de las Cualificaciones",
              style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
      ),
      tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 15%;"),
    ),
    div(style = "height: 20px;"),
    
    fluidRow(
    column(10, offset =1,
             column(12,
                    img(src = "images/ruta_diagrama_1.png", width = "100%", style = "max-width: 100%; height: auto;")
                    ),
                     fluidRow(
                     column(3, 
                            img(src = "images/yellow.png"),
                            HTML("<p style='font-size: 22px; text-align: left;'>
                                  <b>F1:</b> Delimitación del (los) sector(es) objeto de estudio
                                  asociado(s) al área de cualificación.
                                  </p>
                                  <p style='font-size: 22px; text-align: left;'>
                                  <b>F2:</b> Identificación de características del sector asociado
                                  de cualificación.
                                  </p>"
                                 )
                            ),
                     column(3, 
                            img(src = "images/red.png"),
                            HTML("<p style='font-size: 22px; text-align: left;'>
                                  <b>F3:</b> Identificación de brechas de capital humano.
                                 </p>
                                 <ul>
                                  <li> <p style='font-size: 22px; text-align: left;'> Análisis de prospectiva laboral</li></p>
                                  <li> <p style='font-size: 22px; text-align: left;'> Análisis de demanda laboral</li></p>
                                  <li> <p style='font-size: 22px;text-align: left;'> Análisis de oferta educativa</li></p>
                                  <li> <p style='font-size: 22px;text-align: left;'> Análisis de brechas de capital Humano</li></p>
                                 </ul>")
                            ),
                     column(3,
                            img(src = "images/green.png"),
                            HTML("
                                  <p style='font-size: 22px; text-align: left;'>
                                  <b>F4:</b> Análisis ocupacional
                                  </p>
                                  <ul>
                                  <li> <p style='font-size: 22px; text-align: left;'> Elaboración de la Matriz de Análisis Ocupacional y Organizacional</li></p>
                                  </ul>
                                  <p style='font-size: 22px; text-align: left;'>
                                  <b>F5:</b> Análisis funcional
                                  </p>
                                 ")
                     ),
                     column(3,
                            img(src = "images/blue.png"),
                            HTML("<p>
                                 <p style='font-size: 22px; text-align: left;'>
                                  <b>F6:</b> Identificación y perfil de competencias.
                                  </p>
                                  <p style='font-size: 22px; text-align: left;'>
                                  <b>F7:</b> Verificación de la Identificación y perfil de competencias.
                                  </p>
                                  <p style='font-size: 22px; text-align: left;'>
                                  <b>F8:</b> Referentes para la educación y formación y Paŕametros de calidad.
                                  </p>
                                  <p style='font-size: 22px;text-align: left;'>
                                  <b>F9:</b> Verificación de Referentes y parámetros de calidad.
                                  </p>
                                  <p style='font-size: 22px;text-align: left;'>
                                  <b>F10:</b> Incorporación de las cualificaciones en el <b>CNC</b>.
                                  </p>
                                 ")
                     )
                 )
             
  )
           ),
    div(style = "height: 20px;"),

    
    fluidRow(
      column(width = 3,  offset = 1, img(src = "images/logos/logo_MNC.png", #class = "img-responsive",
                             width = "75%", style = "max-width: 100%; height: auto;")),
      column(width = 1, offset = 4, align = "right", img(src = "images/logos/logo_PNUD.png", #class = "img-responsive",
                                                         width = "75%", style = "max-width: 200px; height: auto;")),
      column(width = 3,  img(src = "images/logos/logo_corona.png", #class = "img-responsive",
                                              width = "75%", style = "max-width: 100%; height: auto;"))
    )
)

# TAB CONSULTA ------------------------------------------------------------

tab_consulta <- tabItem(
  div(style = "height: 20px;"),
    tabName = "consulta",
    class = "tab_consulta",
    tags$style('.tab_consulta {
                             background-color: #ffffff;
              }'),
  
    div(style = "height: 20px;"),
    fluidRow(
      column(8, offset = 2,
             tags$h1("Descriptivos por Área del MNC",
                     style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
             ),
             tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
             tags$p("En esta sección podrá consultar los datos de la 
            Sistema de Gestión de datos del MNC Colombia.",
                    style = "text-align: center; font-size: 22px;"
             )
      )
    ),
    div(
      style = "height: 40px;"
      ),
# 
#     fluidRow(
#       box(width = 12,
#           fluidRow(
#             tags$h1("Estadísticas Descriptivas por Área de Cualificación", style = "text-align: center; font-weight: bold; color: #4682B4;"),
#             tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
#             div(style = "height: 30px;")
#           ),
#           fluidRow(
#             column(2,
#                    uiOutput("select_area_catalog")
#             ),
#             column(3,
#                    div(style = "height: 24px;"),
#                    actionButton("clear_areas", "Limpiar Filtros", icon = icon("eraser"),
#                                 style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
#                    )
#             )
#           ),
#           fluidRow(
#             column(4,
#                   tags$h2("Sectores CIIU", style = "text-align: center;"),
#                   plotOutput("CIIU_plot")
#                 ),
#             column(4,
#                    tags$h2("Denominaciones CUOC", style = "text-align: center;"),
#                    plotOutput("CUOC_plot")   
#                    ),
#             column(4,
#                    tags$h2("Educación CINE", style = "text-align: center;"),
#                    plotOutput("CINE_plot") 
#                    )
#         )
#       )
#     ),
      # fluidRow(
      #   box(width = 12,
      #       fluidRow(
      #         tags$h1("Estadísticas Descriptivas por Área de Cualificación", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 30px;")
      #       ),
      #       fluidRow(
      #         column(2,
      #                uiOutput("select_area_catalog_3")
      #         ),
      #         column(3,
      #                div(style = "height: 24px;"),
      #                actionButton("clear_areas_3", "Limpiar Filtros", icon = icon("eraser"),
      #                             style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
      #                )
      #         )
      #       ),
      #     fluidRow(
      #       tags$h2("Área de Desempeño", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #       tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #       div(style = "height: 10px;"),
      #       column(10, offset = 1,
      #              plotOutput("descriptivas_area")
      #              )
      #     ),
      #     fluidRow(
      #       tags$h2("Tamaño de la Empresa", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #       tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #       div(style = "height: 10px;"),
      #       column(10, offset = 1,
      #              plotOutput("tamano_empresa")
      #       )
      #     ),
      #       div(style = "height: 10px;"),
      #       fluidRow(
      #         tags$h2("Cargos Críticos de Difícil Consecución", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 10px;"),
      #         column(10, offset = 1,
      #                plotOutput("dificil_consecucion")
      #         )
      #       ),
      #       fluidRow(
      #         tags$h2("Departamentos", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 10px;"),
      #         column(10, offset = 1,
      #                plotOutput("departamentos")
      #         )
      #       )
      #       ),
      #   box(width=12,
      #       fluidRow(
      #         tags$h1("Estadísticas Descriptivas por Área de Cualificación", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 30px;")
      #       ),
      #       fluidRow(
      #         column(2,
      #                uiOutput("select_area_catalog_5")
      #         )
      #       ),
      #       fluidRow(
      #         tags$h2("Medios de Búsqueda", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 10px;"),
      #         column(10, offset = 1,
      #                plotOutput("medios")
      #         )
      #       ),
      #       
      #       div(style = "height: 30px;"),
      #       fluidRow(
      #         tags$h2("Motivos de Búsqueda y Consecución de Vacantes", style = "text-align: center; font-weight: bold; color: #4682B4;"),
      #         tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 10%;"),
      #         div(style = "height: 10px;"),
      #         column(10, offset = 1,
      #                plotOutput("motivosNovacante")
      #         )
      #       )
      #   )
      # ),
  fluidRow(
    div(style = "height: 30px;"),
    box(width=12,
        fluidRow(
          column(8, offset = 2,
                 tags$h1("Análisis de Competencias", style = "text-align: center; font-weight: bold; color: #4682B4;"),
                 tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
          )
        ),
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

# TAB INFO GENERAL --------------------------------------------------------

tab_infogeneral <- tabItem(
    tabName = "infogeneral",
    class = "tab_infogeneral",
    tags$style('.tab_infogeneral {
                             background-color: #ffffff;
              }'),
    
    div(style = "height: 20px;"),
    fluidRow(
      column(8, offset = 2,
             tags$h1("Catálogo de Datos",
                     style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
             ),
             tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
             tags$p("En esta sección podrá consultar las bases datos del
            Sistema de Gestión de datos del MNC Colombia.",
                    style = "text-align: center; font-size: 22px;"
             )
      )
    ),
    div(style = "height: 40px;"),
    
    fluidRow(
          column(2,
                 box(title = "Bases de datos",
                   width = 12,
                   solidHeader = TRUE,
                   status = "warning",
                   selectizeInput("select_main_base", "Seleccione Base",
                        choices = c(
                          "Areas de Cualificación",
                          "Ocupaciones CUOC",
                          "Educación CINE",
                          "Sectores CIIU",
                          "Caracterización Sector",
                          "Análisis Funcional",
                          "Estructura de la Cualificación",
                          "Brechas Capital Humano"
                        )
            ),
            
            conditionalPanel(
              condition = "input.select_main_base == 'Areas de Cualificación'",
              checkboxGroupInput("area_cualificacion", "Seleccione Atributos", 
                             choices = c(
                               "Codigo Área" = "Código_área",
                               "Nombre área cualificación" = "Nombreáreacualificación"
                             ),
                             selected = c(
                               "Código_área",
                               "Nombre área cualificación"
                             )
              )
            ),
            conditionalPanel(
              condition = "input.select_main_base == 'Ocupaciones CUOC'",
              checkboxGroupInput("denominacion_cuoc", "Seleccione Atributos", 
                             choices = c(
                               "Código Grandes Grupos" = "CódigoGrandesGrupos",
                               "Grandes Grupos" = "GrandesGrupos",
                               "Código Subgrupos principales" = "CódigoSubgruposprincipales",
                               "Subgrupos principales" = "Subgruposprincipales",
                               "Código subgrupos" = "Códigosubgrupos",
                               "Subgrupos" = "Subgrupos",
                               "Códigos Grupos primarios" = "CódigosGruposprimarios",
                               "Grupos primarios" = "Gruposprimarios",
                               "Código Ocupación" = "CódigoOcupación",
                               "Ocupación" = "Ocupación",
                               "Código denominaciones" = "Códigodenominaciones",
                               "Denominacion" = "Denominacion",
                               "Código CIUO 08 A.C." = "CódigoCIUO08AC",
                               "Código CNO" = "CódigoCNO",
                               "Nombre Ocupación Afín" = "NombreOcupaciónAfín",
                               "Nombre Destreza" = "NombreDestreza", 
                               "Nombre Conocimiento" = "NombreConocimiento",
                               "Nivel Competencia" = "NivelCompetencia",
                               "Descripción Ocupación" = "DescripciónOcupación",
                               "Consecutivo Función" = "ConsecutivoFunción",
                               "Redacción Función" = "RedacciónFunción"
                             ),
                             selected = c(
                               "Código_área",
                               "Nombre área cualificación"
                             )
              )
            ),
            conditionalPanel(
              condition = "input.select_main_base == 'Educación CINE'",
              checkboxGroupInput("cine", "Seleccione Atributos", 
                             choices = c(
                               "Código CINE-2011 AC" = "CódigoCINE2011AC",
                               "Campos Detallado" = "CamposDetallado"
                             )
              )
            ),
            conditionalPanel(
              condition = "input.select_main_base == 'Sectores CIIU'",
              checkboxGroupInput("ciiu", "Seleccione Atributos", 
                             choices = c(
                               "Sección" = "Sección",
                               "División" = "División",
                               "Grupo" = "Grupo",
                               "Código_ciiu" = "Código_ciiu",
                               "Descripción" = "Descripción"
                             )
              )
            ),
            conditionalPanel(
              condition = "input.select_main_base == 'Caracterización Sector'",
              checkboxGroupInput("caract_sector", "Variables Caracterización Sector", 
                             choices = c(
                               "Tasa de crecimiento" = "Tasacrecimiento",
                               "Valor agregado" = "Valoragregado",
                               "Ocupados CIIU" = "OcupadosCIIU",
                               "Ocupados Total" = "OcupadosTotal"
                             )
              ),
              # radioButtons(
              #   "select_sex_caract", "Sexo",
              #   choices = c("Masculino",
              #               "Femenino"
              #   ),
              #   inline = TRUE
              # ),
              # selectInput("select_dept_brechas", "Departamento",
              #             choices = c(
              #               "Amazonas", "Antioquia", "Arauca", "Atlántico", "Bogotá D.C.", "Bolívar", "Boyacá", 
              #               "Caldas", "Caquetá", "Casanare", "Cauca", "Cesar", "Chocó", "Córdoba", 
              #               "Cundinamarca", "Guainía", "Guaviare", "Huila", "La Guajira", "Magdalena", 
              #               "Meta", "Nariño", "Norte de Santander", "Putumayo", "Quindío", 
              #               "Risaralda", "San Andrés y Providencia", "Santander", "Sucre", "Tolima", 
              #               "Valle del Cauca", "Vaupés", "Vichada"
              #             ),
              #             multiple = FALSE,
              #             selected = "Bogotá D.C.",
              #             width = '120px'
              # ),
              # selectInput("select_year_caract", "Año",
              #             choices = 2015: 2024,
              #             multiple = FALSE,
              #             selected = 2023,
              #             width = '120px'
              # )
            ),
            conditionalPanel(
              condition = "input.select_main_base == 'Brechas Capital Humano'",
              checkboxGroupInput("brechas_hum", "Variables Brechas Capital Humano", 
                             choices = c(
                               "Brecha de Cantidad Atracción D" = "BQ__Atraccion_D",
                               "Brechas de Pertinencia Desarticulación D" = "BP__Desarticulacion_D",
                               "Brecha de Cantidad Déficit D" = "BQ__DeficitP_D",
                               "Brecha de Cantidad Atracción Ocu" = "BQ__Atraccion_ocu",
                               "Brechas de Pertinencia Desarticulación Ocu" = "BP__Desarticulacion_ocu",
                               "Brecha de Cantidad  Déficit Ocu" = "BQ__DeficitP_ocu",
                               "Denominación CDC" = "DenominacionCDC",
                               "Brecha de Calidad de Conocimientos D" = "BC__Conocimientos_D",
                               "Brecha de Calidad de Destreza D" = "BC__destreza_D",
                               "Brechas de Pertinencia de Conocimientos D" = "BP__Conocimientos_D",
                               "Brechas de Pertinencia de Destreza D" = "BP__destreza_D",
                               "Brecha de Cantidad de Programa D" = "BQ__Programa_D",
                               "Brecha de Cantidad de Atracción de Vacante D" = "BQ__Atraccion_vacanteD",
                               "Brechas de Pertinencia de Experiencia en Vacante D" = "BP__Experiencia_vacanteD",
                               "Brecha de Calidad de Competencia en Vacante D" = "BC__Competencia_vacanteD",
                               "Brecha de Cantidad de Atracciónde Vacante Ocu" = "BQ__Atraccion_vacante_ocu",
                               "Brechas de Pertinencia de Experiencia en Vacante Ocu" = "BP__Experiencia_vacante_ocu",
                               "Brecha de Calidad de Competencia en Vacante Ocu" = "BC__Competencia_vacante_ocu",
                               "Brecha de Calidad de Conocimientos Ocu" = "BC__Conocimientos_ocu" ,
                               "Brecha de Calidad de Destreza Ocu" = "BC__destreza_ocu",
                               "Brechas de Pertinencia Conocimientos Ocu" = "BP__Conocimientos_ocu",
                               "Brecha de Calidad de Destreza Ocu" = "BC__destreza_ocu",
                               "Brechas de Pertinencia De Conocimientos Ocu" = "BP__Conocimientos_ocu",
                               "Brechas de Pertinencia de Destreza Ocu" = "BP__destreza_ocu",
                               "Brecha de Cantidad de Programa Ocu" = "BQ__Programa_ocu",
                               "Brecha de Cantidad de Atracción Ocu" = "BQ__Atraccion_ocu",
                               "Brechas de Pertinencia de Desarticulación Ocu" = "BP__Desarticulacion_ocu" 
                             )
              )#,
              # radioButtons(
              #   "select_sex_caract", "Sexo",
              #   choices = c("Masculino",
              #               "Femenino"
              #   ),
              #   inline = TRUE
              # ),
              # selectInput("select_dept_brechas", "Departamento",
              #             choices = c(
              #               "Amazonas", "Antioquia", "Arauca", "Atlántico", "Bogotá D.C.", "Bolívar", "Boyacá", 
              #               "Caldas", "Caquetá", "Casanare", "Cauca", "Cesar", "Chocó", "Córdoba", 
              #               "Cundinamarca", "Guainía", "Guaviare", "Huila", "La Guajira", "Magdalena", 
              #               "Meta", "Nariño", "Norte de Santander", "Putumayo", "Quindío", 
              #               "Risaralda", "San Andrés y Providencia", "Santander", "Sucre", "Tolima", 
              #               "Valle del Cauca", "Vaupés", "Vichada"
              #             ),
              #             multiple = FALSE,
              #             selected = "Bogotá D.C.",
              #             width = '120px'
              # ),
              # selectInput("select_year_caract", "Año",
              #             choices = 2015: 2024,
              #             multiple = FALSE,
              #             selected = 2023,
              #             width = '120px'
              # )
            ),
            conditionalPanel(
              condition = "input.select_main_base == 'Análisis Funcional'",
              checkboxGroupInput("analisis_funcional", "Variables Análisis Funcional", 
                             choices = c(
                               "Código Ocupación",
                               "Perfiles",
                               "Funciones",
                               "Competencias"
                             )
              )
            ),
            conditionalPanel(
              condition = "input.select_main_base == 'Estructura de la Cualificación'",
              checkboxGroupInput("estructura_cualificacion", "Variables Estructura de la Cualificación", 
                             choices = c(
                               "Competencia general",
                               "Competencias específicas",
                               "Contexto competencia",
                               "Criterio desempeño",
                               "Competencias básicas",
                               "Competencias transversales",
                               "Resultado de aprendizaje",
                               "Criterios de evaluación",
                               "Competencias tecnico-profesionales",
                               "Competencias pedagóicas",
                               "Ambientes de formación",
                               "Requisitos de ingreso",
                               "Profesión regulada"
                             )
              )
            ),
            
          ),
          div(class = "fluidrow_clear",
              fluidRow(
                column(2, offset = 2,
                       actionButton("clear_bases", "Limpiar Filtros", icon = icon("eraser"),
                                    style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
                                    )
                       )
                )
              ), 
          div(
            style = "height: 200px;"
          ),
          box(title = "Descarga el Instructivo",
                width = 12,
              tags$p("Obtén información sobre..."),
              downloadButton("download_pdf", "Descarga PDF",
                             style="color: #333333; textbackground-color: #FFFFFF; border-color: #2e6da4"
                             )
              )
          )#,
          # column(10, 
          #        reactableOutput("main_databases")
          # )
          
    ),
    fluidRow(
      column(2, offset = 6,
              downloadButton("download_csv", "Descargar Tabla",
                             style="color: #fff; background-color: #008000; border-color: #2e6da4"
              )
      )
      
    )
)


# SURVEY TAB --------------------------------------------------------------


tab_survey <- tabItem(
    tabName = "survey",
    class = "tab_survey",
    tags$style('.tab_survey {
                             background-color: #ffffff;
              }'),
    
    div(style = "height: 20px;"),
    fluidRow(
      column(8, offset = 2,
             tags$h1("Encuesta de demanda laboral",
                     style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
             ),
             tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
             tags$p("En esta sección encontrará la encuesta de demanda laboral realizada a las empresas en el marco de las entrevistas semiestructuradas.",
                    style = "text-align: center; font-size: 22px;"
             )
      )
    ),
    div(style = "height: 20px;"),

    fluidRow(
      column(2,
             box(title = "Atributos de la Encuesta",
                 width = 12,
                 solidHeader = TRUE,
                 status = "warning",
                 selectizeInput("survey_variables", "Seleccione",
                                choices = c(
                                  "Información General",
                                  "Conocimientos",
                                  "Destrezas",
                                  "Programas",
                                  "Brechas",
                                  "Otros"
                                )
                 ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Información General'",
                   checkboxGroupInput("info_general", "Información General", 
                                      choices = c(
                                        "Actividad económica  principal de la empresa" = "Actividadeconómica",
                                        "Departamento" = "Departamento",
                                        "Tamaño empresa" = "tamanoEmpresa",
                                        "Código de Área" = "Código_área",
                                        "Nombre Área Cualificación" = "Nombreáreacualificación"
                                      )
                   )
                 ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Brechas'",
                   checkboxGroupInput("brechas", "Información General", 
                                      choices = c(
                                        "Brechas de Cantidad Atracción D" = "BQ__Atraccion_D",
                                        "Brechas de Pertinencia Desarticulación D" = "BP__Desarticulacion_D",
                                        "Brechas de Cantidad Deficit D" = "BQ__DeficitP_D",
                                        "Brechas de Cantidad Atracción Ocu" = "BQ__Atraccion_ocu",
                                        "Brechas de Pertinencia Desarticulación Ocu" = "BP__Desarticulacion_ocu",
                                        "Brechas de Cantidad Deficit Ocu" = "BQ__DeficitP_ocu",
                                        "Brechas de Calidad Conocimientos Ocu" = "BC__Conocimientos_D",
                                        "Brechas de Calidad Destreza D" = "BC__destreza_D",
                                        "Brechas de Pertinencia Conocimientos D" = "BP__Conocimientos_D",
                                        "Brechas de Pertinencia Destreza D" = "BP__destreza_D",
                                        "Brecha de Cantidad Programa D" = "BQ__Programa_D",
                                        "Brecha de Calidad Conocimientos Ocu" = "BC__Conocimientos_ocu",
                                        "Brecha de Calidad Destreza Ocu" = "BC__destreza_ocu",
                                        "Brecha de Calidad Conocimientos Ocu" = "BP__Conocimientos_ocu",
                                        "Brechas de Pertinencia Destreza Ocu" = "BP__destreza_ocu",
                                        "Brecha de Cantidad Programa Ocu" = "BQ__Programa_ocu",
                                        "Brecha de Cantidad Atracción Vacante D" = "BQ__Atraccion_vacanteD",
                                        "Brechas de Pertinencia experiencia Vacante D" = "BP__Experiencia_vacanteD",
                                        "Brecha de Calidad Competencia Vacante D" = "BC__Competencia_vacanteD",
                                        "Brecha de Cantidad Atracción Vacante Ocu" = "BQ__Atraccion_vacante_ocu",
                                        "Brechas de Pertinencia experiencia Vacante Ocu" = "BP__Experiencia_vacante_ocu",
                                        "Brecha de Calidad Competencia Vacante Ocu" = "BC__Competencia_vacante_ocu"
                                      )
                   )
                 ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Conocimientos'",
                   checkboxGroupInput("conocimientos", "Conocimientos", 
                                      choices = c(
                                        "Conocimiento 1" = "Conocimiento1",
                                        "Conocimiento 2" = "Conocimiento2",
                                        "Conocimiento 3" = "Conocimiento3",
                                        "Conocimiento 4" = "Conocimiento4",
                                        "Conocimiento 5" = "Conocimiento5"
                                      )
                   )
                 ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Destrezas'",
                   checkboxGroupInput("destrezas", "Destrezas", 
                                      choices = c(
                                        "Destreza 1" = "Destreza1",
                                        "Destreza 2" = "Destreza2",
                                        "Destreza 3" = "Destreza3",
                                        "Destreza 4" = "Destreza4",
                                        "Destreza 5" = "Destreza5"
                                        )
                   )
                 ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Otros'",
                   checkboxGroupInput("otros", "Otros", 
                                      choices = c(
                                        "Razones por las" = "Cuálessonlasrazonesporlas",
                                        "Nivel educativo requerido" = "Cuáleselniveleducativorequ",
                                        "Experiencia Mínima" = "CuáleslaExperienciamínimap",
                                        "Rango Salarial" = "CuáleslaExperienciamínimap",
                                        "Tipo de Contrato" = "Tipodecontrato",
                                        "Modalidad del cargo" = "Lamodalidaddelcargoes",
                                        "Rotación del cargo" = "Quétantarotacióntieneelcar",
                                        "Tiempo" = "Porfavorindiquecuántotiempo",
                                        "Cargo Difícil" = "Cargo_Dificil",
                                        "Código Ocupación CDC" = "CódigoOcupaciónCDC",
                                        "Ocupación CDC" = "OcupaciónCDC",
                                        "Área de Desempeño" = "Cuálessuáreadedesempeño",
                                        "Otra área de Desempeño" = "otherareadesempeno",
                                        "Actividad Económica" = "Actividadeconómica",
                                        "Otras Actividades Económicas" = "otheractivideconomicas",
                                        "Cargos de difícil Consecución" = "CargosDificilC",
                                        "Diseño de Programas" = "disenoprogramas",
                                        "Acción Vacante" = "accionvacante",
                                        "Medios de búsqueda" = "mediosbusqueda",
                                        "Motivos No Vacante" = "motivosNovacante",
                                        "Tiene Habilidades Emocionales" = "tienehabSocioemocionales",
                                        "Habilidades Socioemocionales" = "habSocioemocionales"
                                        )
                                      )
                   ),
                 conditionalPanel(
                   condition = "input.survey_variables == 'Programas'",
                   checkboxGroupInput("programas", "Programas", 
                                      choices = c(
                                        "Programas son" = "ProgramasSon",
                                        "Programa 1" = "Programa1",
                                        "Programa 2" = "Programa2",
                                        "Programa 3" = "Programa3"
                                      )
                   )
                 )
                 ),
             div(class = "fluidrow_clear",
                 fluidRow(
                   column(2, offset = 2,
                          actionButton("clear_survey", "Limpiar Filtros", icon = icon("eraser"),
                                       style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
                                       )
                          )
                   )
                 )
             ),
      column(
        10, 
        reactableOutput("survey_table")
        )
      ),
    fluidRow(
      column(2, offset = 6,
             downloadButton("download_survey", "Descargar Tabla",
                            style="color: #fff; background-color: #008000; border-color: #2e6da4"
                            )
             )
      )
    )


