dashboard_sidebar <- dashboardSidebar(
    sidebarMenu(
        id = "tabs",
        menuItem("Inicio",
            tabName = "home", icon = icon("home")),
        menuItem("Áreas de Cualificación",
            tabName = "catalogo", icon = icon("book")),
        menuItem("Consulta de información",
            icon = icon("bar-chart"), startExpanded = FALSE,
                menuSubItem(
                    "Catálogo de datos",
                    tabName = "infogeneral"),
                menuSubItem(
                    "Descriptivos por área del MNC",
                    tabName = "consulta")
        ),
        menuItem("Información Encuestas",
            icon = icon("question-circle"), startExpanded = FALSE,
            menuSubItem(
              "Encuesta de demanda laboral",
              tabName = "survey")
        )
    )
)