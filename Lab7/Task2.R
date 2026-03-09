# Load the required libraries
library(readxl)
library(dplyr)

# 1. Load the Excel file
# (Make sure "uforeport.xlsx" is in your working directory)
df <- read_excel("./Lab7/uforeports.xlsx")

# ---------------------------------------------------------
# INSIGHT 1: What are the Top 5 most common UFO shapes?
# ---------------------------------------------------------
top_shapes <- df %>%
  count(`Shape Reported`, sort = TRUE) %>%
  head(5)

print("--- Insight 1: Top 5 UFO Shapes ---")
print(top_shapes)

# ---------------------------------------------------------
# INSIGHT 2: Which states have the highest number of sightings?
# ---------------------------------------------------------
top_states <- df %>%
  count(State, sort = TRUE) %>%
  head(5)

print("--- Insight 2: Top 5 States with Most Sightings ---")
print(top_states)

# ---------------------------------------------------------
# INSIGHT 3: What colors are seen when a color IS reported?
# (Filtering out the NA values to see the actual colors)
# ---------------------------------------------------------
color_insights <- df %>%
  filter(!is.na(`Colors Reported`) & `Colors Reported` != "NA") %>%
  count(`Colors Reported`, sort = TRUE)

print("--- Insight 3: Most Common UFO Colors Reported ---")
print(color_insights)