# somosaguas-ggplot2

Tema de `ggplot2` con el estándar gráfico de [Nueva Somosaguas](https://nuevasomosaguas.github.io/entorno.html): el gráfico lleva la misma tipografía, el mismo papel y el mismo granate que el texto que lo acompaña, como las plantillas de [Typst](https://github.com/nuevasomosaguas/somosaguas-typst-template) y [Quarto](https://github.com/nuevasomosaguas/somosaguas-quarto-theme).

![Mortalidad por edad en Virginia, 1940, con theme_somosaguas()](ejemplo.png)

## Instalación

```r
# install.packages("remotes")
remotes::install_github("nuevasomosaguas/somosaguas-ggplot2")
```

Requiere `ggplot2` 4.0 o posterior. La EB Garamond viene incluida (licencia OFL) y se registra al cargar el paquete si el sistema no la tiene instalada.

## Uso

```r
library(ggplot2)
library(somosaguas)

ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point() +
  scale_colour_somosaguas() +
  theme_somosaguas()           # fondo = "#ffffff" para papel blanco

ggsave("grafico.png", device = ragg::agg_png)
```

- `theme_somosaguas()`: fondo de papel, sin rejillas verticales ni menores, EB Garamond también en `geom_text()`, título en granate y leyenda mínima encima del gráfico.
- `scale_colour_somosaguas()` y `scale_fill_somosaguas()`: cinco colores en orden fijo (`paleta_somosaguas`), validados para daltonismo y con contraste 3:1 sobre el papel. Con un sexto nivel la escala falla a propósito: agrupe en «Otros» o use facetas.

El estándar pide etiquetar las series directamente en lugar de usar una leyenda; `ejemplo.R` muestra cómo, y genera la imagen de arriba.

## Dispositivos gráficos

La fuente incluida la ven los dispositivos basados en `systemfonts`: `ragg` (PNG, JPEG, TIFF) y `svglite` (SVG). `ggsave()` usa `ragg` por omisión si está instalado; en RStudio, elija *Tools → Global Options → General → Graphics → Backend: AGG*. `pdf()` y `cairo_pdf()` no la ven: para PDF, instale la EB Garamond en el sistema.
