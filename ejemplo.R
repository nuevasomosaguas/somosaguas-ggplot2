# Genera ejemplo.png: Rscript ejemplo.R (requiere ragg)
library(ggplot2)
library(somosaguas)

tasas <- as.data.frame(as.table(VADeaths))
names(tasas) <- c("edad", "grupo", "tasa")
tasas$grupo <- factor(
  tasas$grupo,
  levels = c("Urban Male", "Rural Male", "Urban Female", "Rural Female"),
  labels = c("Hombres, ciudad", "Hombres, campo", "Mujeres, ciudad", "Mujeres, campo")
)
tasas$edad <- sub("-", "–", tasas$edad)
final <- tasas[tasas$edad == "70–74", ]

g <- ggplot(tasas, aes(edad, tasa, colour = grupo, group = grupo)) +
  geom_line(linewidth = 0.9) +
  geom_point(shape = 21, size = 2.8, stroke = 1.2, aes(fill = grupo), colour = "#fffff8") +
  # Etiquetado directo: el nombre al final de cada serie, sin caja de leyenda.
  geom_text(data = final, aes(label = grupo), colour = "#111111",
            hjust = 0, nudge_x = 0.12, size = 3.9) +
  scale_colour_somosaguas(guide = "none") +
  scale_fill_somosaguas(guide = "none") +
  scale_x_discrete(expand = expansion(add = 0.3)) +
  scale_y_continuous(limits = c(0, 75), breaks = seq(0, 75, 25),
                     expand = expansion(mult = c(0, 0.02))) +
  labs(
    title = "La mortalidad se duplica cada diez años de edad",
    subtitle = "Defunciones anuales por cada mil habitantes en Virginia, 1940",
    x = "Grupo de edad", y = NULL,
    caption = "Fuente: Molyneaux, Gilliam y Florant (1947), conjunto VADeaths de R."
  ) +
  # Las etiquetas quedan fuera del panel, en el margen derecho.
  coord_cartesian(clip = "off") +
  theme_somosaguas() +
  theme(plot.margin = margin(14, 110, 14, 14))

ggsave("ejemplo.png", g, width = 8, height = 5, dpi = 200, device = ragg::agg_png)
