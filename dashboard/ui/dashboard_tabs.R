
# TABS --------------------------------------------------------------------
tab_home <- tabItem(
    tabName = "home",
   
    fluidRow(
      column(width = 3,  offset = 1,
             img(src = "https://upload.wikimedia.org/wikipedia/commons/3/30/LOGO_PLAN_DE_DESARROLLO_COLOMBIA_POTENCIA_DE_LA_VIDA_2022-2026.png",
                             width = "90%", style = "max-width: 100%; height: auto;")
             ),
      column(width = 3, offset = 4,
             img(src = "https://www.mineducacion.gov.co/1780/channels-977_logo.png", 
                width = "90%", style = "max-width: 100%; height: auto;")
             )
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
           <span style='color: black; font-size: 18px;'> <b>MNC:</b> </span>
           Es un componente del Sistema Nacional de Cualificaciones (SNC) y se define como el instrumento que permite estructurar y clasificar las Cualificaciones en un esquema de ocho (8) niveles ordenados y expresados en términos de Conocimientos, Destrezas y Actitudes, aplicables en contextos de estudio, trabajo o en ambos, de acuerdo con la secuencialidad y complejidad de los aprendizajes que logran las personas en las diferentes Vías de Cualificación.
           </p>
           
           <p style='font-size: 18px;'>
           <span style='color: black; font-size: 18px;'> <b>Nivel de Cualificación:</b> </span>
           Establece el grado de complejidad, amplitud y profundidad de los Resultados de Aprendizaje, ordenados secuencialmente en términos de Conocimientos, Destrezas y Actitudes, lo que permite clasificar las Cualificaciones en el Marco Nacional de Cualificaciones (MNC).
           </p>
           
           <p style='font-size: 18px;'>
           <span style='color: black; font-size: 18px;'> <b>Cualificación:</b> </span>
           Es el reconocimiento formal que se otorga a una persona por parte de una institución autorizada después de un proceso de evaluación que evidencia el logro de los Resultados de Aprendizaje definidos en la Estructura de la Cualificación y vinculados a un nivel del Marco Nacional de Cualificaciones (MNC). Las Cualificaciones se reconocen mediante los títulos o certificados que se obtienen a través de las diferentes Vías de Cualificación de acuerdo con las normas y lineamientos del Sistema Nacional de Cualificaciones.
           </p>
           
           <p style='font-size: 18px;'>
           <span style='color: black; font-size: 18px;'> <b>Estructura de cualificación:</b> </span>
           Es un documento técnico que hace parte de los Catálogos Sectoriales de Cualificaciones y contiene las Competencias y Resultados de Aprendizaje que debe alcanzar una persona para el reconocimiento de la Cualificación asociada a un nivel del Marco Nacional de Cualificaciones (MNC). La Estructura de Cualificación sirve como referente para el diseño curricular y el reconocimiento de los Aprendizajes Previos.
           </p>
           "
        ), 
              HTML("<p style='font-size: 18px; align: center;'>
                      Para conocer más sobre el MNC, haga click en el siguiente botón:
                    </p>"
                   ),
              column(2, offset = 5,
                        actionButton("more_info",
                                     HTML("<div style = 'font-size: 18px; color: #007bff;'>
                                          Más información <i class='fas fa-mouse-pointer fa-1x' style = 'color: grey;'></i>
                                          "
                                          ),
                                     onclick = "window.open('https://especiales.colombiaaprende.edu.co/mnc/catalogo.html', target = '_blank')"
                                     )
                    )
              
      )
    ),
    div(style = "height: 20px;"),
    
    fluidRow(
             box(
               title = "Ruta metodológica para el diseño de las cualificaciones",
               align="center",
               status = "primary",
               solidHeader = TRUE,
               collapsible = TRUE,
               width = 12,
               column(12,
                      img(src = "images/ruta_diagrama_1.png", width = "100%", style = "max-width: 100%; height: auto;")
                      ),
                       fluidRow(
                       column(3, 
                              img(src = "images/yellow.png"),
                              HTML("<p style='font-size: 18px; text-align: left;'>
                                    <b>F1:</b> Delimitación del (los) sector(es) objeto de estudio
                                    asociado(s) al área de cualificación.
                                    </p>
                                    <p style='font-size: 18px; text-align: left;'>
                                    <b>F2:</b> Identificación de características del sector asociado
                                    de cualificación.
                                    </p>"
                                   )
                              ),
                       column(3, 
                              img(src = "images/red.png"),
                              HTML("<p style='font-size: 18px; text-align: left;'>
                                    <b>F3:</b> Identificación de brechas de capital humano.
                                   </p>
                                   <ul>
                                    <li> <p style='font-size: 18px; text-align: left;'> Análisis de prospectiva laboral</li></p>
                                    <li> <p style='font-size: 18px; text-align: left;'> Análisis de demanda laboral</li></p>
                                    <li> <p style='font-size: 18px;text-align: left;'> Análisis de oferta educativa</li></p>
                                    <li> <p style='font-size: 18px;text-align: left;'> Análisis de brechas de capital Humano</li></p>
                                   </ul>")
                              ),
                       column(3,
                              img(src = "images/green.png"),
                              HTML("
                                    <p style='font-size: 18px; text-align: left;'>
                                    <b>F4:</b> Análisis ocupacional
                                    </p>
                                    <ul>
                                    <li> <p style='font-size: 18px; text-align: left;'> Elaboración de la Matriz de Análisis Ocupacional y Organizacional</li></p>
                                    </ul>
                                    <p style='font-size: 18px; text-align: left;'>
                                    <b>F2:</b> Análisis funcional
                                    </p>
                                   ")
                       ),
                       column(3,
                              img(src = "images/blue.png"),
                              HTML("<p>
                                   <p style='font-size: 18px; text-align: left;'>
                                    <b>F6:</b> Identificación y perfil de competencias.
                                    </p>
                                    <p style='font-size: 18px; text-align: left;'>
                                    <b>F2:</b> Verificación de la Identificación y perfil de competencias.
                                    </p>
                                    <p style='font-size: 18px; text-align: left;'>
                                    <b>F2:</b> Referentes para la educación y formación y Paŕametros de calidad.
                                    </p>
                                    <p style='font-size: 18px;text-align: left;'>
                                    <b>F2:</b> Verificación de Referentes y parámetros de calidad.
                                    </p>
                                    <p style='font-size: 18px;text-align: left;'>
                                    <b>F2:</b> Incorporación de las cualificaciones en el <b>CNC</b>.
                                    </p>
                                   ")
                       )
                   )
             )
             ),
    div(style = "height: 20px;"),

    
    fluidRow(
      column(width = 3,  img(src = "images/logos/logo_MNC.png", #class = "img-responsive",
                             width = "85%", style = "max-width: 100%; height: auto;")),
      column(width = 1, offset = 5, align = "right", img(src = "images/logos/logo_PNUD.png", #class = "img-responsive",
                                                         width = "70%", style = "max-width: 200px; height: auto;")),
      column(width = 3,  align = "right", img(src = "images/logos/logo_corona.png", #class = "img-responsive",
                                              width = "85%", style = "max-width: 100%; height: auto;"))
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
      column(6, 
             actionButton("artes_button",
                          img(id = "alimentos_button",
                              src = "images/artes.png")
             ),
             h3("Artes visuales, Plásticas, y del Patrimonio Cultural (AVPP)")
      ),
      column(6,
        actionButton("conservacion_button",
                     img(id = "conservacion_button",
                         src = "images/ambiental.png")
        ),
        h3("Conservación, Protección y Saneamiento Ambiental (CPSA)")
        )
    ),
    div(style = "height: 20px;"),
    
    
    fluidRow(
      column(6, 
             actionButton("fisicas_button",
                          img(id = "alimentos_button",
                              src = "images/fisicas.png")
             ),
             h3("Actividades físicas, Deportivas y Recreativas (AFIR)")
      ),
      column(6, 
             actionButton("alimentos_button",
                          img(id = "alimentos_button",
                              src = "images/alimentos.png")
             ),
             h3("Elaboración y Transformación de Alimentos (ETAL)")
             )
      ),
    div(style = "height: 20px;"),
    
    fluidRow(
      column(6, 
             actionButton("agropecuarias_button",
                          img(id = "alimentos_button",
                              src = "images/agropecuarias.png")
             ),
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
            title = "Descriptivas por área del MNC",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = 12,
            "En esta sección podrá consultar los datos de la 
            Sistema de Gestión de datos del MNC Colombia.",
            style = "font-size: 18px;"
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
            title = "Catálogo de datos",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = 12,
            "En esta sección podrá consultar las bases de datos de 
            áreas del Sistema de Gestión de datos del MNC Colombia.",
            style = "font-size: 18px;"
        )
    ),
    fluidRow(
      box(width = 12,
      column(2, offset = 2,
             h4("Áreas de Cualificación"),
             selectizeInput("area_cualificacion", "Seleccione", 
                            choices = c(
                                        "Codigo Área" = "Código_área",
                                        "Nombre área cualificación" = "Nombre área cualificación"
                                        ),
                            multiple = TRUE,
                            options = list(plugins = list('remove_button'), persist = FALSE)
             ),
             actionButton("clear_area", "Limpiar Filtros")
      ),
      
      column(2,
             h4("Denominación CUOC"),
             selectizeInput("denominacion_cuoc", "Seleccione", 
                            choices = c(
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
                                        "Denominacion" = "Denominacion",
                                        "Código CIUO 08 A.C." = "Código \nCIUO 08 A.C.",
                                        "Código CNO" = "Código \nCNO",
                                        "Nombre Ocupación Afín" = "Nombre Ocupación Afín",
                                        "Nombre Destreza" = "Nombre Destreza", 
                                        "Nombre Conocimiento" = "Nombre Conocimiento",
                                        "Nivel Competencia" = "Nivel Competencia",
                                        "Descripción Ocupación" = "Descripción Ocupación",
                                        "Consecutivo Función" = "Consecutivo Función",
                                        "Redacción Función" = "Redacción Función"
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
                                        "Código CINE-2011 AC" = "Código CINE-2011 AC",
                                        "Campos Detallado" = "Campos Detallado"
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
                                        "Sección" = "Sección",
                                        "División" = "División",
                                        "Grupo" = "Grupo",
                                        "Código_ciiu" = "Código_ciiu",
                                        "Descripción" = "Descripción"
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
                              choices = c(
                                "Tasadecre2022" = "Tasa crecimiento 2022",
                                "Valoragregado2022" = "Valor agregado 2022",
                                "OcuCIIU2022" = "Ocupados CIIU 2022",
                                "OcuTotal2022" = "Ocupados Total 2022"
                              ),
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
           downloadButton("download_csv", "Descargar Tabla")
    ),
    column(12,
           reactableOutput("main_databases")
    )
    )
)



tab_survey <- tabItem(
    tabName = "survey",
    fluidRow(
        box(
            title = "Encuesta de demanda laboral",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = 12,
            "En esta sección encontrará la encuesta de demanda laboral realizada a las empresas en el marco de las entrevistas semiestructuradas.",
            style = "font-size: 18px;"
        )
    ),
    fluidRow(
      box(width = 12,
          column(2, offset = 2,
                 h4("Información General"),
                 selectizeInput("survey_variables_1", "Seleccione", 
                                choices =  c(
                                  "Actividad económica  principal de la empresa" = "Actividad económica  principal de la empresa",
                                  "Departamento" = "Departamento",
                                  "Tamaño empresa" = "Para determinar el tamaño de la empresa, ¿cuántas personas trabajan actualmente en la empresa?"
                                ),
                                multiple = TRUE,
                                options = list(plugins = list('remove_button'), persist = FALSE)
                 ),
                 actionButton("clear_infoGeneral", "Limpiar Filtros")
          ),
          
          column(2,
                 h4("Otros Cargos"),
                 selectizeInput("survey_variables_2", "Seleccione", 
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
                                ),
                                multiple = TRUE,
                                options = list(plugins = list('remove_button'), persist = FALSE)
                 ),
                 actionButton("clear_otrosCargos", "Limpiar Filtros")
          ),
          column(2,
                 h4("Estrategias desarrolladas para el cierre de brechas"),
                 selectizeInput("survey_variables_3", "Seleccione", 
                                choices = c(
                                  "¿Se involucra usted en el proceso, diseño y/o actualización de los programas de formación necesarios para su actividad productiva?" = "¿Se involucra usted en el proceso, diseño y/o actualización de los programas de formación necesarios para su actividad productiva?",
                                  "En caso de no conseguir o atraer el personal idóneo para sus cargos vacantes, ¿Qué acción toma?" = "En caso de no conseguir o atraer el personal idóneo para sus cargos vacantes, ¿Qué acción toma?",
                                  "Por favor mencione máximo 5 medios que usted ha utilizado para la búsqueda de personal en su organización:" = "Por favor mencione máximo 5 medios que usted ha utilizado para la búsqueda de personal en su organización:",
                                  "¿Cuáles fueron los motivos por los cuales no logro cubrir todas las vacantes? (máximo 5)" = "¿Cuáles fueron los motivos por los cuales no logro cubrir todas las vacantes? (máximo 5)"
                                ),
                                multiple = TRUE,
                                options = list(plugins = list('remove_button'), persist = FALSE)
                 ),
                 actionButton("clear_estrategias", "Limpiar Filtros")
          ),
          column(2,
                 h4("Habilidades Socioemocionales"),
                 selectizeInput("survey_variables_4", "Seleccione", 
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
                                ),
                                multiple = TRUE,
                                options = list(plugins = list('remove_button'), persist = FALSE)
                 ),
                 actionButton("clear_habilidades", "Limpiar Filtros")
          )
      ),
      column(2, offset = 5,
             downloadButton("download_survey_csv", "Descargar Tabla")
      ),
        column(12,
               reactableOutput("survey_table")
        )
        )
    )


