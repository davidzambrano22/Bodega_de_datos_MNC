

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
               tags$p("En esta sección se presenta la información de las ofertas laborales (vacantes), es decir, los anuncios de empleo registrados por los empleadores en el Sistema de Información del Servicio de Empleo. Esta base de datos contiene información detallada sobre las vacantes, incluyendo título, descripción, experiencia requerida y rango salarial. La información se encuentra desagregada por área de cualificación, año y departamentos, proporcionando una visión completa y detallada de las oportunidades laborales disponibles.", style = "font-size: 19px;"),
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
                                         "Código del Municipio" = "Código municipio",
                                         "Municipio" = "Municipio"
                                        )
                     )
                   ),
                   conditionalPanel(
                     condition = "input.caract_OtrasFuentes_SPE == 'Información del Cargo'",
                     checkboxGroupInput("caract_OtrasFuentes_SPE_otros_", "Seleccione Atributos", 
                                        choices = c(
                                          "Experiencia Laboral" = "Experiencia laboral",
                                          "Rangos Salariales" = "Rangos salariales",
                                          "Código CIIU" = "Código CIIU",
                                          "Nivel Educativo" = "Nivel educativo",
                                          "Código Ocupación" = "Código Ocupación",
                                          "Ocupación" = "Ocupación",
                                          "Puestos Trabajo" = "Puestos Trabajo",
                                          "Cantidad Vacantes" = "Cantidad Vacantes"
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

tab_EncuestaOfertaEdu <- tabItem(
  tabName = "encuesta_oferta_edu",
  class = "encuesta_oferta_edu",
  tags$style('.encuesta_oferta_edu {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Encuesta de Oferta Formativa",
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
               tags$p("En la sección de Encuesta de Oferta Educativa, encontrará información detallada recopilada de instituciones de educación superior y para el trabajo, segmentada por área de cualificación. El objetivo de esta encuesta es complementar los análisis de la oferta educativa. La información incluye el nombre del programa, tipo de formación, antigüedad, nivel de formación, duración, modalidad, acreditación, número de estudiantes inscritos y matriculados, y graduados por año. También se abordan competencias técnicas, transversales y socioemocionales, y la percepción de su importancia para los empresarios. Además, se incluye información sobre el perfil de salida, área de cualificación, nombre de la institución, departamento y municipio. Otros aspectos cubiertos son la participación empresarial en programas educativos, alianzas con plataformas de empleo, tipos de acompañamiento en la construcción del perfil ocupacional, estrategias de apoyo a egresados y acciones ante la baja demanda.", style = "font-size: 20px;"),
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
                    selectizeInput("caract_OtrasFuentes_infoEncuesta", "Seleccione Base",
                                   choices = c(
                                     "Área de Cualificación",
                                     "Características Generales",
                                     "Información Programas",
                                     "Competencias",
                                     "Estrategias de Colaboración y Apoyo Empresarial"
                                     
                                   )
                    ),
                    
                    conditionalPanel(
                      condition = "input.caract_OtrasFuentes_infoEncuesta == 'Área de Cualificación'",
                      checkboxGroupInput("caract_OtrasFuentes_infoEncuesta_area_", "Seleccione Atributos", 
                                         choices = c(
                                           "Codigo Área" = "Código_área",
                                           "Nombre Área cualificación" = "Nombre área cualificación"
                                         ),
                                         selected = c(
                                           "Código_área",
                                           "Nombre área cualificación"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.caract_OtrasFuentes_infoEncuesta == 'Información Programas'",
                      checkboxGroupInput("caract_OtrasFuentes_infoEncuesta_infoPrograma_", "Seleccione Atributos",
                                         choices = c(
                                           "Nombre  programa",
                                           "Tipo  formación",
                                           "Antigüedad (años)",
                                           "Nivel formación",
                                           "Duración",
                                           "Modalidad",
                                           "Tiene Acreditación",
                                           "Número estudiantes inscritos",
                                           "Número matriculas",
                                           "Graduados  año"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.caract_OtrasFuentes_infoEncuesta == 'Competencias'",
                      checkboxGroupInput("caract_OtrasFuentes_infoEncuesta_competencias_", "Seleccione Atributos", 
                                         choices = c(
                                           "Comp técnicas 1 (CT1)",
                                           "CT1 Importancia  empresarios",
                                           "Comp técnicas 2 (CT2)",
                                           "Comp técnicas 3 (CT3)",
                                           "CT3 Importancia  empresarios",
                                           "Comp técnicas 4 (CT4)",
                                           "CT4 Importancia  empresarios",
                                           "Comp técnicas 5 (CT5)",
                                           "CT5 Importancia  empresarios",
                                           "Competencia transversal 1 (CTV1)",
                                           "CTV1 Importancia  empresarios",
                                           "Competencia transversal 2 (CTV2)",
                                           "CTV2 Importancia  empresarios",
                                           "Competencia transversal 3 (CTV3)",
                                           "CTV3 Importancia  empresarios",
                                           "Competencia transversal 4 (CTV4)",
                                           "CTV4 Importancia  empresarios",
                                           "Competencia transversal 5 (CTV5)",
                                           "CTV5 Importancia  empresarios",
                                           "Competencia socioemocional 1 (CSE1)",
                                           "CSE1 Importancia  empresarios",
                                           "Competencia socioemocional 2 (CSE2)",
                                           "CSE2 Importancia  empresarios",
                                           "Competencia socioemocional 3 (CSE3)",
                                           "CSE3 Importancia  empresarios",
                                           "Competencia socioemocional 4 (CSE4)",
                                           "CSE4 Importancia  empresarios" ,
                                           "Competencia socioemocional 5 (CSE5)",
                                           "CSE5 Importancia  empresarios",
                                           "Perfil Salida 1",
                                           "Perfil Salida 2",
                                           "Perfil Salida 3",
                                           "Perfil Salida 4",
                                           "Perfil Salida 5"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.caract_OtrasFuentes_infoEncuesta == 'Características Generales'",
                      checkboxGroupInput("caract_OtrasFuentes_infoEncuesta_infoInstitu_", "Seleccione Atributos", 
                                         choices = c(
                                           "Nombre de la institución",
                                           "Departamento",
                                           "Municipio",
                                           "Numero_Programas",
                                           "Participación empresarial en programas educativos"
                                           
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.caract_OtrasFuentes_infoEncuesta == 'Estrategias de Colaboración y Apoyo Empresarial'",
                      checkboxGroupInput("caract_OtrasFuentes_infoEncuesta_infoEmpleados_", "Seleccione Atributos", 
                                         choices = c(
                                           "Medio/mecanismo de participación empresarial",
                                           "Alianzas  plataformas  empleo",
                                           "Detalle de alianzas",
                                           "Acompañamiento  perfil ocupacional",
                                           "Tipos acompañamiento",
                                           "Apoyo a egresados para empleo",
                                           "Estrategias de apoyo a egresados",
                                           "Acciones ante baja demanda",
                                           "Otras Acciones baja demanda",
                                           "Alianzas con otras instituciones",
                                           "Problemas de empleabilidad de egresados"
                                         )
                      )
                    ),
                    div(
                      style = "height: 30px;"
                    ),
                    fluidRow(
                      column(2, offset = 1,
                             actionButton("clear_encuestaOferta", "Limpiar Filtros", icon = icon("eraser"),
                                          style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                             )
                      )
                    ),
                    div(
                      style = "height: 15px;"
                    ),
                    fluidRow(
                      column(2, offset = 1,
                             downloadButton("download_encuestaOferta", "Descargar Tabla",
                                            style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                             )
                      )
                      
                    )
                )#,
                # box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                #     width = 12,
                #     HTML("<a href='https://snies.mineducacion.gov.co/portal/' target='_blank'> 
                #         <p align: center; color: #4682B4;'>
                #           Portal MinEducación
                #         </p>
                #      </a>"
                #     ),
                #     HTML("<a href='SNIES.pdf' target='_blank'> 
                #         <p align: center; color: #4682B4;'>
                #           SNIES
                #         </p>
                #      </a>"
                #     )
                # )
         ),
         column(10,
                reactableOutput("base_encuestaOferta")
         )
    )
  )
)


tab_BaseDemanda_ <- tabItem(
  tabName = "encuesta_baseDemanda",
  class = "encuesta_baseDemanda",
  tags$style('.encuesta_baseDemanda {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Encuesta de demanda y brechas de Capital Humano",
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
               tags$p("En esta sección encontrará información detallada recopilada de empresas sobre áreas de cualificación y cargos críticos. El objetivo de esta encuesta es complementar los análisis de brechas de capital humano. La información incluye detalles como nivel educativo, experiencia mínima, rango salarial, tipo de contrato, tiempo para cubrir vacantes, habilidades socioemocionales, medios de búsqueda y estrategias para cubrir vacantes, conocimientos y destrezas requeridos para los cargos críticos. Además, se abordan aspectos como la actividad económica de las empresas, el tamaño de las mismas, y los programas de desarrollo asociados. Otros aspectos cubiertos son la participación empresarial en programas educativos, estrategias de desarrollo de funciones y acciones ante la desarticulación y calidad de las vacantes.", style = "font-size: 20px;"),
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
                    selectizeInput("caract_OtrasFuentes_baseDemanda", "Seleccione Base",
                                   choices = c(
                                     "Área de Cualificación",
                                     "Caracteristicas Cargo",
                                     "Razones Brechas",
                                     "Competencias Cargo",
                                     "Indicadores Brechas"
                                     
                                   )
                    ),
                    
                    conditionalPanel(
                      condition = "input.caract_OtrasFuentes_baseDemanda == 'Área de Cualificación'",
                      checkboxGroupInput("caract_OtrasFuentes_baseDemanda_area_", "Seleccione Atributos", 
                                         choices = c(
                                           "Codigo Área" = "Código_área",
                                           "Nombre Área cualificación" = "Nombreáreacualificación"
                                         ),
                                         selected = c(
                                           "Código_área",
                                           "Nombreáreacualificación"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.caract_OtrasFuentes_baseDemanda == 'Caracteristicas Cargo'",
                      checkboxGroupInput("caract_OtrasFuentes_baseDemanda_caracCargo_", "Seleccione Atributos",
                                         choices = c(
                                           "Cargo Critico",
                                           "Ocupación Misional",
                                           "Código denominaciones",
                                           "Denominacion",
                                           "Código Ocupación",
                                           "Ocupación",
                                           "Nivel Educativo",
                                           "Experiencia Minima", 
                                           "Rango salario",
                                           "Otro Salario",
                                           "Tipo de contrato",
                                           "Otro Tipo Contrato",
                                           "Modalidad",
                                           "Actividad económica", 
                                           "Otra actividad económica", 
                                           "Departamento",
                                           "Tamaño Empresa",
                                           "Área desempeño"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.caract_OtrasFuentes_baseDemanda == 'Razones Brechas'",
                      checkboxGroupInput("caract_OtrasFuentes_baseDemanda_razones_", "Seleccione Atributos", 
                                         choices = c(
                                           "Razon Cargo Critico",
                                           "Otra Razon Cargo Critico",
                                           "Rotación Cargo",
                                           "Tiempo cubrir vacante",
                                           "Número Cargos Criticos" ,
                                           "Notas Cargo Critico",
                                           "ProgramasSon",
                                           "Nombre Programas",
                                           "Motivos No vacantes",
                                           "Diseño Programas",
                                           "Acciones para cubrir vacantes",
                                           "Medios Busqueda"
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.caract_OtrasFuentes_baseDemanda == 'Competencias Cargo'",
                      checkboxGroupInput("caract_OtrasFuentes_infoEncuesta_infoInstitu_", "Seleccione Atributos", 
                                         choices = c(
                                           "Habilidad Misión Visión",
                                           "Habilidades Socioemocionales",
                                           "Funciones Cargo Critico",
                                           "Desarrollo Funciones",
                                           "Estrategia Desarrollo Función",
                                           "Conocimientos Cargo Critico", 
                                           "Desarrollo Conocimientos",
                                           "Estrategia No Conocimiento Requerido", 
                                           "Destrezas Cargo Critico", 
                                           "Desarrollo Destrezas",
                                           "Estrategia No Destreza Requerido" 
                                         )
                      )
                    ),
                    conditionalPanel(
                      condition = "input.caract_OtrasFuentes_baseDemanda == 'Indicadores Brechas'",
                      checkboxGroupInput("caract_OtrasFuentes_baseDemanda_indicadores_", "Seleccione Atributos", 
                                         choices = c(
                                           "BQ__Atraccion_vacante",
                                           "BP__Experiencia_vacante",
                                           "BC__Competencia_vacante",
                                           "BQ__Atraccion_vacante_ocu",
                                           "BP__Experiencia_vacante_ocu",
                                           "BC__Competencia_vacante_ocu",
                                           "BC__Conocimientos",
                                           "BC__destreza",
                                           "BP__Conocimientos",
                                           "BP__destreza",
                                           "BQ__Programa",
                                           "BC__Conocimientos_ocu",
                                           "BC__destreza_ocu",
                                           "BP__Conocimientos_ocu",
                                           "BP__destreza_ocu",
                                           "BQ__Programa_ocu",
                                           "BQ__Atraccion",
                                           "BP__Desarticulacion",
                                           "BQ__DeficitP",
                                           "BC__Calidad",
                                           "BQ__Atraccion_ocu",
                                           "BP__Desarticulacion_ocu",
                                           "BQ__DeficitP_ocu",
                                           "BC__Calidad_ocu"
                                         )
                      )
                    ),
                    div(
                      style = "height: 30px;"
                    ),
                    fluidRow(
                      column(2, offset = 1,
                             actionButton("clear_baseDemanda__", "Limpiar Filtros", icon = icon("eraser"),
                                          style="color: #fff; background-color: #333; border-color: #2e6da4; font-size: 17px;"
                             )
                      )
                    ),
                    div(
                      style = "height: 15px;"
                    ),
                    fluidRow(
                      column(2, offset = 1,
                             downloadButton("download_ofertaDemanda__", "Descargar Tabla",
                                            style="color: #333333; background-color: #F5F5F5; font-size: 17px;"
                             )
                      )
                      
                    )
                )#,
                # box(title = "Material de Apoyo", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                #     width = 12,
                #     HTML("<a href='https://snies.mineducacion.gov.co/portal/' target='_blank'> 
                #         <p align: center; color: #4682B4;'>
                #           Portal MinEducación
                #         </p>
                #      </a>"
                #     ),
                #     HTML("<a href='SNIES.pdf' target='_blank'> 
                #         <p align: center; color: #4682B4;'>
                #           SNIES
                #         </p>
                #      </a>"
                #     )
                # )
         ),
         column(10,
                reactableOutput("base_demanda__")
         )
    )
  )
)