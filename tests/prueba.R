library(ggplot2)
library(somosaguas)

g <- ggplot(mtcars, aes(wt, mpg, colour = factor(cyl))) +
  geom_point() + scale_colour_somosaguas() + theme_somosaguas()
invisible(ggplot_build(g))
stopifnot(identical(unname(layer_data(g)$colour[mtcars$cyl == 4][1]), "#9a2929"))

# Seis niveles para cinco colores: la escala debe fallar, no repetir colores.
seis <- ggplot(data.frame(x = 1:6, g = letters[1:6]), aes(x, x, colour = g)) +
  geom_point() + scale_colour_somosaguas()
stopifnot(inherits(tryCatch(ggplot_build(seis), error = identity), "error"))
