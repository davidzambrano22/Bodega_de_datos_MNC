

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
                      )
        ),
        menuItem("Otras Fuentes de Información",
                 icon = icon("question-circle"), startExpanded = FALSE,
                 menuSubItem("Ofertas Laborales SPE",
                          tabName = "demandaSPE"
                          ),
                 menuSubItem("Oferta SNIES",
                             tabName = "info_snies"
                             )
                 ),
        menuItem("Estadísticas Áreas MNC",
                 icon = icon("pencil"), startExpanded = FALSE,
                 menuItem(
                   "Información General",
                   menuSubItem(
                     "Áreas de Cualificación",
                     tabName = "est_area_cual"
                   ),
                   menuSubItem(
                     "Información General",
                     tabName = "est_generales"
                   ),
                   menuSubItem(
                     "Cargos de Difícil Consecución",
                     tabName = "est_dificilConsecucion"
                   ),
                   menuSubItem(
                     "Medios de Búsqueda",
                     tabName = "est_mediosBusqueda"
                   )
                 ),
                 menuItem(
                   "Análisis de Compentencias",
                   menuSubItem(
                     "Análisis de Competencias",
                     tabName = "analisis_competencias"
                     )
                   )
                 )
        )
)
