dashboard_sidebar <- dashboardSidebar(
    sidebarMenu(
        id = "tabs",
        menuItem("Inicio",
            tabName = "home", icon = icon("home")),
        menuItem("Áreas de Cualificación",
            tabName = "catalogo", icon = icon("book")),
        menuItem("Catálogo de datos",
            icon = icon("bar-chart"), startExpanded = TRUE,
                menuSubItem(
                    "Descriptivos por área",
                    tabName = "infogeneral"),
                menuSubItem(
                    "Bases de datos de áreas",
                    tabName = "consulta")
        ),
        menuItem("Encuesta",
            tabName = "survey", icon = icon("question-circle")
        )
    )
)