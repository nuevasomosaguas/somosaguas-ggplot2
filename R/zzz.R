# Registra la EB Garamond incluida si el sistema no la tiene instalada. El
# registro lo ven los dispositivos basados en systemfonts (ragg, svglite), que
# ggsave() usa por omisión cuando ragg está instalado.
# ponytail: pdf() y cairo_pdf() no ven el registro; para PDF hay que instalar
# la fuente en el sistema o exportar con svglite.
.onLoad <- function(libname, pkgname) {
  if ("EB Garamond" %in% systemfonts::system_fonts()$family) return()
  ruta <- function(estilo) {
    system.file("fonts", paste0("EBGaramond-", estilo, ".ttf"), package = pkgname)
  }
  systemfonts::register_font(
    "EB Garamond",
    plain = ruta("Regular"), bold = ruta("Bold"),
    italic = ruta("Italic"), bolditalic = ruta("BoldItalic")
  )
}
