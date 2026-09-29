# Tokens de website/styles.css, los mismos que usan las plantillas de Typst y Quarto.
granate <- "#800000"
tinta <- "#111111"
gris <- "#555555"
borde <- "#e0e0d8"

# Paleta categórica validada sobre el papel (#fffff8) y sobre blanco: banda de
# luminosidad, croma mínimo, separación para daltonismo entre vecinas y
# contraste 3:1. El granate de la web es demasiado oscuro para una serie, así
# que la primera es su versión aclarada. El orden es fijo: la sexta serie no
# existe, se agrupa en «Otros» o se pasa a facetas.
paleta_somosaguas <- c(
  granate = "#9a2929",
  azul = "#1479b0",
  ocre = "#ba7f14",
  violeta = "#6d5398",
  verde = "#219576"
)

theme_somosaguas <- function(base_size = 12, base_family = "EB Garamond",
                             fondo = "#fffff8") {
  ggplot2::theme_minimal(
    base_size = base_size, base_family = base_family,
    ink = tinta, paper = fondo, accent = paleta_somosaguas[[1]]
  ) +
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = fondo, colour = NA),
      panel.grid.minor = ggplot2::element_blank(),
      panel.grid.major.x = ggplot2::element_blank(),
      panel.grid.major.y = ggplot2::element_line(colour = borde, linewidth = 0.3),
      axis.line.x = ggplot2::element_line(colour = tinta, linewidth = 0.4),
      axis.ticks.x = ggplot2::element_line(colour = tinta, linewidth = 0.3),
      axis.text = ggplot2::element_text(colour = gris),
      axis.title = ggplot2::element_text(colour = gris, size = ggplot2::rel(0.9)),
      plot.title.position = "plot",
      plot.caption.position = "plot",
      plot.title = ggplot2::element_text(
        colour = granate, face = "bold", size = ggplot2::rel(1.45),
        margin = ggplot2::margin(b = 4)
      ),
      plot.subtitle = ggplot2::element_text(
        colour = gris, face = "italic", margin = ggplot2::margin(b = 12)
      ),
      plot.caption = ggplot2::element_text(
        colour = gris, size = ggplot2::rel(0.8), hjust = 0,
        margin = ggplot2::margin(t = 10)
      ),
      # Si las series no admiten etiqueta directa, la leyenda va encima y mínima.
      legend.position = "top",
      legend.justification = "left",
      legend.title = ggplot2::element_blank(),
      strip.text = ggplot2::element_text(colour = granate, face = "italic", hjust = 0),
      plot.margin = ggplot2::margin(14, 14, 14, 14)
    )
}

# `scale_*_manual` falla si hay más niveles que colores: así la paleta nunca se repite.
scale_colour_somosaguas <- function(...) {
  ggplot2::scale_colour_manual(values = unname(paleta_somosaguas), ...)
}
scale_color_somosaguas <- scale_colour_somosaguas

scale_fill_somosaguas <- function(...) {
  ggplot2::scale_fill_manual(values = unname(paleta_somosaguas), ...)
}
