

tab_demandaSPE <- tabItem(
  tabName = "demandaSPE",
  class = "demandaSPE",
  tags$style('.demandaSPE {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Información Ofertas Laborales SPE",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
    )
  ),
  div(style = "height: 40px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = F,
               tags$p("En esta sección se presenta la información de las ofertas laborales (vacantes), es decir, los anuncios de empleo registrados por los empleadores en el Sistema de Información del Servicio de Empleo. Esta base de datos contiene información detallada sobre las vacantes, incluyendo título, descripción, experiencia requerida y rango salarial. La información se encuentra desagregada por área de cualificación, año y departamentos, proporcionando una visión completa y detallada de las oportunidades laborales disponibles.", style = "font-size: 20px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(
    style = "height: 40px;"
  ),
  fluidRow(
    div(style = "font-size: 17px;",
        column(2,
               box(title = "Atributos",
                   width = 12,
                   solidHeader = TRUE,
                   status = "primary",
                   selectizeInput("caract_OtrasFuentes_SPE", "Seleccione Base",
                                  choices = c(
                                    "Área de Cualificación",
                                    "Características Generales",
                                    "Información del Cargo"
                                  )
                   ),
                   
                   conditionalPanel(
                     condition = "input.caract_OtrasFuentes_SPE == 'Área de Cualificación'",
                     checkboxGroupInput("caract_OtrasFuentes_SPE_Areas_", "Seleccione Atributos", 
                                        choices = c(
                                          "Codigo Área" = "Código área",
                                          "Nombre Área cualificación" = "Nombre área cualificación"
                                        ),
                                        selected = c(
                                          "Código área",
                                          "Nombre área cualificación"
                                        )
                     )
                   ),
                   conditionalPanel(
                     condition = "input.caract_OtrasFuentes_SPE == 'Características Generales'",
                     checkboxGroupInput("caract_OtrasFuentes_SPE_generales_", "Seleccione Atributos", 
                                        choices = c(
                                         "Año" = "Año",
                                         "Mes" = "Mes",
                                         "Dia" = "Dia",
                                         "Código del Municipio" = "Código municipio",
                                         "Municipio" = "Municipio"#,
                                         # "Departamento" = "Departamento"
                                        )
                     )
                   ),
                   conditionalPanel(
                     condition = "input.caract_OtrasFuentes_SPE == 'Información del Cargo'",
                     checkboxGroupInput("caract_OtrasFuentes_SPE_otros_", "Seleccione Atributos", 
                                        choices = c(
                                          "Cantidad de Vacantes" = "Cantidad Vacantes",
                                          "Cargo Solicitado" = "Cargo Solicitado",
                                          "Experiencia Laboral" = "Experiencia laboral",
                                          "Rangos Salariales" = "Rangos salariales",
                                          "Códigos Grupos Primarios" = "Códigos Grupos primarios",
                                          "Código CIIU" = "Código CIIU",
                                          "Nivel Educativo" = "Nivel educativo",
                                          "Código Ocupación" = "Código Ocupación",
                                          "Ocupación" = "Ocupación"
                                        )
                     )
                   ),
                   div(
                     style = "height: 30px;"
                   ),
                   selectizeInput("otrasFuentes_SPE_año", "Seleccione Año",  # Seleccione por año
                                  choices = 2020:2023
                                  ),
                   div(
                     style = "height: 30px;"
                   ),
                   uiOutput("otrasFuentes_SPE_depto"),
                   div(
                     style = "height: 30px;"
                   ),
                   fluidRow(
                     column(2, offset = 1,
                            actionButton("clear_SPE", "Limpiar Filtros", icon = icon("eraser"),
                                         style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                            )
                     )
                   ),
                   div(
                     style = "height: 15px;"
                   ),
                   fluidRow(
                     column(2, offset = 1,
                            downloadButton("download_SPE", "Descargar Tabla",
                                           style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                            )
                     )
                     
                   )
               ),
               box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                   width = 12,
                   HTML("<a href='https://www.serviciodeempleo.gov.co/dataempleo-spe' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          SPE- Servicio Público de Empleo
                        </p>
                     </a>"
                   ),
                   HTML("<a href='OfertasLaborales.pdf' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          Ofertas Laborales
                        </p>
                     </a>"
                   )
               )
        ),
        column(10,
               reactableOutput("base_demandaSPE")
        )
      )
  )
)

tab_infoSNIES <- tabItem(
  tabName = "info_snies",
  class = "info_snies",
  tags$style('.info_snies {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Información Oferta Educativa SNIES",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
    )
  ),
  div(style = "height: 40px;"),
  fluidRow(
    column(10, offset=1,
           box(title = "Información",
               width = 12,
               solidHeader = TRUE,
               status = "primary",
               collapsible = T,
               collapsed = F,
               tags$p("En esta sección se presenta la información del Sistema Nacional de Información de la Educación Superior (SNIES), el cual recopila y organiza datos relevantes sobre la educación superior en Colombia. Esta base de datos contiene información detallada sobre estudiantes matriculados, admitidos e inscritos, así como sobre el personal docente y administrativo. La información se encuentra desagregada por área de cualificación, proporcionando una visión completa y detallada del comportamiento del sector de educación superior en el país.", style = "font-size: 20px;"),
               div(style = "height: 10px;"),
               div(style="text-align:center;"
               ),
               style = "font-size: 18px; text-align: justify;"
           )
    )
  ),
  div(
    style = "height: 40px;"
  ),
  fluidRow(
    div( style = "font-size: 17px;",
          column(2,
                 box(title = "Atributos",
                     width = 12,
                     solidHeader = TRUE,
                     status = "primary",
                     selectizeInput("caract_OtrasFuentes_snies", "Seleccione Base",
                                    choices = c(
                                      "Área de Cualificación",
                                      "Información General",
                                      "Información del Programa"
                                      
                                    )
                     ),
                     
                     conditionalPanel(
                       condition = "input.caract_OtrasFuentes_snies == 'Área de Cualificación'",
                       checkboxGroupInput("caract_OtrasFuentes_snies_Areas_", "Seleccione Atributos", 
                                          choices = c(
                                            "Codigo Área" = "Código área",
                                            "Nombre Área cualificación" = "Nombre área cualificación"
                                          ),
                                          selected = c(
                                            "Código área",
                                            "Nombre área cualificación"
                                          )
                       )
                     ),
                     conditionalPanel(
                       condition = "input.caract_OtrasFuentes_snies == 'Información del Programa'",
                       checkboxGroupInput("caract_OtrasFuentes_snies_programa_", "Seleccione Atributos", 
                                          choices = c(
                                            "Estado del Programa" = "Estado programa",
                                            "Justificacion" = "Justificacion",
                                            "Justificacion Detallada" = "Justificacion detallada",
                                            "Reconocimiento de Ministerio" = "Reconocimiento del ministerio",
                                            "Resolución de Aprobación" = "Resolución de aprobación",
                                            "Fecha de Resolución" = "Fecha de resolución",
                                            "Fechade Ejecutoria" = "Fecha ejecutoria",
                                            "Vigencia en Años" = "Vigencia años",
                                            "Núcleo básico del conocimiento" = "Núcleo básico del conocimiento",
                                            "Nivel de Formación" = "Nivel de formación",
                                            "Modalidad" = "Modalidad",
                                            "Número de Créditos" = "Número créditos",
                                            "Número de Periodos de Duración" = "Número periodos de duración",
                                            "Periodicidad" = "Periodicidad",
                                            "Se Ofrece por Ciclos Propedéut" = "Se ofrece por ciclos propedéut",
                                            "Periodicidadde Admisiones" = "Periodicidad admisiones",
                                            "Programa en Convenio" = "Programa en convenio"
                                          )
                       )
                     ),
                     conditionalPanel(
                       condition = "input.caract_OtrasFuentes_snies == 'Información General'",
                       checkboxGroupInput("caract_OtrasFuentes_snies_general_", "Seleccione Atributos", 
                                          choices = c(
                                            "Municipio de Oferta del Programa" = "Municipio oferta programa",
                                            # "Departamento de Oferta del Programa" = "Departamento oferta programa",
                                            "Nivel Académico"= "Nivel académico",
                                            "Área de Conocimiento" = "Área de conocimiento",
                                            "Cine f 2013 Campo Detallado" = "Cine f 2013 ac campo detallado",
                                            "Cine f 2013 ac Campo Específic" = "Cine f 2013 ac campo específic",
                                            "Cine f 2013 ac campo Amplio" = "Cine f 2013 ac campo amplio",
                                            "Fecha de Registro en Snies" = "Fecha de registro en snies"
                                          )
                       )
                     ),
                     div(
                       style = "height: 30px;"
                     ),
                     fluidRow(
                       column(2, offset = 1,
                              actionButton("clear_snies", "Limpiar Filtros", icon = icon("eraser"),
                                           style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                              )
                       )
                     ),
                     div(
                       style = "height: 15px;"
                     ),
                     fluidRow(
                       column(2, offset = 1,
                              downloadButton("download_snies", "Descargar Tabla",
                                             style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                              )
                       )
                       
                     )
                 ),
                 box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                     width = 12,
                     HTML("<a href='https://snies.mineducacion.gov.co/portal/' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          Portal MinEducación
                        </p>
                     </a>"
                     ),
                     HTML("<a href='SNIES.pdf' target='_blank'> 
                        <p align: center; color: #4682B4;'>
                          SNIES
                        </p>
                     </a>"
                     )
                 )
          ),
          column(10,
                 reactableOutput("base_OfertaSNIES")
          )
    )
  )
)