# Introduction: https://wilkelab.org/cowplot/
# Detailed vignettes https://wilkelab.org/cowplot/articles/index.html
df <- read_csv("ExampleNRL.csv")
tibble(df)
install.packages("cowplot")
library(cowplot)
library(tidyverse)
library(ggrepel)
install.packages("magick")
library(magick)
library(forcats)
p1 <- ggplot(df, aes(Elo, Game, Elo, label = Elo)) + 
  geom_point() +
  geom_label_repel() +
  labs(title = "Cowplot Theme", 
       subtitle = "An NRL Example with a Cowplot Theme: Labels are Elo Rating Points",
       x = "Elo Rating Points", y = "Week in the 2019 Season") +
  theme_cowplot(12)
p1
p2 <- ggplot(df, aes(Elo, Game, Elo, label = Elo)) + 
  geom_point() +
  geom_label_repel() +
  labs(title = "Minimal Theme", 
       subtitle = "An NRL Example with Minimal Theme with a Grid: Labels are Elo Rating Points",
       x= "Elo Rating Points", y = "Week in the 2019 Season") +
  theme_minimal_grid(
    font_size = 12,
    color = "grey70"
  )
p2
plot_grid(p1, p2, label_size = 8)
img <- system.file("extdata", "logo.png", package = "cowplot") %>%
  image_read() %>%
  image_resize("270x80") %>%
  image_colorize(35, "white")
img
logo_file <- system.file("extdata", "logo.png", package = "cowplot")
ggdraw() + 
  draw_plot(p1) +
  draw_image(logo_file, x = 1, hjust = 1, width = 0.13, height = 0.2)
plot_grid(p1, p2, rel_heights = c(.6, 1), labels = "auto")
plot_grid(
  p1, p2,
  ncol = 1)
plot_grid(p1, p2, rel_widths = c(1, 2))
plot_row <- plot_grid(p1, p2)
title <- ggdraw() + 
  draw_label(
    "Two Different Themes in Cowplot (Cowplot and Minimal)",
    fontface = 'bold',
    x = 0,
    hjust = 0
  ) +
  theme(
    plot.margin = margin(0, 0, 0, 7)
  )
plot_grid(
  title, plot_row,
  ncol = 1,
  rel_heights = c(0.1, 1))


