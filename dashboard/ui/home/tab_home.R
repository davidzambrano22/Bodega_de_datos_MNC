

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
                                    "Bases de Datos Etapas MNC"),
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
           box(width = 12, align = "justify",
               title = span(tagList(icon("pencil"),
                                    "Estadísticas Áreas MNC"),
                            style = "font-size: 22px;"
               ),
               status = "primary",
               solidHeader = TRUE,
               tags$p(
                 "En esta sección podrá encontrar una serie de estadísticas descriptivas a nivel de las áreas de cualificación, que aportan información esencial para los análisis de cada componente del Marco Nacional de Cualificaciones (MNC).",
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
           fluidRow(
             column(4, offset = 2, 
                    actionButton(
                      "guia_metodol",
                      HTML("<i class='hand-pointer' style = 'color:#D55E00;'></i> <a href='MNC_PPX.pdf' target='_blank'>
                          <p style='font-size: 22px; text-align: left; color: #4682B4;'>
                            Guía Metodológica y Contextual del Marco Nacional de Cualificaciones
                          </p>
                       </a>"
                      ),
                      style = "tex-align: center;"
                    )
             )
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