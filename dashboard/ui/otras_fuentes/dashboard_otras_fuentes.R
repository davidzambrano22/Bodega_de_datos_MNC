

tab_demandaSPE <- tabItem(
  tabName = "demandaSPE",
  class = "demandaSPE",
  tags$style('.demandaSPE {
                             background-color: #ffffff;
              }'),
  div(style = "height: 40px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Información Demanda SPE",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;")
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
                     condition = "input.caract_OtrasFuentes_SPE == 'Características Generales'",
                     checkboxGroupInput("caract_OtrasFuentes_SPE_generales_", "Seleccione Atributos", 
                                        choices = c(
                                         "Año" = "Año",
                                         "Mes" = "Mes",
                                         "Dia" = "Dia",
                                         "Código del Municipio" = "cod_mpio",
                                         "Municipio" = "Municipio",
                                         "Departamento" = "Departamento"
                                        )
                     )
                   ),
                   conditionalPanel(
                     condition = "input.caract_OtrasFuentes_SPE == 'Información del Cargo'",
                     checkboxGroupInput("caract_OtrasFuentes_SPE_otros_", "Seleccione Atributos", 
                                        choices = c(
                                          "Cantidad de Vacantes" = "CantidadVacantes",
                                          "Cargo Solicitado" = "CargoSolicitado",
                                          "Experiencia Laboral" = "Experiencia_laboral",
                                          "Rangos Salariales" = "Rangos_salariales",
                                          "Códigos Grupos Primarios" = "CódigosGruposprimarios",
                                          "Código CIIU" = "Código_ciiu",
                                          "Nivel Educativo" = "Nivel_educativo",
                                          "Código Ocupación" = "CódigoOcupación",
                                          "Ocupación" = "Ocupación"
                                        )
                     )
                   ),
                   div(
                     style = "height: 30px;"
                   ),
                   selectizeInput("otrasFuentes_SPE_año", "Seleccione Año",  # Seleccione por año
                                  choices = 2022:2024
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
               box(title = "Guía", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                   width = 12,
                   tags$p("En esta sección encontrará información sobre...",
                          style = "font-size: 17px; text-align: justify;"
                   ),
                   tags$a("Descargar el instructivo...", href="fichas_brechas.pdf", target="_blank", style = "font-size: 17px;")
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
                                            "Codigo Área" = "Código_área",
                                            "Nombre Área cualificación" = "Nombre área cualificación"
                                          ),
                                          selected = c(
                                            "Código_área",
                                            "Nombreáreacualificación"
                                          )
                       )
                     ),
                     conditionalPanel(
                       condition = "input.caract_OtrasFuentes_snies == 'Información del Programa'",
                       checkboxGroupInput("caract_OtrasFuentes_snies_programa_", "Seleccione Atributos", 
                                          choices = c(
                                            "Estado del Programa" = "Estado_programa",
                                            "Justificacion" = "Justificacion",
                                            "Justificacion Detallada" = "Justificacion_detallada",
                                            "Reconocimiento de Ministerio" = "Reconocimiento_del_ministerio",
                                            "Resolución de Aprobación" = "Resolución_de_aprobación",
                                            "Fecha de Resolución" = "Fecha_de_resolución",
                                            "Fechade Ejecutoria" = "Fecha_ejecutoria",
                                            "Vigencia en Años" = "Vigencia_años",
                                            "Núcleo_básico_del_conocimiento" = "Núcleo_básico_del_conocimiento",
                                            "Nivel de Formación" = "Nivel_de_formación",
                                            "Modalidad" = "Modalidad",
                                            "Número de Créditos" = "Número_créditos",
                                            "Número de Periodos de Duración" = "Número_periodos_de_duración",
                                            "Periodicidad" = "Periodicidad",
                                            "Se Ofrece por Ciclos Propedéut" = "Se_ofrece_por_ciclos_propedéut",
                                            "Periodicidadde Admisiones" = "Periodicidad_admisiones",
                                            "Programa en Convenio" = "Programa_en_convenio"
                                          )
                       )
                     ),
                     conditionalPanel(
                       condition = "input.caract_OtrasFuentes_snies == 'Información General'",
                       checkboxGroupInput("caract_OtrasFuentes_snies_general_", "Seleccione Atributos", 
                                          choices = c(
                                            "Municipio de Oferta del Programa" = "Municipio_oferta_programa",
                                            "Departamento de Oferta del Programa" = "Departamento_oferta_programa",
                                            "Nivel Académico"= "Nivel_académico",
                                            "Área de Conocimiento" = "Área_de_conocimiento",
                                            "Cine f 2013 Campo Detallado" = "Cine_f_2013_ac_campo_detallado",
                                            "Cine f 2013 ac Campo Específic" = "Cine_f_2013_ac_campo_específic",
                                            "Cine f 2013 ac campo Amplio" = "Cine_f_2013_ac_campo_amplio",
                                            "Fecha de Registro en Snies" = "Fecha_de_registro_en_snies"
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
                 box(title = "Guía", solidHeader = T, status = "primary", collapsible = T, collapsed = T,
                     width = 12,
                     tags$p("En esta sección encontrará información sobre...",
                            style = "font-size: 17px; text-align: justify;"
                     ),
                     tags$a("Descargar el instructivo...", href="fichas_brechas.pdf", target="_blank", style = "font-size: 17px;")
                 )
          ),
          column(10,
                 reactableOutput("base_OfertaSNIES")
          )
    )
  )
)