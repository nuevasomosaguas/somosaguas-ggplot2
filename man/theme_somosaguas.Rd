\name{theme_somosaguas}
\alias{theme_somosaguas}
\title{Tema de Nueva Somosaguas}
\description{
Tema de \pkg{ggplot2} con el estándar gráfico de Nueva Somosaguas: fondo de
papel, sin rejillas verticales ni menores, EB Garamond en todo el gráfico
(también en \code{geom_text()}), título en granate y leyenda mínima encima.
}
\usage{
theme_somosaguas(base_size = 12, base_family = "EB Garamond", fondo = "#fffff8")
}
\arguments{
\item{base_size}{Tamaño base del texto, en puntos.}
\item{base_family}{Familia tipográfica.}
\item{fondo}{Color del fondo: el papel crema de la web o \code{"#ffffff"}.}
}
\examples{
library(ggplot2)
g <- ggplot(mtcars, aes(wt, mpg)) + geom_point() + theme_somosaguas()
# Se dibuja con ragg o svglite, que ven la EB Garamond incluida:
# ggsave("grafico.png", g, device = ragg::agg_png)
}
