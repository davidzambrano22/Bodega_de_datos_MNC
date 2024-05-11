

tab_demandaSPE <- tabItem(
  tabName = "demandaSPE",
  class = "demandaSPE",
  tags$style('.demandaSPE {
                             background-color: #ffffff;
              }'),
  div(style = "height: 20px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Información Demanda SPE",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
           tags$p("En esta sección podrá consultar información asociada a la demanda SPE",
                  style = "text-align: center; font-size: 22px;"
           )
    )
  ),
  div(
    style = "height: 20px;"
  ),
  fluidRow(
    column(2,
           box(title = "Atributos",
               width = 12,
               solidHeader = TRUE,
               status = "warning",
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
                                     "Municipio" = "Municipio"
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
               div(class = "fluidrow_clear",
                   fluidRow(
                     column(2, offset = 2,
                            actionButton("clear_SPE", "Limpiar Filtros", icon = icon("eraser"),
                                         style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
                            )
                     )
                   )
               )
           )
    ),
    column(10,
           reactableOutput("base_demandaSPE")
    )
  ),
  fluidRow(
    column(2, offset = 6,
           downloadButton("download_SPE", "Descargar Tabla",
                          style="color: #fff; background-color: #008000; border-color: #2e6da4"
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
  div(style = "height: 20px;"),
  fluidRow(
    column(8, offset = 2,
           tags$h1("Información Oferta Educativa SNIES",
                   style = "font-size: 45px; text-align: center; font-weight: bold; color: #4682B4;"
           ),
           tags$hr(style = "border-top: 4px solid black; margin-top: 5px; margin-bottom: 10px;  border-color: #D3D3D3; width: 20%;"),
           tags$p("En esta sección podrá consultar información asociada a la oferta educativa SNIES",
                  style = "text-align: center; font-size: 22px;"
           )
    )
  ),
  div(
    style = "height: 20px;"
  ),
  fluidRow(
    column(2,
           box(title = "Atributos",
               width = 12,
               solidHeader = TRUE,
               status = "warning",
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
               div(class = "fluidrow_clear",
                   fluidRow(
                     column(2, offset = 2,
                            actionButton("clear_snies", "Limpiar Filtros", icon = icon("eraser"),
                                         style="color: #fff; background-color: #dc3545; border-color: #2e6da4"
                            )
                     )
                   )
               )
           )
    ),
    column(10,
           reactableOutput("base_OfertaSNIES")
    )
  ),
  fluidRow(
    column(2, offset = 6,
           downloadButton("download_snies", "Descargar Tabla",
                          style="color: #fff; background-color: #008000; border-color: #2e6da4"
           )
    )
    
  )
)