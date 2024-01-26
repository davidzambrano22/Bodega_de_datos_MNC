tab_home <- tabItem(
    tabName = "home",
   
    fluidRow(
      column(width = 6,  img(src = "https://upload.wikimedia.org/wikipedia/commons/3/30/LOGO_PLAN_DE_DESARROLLO_COLOMBIA_POTENCIA_DE_LA_VIDA_2022-2026.png", width = 225, height = 100)),
      column(width = 6,  align = "right", img(src = "https://www.mineducacion.gov.co/1780/channels-977_logo.png", width = 280, height = 100))
    ),
    div(style = "height: 20px;"),
    
    fluidRow(
             box(
               title = "Sistema de Gestión de Datos para el Marco Nacional de Cualificaciones",
               solidHeader = TRUE,
               collapsible = TRUE,
               status = "primary",
               width = 12,
               "Es una herramienta diseñada para almacenar y gestionar la información relacionada con las cualificaciones. 
               Permite la visualización y almacenamiento de datos provenientes de las distintas fases del proceso, incluyendo la caracterización,
               análisis de brechas de capital humano, análisis funcional y las cualificaciones. Garantiza la carga estructurada de los datos,
               su seguridad e integridad, al mismo tiempo que permite al usuario  realizar búsquedas filtradas que le brinden información
               específica de manera eficiente.  
               ",
               style = "font-size: 18px;"  # Adjust the font size as needed
             )
    ),
    div(style = "height: 20px;"),
    
    fluidRow(
      box(
        title = "¿Qué debemos saber sobre el MNC?",
        solidHeader = TRUE,
        collapsible = TRUE,
        status = "primary",
        width = 12,
        HTML("<p style='font-size: 18px;'>
           <span style='color: black; font-size: 20px;'> MNC: </span>
           Es un componente del Sistema Nacional de Cualificaciones (SNC) y se define como el instrumento que permite estructurar y clasificar las Cualificaciones en un esquema de ocho (8) niveles ordenados y expresados en términos de Conocimientos, Destrezas y Actitudes, aplicables en contextos de estudio, trabajo o en ambos, de acuerdo con la secuencialidad y complejidad de los aprendizajes que logran las personas en las diferentes Vías de Cualificación.
           </p>
           
           <p style='font-size: 18px;'>
           <span style='color: black; font-size: 20px;'> Nivel de Cualificación: </span>
           Establece el grado de complejidad, amplitud y profundidad de los Resultados de Aprendizaje, ordenados secuencialmente en términos de Conocimientos, Destrezas y Actitudes, lo que permite clasificar las Cualificaciones en el Marco Nacional de Cualificaciones (MNC).
           </p>
           
           <p style='font-size: 18px;'>
           <span style='color: black; font-size: 20px;'> Cualificación: </span>
           Es el reconocimiento formal que se otorga a una persona por parte de una institución autorizada después de un proceso de evaluación que evidencia el logro de los Resultados de Aprendizaje definidos en la Estructura de la Cualificación y vinculados a un nivel del Marco Nacional de Cualificaciones (MNC). Las Cualificaciones se reconocen mediante los títulos o certificados que se obtienen a través de las diferentes Vías de Cualificación de acuerdo con las normas y lineamientos del Sistema Nacional de Cualificaciones.
           </p>
           
           <p style='font-size: 18px;'>
           <span style='color: black; font-size: 20px;'> Estructura de cualificación: </span>
           Es un documento técnico que hace parte de los Catálogos Sectoriales de Cualificaciones y contiene las Competencias y Resultados de Aprendizaje que debe alcanzar una persona para el reconocimiento de la Cualificación asociada a un nivel del Marco Nacional de Cualificaciones (MNC). La Estructura de Cualificación sirve como referente para el diseño curricular y el reconocimiento de los Aprendizajes Previos.
           </p>
           "
        )
      )
    ),
    div(style = "height: 20px;"),
    
    fluidRow(
      column(width = 12,
             box(
               title = "Ruta metodológica para el diseño de las cualificaciones",
               align="center",
               status = "primary",
               solidHeader = TRUE,
               collapsible = F,
               width = 12,
               column(6, offset = 1,
                      imageOutput("img_fases", width = 1350, height = 370)),
               box(
                 title = tags$b("Fases de la metodología"),
                 collapsible = TRUE,
                 width = 12,
                 column(6, offset = 1,
                        imageOutput("img_fases_descripcion", width = 1350, height = 260)),
                 style = "font-size: 18px;"
             )
             )
    )),
    div(style = "height: 20px;"),

    
    fluidRow(
      column(width = 9,  img(src = "images/logo_3.png", width = 225, height = 90)),
      column(width = 1,  align = "right", img(src = "images/logo_4.png", width = 60, height = 100)),
      column(width = 2,  align = "right", img(src = "images/logo_5.png", width = 230, height = 100))
    )
)


# TAB CATÁLOGO ------------------------------------------------------------

tab_catalogo <- tabItem(
    tabName = "catalogo",
    fluidRow(
        box(
            title = "Catálogo de las Áreas de Cualificación del MNC",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = 12,
            "En esta sección podrá consultar información asociada a los catálogos sectoriales de las cualificaciones. 
            La información presentada corresponde a datos de cada una de las etapas metodológicas del MNC.
            ",
            style = "font-size: 18px;"
        )
    ),
    div(style = "height: 40px;"),
    
    fluidRow(
      column(1, 
             actionButton("artes_button",
                          img(id = "alimentos_button",
                              src = "images/artes.png")
             )
      ),
      column(4, offset = 1,
      h3("Artes visuales, Plásticas, y del Patrimonio Cultural (AVPP)")
    ),
      column(1,
        actionButton("conservacion_button",
                     img(id = "conservacion_button",
                         src = "images/ambiental.png")
        )
    ),
    column(4, offset = 1,
           h3("Conservación, Protección y Saneamiento Ambiental (CPSA)")
    )
    ),
    div(style = "height: 20px;"),
    
    
    fluidRow(
      column(1, 
             actionButton("fisicas_button",
                          img(id = "alimentos_button",
                              src = "images/fisicas.png")
             )
      ),
      column(4, offset = 1,
             h3("Actividades físicas, Deportivas y Recreativas (AFIR)")
      ),
      column(1, 
             actionButton("alimentos_button",
                          img(id = "alimentos_button",
                              src = "images/alimentos.png")
             )
      ),
      column(3, offset = 1,
             h3("Elaboración y Transformación de Alimentos (ETAL)")
      )),
    div(style = "height: 40px;"),
    
    fluidRow(
      column(1, 
             actionButton("agropecuarias_button",
                          img(id = "alimentos_button",
                              src = "images/agropecuarias.png")
             )
      ),
      column(4, offset = 1,
             h3("Agropecuario, Silvicultura, Pesca, Acuicultura y Veterinaria (AGVE)")
      )),
    div(style = "height: 100px;"),
    
    fluidRow(
      box(
        title = "Panel interactivo",
        status = "primary",
        solidHeader = TRUE,
        collapsible = TRUE,
        width = 12,
        HTML("<p> El <a href='https://app.powerbi.com/view?r=eyJrIjoiNjFmNzI1ZjItMWM5Yy00MGMzLWIzODItOGNlNmUwNTM5NzIzIiwidCI6ImIzZTVkYjVlLTI5NDQtNDgzNy05OWY1LTc0ODhhY2U1NDMxOSIsImMiOjh9' target='_blank'> panel interactivo </a> posibilita la exploración dinámica de información acerca de las distintas fases del MNC para cada área
        de cualificación trabajada.</p>"),
        style = "font-size: 18px;",
        
        div(style = "height: 10px;"),
        fluidRow(
          column(1, offset = 5,
            actionButton("link_to_powerBI_report", 
                         HTML("<span style='color: grey; font-size: 18px;'> <a href= 'https://app.powerbi.com/view?r=eyJrIjoiNjFmNzI1ZjItMWM5Yy00MGMzLWIzODItOGNlNmUwNTM5NzIzIiwidCI6ImIzZTVkYjVlLTI5NDQtNDgzNy05OWY1LTc0ODhhY2U1NDMxOSIsImMiOjh9' target='_blank'> Panel Interactivo</a> </span>"))
            )
        ),
        div(style = "height: 10px;"),
      )
    )
)

tab_consulta <- tabItem(
    tabName = "consulta",
    fluidRow(
        box(
            title = "Consulta de datos",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = 12,
            "En esta sección podrá consultar los datos de la 
            Sistema de Gestión de datos del MNC Colombia."
        )
    ),
    fluidRow(
        column(12,
            h3("Selección de Áreas de cualificación"),
            # Reactable with the catalog table
            reactableOutput("areas_catalog"),
            br(),
            verbatimTextOutput("selected_row_details")
        )
    ),
    fluidRow(
        column(12,
            h3("Actividades económicas CIIU relacionadas"),
        )
    ),
    fluidRow(
        column(6,
            # Reactable with the ciiu table
            reactableOutput("tabla_ciiu")
        ),
        column(6,
            plotOutput("actividades_areas_plot")
        )
    ),
    fluidRow(
        column(12,
            h3("Ocupaciones CUOC relacionadas"),
        )
    ),
    fluidRow(
        column(6,
            # Reactable with the cuoc table
            reactableOutput("tabla_cuoc")
        ),
        column(6,
            plotOutput("ocupaciones_areas_plot")
        )
    ),
    fluidRow(
        column(12,
            h3("Información CINE relacionada"),
        )
    ),
    fluidRow(
        column(6,
            # Reactable with the cine table
            reactableOutput("tabla_cine")
        ),
        column(6,
            plotOutput("cine_areas_plot")
        )
    )
)

tab_infogeneral <- tabItem(
    tabName = "infogeneral",
    fluidRow(
        box(
            title = "Bases de datos de áreas",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = 12,
            "En esta sección podrá consultar las bases de datos de 
            áreas del Sistema de Gestión de datos del MNC Colombia."
        )
    ),
    fluidRow(
      box(width = 12,
      column(2, offset = 2,
             h4("Áreas de Cualificación"),
             selectizeInput("area_cualificacion", "Seleccione", 
                            choices = c(
                                        "Codigo Área" = "Codigo Área",
                                        "Nombre Cualificación" = "Nombre Cualificación"
                                        ),
                            multiple = TRUE,
                            options = list(plugins = list('remove_button'), persist = FALSE)
             ),
             actionButton("clear_area", "Limpiar Filtros")
      ),
      
      column(2,
             h4("Denominación CUOC"),
             selectizeInput("denominacion_cuoc", "Seleccione", 
                            choices = c("Código de Área" = "Código_área",
                                        "Nombre área cualificación" = "Nombre área cualificación",
                                        "Código Grandes Grupos" = "Código Grandes Grupos",
                                        "Grandes Grupos" = "Grandes Grupos",
                                        "Código Subgrupos principales" = "Código Subgrupos principales",
                                        "Subgrupos principales" = "Subgrupos principales",
                                        "Código subgrupos" = "Código subgrupos",
                                        "Subgrupos" = "Subgrupos",
                                        "Códigos Grupos primarios" = "Códigos Grupos primarios",
                                        "Grupos primarios" = "Grupos primarios",
                                        "Código Ocupación" = "Código Ocupación",
                                        "Ocupación" = "Ocupación",
                                        "Código denominaciones" = "Código denominaciones",
                                        "Denominacion" = "Denominacion"
                            ),
                            multiple = TRUE,
                            options = list(plugins = list('remove_button'), persist = FALSE)
             ),
             actionButton("clear_CUOC", "Limpiar Filtros")
      ),
      column(2,
             h4("CINE"),
             selectizeInput("cine", "Seleccione", 
                            choices = c(
                                        "Código_área",
                                        "Nombre área cualificación",
                                        "Código CINE-2011 AC",
                                        "Campos Detallado"
                            ),
                            multiple = TRUE,
                            options = list(plugins = list('remove_button'), persist = FALSE)
                            ),
             actionButton("clear_CINE", "Limpiar Filtros")
      ),
      column(2,
             h4("CIIU"),
             selectizeInput("ciiu", "Seleccione", 
                            choices = c(
                                        "Sección",
                                        "División",
                                        "Grupo",
                                        "Código_ciiu",
                                        "Descripción",
                                        "Código_área",
                                        "Nombre área cualificación"
                                        ),
                            multiple = TRUE,
                            options = list(plugins = list('remove_button'), persist = FALSE)
                            ),
             actionButton("clear_CIIU", "Limpiar Filtros")
             )
    ),
    
    box(
        width = 12,
        column(2, offset = 2,
               h4("Caracterización Sector"),
               selectizeInput("caract_sector", "Seleccione", 
                              choices = c("Código CiiU",
                                          "Código Área",
                                          "Entorno Socioeconómico",
                                          "Entorno Tecnológico",
                                          "Entorno Organizacional",
                                          "Entorno Ambiental",
                                          "Entorno Normativo",
                                          "Proyección Internacional"),
                              multiple = TRUE,
                              options = list(plugins = list('remove_button'), persist = FALSE)
               ),
               actionButton("clear_caracterizacion", "Limpiar Filtros")
        ),
        
        column(2,
               h4("Brechas Capital Humano"),
               selectizeInput("brechas_hum", "Seleccione", 
                              choices = c("Código Ocupación",
                                          "Oferta Educativa",
                                          "Demanda Laboral",
                                          "Prospectiva"),
                              multiple = TRUE,
                              options = list(plugins = list('remove_button'), persist = FALSE)
               ),
               actionButton("clear_brechas", "Limpiar Filtros")
        ),
        column(2,
               h4("Análisis Funcional"),
               selectizeInput("analisis_funcional", "Seleccione", 
                              choices = c("Código Ocupación",
                                          "Perfiles",
                                          "Funciones",
                                          "Competencias"
                              ),
                              multiple = TRUE,
                              options = list(plugins = list('remove_button'), persist = FALSE)
               ),
               actionButton("clear_analisis", "Limpiar Filtros")
        ),
        column(2,
               h4("Estructura de la Cualificación"),
               selectizeInput("estructura_cualificacion", "Seleccione", 
                              choices = c("Competencia general",
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
                                          "Profesión regulada"),
                              multiple = TRUE,
                              options = list(plugins = list('remove_button'), persist = FALSE)
               ),
               actionButton("clear_estructura", "Limpiar Filtros")
        )
    ),
    column(2, offset = 5,
           actionButton("download_button", "Descargar Tabla")
    )
    )
)



tab_survey <- tabItem(
    tabName = "survey",
    fluidRow(
        box(
            title = "Encuesta",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = 12,
            "En esta sección podrá ver los resultados de la Encuesta
            de Demanda Laboral."
        )
    ),
    fluidRow(
        column(3,
            h3("Variables a mostrar"),
            selectInput(
              "survey_sections", "Secciones",
              c(
                "Información general",
                "Otros cargos",
                "Estrategias desarrolladas por la empresa para el cierre de brechas",
                "Habilidades Socioemocionales"
              )
            ),
            conditionalPanel(
              condition="input.survey_sections == 'Información general'",
              checkboxGroupInput(
                "survey_variables_1", "Variables",
                choices = c(
                  "Actividad económica  principal de la empresa" = "Actividad económica  principal de la empresa",
                  "Departamento" = "Departamento",
                  "Tamaño empresa" = "Para determinar el tamaño de la empresa, ¿cuántas personas trabajan actualmente en la empresa?"
                ))
            ),
            conditionalPanel(
              condition="input.survey_sections == 'Otros cargos'",
              checkboxGroupInput(
                "survey_variables_2", "Variables",
                choices = c(
                  "¿Cuáles cargos misionales?" = "¿Cuáles cargos misionales?",
                  "Cargo misional 1" = "Cargo misional 1:",
                  "Cargo misional 2" = "Cargo misional 2:",
                  "Cargo misional 3" = "Cargo misional 3:",
                  "Cargo misional 4" = "Cargo misional 4:",
                  "Cargo misional 5" = "Cargo misional 5:",
                  "Cargo misional 6" = "Cargo misional 6:",
                  "Cargo misional 7" = "Cargo misional 7:",
                  "Cargo misional 8" = "Cargo misional 8:",
                  "Cargo misional 9" = "Cargo misional 9:",
                  "Cargo misional 10" = "Cargo misional 10:"
                  ))
            ),
            conditionalPanel(
              condition="input.survey_sections == 'Estrategias desarrolladas por la empresa para el cierre de brechas'",
              checkboxGroupInput(
                "survey_variables_3", "Variables",
                choices = c(
                  "¿Se involucra usted en el proceso, diseño y/o actualización de los programas de formación necesarios para su actividad productiva?" = "¿Se involucra usted en el proceso, diseño y/o actualización de los programas de formación necesarios para su actividad productiva?",
                  "En caso de no conseguir o atraer el personal idóneo para sus cargos vacantes, ¿Qué acción toma?" = "En caso de no conseguir o atraer el personal idóneo para sus cargos vacantes, ¿Qué acción toma?",
                  "Por favor mencione máximo 5 medios que usted ha utilizado para la búsqueda de personal en su organización:" = "Por favor mencione máximo 5 medios que usted ha utilizado para la búsqueda de personal en su organización:",
                  "¿Cuáles fueron los motivos por los cuales no logro cubrir todas las vacantes? (máximo 5)" = "¿Cuáles fueron los motivos por los cuales no logro cubrir todas las vacantes? (máximo 5)"
                ))
            ),
            conditionalPanel(
              condition="input.survey_sections == 'Habilidades Socioemocionales'",
              checkboxGroupInput(
                "survey_variables_4", "Variables",
                choices = c(
                  "¿La misión, visión o alcance social de su empresa define algún tipo de habilidad socioemocional?" = "1. ¿La misión, visión o alcance social de su empresa define algún tipo de habilidad socioemocional?",
                  "¿Cuáles son las habilidades socioemocionales que identifica su empresa como necesarias para el cumplimiento de su rol social?" = "2. ¿Cuáles son las habilidades socioemocionales que identifica su empresa como necesarias para el cumplimiento de su rol social?",
                  "¿Qué otra habilidad socioemocional usted reconoce como importante en su empresa?" = "3. ¿Qué otra habilidad socioemocional usted reconoce como importante en su empresa?",
                  "De acuerdo al cargo (operativo-directivo) ¿existen diferencias entre las habilidades socioemocionales requeridas para ejercer sus funciones?" = "4. De acuerdo al cargo (operativo-directivo) ¿existen diferencias entre las habilidades socioemocionales requeridas para ejercer sus funciones?",
                  "¿Cuáles?" = "¿Cuáles?...95",
                  "¿Existen diferencias en habilidades socioemocionales requeridas por una persona con mayor o menor experiencia laboral?" = "5. ¿Existen diferencias en habilidades socioemocionales requeridas por una persona con mayor o menor experiencia laboral?",
                  "¿Cuáles?" = "¿Cuáles?...97",
                  "En sus planes o programas de formación internos existen espacios para el desarrollo de habilidades socioemocionales?" = "6.  En sus planes o programas de formación internos existen espacios para el desarrollo de habilidades socioemocionales?",
                  "¿Cuáles?" = "¿Cuáles?...99"
                  ))
            )
        ),
        column(9,
               reactableOutput("survey_table")
        )
        )
    )


