library(ggplot2)
library(tidyr)
library(readr)

library(tidyverse)

# Load the data
data <- read_csv('https://raw.githubusercontent.com/tranJen/RaBi-Collaboration/main/testing%20%22hits%22/mutation_glm.csv')

# Reshape data from wide to long format
data_long <- pivot_longer(data, cols = starts_with("CyanToYellow"), 
                          names_to = "Trial", values_to = "ratio")
# Convert "Trial" column to numeric
data_long$Trial <- as.numeric(gsub("Trial", "", data_long$Trial))

# Define custom order for Mutation factor
mutation_order <- c('LgBiT', 'T145E', 'T145S', 'N157D')
data_long$Mutation <- factor(data_long$Mutation, levels = mutation_order)

# Calculate the mean for the LgBiT mutant
lgB_mean <- mean(data_long$ratio[data_long$Mutation == "LgBiT"], na.rm = TRUE)

# Create a jitter plot with custom color palette
ctoy <- ggplot(data_long, aes(x = Mutation, y = ratio)) +
  geom_rect(aes(xmin = -Inf, xmax = Inf, ymin = lgB_mean, ymax = Inf),
            fill = "cyan4", alpha = 0.055, color = NA) +
  geom_rect(aes(xmin = -Inf, xmax = Inf, ymin = -Inf, ymax = lgB_mean),
            fill = "darkgoldenrod1", alpha = 0.04, color = NA) +
  geom_jitter(width = 0.1, height = 0, color = 'black', alpha = 1, size = 3) +
  stat_summary(fun.y = "mean", fun.ymin = "mean", fun.ymax = "mean",
               size = 0.3, width = 0.5, geom = "crossbar") +
  labs(x = "Mutant", y = "Cyan to Yellow RLU Ratio") +
  ylim(3, 11) +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 10)) +
  guides(color = FALSE) +
  theme_classic() +
  theme(text = element_text(size = 15), axis.text.x = element_text(size = 15))+
  geom_hline(yintercept = lgB_mean, color = "black", linetype = "dashed") +
  geom_text(aes(x = 4, y = lgB_mean + 0.25, label = "Prefer SmBiT 1"),
            size = 4, fontface = "italic") +
  geom_text(aes(x = 4, y = lgB_mean - 0.25, label = "Prefer SmBiT 2"),
            size = 4, fontface = "italic")

ggsave("cyantoyellow.png", ctoy, width = 6, bg = "transparent", height = 5, units = "in")
