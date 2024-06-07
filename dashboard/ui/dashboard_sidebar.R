

dashboard_sidebar <- dashboardSidebar(
    width = 276,
    sidebarMenu(
        id = "Sidebar",
        menuItem("Inicio",
            tabName = "home", icon = icon("home")),
        menuItem("Áreas de Cualificación",
            tabName = "tab_catalogo", icon = icon("book")),
        menuItem("Bases de Datos Oficiales",
                 tabName = "bases_oficiales", icon = icon("cloud")),
        menuItem("Bases de datos Etapas MNC",
                 icon = icon("bar-chart"),
                 startExpanded = FALSE,
                 menuItem("Información por Etapas MNC",
                          tabName = "info_etapas",
                          startExpanded = T
                          ),
                 menuItem(
                      "Contextualización Sector",
                      tabName = "tasa_ocupados",
                      menuSubItem("Ocupados Departamentos", tabName = "tasa_ocupados"),
                      menuSubItem("Ocupados Sectores", tabName = "ocupados_ciiu"),
                      menuSubItem("Ocupados Edad y Sexo", tabName = "ocupados_edadSexo"),
                      menuSubItem("Ocupados Nivel Educativo", tabName = "ocupados_NivelEdu")
                      ),
                 menuItem(
                   "Brechas de Capital Humano",
                   menuSubItem("Brechas de Cantidad", tabName = "brechas_Cantidad"),
                   menuSubItem("Brechas de Calidad", tabName = "brechasCalidad"),
                   menuSubItem("Brechas de Pertinencia", tabName = "brechas_pertinencia")
                 )
        ),
        menuItem("Estadísticas Áreas MNC",
                 icon = icon("pencil"), startExpanded = FALSE,
                 menuItem(
                   "Estadísticas Áreas MNC",
                   tabName = "est_area_cual"
                 ),
                 menuItem(
                   "Estadísticas Encuesta Demanda",
                   tabName = "est_generales"
                 ),
                 menuItem(
                   "Cargos Críticos DC",
                   tabName = "est_dificilConsecucion"
                 ),
                 menuItem(
                   "Gestión de Vacantes",
                   tabName = "est_mediosBusqueda"
                 ),
                 menuItem(
                   "Estadísticas Brechas KH",
                   menuSubItem("Resumen Brechas KH",
                   tabName = "brechasKH"
                   ),
                   menuSubItem("Brechas Denominación",
                               tabName = "brechasDenominacion"
                   ),
                   menuSubItem("Brechas Ocupación",
                               tabName = "brechasKHOcupacion"
                   )
                 ),
                 menuItem(
                   "Análisis de Compentencias",
                   menuSubItem(
                     "Análisis de Competencias",
                     tabName = "analisis_competencias"
                   )
                 )
        ),
        menuItem("Otras Fuentes de Información",
                 icon = icon("question-circle"), startExpanded = FALSE,
                 menuSubItem("Ofertas Laborales SPE",
                          tabName = "demandaSPE"
                          ),
                 menuSubItem("Oferta SNIES",
                             tabName = "info_snies"
                             ),
                 menuSubItem("Encuesta Oferta Educativa",
                             tabName = "encuesta_oferta_edu"
                 ),
                 menuSubItem("Encuesta Demanda y Brechas KH",
                             tabName = "encuesta_baseDemanda"
                 )
                 )
        )
)
