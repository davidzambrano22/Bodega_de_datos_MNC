tab_home <- tabItem(
    tabName = "home",
    fluidRow(
        box(
            title = "Bienvenido",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = 12,
            "Bienvenido al Sistema de Gestión de datos del MNC Colombia. 
            En esta aplicación podrá consultar los datos de la 
            Sistema de Gestión de datos del MNC Colombia, así como cargar 
            nuevos datos al Sistema de Gestión de datos."
        )
    ),
    fluidRow(
        # ValueBoxOutput to show number of uploaded files, data volume,
        # first upload date, last upload date
        # valueBoxOutput("num_files"),
        valueBoxOutput("data_volume"),
        valueBoxOutput("first_upload_date"),
        valueBoxOutput("last_upload_date")
    )
)

tab_catalogo <- tabItem(
    tabName = "catalogo",
    fluidRow(
        box(
            title = "Catálogo de archivos",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = 12,
            "En esta sección podrá consultar el catálogo de 
            datos del Sistema de Gestión de datos del MNC Colombia."
        )
    ),
    fluidRow(
        box(
            title = "Filtros",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = 12,
            fluidRow(
                column(3,
                    textInput("filename", "Nombre del archivo", "")
                ),
                column(3,
                    textInput("size", "Tamaño del archivo", "")
                ),
                column(3,
                    textInput(
                        "ctime", "Fecha de creación del archivo", ""
                    )
                ),
                column(3,
                    textInput("extension", "Extensión del archivo", "")
                )
            ),
            fluidRow(
                column(12,
                    actionButton(
                        "clear_filters", "Limpiar filtros",
                        icon = icon("eraser"),
                        style = "color: #fff; background-color: 
                        #d9534f; border-color: #d43f3a;"),
                    actionButton(
                        "apply_filters", "Aplicar filtros",
                        icon = icon("filter"),
                        style = "color: #fff; background-color:
                        #5cb85c; border-color: #4cae4c;")
                )
            )
        )
    ),
    fluidRow(
        column(12,
            # Reactable with the catalog table
            reactableOutput("file_catalog")
        )
    )
)

tab_carga <- tabItem(
    tabName = "carga",
    fluidRow(
        box(
            title = "Carga de archivos",
            status = "primary",
            solidHeader = TRUE,
            collapsible = TRUE,
            width = 12,
            "En esta sección podrá cargar nuevos datos a la 
            Sistema de Gestión de datos del MNC Colombia."
        )
    ),
    fluidRow(
        column(12,
            # FileInput to upload files
            fileInput(
                "file_upload", "Seleccione los archivos a cargar",
                multiple = TRUE
            )
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
        column(2,
            h3("Variables a mostrar"),
            checkboxGroupInput(
                "general_variables", "Variables",
                choices = c(
                    "Clase" = "clase",
                    "Descripción" = "descripcion",
                    "Código de área" = "codigo_area",
                    "Area de cualificación" = "area_cualificacion",
                    "Código CINE" = "codigo_cine_2011_ac",
                    "Campos detallados" = "campos_detallado"
                ),
                selected = c(
                    "clase",
                    "descripcion",
                    "codigo_area",
                    "area_cualificacion",
                    "codigo_cine_2011_ac",
                    "campos_detallado"
                )
            )
        ),
        column(10,
            h3("Tabla general de consulta"),
            # Reactable with the catalog table
            reactableOutput("joined_table")
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
                  "Se entiende como habilidades socioemocionales  “el proceso a través del cual se adquieren y aplican efectivamente los conocimientos, actitudes y habilidades necesarias para comprender y manejar las emociones," = "Se entiende como habilidades socioemocionales  “el proceso a través del cual se adquieren y aplican efectivamente los conocimientos, actitudes y habilidades necesarias para comprender y manejar las emociones,",
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
            # checkboxGroupInput(
            #     "survey_variables", "Variables",
            #     choices = c(
            #         "NIT" = "NIT",
            #         "Razón social" = "Razón social",
            #         "Actividad económica" = "Actividad económica  principal de la empresa",
            #         "Departamento" = "Departamento",
            #         "Tamaño empresa" = "Para determinar el tamaño de la empresa, ¿cuántas personas trabajan actualmente en la empresa?",
            #         "¿Cuántos cargos en su empresa u organización considera que son de difícil consecución?" = "¿Cuántos cargos en su empresa u organización considera que son de difícil consecución?",
            #         "Cargo misional 1" = "Cargo misional 1:",
            #         "Cargo misional 2" = "Cargo misional 2:",
            #         "¿Se involucra usted en el proceso, diseño y/o actualización de los programas de formación necesarios para su actividad productiva?" = "¿Se involucra usted en el proceso, diseño y/o actualización de los programas de formación necesarios para su actividad productiva?",
            #         "Adicional a los cargos mencionados anteriormente... ¿Considera que existen otros cargos misionales dentro de su empresa u organización?" = "Adicional a los cargos mencionados anteriormente... ¿Considera que existen otros cargos misionales dentro de su empresa u organización?",
            #         "En caso de no conseguir o atraer el personal idóneo para sus cargos vacantes, ¿Qué acción toma?" = "En caso de no conseguir o atraer el personal idóneo para sus cargos vacantes, ¿Qué acción toma?",
            #         "Motivos de no cobertura de vacantes" = "¿Cuáles fueron los motivos por los cuales no logro cubrir todas las vacantes? (máximo 5)",
            #         "Misión de la empresa / habilidad socioemocional" = "1. ¿La misión, visión o alcance social de su empresa define algún tipo de habilidad socioemocional?"
            #     ),
            #     selected = c(
            #       "NIT",
            #       "Razón social",
            #       "Actividad económica  principal de la empresa",
            #       "Departamento",
            #       "Para determinar el tamaño de la empresa, ¿cuántas personas trabajan actualmente en la empresa?",
            #       "¿Cuántos cargos en su empresa u organización considera que son de difícil consecución?",
            #       "Cargo misional 1:",
            #       "Cargo misional 2:"
            #     )
            # )
        ),
        column(9,
               reactableOutput("survey_table")
        )
        )
    )


