# Load required libraries
library(ggplot2)
library(dplyr)

# 1. Prepare the data: Calculate the average CO2 uptake for each region (Type)
pie_data <- CO2 %>%
  group_by(Type) %>%
  summarise(avg_uptake = mean(uptake))

# 2. Create the Pie Chart
ggplot(pie_data, aes(x = "", y = avg_uptake, fill = Type)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) + # This converts the bar chart into a pie chart
  labs(
    title = "Average CO2 Uptake by Region",
    subtitle = "Quebec plants dominate in overall performance",
    fill = "Plant Origin"
  ) +
  # Add the actual numbers to the slices
  geom_text(aes(label = round(avg_uptake, 1)), position = position_stack(vjust = 0.5), color = "white", fontface = "bold") +
  theme_void() + # Removes the background, grid, and axes for a clean pie look
  scale_fill_manual(values = c("Quebec" = "#2E86C1", "Mississippi" = "#E74C3C")) # Custom professional colors