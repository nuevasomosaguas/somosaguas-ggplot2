\name{scale_colour_somosaguas}
\alias{scale_colour_somosaguas}
\alias{scale_color_somosaguas}
\alias{scale_fill_somosaguas}
\alias{paleta_somosaguas}
\title{Escalas de color de Nueva Somosaguas}
\description{
Paleta categórica de cinco colores en orden fijo (granate, azul, ocre, violeta,
verde), validada para daltonismo y con contraste 3:1 sobre el papel. Con más de
cinco niveles la escala falla a propósito: agrupe en «Otros» o use facetas.
}
\usage{
scale_colour_somosaguas(...)
scale_color_somosaguas(...)
scale_fill_somosaguas(...)
paleta_somosaguas
}
\arguments{
\item{...}{Argumentos para \code{\link[ggplot2]{scale_colour_manual}}.}
}
\examples{
library(ggplot2)
g <- ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_point() +
  scale_colour_somosaguas() +
  theme_somosaguas()
}
